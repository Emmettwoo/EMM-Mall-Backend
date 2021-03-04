# coding=utf-8
import os
import sys
from time import strftime, gmtime

from bs4 import BeautifulSoup
import urllib2
import re

from pip._vendor import requests

# fixme: 升变系统的干员英文名称相同，此爬虫暂时不支持。
#  （之后还会上线同名的更多角色，解决方案未定）
# todo: 后续更新考虑先拆分模块，独立成一个git项目

# 设置中文编码为UTF-8
reload(sys)
sys.setdefaultencoding('utf8')

# 覆盖模式，默认关闭，开启后会覆盖爬取已存在档案
# workingDir列举当前工作目录下的子目录，用于判断档案是否已存在
CoverMode = 0
workingDir = os.listdir("./")

# 干员类型<图片链接>对应的<数据库编号>
char_class_links = {
    # 先锋干员
    "http://prts.wiki/images/8/82/%E5%9B%BE%E6%A0%87_%E8%81%8C%E4%B8%9A_%E5%85%88%E9%94%8B_%E5%A4%A7%E5%9B%BE.png": "1",
    # 近卫干员
    "http://prts.wiki/images/a/a9/%E5%9B%BE%E6%A0%87_%E8%81%8C%E4%B8%9A_%E8%BF%91%E5%8D%AB_%E5%A4%A7%E5%9B%BE.png": "2",
    # 狙击干员
    "http://prts.wiki/images/d/d1/%E5%9B%BE%E6%A0%87_%E8%81%8C%E4%B8%9A_%E7%8B%99%E5%87%BB_%E5%A4%A7%E5%9B%BE.png": "3",
    # 重装干员
    "http://prts.wiki/images/6/6f/%E5%9B%BE%E6%A0%87_%E8%81%8C%E4%B8%9A_%E9%87%8D%E8%A3%85_%E5%A4%A7%E5%9B%BE.png": "4",
    # 医疗干员
    "http://prts.wiki/images/b/b8/%E5%9B%BE%E6%A0%87_%E8%81%8C%E4%B8%9A_%E5%8C%BB%E7%96%97_%E5%A4%A7%E5%9B%BE.png": "5",
    # 辅助干员
    "http://prts.wiki/images/f/f0/%E5%9B%BE%E6%A0%87_%E8%81%8C%E4%B8%9A_%E8%BE%85%E5%8A%A9_%E5%A4%A7%E5%9B%BE.png": "6",
    # 术士干员
    "http://prts.wiki/images/4/4d/%E5%9B%BE%E6%A0%87_%E8%81%8C%E4%B8%9A_%E6%9C%AF%E5%B8%88_%E5%A4%A7%E5%9B%BE.png": "7",
    # 特种干员
    "http://prts.wiki/images/2/2a/%E5%9B%BE%E6%A0%87_%E8%81%8C%E4%B8%9A_%E7%89%B9%E7%A7%8D_%E5%A4%A7%E5%9B%BE.png": "8"
}

# 干员类型<星级链接>对应的<数据库编号>
char_stars_links = {
    "http://prts.wiki/images/0/06/%E7%A8%80%E6%9C%89%E5%BA%A6_%E7%99%BD_0.png": "1",
    "http://prts.wiki/images/8/8a/%E7%A8%80%E6%9C%89%E5%BA%A6_%E7%99%BD_1.png": "2",
    "http://prts.wiki/images/6/66/%E7%A8%80%E6%9C%89%E5%BA%A6_%E7%99%BD_2.png": "3",
    "http://prts.wiki/images/4/49/%E7%A8%80%E6%9C%89%E5%BA%A6_%E7%99%BD_3.png": "4",
    "http://prts.wiki/images/b/bf/%E7%A8%80%E6%9C%89%E5%BA%A6_%E7%99%BD_4.png": "5",
    "http://prts.wiki/images/c/cf/%E7%A8%80%E6%9C%89%E5%BA%A6_%E7%99%BD_5.png": "6"
}


# URL管理模块
class UrlManager:
    def __init__(self):
        self.url_set = set()

    def init_root_url(self, root_url, soup):
        # 获取 注释与链接 中的 干员一览 部分
        links = soup.find('table', class_="nowraplinks collapsible uncollapsed navbox-inner")
        # 循环 干员一览 内的所有超链接
        for link in links.find_all('a', href=re.compile(r"/w/")):
            # 如果目标地址不(包含)以 "分类:" 开头，则为干员链接
            if "%E5%88%86%E7%B1%BB:" not in link.get('href'):
                self.url_set.add("http://prts.wiki/" + link.get('href'))
        # 最后，根路径也是目标干员信息之一
        self.url_set.add(root_url)

    def has_new_url(self):
        return len(self.url_set) != 0

    def get_new_url(self):
        return self.url_set.pop()


# 网页解析模块
class Parser:
    def __init__(self):
        pass

    @staticmethod
    def get_page_data(page_url, soup):
        page_data = {'url': page_url}

        # 干员英文名称: <div class="charname-en anicss" id="charname-en">Lancet-2</div>
        name_en_node = soup.find('div', class_="charname-en anicss")
        # 去除名称中的空格和单引号，以免引起奇奇怪怪的bug
        page_data['name_en'] = name_en_node.get_text().replace(" ", "").replace("'", "")
        # print("page_data['name_en']: ", page_data['name_en'])

        # 如果角色已存在，决定覆盖或者跳过
        if page_data['name_en'] in workingDir and CoverMode != 1:
            print("Character Exist.")
            # 全局变量：已存在的干员数量加一
            global existed_characters
            existed_characters = existed_characters + 1
            return

        # 干员中文名称：<div class="charname anicss" id="charname">Lancet-2</div>
        name_cn_node = soup.find('div', class_="charname anicss")
        page_data['name_cn'] = name_cn_node.get_text()
        # print("page_data['name_cn']: ", page_data['name_cn'])

        # 干员类型
        class_node = soup.find('div', class_="charclass anicss").find("img")
        page_data['class'] = char_class_links[class_node.get("src")]
        # print("page_data['class']: ", page_data['class'])

        # 干员星级
        stars_node = soup.find('div', class_="starimg").find("img")
        page_data['stars'] = char_stars_links[stars_node.get("src")]
        # print("page_data['stars']: ", page_data['stars'])

        # 干员图片
        if page_data['name_en'] not in workingDir:
            os.mkdir(page_data['name_en'])
        os.chdir(page_data['name_en'])
        # 如果是第一张图，则跳过（初始图 和 阶段一 图是重复的）
        count = 0
        # 遍历角色原始图片（精英阶段一 和 精英阶段二）
        for img_node in soup.find_all('div', class_="charimg-stage"):
            if count != 0:
                try:
                    Downloader.save_image(img_node.find("img").get("src"),
                                          page_data['name_en'] + "_img-" + str(count) + ".png")
                except:
                    continue
            count = count + 1

        # 遍历角色皮肤图片
        for img_node in soup.find_all('div', class_="charimg-skin"):
            try:
                Downloader.save_image(img_node.find("img").get("src"),
                                      page_data['name_en'] + "_img-" + str(count) + ".png")
            except:
                continue
            count = count + 1

        os.chdir("../")

        return page_data

    def parse(self, page_url, html_cont):
        if page_url is None:
            return
        else:
            print ("Parsing: " + page_url)
            soup = BeautifulSoup(html_cont, 'html.parser', from_encoding='utf-8')
            new_data = self.get_page_data(page_url, soup)
            return new_data


# 网页下载模块
class Downloader:
    def __init__(self):
        pass

    @staticmethod
    def download(url):
        if url is None:
            return None

        # print ("Downloading: " + url)
        response = urllib2.urlopen(url, timeout=5)

        if response.getcode() != 200:
            return None
        return response.read()

    @staticmethod
    def save_image(img_url, img_name):
        if img_url != "http:":
            # print ("Downloading: " + img_name)
            content = requests.get(img_url).content
            with open(img_name, 'wb') as f:
                f.write(content)


# 结果输出模块
class Printer(object):
    def __init__(self):
        self.datas = []

    def collect_data(self, data):
        if data is None:
            return
        self.datas.append(data)

    def output_html(self):
        fout = open('result.html', 'w')
        fout.write("<html>")
        fout.write("<head>")
        fout.write('<meta charset="utf-8" />')
        fout.write("<title>Crawl Result</title>")
        fout.write("</head>")
        fout.write("<body>")
        fout.write('<h1 style="text-align:center">Crawl Result</h1>')
        fout.write('<table style="border-collapse:collapse;"  border="1">')
        fout.write("<tr>")
        fout.write("<td>中文名称</td>")
        fout.write("<td>英文名称</td>")
        fout.write("<td>干员类型</td>")
        fout.write("<td>干员星级</td>")
        fout.write("<td>干员图片</td>")
        fout.write("</tr>")

        for data in self.datas:
            fout.write("<tr>")
            fout.write("<td><a href='%s'>%s</a></td>" % (data["url"].encode("utf-8"), data["name_cn"].encode("utf-8")))
            fout.write("<td>%s</td>" % data["name_en"])
            fout.write("<td>%s</td>" % data["class"])
            fout.write("<td>%s</td>" % data["stars"])
            # 图片循环
            os.chdir(data['name_en'])
            count = 1
            while 1:
                if os.path.exists(data['name_en'] + "_img-" + str(count) + ".png"):
                    fout.write("<td><img src='%s/%s_img-%s.png' width=80px></td>"
                               % (data['name_en'], data['name_en'], str(count)))
                    count = count + 1
                else:
                    break
            fout.write("</tr>")
            os.chdir("../")

        fout.write("</table>")
        fout.write('<br /><br /><p style="text-align:center">Power By Emmett Woo</p>')
        fout.write("</body>")
        fout.write("</html>")

    def output_sql(self):
        if CoverMode:
            fout = open('result.sql', 'w')
            fout.write("truncate table mall_product;\n")
            count = 1
        else:
            fout = open('result.sql', 'a')
            count = len(workingDir) + 1

        for data in self.datas:
            time_now = strftime("%Y-%m-%d %H:%M:%S", gmtime()).decode('utf-8')
            sql_head = "INSERT INTO `mall_product` (`id`, `category_id`, `name`, `subtitle`, `main_image`, " \
                       "`sub_images`, `detail`, `price`, `stock`, `status`, `create_time`, `update_time`) VALUES "
            sql_body = '''(%s, %s, '%s', '%s', '%s/%s_img-1.png', '%s', '%s', %s, 1024, 1, '%s', '%s')''' % \
                       (str(count), data['class'], data['name_cn'], data['name_en'], data['name_en'], data['name_en'],
                        self.get_image_urls(data['name_en']), self.get_describe(data['name_en']), data['stars'],
                        time_now, time_now)
            fout.write(sql_head + sql_body + ";\n")
            count = count + 1

    @staticmethod
    def get_image_urls(name_en):
        image_urls = ""
        os.chdir(name_en)
        count = 1
        while 1:
            if os.path.exists(name_en + "_img-" + str(count) + ".png"):
                image_urls = image_urls + ("%s/%s_img-%s.png," % (name_en, name_en, str(count)))
                count = count + 1
            else:
                break
        os.chdir("../")
        return image_urls[0:-1]

    @staticmethod
    def get_describe(name_en):
        describe = ""
        os.chdir(name_en)
        count = 1
        while 1:
            if os.path.exists(name_en + "_img-" + str(count) + ".png"):
                describe = describe + ('<img src="http://q.woohoo.top/%s/%s_img-%s.png" width="512px">\n'
                                       % (name_en, name_en, str(count)))
                count = count + 1
            else:
                break
        os.chdir("../")
        return describe


# 主程序入口
class SpiderMain:
    def __init__(self):
        pass


def change_working_dir():
    if 'data' not in os.listdir("./"):
        os.mkdir('data')
    os.chdir('data')
    global workingDir
    workingDir = os.listdir("./")


def craw(root_url):
    soup = BeautifulSoup(Downloader.download(root_url), 'html.parser', from_encoding='utf-8')
    UrlManager.init_root_url(root_url, soup)

    # 根据url列表爬取网页
    while UrlManager.has_new_url():
        try:
            new_url = UrlManager.get_new_url()
            html_cont = Downloader.download(new_url)
            new_data = Parser.parse(new_url, html_cont)
            Printer.collect_data(new_data)
        except:
            print "crawl failed!"
    Printer.output_sql()


# 程序执行
if __name__ == "__main__":
    print "Welcome to EMM-Mall-ArknightDataSpider."

    # 各模块初始化(实例化)
    UrlManager = UrlManager()
    Parser = Parser()
    Downloader = Downloader()
    Printer = Printer()

    # 接收/设置 根地址（目标干员信息之一）
    # root_url = raw_input("Enter Root Url : ")
    root_url = "http://prts.wiki/w/Lancet-2"

    # 实例化主入口，开始爬取数据
    SpiderMain = SpiderMain()
    change_working_dir()
    craw(root_url)

    print ("Everything is done. Result is in result.sql")

echo "---------- EMM-Mall后端 部署开始 ----------"


echo "1. 清理以前的部署残留"
rm -rf /home/mall/Git/EMM-Mall-Backend/target

echo "2. 进入后端项目目录"
cd /home/mall/Git/EMM-Mall-Backend/

echo "3. 切换git到主分支"
git checkout master

echo "4. 更新git的分支信息"
git fetch

echo "5. 拉取git的更新文件"
git pull 

echo "6. 编译并跳过单元测试"
mvn clean package -Dmaven.test.skip=true 

echo "7. 删除旧的war包文件"
rm /www/server/tomcat/webapps/mall.war

echo "8. 删除旧的已部署文件"
rm -rf /www/server/tomcat/webapps/mall

echo "9. 将新文件部署到Tomcat"
cp /home/mall/Git/EMM-Mall-Backend/target/EMM-Mall.war /www/server/tomcat/webapps/mall.war

echo "10. 重启Tomcat以载入新包（BT-Panel自动完成）"
for i in {1..30}
do
    echo $i"s"
    sleep 1s
done 

echo "11. 各种配置文件的覆盖"
cp /home/mall/emm_mall_backend_config/zfbinfo.properties /www/server/tomcat/webapps/mall/WEB-INF/classes/
cp /home/mall/emm_mall_backend_config/datasource.properties /www/server/tomcat/webapps/mall/WEB-INF/classes/
cp /home/mall/emm_mall_backend_config/mall.properties /www/server/tomcat/webapps/mall/WEB-INF/classes/


echo "---------- EMM-Mall后端 部署完成 ----------"
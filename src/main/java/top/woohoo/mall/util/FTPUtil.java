package top.woohoo.mall.util;

import org.apache.commons.net.ftp.FTPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

public class FTPUtil {

    private static final Logger logger = LoggerFactory.getLogger(FTPUtil.class);

    private static String ftpServerIp = PropertiesUtil.getProperty("ftp.server.ip");
    private static String ftpUsername = PropertiesUtil.getProperty("ftp.username");
    private static String ftpPassword = PropertiesUtil.getProperty("ftp.password");

    private String ip;
    private Integer port;
    private String user;
    private String pwd;
    private FTPClient ftpClient;


    public FTPUtil(String ip, Integer port, String user, String pwd) {
        this.ip = ip;
        this.port = port;
        this.user = user;
        this.pwd = pwd;
    }


    public static boolean uploadFile(String remotePath, List<File> fileList) throws IOException {
        // FTP主动模式的文件传输端口永远为21。
        FTPUtil ftpUtil = new FTPUtil(ftpServerIp, 21, ftpUsername, ftpPassword);
        if (remotePath == null) {
            remotePath = "/";
        }
        return ftpUtil.upload(remotePath, fileList);
    }

    private boolean upload(String remotePath, List<File> fileList) throws IOException {
        boolean uploadStatus = false;
        FileInputStream fileInputStream = null;
        try {
            if (this.connectServer(this.ip, this.port, this.user, this.pwd)) {
                ftpClient.makeDirectory(remotePath);
                ftpClient.changeWorkingDirectory(remotePath);
                ftpClient.setBufferSize(1024);
                ftpClient.setControlEncoding("UTF-8");
                ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
                ftpClient.enterLocalPassiveMode();
                for (File file : fileList) {
                    fileInputStream = new FileInputStream(file);
                    ftpClient.storeFile(file.getName(), fileInputStream);
                }
                uploadStatus = true;
            }
        } catch (IOException e) {
            logger.error("上传文件出错： " + e);
        } finally {
            if (fileInputStream != null) {
                fileInputStream.close();
            }
            ftpClient.disconnect();
        }
        return uploadStatus;
    }

    private boolean connectServer(String ip, Integer port, String user, String pwd) {
        boolean connectStatus = false;
        this.ftpClient = new FTPClient();
        try {
            ftpClient.connect(ip, port);
            connectStatus = ftpClient.login(user, pwd);
        } catch (IOException e) {
            logger.error("连接FTP服务器失败： " + e);
        }
        return connectStatus;
    }


    // Getters & Setters
    public String getIp() {
        return ip;
    }
    public void setIp(String ip) {
        this.ip = ip;
    }
    public Integer getPort() {
        return port;
    }
    public void setPort(Integer port) {
        this.port = port;
    }
    public String getUser() {
        return user;
    }
    public void setUser(String user) {
        this.user = user;
    }
    public String getPwd() {
        return pwd;
    }
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    public FTPClient getFtpClient() {
        return ftpClient;
    }
    public void setFtpClient(FTPClient ftpClient) {
        this.ftpClient = ftpClient;
    }
}
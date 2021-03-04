package top.woohoo.mall.service.impl;

import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.service.IFileService;
import top.woohoo.mall.util.FTPUtil;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service("iFileService")
@Slf4j
public class FileServiceImpl implements IFileService {

    @Override
    public ServerResponse<String> upload(MultipartFile multipartFile, String path) {
        String originalFileName = multipartFile.getOriginalFilename();
        // 最后一个dot的后一位开始，为文件后缀名。
        String fileExtensionName = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
        String uploadFileName = UUID.randomUUID().toString() + "." + fileExtensionName;

        log.info("Start upload {} to {} and rename to {}", originalFileName, path, uploadFileName);
        File fileDir = new File(path);
        if(!fileDir.exists()) {
            fileDir.setWritable(true);
            fileDir.mkdirs();
        }
        File targetFile = new File(path, uploadFileName);
        try {
            // 上传到tomcat网站服务器（本地）
            multipartFile.transferTo(targetFile);

            // 通过ftp上传到文件服务器（本地/远端）
            log.info("Start connect FTP server.");
            // 上传后（无论成功与否）删除tomcat上的临时文件副本
            if (FTPUtil.uploadFile(null, Lists.newArrayList(targetFile))) {
                log.info("File uploaded to FTP server.");
                targetFile.delete();
            } else {
                log.error("File upload failed.");
                targetFile.delete();
                return ServerResponse.createByErrorMessage("上传文件失败");
            }
        } catch (IOException e) {
            log.error("File upload failed. " + e);
            return ServerResponse.createByErrorMessage("上传文件失败。 " + e);
        }
        return ServerResponse.createBySuccess(targetFile.getName());
    }
}
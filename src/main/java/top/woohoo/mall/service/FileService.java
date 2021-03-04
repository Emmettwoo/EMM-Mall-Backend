package top.woohoo.mall.service;

import org.springframework.web.multipart.MultipartFile;
import top.woohoo.mall.common.ServerResponse;

public interface FileService {

    ServerResponse<String> upload(MultipartFile file, String path);
}
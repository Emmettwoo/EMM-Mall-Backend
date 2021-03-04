package top.woohoo.mall.service;

import org.springframework.web.multipart.MultipartFile;
import top.woohoo.mall.common.ServerResponse;

public interface IFileService {

    ServerResponse<String> upload(MultipartFile file, String path);
}
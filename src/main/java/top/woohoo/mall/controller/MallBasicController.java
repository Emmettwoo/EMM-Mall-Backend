package top.woohoo.mall.controller;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import top.woohoo.mall.common.ResponseData;

import java.io.Serializable;

/**
 * 后端服务通用基础控制器
 *
 * @author Emmett Woo
 * @since 2021/03/20
 */
public class MallBasicController {

    public <T extends Serializable> ResponseData<T> commonResponse(T data) {
        return this.commonResponse(200, data, "success");
    }

    public <T extends Serializable> ResponseData<T> commonResponse(Integer code, String desc) {
        return this.commonResponse(code, null, desc);
    }

    public <T extends Serializable> ResponseData<T> commonResponse(T data, String desc) {
        return this.commonResponse(200, data, desc);
    }

    public <T extends Serializable> ResponseData<T> commonResponse(Integer code, T data, String desc) {
        return new ResponseData<>(code, data, desc);
    }

    public <T extends Serializable> ResponseData<T> commonResponse(BindingResult result) {
        StringBuilder errorMsg = new StringBuilder();

        for (FieldError fieldError : result.getFieldErrors()) {
            errorMsg.append(fieldError.getDefaultMessage()).append(", ");
        }

        return this.commonResponse(-1, errorMsg.substring(0, errorMsg.length() - 2));
    }
}

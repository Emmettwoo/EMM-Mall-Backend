package top.woohoo.mall.common;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 后端服务全局错误处理
 *
 * @author Emmett Woo
 * @since 2021/03/20
 */
@RestControllerAdvice
public class ResponseExceptionHandler {

    @ResponseBody
    @ExceptionHandler(value = {ResponseException.class})
    public ResponseData<String> jsonErrorHandler(ResponseException e) {

        ResponseData<String> r = new ResponseData<>();
        r.setDesc(e.getDesc());
        r.setCode(e.getCode());
        r.setData(null);
        return r;
    }
}
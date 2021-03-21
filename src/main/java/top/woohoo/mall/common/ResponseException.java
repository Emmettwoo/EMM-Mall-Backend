package top.woohoo.mall.common;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 后端服务通用运行时异常
 * @author Emmett Woo
 * @since 2021/03/20
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class ResponseException extends RuntimeException {

    private Integer code;
    private String desc;

    public ResponseException(Integer code, String desc) {
        super(desc);
        this.code = code;
        this.desc = desc;
    }
}

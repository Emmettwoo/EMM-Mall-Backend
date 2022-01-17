package top.woohoo.mall.common;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 后端服务通用程式异常
 *
 * @author Emmett Woo
 * @since 2022/01/16
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class ProgramException extends Exception {

    private static final long serialVersionUID = -2854177742521037798L;

    private final Integer code;
    private final String desc;

    public ProgramException(Integer code, String desc) {
        super(desc);
        this.code = code;
        this.desc = desc;
    }
}

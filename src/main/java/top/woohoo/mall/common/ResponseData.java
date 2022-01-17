package top.woohoo.mall.common;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 后端服务通用数据返回
 *
 * @author Emmett Woo
 * @since 2021/03/20
 */
@Data
@JsonSerialize
@NoArgsConstructor
@AllArgsConstructor
public class ResponseData<T extends Serializable> implements Serializable {

    private static final long serialVersionUID = -8925451418069396730L;

    private Integer code;
    private T data;
    private String desc;
}

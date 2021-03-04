package top.woohoo.mall.common;

public enum ResponseCode {
    SUCCESS(0, "请求成功"),
    ERROR(1, "请求失败"),
    NEED_LOGIN(10, "需要登入"),
    ILLEGAL_ARGUMENT(20, "参数错误");

    private final int code;
    private final String desc;


    ResponseCode(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
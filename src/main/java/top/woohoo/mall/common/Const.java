package top.woohoo.mall.common;

import com.google.common.collect.Sets;

import java.util.Set;

public class Const {
    public static final String CURRENT_USER = "currentUser";
    public static final String EMAIL = "email";
    public static final String USERNAME = "username";


    public interface CartItem {
        int UN_CHECKED = 0;
        int CHECKED = 1;

        String IS_OUT_OF_STOCK = "IS_OUT_OF_STOCK";
        String NOT_OUT_OF_STOCK = "NOT_OUT_OF_STOCK";
    }

    public interface ProductListOrderBy {
        Set<String> PRICE_ASC_DESC = Sets.newHashSet("price_asc", "price_desc");
    }

    // 根据支付宝回调状态配置
    public interface AlipayCallback {
        String TRADE_STATUS_WAIT_BUYER_PAY = "WAIT_BUYER_PAY";
        String TRADE_STATUS_TRADE_SUCCESS = "TRADE_SUCCESS";

        String RESPONSE_SUCCESS = "success";
        String RESPONSE_FAILED = "failed";
    }


    public enum UserRoleEnum {
        ROLE_CUSTOMER(0, "普通用户"),
        ROLE_ADMIN(1, "管理员");


        private final int code;
        private final String value;

        UserRoleEnum(int code, String value) {
            this.code = code;
            this.value = value;
        }

        public int getCode() {
            return code;
        }
        public String getValue() {
            return value;
        }

        public static UserRoleEnum codeOf(int code) {
            for (UserRoleEnum userRoleEnum : values()) {
                if (userRoleEnum.getCode() == code) {
                    return userRoleEnum;
                }
            }
            throw new RuntimeException("没有对应的用户类型枚举");
        }
    }

    public enum ProductStatusEnum {
        ON_SALE(1, "Available"),
        NOT_SALE(0, "Unavailable");


        private final int code;
        private final String value;

        ProductStatusEnum(int code, String value) {
            this.code = code;
            this.value = value;
        }

        public int getCode() {
            return code;
        }
        public String getValue() {
            return value;
        }
    }

    public enum ShippingStatusEnum {
        Available(1, "Available"),
        Unavailable(0, "Unavailable");


        private final int code;
        private final String value;

        ShippingStatusEnum(int code, String value) {
            this.code = code;
            this.value = value;
        }

        public int getCode() {
            return code;
        }
        public String getValue() {
            return value;
        }
    }

    public enum OrderStatusEnum{
        CANCELED(0, "已取消"),
        NO_PAY(10, "未支付"),
        PAID(20, "已付款"),
        SHIPPED(40, "已发货"),
        ORDER_SUCCESS(50, "订单完成"),
        ORDER_CLOSE(60, "订单关闭");

        private final int code;
        private final String value;

        OrderStatusEnum(int code, String value) {
            this.code = code;
            this.value = value;
        }

        public int getCode() {
            return code;
        }
        public String getValue() {
            return value;
        }

        public static OrderStatusEnum codeOf(int code) {
            for (OrderStatusEnum orderStatusEnum : values()) {
                if (orderStatusEnum.getCode() == code) {
                    return orderStatusEnum;
                }
            }
            throw new RuntimeException("没有对应的订单状态枚举");
        }
    }

    public enum PaymentTypeEnum {
        ONLINE_PAY(1, "在线支付");

        private final int code;
        private final String value;

        PaymentTypeEnum(int code, String value) {
            this.code = code;
            this.value = value;
        }

        public int getCode() {
            return code;
        }
        public String getValue() {
            return value;
        }

        public static PaymentTypeEnum codeOf(int code) {
            for (PaymentTypeEnum paymentTypeEnum : values()) {
                if (paymentTypeEnum.getCode() == code) {
                    return paymentTypeEnum;
                }
            }
            throw new RuntimeException("没有对应的支付类型枚举");
        }
    }

    public enum PayPlatformEnum {
        ALIPAY(1, "支付宝");

        private final int code;
        private final String value;

        PayPlatformEnum(int code, String value) {
            this.code = code;
            this.value = value;
        }

        public int getCode() {
            return code;
        }
        public String getValue() {
            return value;
        }
    }
}
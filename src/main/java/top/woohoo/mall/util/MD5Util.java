package top.woohoo.mall.util;

import java.security.MessageDigest;
import java.util.Objects;

public class MD5Util {
    // byte转String需要用到的16位字符表
    private static final String[] hexDigits = {"0", "1", "2", "3", "4", "5",
            "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};


    // 加密后的数据是byte[]的，转换成String。
    private static String byteArrayToHexString(byte bytes[]) {
        StringBuilder result = new StringBuilder();
        // 遍历每一个byte转换成String拼接起来。
        for (byte value : bytes) {
            result.append(byteToHexString(value));
        }

        return result.toString();
    }

    private static String byteToHexString(byte b) {
        int n = b;
        if (n < 0) {
            n += 256;
        }
        int d1 = n / 16;
        int d2 = n % 16;
        return hexDigits[d1] + hexDigits[d2];
    }


    // MD5加密实际实现方法。
    private static String MD5Encode(String origin, String charsetName) {
        String resultString = null;
        try {
            resultString = origin;
            MessageDigest md = MessageDigest.getInstance("MD5");
            if (charsetName == null || "".equals(charsetName)) {
                resultString = byteArrayToHexString(md.digest(resultString.getBytes()));
            } else {
                resultString = byteArrayToHexString(md.digest(resultString.getBytes(charsetName)));
            }
        } catch (Exception ignored) {
        }
        return Objects.requireNonNull(resultString).toUpperCase();
    }

    // MD5加密的调用入口，判断是否加上盐值，默认为空（不安全）。
    public static String MD5EncodeUtf8(String origin) {
        origin = origin + PropertiesUtil.getProperty("password.salt", "");
        return MD5Encode(origin, "utf-8");
    }
}
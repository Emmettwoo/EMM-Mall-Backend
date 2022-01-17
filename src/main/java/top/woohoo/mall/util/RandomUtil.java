package top.woohoo.mall.util;

import java.security.SecureRandom;

/**
 * 随机数生成器
 *
 * @author Emmett Woo
 * @since 2021/03/18
 */
public class RandomUtil {

    private static final SecureRandom RANDOM = new SecureRandom();

    /** Utility classes should not have public constructors */
    private RandomUtil() {
        throw new IllegalStateException("Utility class");
    }

    /** 随机 Boolean 值 */
    public static Boolean nextBoolean() {
        return RANDOM.nextBoolean();
    }

    /** 随机 Integer 值 */
    public static Integer nextInteger(Integer minValue, Integer maxValue) {
        return minValue + RANDOM.nextInt() * (maxValue - minValue);
    }

    /** 随机 Long 值 */
    public static Long nextLong(Long minValue, Long maxValue) {
        return minValue + RANDOM.nextLong() * (maxValue - minValue);
    }

    /** 随机 UUID 值 */
    public static Long nextUUID() {
        return SnowFlakeUtil.getNextId();
    }
}

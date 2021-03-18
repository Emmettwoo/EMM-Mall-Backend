package top.woohoo.mall.util;

import java.util.Random;

/**
 * 随机数生成器
 * @author wuzhihong
 * @since 2021/03/18
 */
public class RandomUtil {

    private static final Random RANDOM = new Random();
    public RandomUtil() {
    }

    // 随机Boolean值
    public static Boolean nextBoolean() {
        return RANDOM.nextBoolean();
    }

    // 随机Integer值
    public static Integer nextInteger(Integer minValue, Integer maxValue) {
        return minValue + (int) (Math.random() * (maxValue - minValue));
    }

    // 随机Long值
    public static Long nextLong(Long minValue, Long maxValue) {
        return minValue + (long) (Math.random() * (maxValue - minValue));
    }

    // 随机UUID值
    public static Long nextUUID() {
        return SnowFlakeUtil.getNextId();
    }
}

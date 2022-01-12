package top.woohoo.mall.util;

import org.junit.Test;
import top.woohoo.mall.util.RandomUtil;
import top.woohoo.mall.util.SnowFlakeUtil;

public class RandomUtilTest {

    @Test
    public void nextLongTest() {
        for (int index = 0; index < 10; index++) {
            // System.out.println(RandomUtil.nextLong(-10L, -10L));
        }
    }

    @Test
    public void nextUUIDTest() {
        for (int index = 0; index < 10; index++) {
            // System.out.println(SnowFlakeUtil.getNextId());
        }
    }
}

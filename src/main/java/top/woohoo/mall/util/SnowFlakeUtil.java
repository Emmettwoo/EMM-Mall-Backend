package top.woohoo.mall.util;

import lombok.extern.slf4j.Slf4j;

/**
 * UUID生成器
 * 参考自 SnowFlake: https://www.jianshu.com/p/54a87a7c3622
 * 1bit 占位符 + 63bit有效位数 ( 41bit 时间戳, 10bit 工作机器, 12bit 序列号)
 *
 * @author wuzhihong
 * @since 2021/03/17
 */
@Slf4j
public class SnowFlakeUtil {

    // 工作机器标识位数
    private final static long WORKER_ID_BITS = 10L;
    // 毫秒内自增位数（序列）
    private final static long SEQUENCE_BITS = 12L;
    // 工作机器ID偏左移12位
    private final static long WORKER_ID_SHIFT = SEQUENCE_BITS;
    // 时间毫秒左移22位
    private final static long TIMESTAMP_LEFT_SHIFT = SEQUENCE_BITS + WORKER_ID_BITS;
    // 序列掩码，验证序列是否超出上限
    private final static long SEQUENCE_MASK = ~(-1L << SEQUENCE_BITS);

    // 起始时间戳 （北京时间: 2021-01-01 00:00:00）
    private final static long START_TIME_STAMP = 1609430400000L;
    // 上次时间戳
    private static long LAST_TIME_STAMP = -1L;

    // 工作机器ID
    private final long workerId;
    // 当前毫秒内序列
    private long sequence = 0L;


    // 单例模式
    private static final SnowFlakeUtil instance;
    static {
        instance = new SnowFlakeUtil(RandomUtil.nextLong(0L, 1023L));
    }
    private SnowFlakeUtil(Long workerId) {
        this.workerId = workerId;
    }

    // 获取下一个UUID
    public static synchronized long getNextId() {
        return instance.generateNextId();
    }
    public synchronized long generateNextId() {
        // 获取当前时间戳
        long timestamp = this.getCurrentMillis();

        // 如果时间戳小于上次时间戳则报错
        if (timestamp < LAST_TIME_STAMP) {
            try {
                throw new Exception("发生了时间回溯？接下来 " + (LAST_TIME_STAMP - timestamp) + " 毫秒内不再接受生成请求！");
            } catch (Exception e) {
                log.error(e.getMessage());
            }
        }

        // 如果时间戳与上次时间戳相同
        if (LAST_TIME_STAMP == timestamp) {
            // 当前毫秒序列+1，与sequenceMask确保sequence不会超出上限
            sequence = (sequence + 1) & SEQUENCE_MASK;
            if (sequence == 0) {
                // 当前毫秒内计数满了，则等待下一秒
                timestamp = waitNextMillis(LAST_TIME_STAMP);
            }
        } else {
            // 当前时间戳大于上次时间戳，开始新序列
            sequence = 0;
        }

        // 更新最后访问时间，对ID偏移组合生成最终的ID
        LAST_TIME_STAMP = timestamp;
        return ((timestamp - START_TIME_STAMP) << TIMESTAMP_LEFT_SHIFT) | (workerId << WORKER_ID_SHIFT) | sequence;
    }

    // 获取当前时间戳
    private long getCurrentMillis() {
        return System.currentTimeMillis();
    }
    // 等待新的时间戳
    private long waitNextMillis(final long lastTimestamp) {
        long timestamp = this.getCurrentMillis();
        while (timestamp <= lastTimestamp) {
            timestamp = this.getCurrentMillis();
        }
        return timestamp;
    }
}

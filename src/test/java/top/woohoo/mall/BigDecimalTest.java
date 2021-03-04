package top.woohoo.mall;

import org.junit.Test;

import java.math.BigDecimal;

// 价格计算问题的演示测试
public class BigDecimalTest {

    @Test
    public void test1() {
        // Java处理浮点数的精度问题
        System.out.println(0.05 + 0.01);
        System.out.println(1.0 - 0.42);
        System.out.println(4.015 * 100);
        System.out.println(123.3 / 100);
    }

    @Test
    public void test2() {
        // 使用BigDecimal的Double构造器
        BigDecimal b1 = new BigDecimal(0.05);
        BigDecimal b2 = new BigDecimal(0.01);
        System.out.println(b1.add(b2));
    }

    @Test
    public void test3() {
        // 使用BigDecimal的String构造器
        BigDecimal b1 = new BigDecimal("0.05");
        BigDecimal b2 = new BigDecimal("0.01");
        System.out.println(b1.add(b2));
    }
}

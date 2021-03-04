package top.woohoo.mall.util;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.junit.Test;

import java.util.Date;

public class DateTimeUtil {
    public static final String STANDARD_FORMAT = "yyyy-MM-dd HH:mm:ss";

    public static Date formatTime2Timestamp(String formatTime) {
        DateTimeFormatter dateTimeFormatter = DateTimeFormat.forPattern(STANDARD_FORMAT);
        DateTime dateTime = dateTimeFormatter.parseDateTime(formatTime);
        return dateTime.toDate();
    }

    public static String timestamp2FormatTime(Date timestamp) {
        if (timestamp == null) {
            return null;
        }
        DateTime dateTime = new DateTime(timestamp);
        return dateTime.toString(STANDARD_FORMAT);
    }


    // 以下两个方法与上面的方法一致，但是需要自带时间格式，而非使用默认格式。
    public static Date formatTime2Timestamp(String formatTime, String format) {
        DateTimeFormatter dateTimeFormatter = DateTimeFormat.forPattern(format);
        DateTime dateTime = dateTimeFormatter.parseDateTime(formatTime);
        return dateTime.toDate();
    }

    public static String timestamp2FormatTime(Date timestamp, String format) {
        if (timestamp == null) {
            return null;
        }
        DateTime dateTime = new DateTime(timestamp);
        return dateTime.toString(format);
    }
}
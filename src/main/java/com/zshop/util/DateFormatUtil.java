package com.zshop.util;

import org.apache.commons.lang3.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Author ZhangHang
 * Date 2018/2/22 11:27
 * Description
 */
public class DateFormatUtil {
    /**
     * 时间格式转化为字符串
     * @param time
     * @return
     */
    public static String dateFormat(Date time) {
        if (time == null) {
            return "";
        }
        String resultDate = null;
        try {
            Date date = new SimpleDateFormat("EEE MMM dd HH:mm:ss Z yyyy", Locale.UK).parse(time.toString());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            resultDate = sdf.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return resultDate;
    }

    /**
     * 字符串转为时间格式
     * @param dateString
     * @return
     */
    public static Date parseDate(String dateString) {
        if (StringUtils.isBlank(dateString)) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = sdf.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    public static void main(String[] args) {
        String str = "2018-02-23 00:25:00";
        Date date = DateFormatUtil.parseDate(str);
        System.out.println(date);
    }
}

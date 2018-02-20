package com.zshop.util;

import java.io.UnsupportedEncodingException;

/**
 * Author ZhangHang
 * Date 2018/2/20 19:41
 * Description
 */
public class EncodingTool {
    public static String encodeStr(String str) {
        try {
            return new String(str.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }
}

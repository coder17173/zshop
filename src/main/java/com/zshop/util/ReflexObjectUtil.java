package com.zshop.util;

import com.zshop.common.AdminSearchParam;
import com.zshop.common.OrderSearchParam;

import java.lang.reflect.Field;

/**
 * Author ZhangHang
 * Date 2018/2/20 17:01
 * Description
 */
public class ReflexObjectUtil {
    public static boolean isBlank(Object obj) {
        boolean isBlank = true;
        Class beanClass = obj.getClass();
        Field[] fs = beanClass.getDeclaredFields();
        for (Field f : fs) {
            f.setAccessible(true);
            String name = f.getName();
            Object val = new Object();
            try {
                val = f.get(obj);
                if(val != null && !"".equals(val)) {
                    isBlank = false;
                }
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return isBlank;
    }

    public static void main(String[] args) {
        /*AdminSearchParam searchParam = new AdminSearchParam();
        boolean result = ReflexObjectUtil.isBlank(searchParam);
        System.out.println(result);*/

        OrderSearchParam orderSearchParam = new OrderSearchParam();
        orderSearchParam.setOrderNumber("");
        boolean result = ReflexObjectUtil.isBlank(orderSearchParam);
        System.out.println(result);

    }
}

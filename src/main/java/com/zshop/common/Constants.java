package com.zshop.common;

/**
 * Author ZhangHang
 * Date 2018/2/12 16:55
 * Description
 */
public class Constants {
    public static final String LOGIN_ADMIN = "login_admin";
    public static final String LOGIN_USER = "login_user";
    public static final int IMG_WIDTH = 300;
    public static final int IMG_HEIGHT = 300;

    public static class OrderStatus {
        public static final Integer WAIT_PAY = 0;//待付款
        public static final Integer PAYED = 1;//已付款
        public static final Integer SHIPPED = 2;//已发货
        public static final Integer DELETED = 3;//已删除
        public static final Integer ENDED = 4;//已完成
    }
}

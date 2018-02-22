package com.zshop.common;

/**
 * Author ZhangHang
 * Date 2018/2/21 20:15
 * Description
 */
public enum OrderStateEnum {
    WAIT_PAY(0, "待付款"),
    PAYED(1, "已付款"),
    SHIPPED(2, "已发货"),
    DELETED(3, "已删除"),
    ENDED(4, "已完成");

    private Integer code;
    private String desc;

    OrderStateEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}

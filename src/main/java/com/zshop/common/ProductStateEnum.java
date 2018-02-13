package com.zshop.common;

/**
 * Author ZhangHang
 * Date 2018/2/11 22:25
 * Description
 */
public enum ProductStateEnum {
    WITHDRAW(0, "已下架"),
    ONSALE(1, "在售");

    private Integer code;
    private String desc;

    ProductStateEnum(Integer code, String desc) {
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

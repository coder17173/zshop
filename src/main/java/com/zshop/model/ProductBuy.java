package com.zshop.model;

/**
 * Author ZhangHang
 * Date 2018/3/3 19:01
 * Description
 */
public class ProductBuy {
    private Integer pid;
    private Float buyPrice;

    public ProductBuy(Integer pid, Float buyPrice) {
        this.pid = pid;
        this.buyPrice = buyPrice;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Float getBuyPrice() {
        return buyPrice;
    }

    public void setBuyPrice(Float buyPrice) {
        this.buyPrice = buyPrice;
    }
}

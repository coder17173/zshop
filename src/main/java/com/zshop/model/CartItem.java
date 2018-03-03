package com.zshop.model;

import java.io.Serializable;

/**
 * Author ZhangHang
 * Date 2018/3/3 10:38
 * Description
 */
public class CartItem implements Serializable {
    private Product product;
    private Integer number;

    public CartItem(Product product, Integer number) {
        this.product = product;
        this.number = number;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}

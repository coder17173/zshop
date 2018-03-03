package com.zshop.model;

import java.io.Serializable;

public class OrderItem implements Serializable{
    private Integer oiid;

    private Integer count;

    private Float subTotal;

    private Order order;

    private Integer oid;

    private Product product;

    private Integer pid;

    private Float buyPrice;


    public Integer getOiid() {
        return oiid;
    }

    public void setOiid(Integer oiid) {
        this.oiid = oiid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Float getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Float subTotal) {
        this.subTotal = subTotal;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Float getBuyPrice() {
        return buyPrice;
    }

    public void setBuyPrice(Float buyPrice) {
        this.buyPrice = buyPrice;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}
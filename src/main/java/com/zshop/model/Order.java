package com.zshop.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Order implements Serializable {
    private Integer oid;

    private String orderNumber;//订单编号

    private Date createTime;//创建时间

    private String createTimeStr;

    private Integer uid;

    private User user;//关联客户

    private String name;//收货人

    private String phone;//收货人电话

    private String addr;//收货人地址

    private Integer state;//订单状态

    private String stateDesc;//订单状态描述

    private Float total;//总价

    private String zipCode;//邮编

    private Date payTime;//付款时间

    private Date shipTime;//发货时间

    private Date confirmTime;//确认收货时间

    private String payTimeStr;

    private String shipTimeStr;

    private String confirmTimeStr;

    private List<OrderItem> orderItems;//订单关联的商品集合

    private UserAddress address;

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr == null ? null : addr.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getStateDesc() {
        return stateDesc;
    }

    public void setStateDesc(String stateDesc) {
        this.stateDesc = stateDesc;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Date getShipTime() {
        return shipTime;
    }

    public void setShipTime(Date shipTime) {
        this.shipTime = shipTime;
    }

    public Date getConfirmTime() {
        return confirmTime;
    }

    public void setConfirmTime(Date confirmTime) {
        this.confirmTime = confirmTime;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public String getCreateTimeStr() {
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }

    public String getPayTimeStr() {
        return payTimeStr;
    }

    public void setPayTimeStr(String payTimeStr) {
        this.payTimeStr = payTimeStr;
    }

    public String getShipTimeStr() {
        return shipTimeStr;
    }

    public void setShipTimeStr(String shipTimeStr) {
        this.shipTimeStr = shipTimeStr;
    }

    public String getConfirmTimeStr() {
        return confirmTimeStr;
    }

    public void setConfirmTimeStr(String confirmTimeStr) {
        this.confirmTimeStr = confirmTimeStr;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public UserAddress getAddress() {
        return address;
    }

    public void setAddress(UserAddress address) {
        this.address = address;
    }
}
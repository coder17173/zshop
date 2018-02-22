package com.zshop.common;

import com.zshop.model.User;

import java.util.Date;

/**
 * Author ZhangHang
 * Date 2018/2/21 16:21
 * Description
 */
public class OrderSearchParam {
    private String orderNumber;
    private Integer orderState;
    private Date start;
    private Date end;
    private String startDate;
    private String endDate;
    private User user;

    public OrderSearchParam() {
    }

    public OrderSearchParam(String orderNumber, Integer orderState, String start, String end, User user) {
        this.orderNumber = orderNumber;
        this.orderState = orderState;
        this.startDate = start;
        this.endDate = end;
        this.user = user;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "OrderSearchParam{" +
                "orderNumber='" + orderNumber + '\'' +
                ", orderState=" + orderState +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", user=" + user +
                '}';
    }
}

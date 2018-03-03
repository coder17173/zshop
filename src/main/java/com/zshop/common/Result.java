package com.zshop.common;

import java.io.Serializable;

/**
 * Author ZhangHang
 * Date 2018/3/3 10:51
 * Description
 */
public class Result implements Serializable {
    /**
     * 状态
     */
    private Status status;

    /**
     * 消息
     */
    private String message;


    public void setToFail(){
        this.message = "未知异常";
        this.status = Status.FAIL;
    }

    public void setToFail(String message){
        this.message = message;
        this.status = Status.FAIL;
    }

    public void setToSuccess(){
        this.message = "成功";
        this.status = Status.SUCCESS;
    }

    public void setToSuccess(String message){
        this.message = message;
        this.status = Status.SUCCESS;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}

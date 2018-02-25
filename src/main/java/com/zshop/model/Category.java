package com.zshop.model;

import java.util.List;

public class Category {
    private Integer cid;

    private String cname;

    private List<CategorySecond> csList;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public List<CategorySecond> getCsList() {
        return csList;
    }

    public void setCsList(List<CategorySecond> csList) {
        this.csList = csList;
    }

    @Override
    public String toString() {
        return "Category{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                ", csList=" + csList +
                '}';
    }
}
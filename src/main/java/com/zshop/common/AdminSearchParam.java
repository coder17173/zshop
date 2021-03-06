package com.zshop.common;

import java.io.Serializable;
import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/20 15:14
 * Description
 */
public class AdminSearchParam implements Serializable{
    private String pname;
    private String pcode;
    private Integer pstate;
    private List<Integer> csids;
    private Integer cid;
    private Integer csid;
    private String searchQuery;
    private List<String> queryList;

    public AdminSearchParam() {}

    public AdminSearchParam(String pname, String pcode, Integer pstate) {
        this.pname = pname;
        this.pcode = pcode;
        this.pstate = pstate;
//        this.csids = new ArrayList<Integer>();
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public Integer getPstate() {
        return pstate;
    }

    public void setPstate(Integer pstate) {
        this.pstate = pstate;
    }

    public List<Integer> getCsids() {
        return csids;
    }

    public void setCsids(List<Integer> csids) {
        this.csids = csids;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    public String getSearchQuery() {
        return searchQuery;
    }

    public void setSearchQuery(String searchQuery) {
        this.searchQuery = searchQuery;
    }

    public List<String> getQueryList() {
        return queryList;
    }

    public void setQueryList(List<String> queryList) {
        this.queryList = queryList;
    }
}

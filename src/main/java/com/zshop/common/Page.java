package com.zshop.common;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/11 13:26
 * Description
 */
public class Page<T> {
    public static final int DEFAULT_PAGE_SIZE = 10;
    public static final String ASC = "asc";
    public static final String DESC = "desc";

    private int pageNo = 1;
    private int pageSize = -1;
    private String order = null;
    private List<T> result = new ArrayList<T>();
    private long totalCount = -1;

    public Page(int pageNo, int pageSize){
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    public Page(HttpServletRequest request) {
        int pageNo = Integer.parseInt(StringUtils.defaultIfBlank(request.getParameter("p"), "1"));
        this.pageNo = pageNo;
        int pageSize = Integer.parseInt(StringUtils.defaultIfBlank(request.getParameter("ps"), String.valueOf(DEFAULT_PAGE_SIZE)));
        this.pageSize = pageSize;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
        if(pageNo < 1) {
            this.pageNo = 1;
        }
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public List<T> getResult() {
        return result;
    }

    public void setResult(List<T> result) {
        this.result = result;
    }

    public long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }

    /**
     * 总页数
     * @return
     */
    public long getTotalPages() {
        if(totalCount < 0) {
            return -1;
        }
        long pages = totalCount / pageSize;
        if(totalCount % pageSize > 0) {
            pages++;
        }
        return pages;
    }

    /**
     * 根据pageNo和pageSize计算当前页第一条记录在总结果集中的位置,序号从1开始.
     */
    public int getFirst() {
        return (pageNo - 1) * pageSize;
    }

    /**
     * 是否还有下一页
     * @return
     */
    public boolean isHasNext() {
        return (pageNo + 1 <= getTotalPages());
    }

    /**
     * 取得下页的页号, 序号从1开始. 当前页为尾页时仍返回尾页序号.
     */
    public int getNextPage() {
        if (isHasNext()) {
            return pageNo + 1;
        } else {
            return pageNo;
        }
    }

    /**
     * 是否还有上一页.
     */
    public boolean isHasPre() {
        return (pageNo - 1 >= 1);
    }

    /**
     * 取得上页的页号, 序号从1开始. 当前页为首页时返回首页序号.
     */
    public int getPrePage() {
        if (isHasPre()) {
            return pageNo - 1;
        } else {
            return pageNo;
        }
    }
}

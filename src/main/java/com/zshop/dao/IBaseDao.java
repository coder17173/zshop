package com.zshop.dao;

import com.zshop.model.Admin;
import org.apache.ibatis.annotations.Param;

/**
 * @author zhanghang
 * @description
 * @date 2018/1/27 15:55
 * @modified by
 */
public interface IBaseDao<T> {
    /**
     * 插入
     *
     * @param o
     */
    public void insert(T o);

    /**
     * 删除
     *
     * @param id
     */
    public void deleteById(Integer id);

    /**
     * 修改
     *
     * @param o
     */
    public void updateById(T o);

    /**
     * 统计
     * @return
     */
    public Integer count();
}

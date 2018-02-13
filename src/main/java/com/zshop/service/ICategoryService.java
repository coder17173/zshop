package com.zshop.service;

import com.zshop.model.Category;

import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/11 10:16
 * Description
 */
public interface ICategoryService {
    /**
     * 根据ID查询
     * @param id
     * @return
     */
    public Category findById(Integer id);

    /**
     * 根据name查询
     * @param name
     * @return
     */
    public Category findByName(String name);

    /**
     * 查询所有
     * @return
     */
    public List<Category> findAll();
}

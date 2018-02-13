package com.zshop.service;

import com.zshop.model.CategorySecond;

import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/11 9:33
 * Description
 */
public interface ICategorySecondService {
    /**
     * 根据ID查询
     * @param id
     * @return
     */
    public CategorySecond findById(Integer id);

    /**
     * 根据name查询
     * @param name
     * @return
     */
    public CategorySecond findByName(String name);

    /**
     * 查询所有
     * @return
     */
    public List<CategorySecond> findAll();
}

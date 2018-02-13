package com.zshop.dao;

import com.zshop.model.Category;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/10 22:32
 * Description
 */
@Component
public interface ICategoryDao extends IBaseDao<Category>{
    /**
     * 根据id查找一级类目
     * @param id
     * @return
     */
    public Category selectById(Integer id);

    /**
     * 根据name查询
     * @param name
     * @return
     */
    public Category selectByName(String name);

    /**
     * 查询所有
     * @return
     */
    public List<Category> selectAll();
}

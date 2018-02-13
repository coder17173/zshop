package com.zshop.service.impl;

import com.zshop.dao.ICategoryDao;
import com.zshop.model.Category;
import com.zshop.service.ICategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/11 10:18
 * Description
 */
@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService {
    @Resource
    private ICategoryDao categoryDao;
    @Override
    public Category findById(Integer id) {
        Category category = categoryDao.selectById(id);
        return category;
    }

    @Override
    public Category findByName(String name) {
        Category category = categoryDao.selectByName(name);
        return category;
    }

    @Override
    public List<Category> findAll() {
        List<Category> list = categoryDao.selectAll();
        return list;
    }
}

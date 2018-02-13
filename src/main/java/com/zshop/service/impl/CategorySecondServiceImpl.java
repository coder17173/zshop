package com.zshop.service.impl;

import com.zshop.dao.ICategorySecondDao;
import com.zshop.model.CategorySecond;
import com.zshop.service.ICategorySecondService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/11 9:34
 * Description
 */
@Service("categorySecondService")
public class CategorySecondServiceImpl implements ICategorySecondService {
    @Resource
    private ICategorySecondDao categorySecondDao;
    @Override
    public CategorySecond findById(Integer id) {
        CategorySecond categorySecond = categorySecondDao.selectById(id);
        return categorySecond;
    }

    @Override
    public CategorySecond findByName(String name) {
        CategorySecond categorySecond = categorySecondDao.selectByName(name);
        return categorySecond;
    }

    @Override
    public List<CategorySecond> findAll() {
        List<CategorySecond> list = categorySecondDao.selectAll();
        return list;
    }
}

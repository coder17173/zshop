package com.zshop.mapper;

import com.zshop.model.CategorySecond;

public interface CategorySecondMapper {
    int deleteByPrimaryKey(Integer csid);

    int insert(CategorySecond record);

    int insertSelective(CategorySecond record);

    CategorySecond selectByPrimaryKey(Integer csid);

    int updateByPrimaryKeySelective(CategorySecond record);

    int updateByPrimaryKey(CategorySecond record);
}
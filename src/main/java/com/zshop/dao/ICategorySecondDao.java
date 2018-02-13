package com.zshop.dao;

import com.zshop.model.CategorySecond;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/10 22:43
 * Description
 */
@Component
public interface ICategorySecondDao extends IBaseDao<CategorySecond>{
    /**
     * 根据id查询商品二级类目
     * @param id
     * @return
     */
    public CategorySecond selectById(Integer id);

    /**
     * 根据name查询
     * @param name
     * @return
     */
    public CategorySecond selectByName(String name);

    /**
     * 查询所有
     * @return
     */
    public List<CategorySecond> selectAll();
}

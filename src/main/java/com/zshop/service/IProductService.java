package com.zshop.service;

import com.zshop.common.Page;
import com.zshop.model.Product;

import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/11 12:21
 * Description
 */
public interface IProductService {
    /**
     * 根据ID查询商品
     * @param id
     * @return
     */
    public Product findById(Integer id);

    /**
     * 根据name查询商品
     * @param name
     * @return
     */
    public Product findByName(String name);

    /**
     * 分页查询
     * @param page
     * @return
     */
    public Page<Product> findProductByLimit(Page page);

    /**
     * 修改信息
     * @param product
     */
    public Product update(Product product);
}

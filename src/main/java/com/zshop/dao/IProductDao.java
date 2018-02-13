package com.zshop.dao;

import com.zshop.model.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author zhanghang
 * @description
 * @date 2018/1/27 17:49
 * @modified by
 */
@Component
public interface IProductDao extends IBaseDao<Product> {
    /**
     * 根据ID查询商品
     * @param id
     * @return
     */
    public Product selectById(Integer id);

    /**
     * 根据name查询商品
     * @param name
     * @return
     */
    public Product selectByName(String name);

    /**
     * 分页查询
     * @param offset
     * @param pageSize
     * @return
     */
    public List<Product> selectByLimit(@Param("offset") int offset, @Param("limit") int pageSize);

//    public List<Product> findByCategorySecondCsid(@Param("csid") Integer csid, @Param("page") Integer page);

//    public List<Product> findByCategoryCid(Integer cid, Integer page);


}

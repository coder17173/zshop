package com.zshop.dao;

import com.zshop.common.AdminSearchParam;
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

    /**
     * 多条件分页查询
     * @param offset
     * @param pageSize
     * @param searchParam
     * @return
     */
    public List<Product> selectBySearchParam(@Param("offset") int offset, @Param("limit") int pageSize, @Param("searchParam") AdminSearchParam searchParam);

    /**
     * 条件查询统计
     * @param searchParam
     * @return
     */
    public Integer countByParam(@Param("searchParam") AdminSearchParam searchParam);
//    public List<Product> findByCategorySecondCsid(@Param("csid") Integer csid, @Param("page") Integer page);

//    public List<Product> findByCategoryCid(Integer cid, Integer page);


}

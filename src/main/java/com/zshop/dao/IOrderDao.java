package com.zshop.dao;

import com.zshop.common.AdminSearchParam;
import com.zshop.common.OrderSearchParam;
import com.zshop.model.Order;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/21 15:15
 * Description
 */
@Component
public interface IOrderDao extends IBaseDao<Order> {
    /**
     * 根据id查询订单
     * @param id
     * @return
     */
    public Order selectById(Integer id);

    /**
     * 订单分页查询
     * @param offset
     * @param pageSize
     * @return
     */
    public List<Order> selectByLimit(@Param("offset") int offset, @Param("limit") int pageSize);

    /**
     * 多条件查询
     * @param offset
     * @param pageSize
     * @param orderSearchParam
     * @return
     */
    public List<Order> selectBySearchParam(@Param("offset") int offset, @Param("limit") int pageSize, @Param("searchParam")OrderSearchParam orderSearchParam);

    /**
     * 统计该用户下订单总数
     * @param uid
     * @return
     */
    public Integer countByUser(Integer uid);

    /**
     *
     * @param searchParam
     * @return
     */
    public Integer countByParam(@Param("searchParam") OrderSearchParam searchParam);

    /**
     * 更改订单状态
     * @param oid
     * @param state
     */
    public void updateOrderStatus(@Param("oid") Integer oid, @Param("state") Integer state);

    /**
     *
     * @param uid
     */
    public List<Integer> selectAllByUser(@Param("uid")Integer uid);
}

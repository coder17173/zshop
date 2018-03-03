package com.zshop.dao;

import com.zshop.model.OrderItem;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/21 15:26
 * Description
 */
@Component
public interface IOrderItemDao extends IBaseDao<OrderItem> {
    /**
     * 根据id查询订单详情
     * @param id
     * @return
     */
    public OrderItem selectById(Integer id);

    /**
     * 根据订单id查询详情
     * @param oid
     * @return
     */
    public List<OrderItem> selectByOrderId(Integer oid);

    /**
     *
     * @param oid
     * @return
     */
    public List<OrderItem> deleteByOrderId(Integer oid);

}

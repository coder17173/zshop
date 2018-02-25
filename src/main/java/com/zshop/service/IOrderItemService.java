package com.zshop.service;

import com.zshop.model.OrderItem;

import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/23 13:50
 * Description
 */
public interface IOrderItemService {
    /**
     * id查找订单
     *
     * @param oid
     * @return
     */
    public OrderItem findById(Integer oid);

    /**
     * 更新
     *
     * @param orderItem
     * @return
     */
    public OrderItem update(OrderItem orderItem);

    /**
     * 增加订单项
     *
     * @param orderItem
     * @return
     */
    public OrderItem add(OrderItem orderItem);

    /**
     * 删除订单项
     *
     * @param oiid
     */
    public void delete(Integer oiid);

    /**
     * 根据订单id查询详情
     *
     * @param oid
     * @return
     */
    public List<OrderItem> findByOrderId(Integer oid);
}

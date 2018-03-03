package com.zshop.service;

import com.zshop.common.OrderSearchParam;
import com.zshop.common.Page;
import com.zshop.model.Order;

import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/21 15:57
 * Description
 */
public interface IOrderService {
    /**
     * id查找订单
     * @param oid
     * @return
     */
    public Order findById(Integer oid);

    /**
     * 分页查询订单
     * @param page
     * @return
     */
    public Page<Order> findOrdersByLimit(Page page);

    /**
     * 分页参数查询
     * @param page
     * @param param
     * @return
     */
    public Page<Order> findOrdersByParam(Page page, OrderSearchParam param);

    /**
     * 更新
     * @param order
     * @return
     */
    public Order update(Order order);

    /**
     * 增加订单（管理员无法新增订单）
     * @param order
     * @return
     */
    public Order add(Order order);

    /**
     * 删除订单
     * @param oid
     */
    public void delete(Integer oid);

    /**
     * 修改订单状态
     * @param oid
     * @param state
     */
    public void updateState(Integer oid, Integer state);

    /**
     * @param uid
     * @return
     */
    public List<Integer> findAllByUserId(Integer uid);
}

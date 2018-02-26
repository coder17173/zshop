package com.zshop.service.impl;

import com.zshop.common.OrderSearchParam;
import com.zshop.common.OrderStateService;
import com.zshop.common.Page;
import com.zshop.dao.IOrderDao;
import com.zshop.dao.IOrderItemDao;
import com.zshop.model.Order;
import com.zshop.model.OrderItem;
import com.zshop.service.IOrderItemService;
import com.zshop.service.IOrderService;
import com.zshop.util.DateFormatUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/21 20:33
 * Description
 */
@Service("orderService")
public class OrderServiceImpl implements IOrderService {
    @Resource
    private IOrderDao orderDao;
    @Resource
    private IOrderItemDao orderItemDao;
    @Resource
    private IOrderItemService orderItemService;

    @Override
    public Order findById(Integer oid) {
        Order order = orderDao.selectById(oid);
        List<OrderItem> orderItems = orderItemDao.selectByOrderId(order.getOid());
        order.setOrderItems(orderItems);
        int state = order.getState();
        String stateDesc = OrderStateService.getOrderStateDesc(state);
        order.setStateDesc(stateDesc);
        String createTime = DateFormatUtil.dateFormat(order.getCreateTime());
        String payTime = DateFormatUtil.dateFormat(order.getPayTime());
        String shipTime = DateFormatUtil.dateFormat(order.getShipTime());
        String confirmTime = DateFormatUtil.dateFormat(order.getConfirmTime());
        order.setCreateTimeStr(createTime);
        order.setPayTimeStr(payTime);
        order.setShipTimeStr(shipTime);
        order.setConfirmTimeStr(confirmTime);
        return order;
    }

    @Override
    public Page<Order> findOrdersByLimit(Page page) {
        int count = orderDao.count();
        page.setTotalCount(count);
        int offset = page.getFirst();
        int pageSize = page.getPageSize();
        List<Order> orders = orderDao.selectByLimit(offset, pageSize);
        for (Order order : orders) {
           /* List<OrderItem> orderItems = orderItemDao.selectByOrderId(order.getOid());
            order.setOrderItems(orderItems);*/
            int state = order.getState();
            String stateDesc = OrderStateService.getOrderStateDesc(state);
            order.setStateDesc(stateDesc);
            String createTime = DateFormatUtil.dateFormat(order.getCreateTime());
            String payTime = DateFormatUtil.dateFormat(order.getPayTime());
            String shipTime = DateFormatUtil.dateFormat(order.getShipTime());
            String confirmTime = DateFormatUtil.dateFormat(order.getConfirmTime());
            order.setCreateTimeStr(createTime);
            order.setPayTimeStr(payTime);
            order.setShipTimeStr(shipTime);
            order.setConfirmTimeStr(confirmTime);
        }
        page.setResult(orders);
        return page;
    }

    @Override
    public Page<Order> findOrdersByParam(Page page, OrderSearchParam param) {
        int count = orderDao.countByParam(param);
        page.setTotalCount(count);
        int offset = page.getFirst();
        int pageSize = page.getPageSize();
        List<Order> orders = orderDao.selectBySearchParam(offset, pageSize, param);
        for (Order order : orders) {
            int state = order.getState();
            String stateDesc = OrderStateService.getOrderStateDesc(state);
            order.setStateDesc(stateDesc);
            String createTime = DateFormatUtil.dateFormat(order.getCreateTime());
            String payTime = DateFormatUtil.dateFormat(order.getPayTime());
            String shipTime = DateFormatUtil.dateFormat(order.getShipTime());
            String confirmTime = DateFormatUtil.dateFormat(order.getConfirmTime());
            order.setCreateTimeStr(createTime);
            order.setPayTimeStr(payTime);
            order.setShipTimeStr(shipTime);
            order.setConfirmTimeStr(confirmTime);
        }
        page.setResult(orders);
        return page;
    }

    @Override
    public Order update(Order order) {
        orderDao.updateById(order);
        return order;
    }

    @Override
    public Order add(Order order) {
        return null;
    }

    @Override
    public void delete(Integer oid) {
        orderDao.deleteById(oid);
    }
}

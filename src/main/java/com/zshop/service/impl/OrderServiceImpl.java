package com.zshop.service.impl;

import com.zshop.common.*;
import com.zshop.dao.IOrderDao;
import com.zshop.dao.IOrderItemDao;
import com.zshop.model.Order;
import com.zshop.model.OrderItem;
import com.zshop.service.IOrderItemService;
import com.zshop.service.IOrderService;
import com.zshop.util.DateFormatUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
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
        orderDao.insert(order);
        if(order.getOrderItems() != null) {
            for (OrderItem item : order.getOrderItems()) {
                item.setOid(order.getOid());
                System.out.println(order.getOid());
                orderItemService.add(item);
            }
        }
        return order;
    }


    /**
     *删除订单以及对应订单项
     * @param oid
     */
    @Override
    public void delete(Integer oid) {
        orderItemService.deleteByOrderId(oid);
        orderDao.deleteById(oid);
    }

    @Override
    public void updateState(Integer oid, Integer state) {
        Order order = orderDao.selectById(oid);
        order.setState(state);
        if(OrderStateEnum.PAYED.getCode().equals(state)) {
            order.setPayTime(new Date());
        } else if(OrderStateEnum.SHIPPED.getCode().equals(state)){
            order.setShipTime(new Date());
        } else if(OrderStateEnum.ENDED.getCode().equals(state)) {
            order.setConfirmTime(new Date());
        }
        orderDao.updateById(order);
    }

    @Override
    public List<Integer> findAllByUserId(Integer uid) {
        List<Integer> list = orderDao.selectAllByUser(uid);
        return list;
    }
}

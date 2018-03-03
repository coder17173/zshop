package com.zshop.service.impl;

import com.zshop.dao.IOrderItemDao;
import com.zshop.model.OrderItem;
import com.zshop.service.IOrderItemService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/23 13:56
 * Description
 */
@Service("orderItemService")
public class OrderItemServiceImpl implements IOrderItemService {
    @Resource
    private IOrderItemDao orderItemDao;

    @Override
    public OrderItem findById(Integer oid) {
        OrderItem orderItem = orderItemDao.selectById(oid);
        return orderItem;
    }

    @Override
    public OrderItem update(OrderItem orderItem) {
        return null;
    }

    @Override
    public OrderItem add(OrderItem orderItem) {
        orderItemDao.insert(orderItem);
        return orderItem;
    }

    @Override
    public void delete(Integer oiid) {
        orderItemDao.deleteById(oiid);
    }

    @Override
    public List<OrderItem> findByOrderId(Integer oid) {
        List<OrderItem> orderItems = orderItemDao.selectByOrderId(oid);
       /* for (OrderItem orderItem : orderItems) {
            int state = orderItem.getProduct().getState();
            String StateDesc = (state == 0) ? ProductStateEnum.WITHDRAW.getDesc() : ProductStateEnum.ONSALE.getDesc();
            orderItem.getProduct().setStateDesc(StateDesc);
        }*/
        return orderItems;
    }

    @Override
    public void deleteByOrderId(Integer oid) {
        orderItemDao.deleteByOrderId(oid);
    }
}

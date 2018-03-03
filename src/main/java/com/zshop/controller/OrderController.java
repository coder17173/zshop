package com.zshop.controller;

import com.zshop.common.Constants;
import com.zshop.common.OrderStateEnum;
import com.zshop.model.Order;
import com.zshop.model.OrderItem;
import com.zshop.model.User;
import com.zshop.model.UserAddress;
import com.zshop.service.IOrderService;
import com.zshop.service.IUserAddressService;
import com.zshop.service.IUserService;
import com.zshop.util.CartUtil;
import com.zshop.util.DateFormatUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/3/2 21:31
 * Description
 */
@Controller
@RequestMapping(value = "/order")
public class OrderController {
    @Resource
    private IOrderService orderService;
    @Resource
    private IUserService userService;
    @Resource
    private IUserAddressService userAddressService;

    @RequestMapping(value = "/purchase", method = RequestMethod.GET)
    public ModelAndView purchase(ModelAndView modelAndView, HttpSession session) {
        Object obj = session.getAttribute(Constants.LOGIN_USER);
        User user = (obj == null) ? null : (User) obj;
        int uid = userService.findByUserNameAndPassword(user.getNickName(), user.getPassword()).getUid();
        List<UserAddress> addressList = userAddressService.selectByUserId(uid);
        modelAndView.addObject("addressList", addressList);
        modelAndView.setViewName("order/orderPurchase.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "ordering", method = RequestMethod.POST)
    public String ordering(HttpSession session, @ModelAttribute("optionsRadios") Integer addressId) {
        Order order = new Order();
        order.setCreateTime(new Date());
        Object obj = session.getAttribute(Constants.LOGIN_USER);
        User tmp = (obj == null) ? null : (User) obj;
        User user = userService.findByUserNameAndPassword(tmp.getNickName(), tmp.getPassword());
        order.setUser(user);
        order.setUid(user.getUid());
        order.setOrderNumber(DateFormatUtil.dateToOrderNumber(new Date()));
        order.setState(OrderStateEnum.WAIT_PAY.getCode());
        List<OrderItem> itemList = CartUtil.getOrderItemFromCart(session);
        //总金额
        BigDecimal totalSum = new BigDecimal("0");
        for (OrderItem orderItem : itemList) {
            totalSum = totalSum.add(new BigDecimal(orderItem.getSubTotal()));
            orderItem.setOrder(order);
        }
        order.setTotal(totalSum.floatValue());
        order.setOrderItems(itemList);
        //地址
        UserAddress address = userAddressService.findById(addressId);
        order.setName(address.getName());
        order.setPhone(address.getPhone());
        order.setAddr(address.getAddress());
        order.setZipCode(address.getZipcode());

        orderService.add(order);
        CartUtil.cleanCart(session);
        return "order/orderingSuccess.jsp";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView viewOrder(ModelAndView modelAndView, @PathVariable("id") Integer id) {
        Order order = orderService.findById(id);
        modelAndView.addObject("order", order);
        modelAndView.setViewName("order/orderDetail.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/pay/{id}", method = RequestMethod.GET)
    public ModelAndView pay(ModelAndView modelAndView, @PathVariable("id") Integer id) {
        Order order = orderService.findById(id);
        order.setState(OrderStateEnum.PAYED.getCode());
        order.setPayTime(new Date());
        orderService.update(order);
        modelAndView.setViewName("redirect:/user/order/");
        return modelAndView;
    }

    @RequestMapping(value = "/cancel/{id}", method = RequestMethod.GET)
    public String cancel(@PathVariable(value = "id") Integer oid) {
        orderService.updateState(oid, OrderStateEnum.DELETED.getCode());
        return "redirect:/user/order/";
    }

    @RequestMapping(value = "/confirm/{id}", method = RequestMethod.GET)
    public String confirm(@PathVariable(value = "id") Integer orderId) {
        orderService.updateState(orderId, OrderStateEnum.ENDED.getCode());
        return "redirect:/user/order/";
    }

}

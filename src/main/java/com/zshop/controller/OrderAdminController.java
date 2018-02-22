package com.zshop.controller;

import com.zshop.common.Constants;
import com.zshop.common.OrderSearchParam;
import com.zshop.common.Page;
import com.zshop.model.Order;
import com.zshop.service.IOrderService;
import com.zshop.util.DateFormatUtil;
import com.zshop.util.ReflexObjectUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Author ZhangHang
 * Date 2018/2/22 10:34
 * Description
 */
@Controller
@RequestMapping(value = "/admin/order")
public class OrderAdminController {
    @Resource
    private IOrderService orderService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView listOrder(ModelAndView modelAndView, HttpServletRequest request, HttpSession session, @ModelAttribute("searchParam") OrderSearchParam searchParam) {
        //判断管理员是否登录
        Object obj = session.getAttribute(Constants.LOGIN_ADMIN);
        if(obj == null ){
            modelAndView.setViewName("redirect:/admin/login");
            return modelAndView;
        }
        Page<Order> page = new Page<Order>(request);
        if(!ReflexObjectUtil.isBlank(searchParam)) {
            //格式化时间参数
            if(StringUtils.isNotBlank(searchParam.getStartDate())){
                String startDate = searchParam.getStartDate() + ":00";
                searchParam.setStart(DateFormatUtil.parseDate(startDate));
            }
            if(StringUtils.isNotBlank(searchParam.getEndDate())) {
                String endDate = searchParam.getEndDate() + ":00";
                searchParam.setEnd(DateFormatUtil.parseDate(endDate));
            }
            page = orderService.findOrdersByParam(page, searchParam);
        } else {
            page =  orderService.findOrdersByLimit(page);
        }
        modelAndView.addObject("page", page);
        modelAndView.setViewName("admin/order/orderList.jsp");
        return modelAndView;
    }
}

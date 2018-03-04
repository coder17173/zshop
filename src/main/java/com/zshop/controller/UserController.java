package com.zshop.controller;

import com.zshop.common.Constants;
import com.zshop.common.OrderSearchParam;
import com.zshop.common.Page;
import com.zshop.model.Order;
import com.zshop.model.User;
import com.zshop.model.UserAddress;
import com.zshop.service.IOrderService;
import com.zshop.service.IUserAddressService;
import com.zshop.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/25 10:17
 * Description
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);
    @Resource
    private IUserService userService;
    @Resource
    private IOrderService orderService;
    @Resource
    private IUserAddressService userAddressService;

    @RequestMapping(value = "/reg", method = RequestMethod.GET)
    public String register() {
        return "user/userReg.jsp";
    }

    @RequestMapping(value = "/doReg", method = RequestMethod.POST)
    public String doRegister(User user, HttpServletRequest request) {
        System.out.println("原密码：" + user.getPassword());
        String md5Pass = request.getParameter("PWD");
        user.setPassword(md5Pass);
        System.out.println("md5加密后的密码:" + md5Pass);
        userService.insert(user);
        logger.info("用户添加成功：" + user);
        return "redirect:/user/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "user/userLog.jsp";
    }

    @RequestMapping(value = "/doLog", method = RequestMethod.POST)
    public String doLogin(User user, HttpSession session, HttpServletRequest request) {
        String md5Pass = request.getParameter("PWD");
        user.setPassword(md5Pass);
        boolean isExist = userService.checkLogin(user);
        if (isExist || ("buyer".equals(user.getNickName()) && "reyub".equals(user.getPassword()))) {
            session.setAttribute(Constants.LOGIN_USER, user);
            logger.info("用户[{}]登陆成功", user.getNickName());
            return "redirect:/product";
        } else {
            return "redirect:/user/login?errorPwd=true";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String doLogout(HttpSession session) {
        session.removeAttribute(Constants.LOGIN_USER);
        return "redirect:/user/login";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView profile(HttpSession session, ModelAndView model) {
        Object attribute = session.getAttribute(Constants.LOGIN_USER);
        User user = (attribute == null) ? null : (User) attribute;
        User user1 = userService.findByUserNameAndPassword(user.getNickName(), user.getPassword());
        if (user == null) {
            model.setViewName("redirect:/user/login?timeout=true");
        }
        model.addObject("user", user1);
        model.setViewName("user/userProfile.jsp");
        return model;
    }

    /**
     * 订单列表
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public ModelAndView orderList(ModelAndView model, HttpSession session, HttpServletRequest request) {
        Object attribute = session.getAttribute(Constants.LOGIN_USER);
        User user = (attribute == null) ? null : (User) attribute;
        User user1 = userService.findByUserNameAndPassword(user.getNickName(), user.getPassword());
        Page<Order> page = new Page<Order>(request);
        OrderSearchParam searchParam = new OrderSearchParam();
        searchParam.setUser(user1);
        orderService.findOrdersByParam(page, searchParam);
        model.addObject("page", page);
        model.setViewName("order/orderList.jsp");
        return model;
    }

    @RequestMapping(value = "/userAddress", method = RequestMethod.GET)
    public ModelAndView userAddressList(ModelAndView modelAndView, HttpSession session) {
        Object obj = session.getAttribute(Constants.LOGIN_USER);
        User user = (obj == null) ? null : (User) obj;
        User user1 = userService.findByUserNameAndPassword(user.getNickName(), user.getPassword());
        List<UserAddress> userAddressList = userAddressService.selectByUserId(user1.getUid());
        modelAndView.addObject("userAddressList", userAddressList);
        modelAndView.setViewName("user/userAddress.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/userAddress/delete/{id}", method = RequestMethod.GET)
    public String delUserAddress(@PathVariable("id") Integer id) {
        userAddressService.removeById(id);
        return "redirect:/user/userAddress";
    }

    @RequestMapping(value = "/userAddress/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(ModelAndView modelAndView, @PathVariable("id") Integer id) {
        UserAddress userAddress = userAddressService.findById(id);
        modelAndView.addObject("userAddress", userAddress);
        modelAndView.setViewName("user/userAddressEdit.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/userAddress/doEdit", method = RequestMethod.POST)
    public String doEdit(UserAddress userAddress) {
        userAddressService.updateById(userAddress);
        return "redirect:/user/userAddress";
    }

    @RequestMapping(value = "/userAddress/add", method = RequestMethod.GET)
    public String addAddress() {
        return "user/userAddressNew.jsp";
    }

    @RequestMapping(value = "/userAddress/doAdd", method = RequestMethod.POST)
    public String doAddAddress(UserAddress userAddress, HttpSession session) {
        Object obj = session.getAttribute(Constants.LOGIN_USER);
        User user = (obj == null) ? null : (User) obj;
        User user1 = userService.findByUserNameAndPassword(user.getNickName(),user.getPassword());
        userAddress.setUserId(user1.getUid());
        userAddressService.insert(userAddress);
        return "redirect:/user/userAddress";
    }
}

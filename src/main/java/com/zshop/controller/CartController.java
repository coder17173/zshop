package com.zshop.controller;

import com.zshop.common.Constants;
import com.zshop.common.Result;
import com.zshop.model.Product;
import com.zshop.service.IProductService;
import com.zshop.util.CartUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Author ZhangHang
 * Date 2018/3/3 10:17
 * Description
 */
@Controller
@RequestMapping(value = "/cart")
public class CartController {
    @Resource
    private IProductService productService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String cart(HttpSession session) {
        Object obj = session.getAttribute(Constants.LOGIN_USER);
        if(obj == null){
            return "redirect:/user/login";
        }
        return "order/cart.jsp";
    }

    @RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
    public ModelAndView addToCart1(ModelAndView modelAndView, @PathVariable("id") Integer pid, HttpSession session, HttpServletRequest request) {
        Product product = productService.findById(pid);
        String total = request.getParameter("pamount");
        int number = Integer.valueOf(total);
        CartUtil.addProductToCart(session, product, number);
        modelAndView.setViewName("redirect:/product/");
        return modelAndView;
    }

    @RequestMapping(value = "/add/{id}/{number}", method = RequestMethod.GET)
    @ResponseBody
    public Result addToCart(@PathVariable("id") Integer pid, @PathVariable("number") Integer number, HttpSession session, HttpServletRequest request) {
        Product product = productService.findById(pid);
        /*String total = request.getParameter("pamount");
        if(StringUtils.isNotBlank(total)) {
            number = Integer.valueOf(total);
        }*/
        CartUtil.addProductToCart(session, product, number);
        Result result = new Result();
        result.setToSuccess();
        return result;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Result deleteFromCart(@PathVariable("id") Integer pid, HttpSession session) {
        CartUtil.deleteProductFromCart(session, pid);
        Result result = new Result();
        result.setToSuccess();
        return result;
    }

    @RequestMapping(value = "/deleteAll", method = RequestMethod.GET)
    @ResponseBody
    public Result cleanCart(HttpSession session) {
        CartUtil.cleanCart(session);
        Result result = new Result();
        result.setToSuccess();
        return result;
    }
}

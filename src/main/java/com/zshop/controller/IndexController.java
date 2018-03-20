package com.zshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Author ZhangHang
 * Date 2018/3/20 13:07
 * Description
 */
@Controller
public class IndexController {
    @RequestMapping(value = "/")
    public ModelAndView index(ModelAndView modelAndView) {
        System.out.println("-------");
        modelAndView.setViewName("redirect:/product");
        return modelAndView;
    }
}

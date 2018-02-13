package com.zshop.controller;

import com.zshop.model.Admin;
import com.zshop.service.IAdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Author ZhangHang
 * Date 2018/2/8 15:42
 * Description
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Resource
    private IAdminService adminService;

    @RequestMapping(value = "/reg", method = RequestMethod.GET)
    public String register() {
        return "admin/adminReg.jsp";
    }

    @RequestMapping(value = "/doReg", method = RequestMethod.POST)
    public String doRegister(Admin admin) {
        adminService.insert(admin);
        System.out.println(admin.getUserName());
        return "redirect:/admin/adminLog.jsp";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "admin/adminLog.jsp";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String doLogin(Admin admin, HttpSession session) {
        boolean isExist = adminService.checkLogin(admin);
        if (isExist) {
            session.setAttribute("login_admin", admin);
            logger.info("管理员[{}]登陆成功", admin.getUserName());
            return "redirect:/admin/product";
        } else {
            return "redirect:/admin/login?errorPwd=true";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String doLogout(HttpSession session) {
        session.removeAttribute("admin");
        return "redirect:/admin/login";
    }

}

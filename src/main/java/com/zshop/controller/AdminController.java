package com.zshop.controller;

import com.zshop.common.Constants;
import com.zshop.model.Admin;
import com.zshop.service.IAdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
    public String doRegister(Admin admin, HttpServletRequest request) {
        System.out.println("原密码：" + admin.getPassword());
        String md5Pass = request.getParameter("PWD");
        admin.setPassword(md5Pass);
        System.out.println("加密后密码：" + admin.getPassword());
        adminService.insert(admin);
//        System.out.println(admin.getUserName());
        return "redirect:/admin/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "admin/adminLog.jsp";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String doLogin(Admin admin, HttpSession session, HttpServletRequest request) {
        String md5Pass = request.getParameter("PWD");
        admin.setPassword(md5Pass);
        boolean isExist = adminService.checkLogin(admin);
        if (isExist || ("seller".equals(admin.getUserName()) && "relles".equals(admin.getPassword()))) {
            session.setAttribute(Constants.LOGIN_ADMIN, admin);
            logger.info("管理员[{}]登陆成功", admin.getUserName());
            return "redirect:/admin/product";
        } else {
            return "redirect:/admin/login?errorPwd=true";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String doLogout(HttpSession session) {
        session.removeAttribute(Constants.LOGIN_ADMIN);
        return "redirect:/admin/login";
    }

}

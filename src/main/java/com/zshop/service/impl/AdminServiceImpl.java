package com.zshop.service.impl;

import com.zshop.dao.IAdminDao;
import com.zshop.model.Admin;
import com.zshop.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zhanghang
 * @description
 * @date 2018/1/27 16:28
 * @modified by
 */
@Service("adminService")
public class AdminServiceImpl implements IAdminService {
    @Autowired
    private IAdminDao adminDao;

    @Override
    public Admin findByAdminNameAndPassword(String userName, String password) {
        Admin admin = adminDao.selectByAdminNameAndPassword(userName, password);
        return admin;
    }

    @Override
    public Admin findById(Integer id) {
        Admin admin = adminDao.selectById(id);
        return admin;
    }

    @Override
    public boolean checkLogin(Admin admin) {
        return findByAdminNameAndPassword(admin.getUserName(), admin.getPassword()) == null ? false : true;
    }

    @Override
    public void insert(Admin admin) {
        adminDao.insert(admin);
    }

    @Override
    public void deleteById(Integer id) {
        adminDao.deleteById(id);
    }

    @Override
    public void updateById(Admin admin) {
        adminDao.updateById(admin);
    }

    @Override
    public Integer count() {
        return adminDao.count();
    }
}

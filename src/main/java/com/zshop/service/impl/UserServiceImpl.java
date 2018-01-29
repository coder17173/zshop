package com.zshop.service.impl;

import com.zshop.dao.IUserDao;
import com.zshop.model.User;
import com.zshop.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zhanghang
 * @description
 * @date 2018/1/27 16:44
 * @modified by
 */
@Service("userService")
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;

    @Override
    public User findByUserNameAndPassword(String userName, String password) {
        User user = userDao.selectByUserNameAndPassword(userName, password);
        return user;
    }

    @Override
    public User findById(Integer id) {
        User user = userDao.selectById(id);
        return user;
    }

    @Override
    public boolean checkLogin(User user) {
        return findByUserNameAndPassword(user.getNickName(), user.getPassword()) == null ? false : true;
    }

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public void deleteById(Integer id) {
        userDao.deleteById(id);
    }

    @Override
    public void updateById(User user) {
        userDao.updateById(user);
    }

    @Override
    public Integer count() {
        return userDao.count();
    }
}

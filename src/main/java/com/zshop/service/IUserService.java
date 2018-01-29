package com.zshop.service;

import com.zshop.model.User;

/**
 * @author zhanghang
 * @description
 * @date 2018/1/27 16:40
 * @modified by
 */
public interface IUserService {
    /**
     * 根据用户名、密码查找用户
     *
     * @param userName
     * @param password
     * @return
     */
    public User findByUserNameAndPassword(String userName, String password);

    /**
     * 根据id查找用户
     *
     * @param id
     * @return
     */
    public User findById(Integer id);

    /**
     * 判断是否登录
     *
     * @param user
     * @return
     */
    public boolean checkLogin(User user);

    /**
     * 新增用户
     *
     * @param user
     */
    public void insert(User user);

    /**
     * 删除用户
     *
     * @param id
     */
    public void deleteById(Integer id);

    /**
     * 修改用户信息
     *
     * @param user
     */
    public void updateById(User user);

    /**
     * 统计
     * @return
     */
    public Integer count();
}

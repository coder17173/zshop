package com.zshop.service;

import com.zshop.model.Admin;

/**
 * @author zhanghang
 * @description
 * @date 2018/1/27 16:15
 * @modified by
 */
public interface IAdminService {
    /**
     * 根据用户名、密码查找管理员
     *
     * @param userName
     * @param password
     * @return
     */
    public Admin findByAdminNameAndPassword(String userName, String password);

    /**
     * 根据id查找管理员
     *
     * @param id
     * @return
     */
    public Admin findById(Integer id);

    /**
     * 判断是否登录
     *
     * @param admin
     * @return
     */
    public boolean checkLogin(Admin admin);

    /**
     * 新增管理员
     *
     * @param admin
     */
    public void insert(Admin admin);

    /**
     * 删除用户
     *
     * @param id
     */
    public void deleteById(Integer id);

    /**
     * 修改管理员信息
     *
     * @param admin
     */
    public void updateById(Admin admin);

    /**
     * 统计
     * @return
     */
    public Integer count();
}

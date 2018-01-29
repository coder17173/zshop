package com.zshop.dao;

import com.zshop.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/**
 * @author zhanghang
 * @description
 * @date 2018/1/27 16:09
 * @modified by
 */
@Component
public interface IUserDao extends IBaseDao<User> {
    /**
     * 根据用户名密码查询用户
     *
     * @param name
     * @param password
     * @return
     */
    public User selectByUserNameAndPassword(@Param("userName") String name, @Param("pasword") String password);

    /**
     * 根据id查询用户
     *
     * @return
     */
    public User selectById(Integer id);
}

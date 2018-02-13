package com.zshop.dao;

import com.zshop.model.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/**
 * @author zhanghang
 * @description
 * @date 2018/1/27 15:35
 * @modified by
 */
@Component
public interface IAdminDao extends IBaseDao<Admin> {
    /**
     * 根据用户名密码查询管理员
     *
     * @param name
     * @param password
     * @return
     */
    public Admin selectByAdminNameAndPassword(@Param("userName") String name, @Param("password") String password);

    /**
     * 根据id查询管理员
     *
     * @param id
     * @return
     */
    public Admin selectById(Integer id);
}

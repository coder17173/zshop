package com.zshop.dao;

import com.zshop.model.UserAddress;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/27 16:51
 * Description
 */
@Component
public interface IUserAddressDao extends IBaseDao<UserAddress>{
    /**
     * 根据id查询
     *
     * @return
     */
    public UserAddress selectById(Integer id);

    /**
     * 根据用户id查询
     *
     * @return
     */
    public List<UserAddress> selectByUserId(Integer id);
}

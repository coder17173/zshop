package com.zshop.service;

import com.zshop.model.UserAddress;

import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/27 17:13
 * Description
 */
public interface IUserAddressService {
    /**
     * 根据id查找
     *
     * @param id
     * @return
     */
    public UserAddress findById(Integer id);

    /**
     *
     * @param id
     */
    public void removeById(Integer id);

    /**
     *
     * @param userAddress
     */
    public void updateById(UserAddress userAddress);

    /**
     *
     * @param userAddress
     */
    public void insert(UserAddress userAddress);

    /**
     *
     * @param uid
     * @return
     */
    public List<UserAddress> selectByUserId(Integer uid);
}

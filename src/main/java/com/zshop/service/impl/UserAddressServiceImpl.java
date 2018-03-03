package com.zshop.service.impl;

import com.zshop.dao.IUserAddressDao;
import com.zshop.model.UserAddress;
import com.zshop.service.IUserAddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/27 17:17
 * Description
 */
@Service("userAddressService")
public class UserAddressServiceImpl implements IUserAddressService {
    @Resource
    private IUserAddressDao userAddressDao;

    @Override
    public UserAddress findById(Integer id) {
        UserAddress userAddress = userAddressDao.selectById(id);
        return userAddress;
    }

    @Override
    public void removeById(Integer id) {
        userAddressDao.deleteById(id);
    }

    @Override
    public void updateById(UserAddress userAddress) {
        userAddressDao.updateById(userAddress);
    }


    @Override
    public void insert(UserAddress userAddress) {
        userAddressDao.insert(userAddress);
    }

    @Override
    public List<UserAddress> selectByUserId(Integer uid) {
        List<UserAddress> userAddresses = userAddressDao.selectByUserId(uid);
        return userAddresses;
    }
}

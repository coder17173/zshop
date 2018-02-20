package com.zshop.service.impl;

import com.zshop.common.AdminSearchParam;
import com.zshop.common.Page;
import com.zshop.common.ProductStateEnum;
import com.zshop.dao.IProductDao;
import com.zshop.model.CategorySecond;
import com.zshop.model.Product;
import com.zshop.service.ICategorySecondService;
import com.zshop.service.IProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/11 12:22
 * Description
 */
@Service("productService")
public class ProductServiceImpl implements IProductService {
    @Resource
    private IProductDao productDao;
    @Resource
    private ICategorySecondService categorySecondService;

    @Override
    public Product findById(Integer id) {
        Product product = productDao.selectById(id);
        CategorySecond categorySecond = categorySecondService.findById(product.getCsid());
        product.setCategorySecond(categorySecond);
        int state = product.getState();
        if(state == 0) {
            product.setStateDesc(ProductStateEnum.WITHDRAW.getDesc());
        } else {
            product.setStateDesc(ProductStateEnum.ONSALE.getDesc());
        }
        return product;
    }

    @Override
    public Product findByName(String name) {
        Product product = productDao.selectByName(name);
        return product;
    }

    @Override
    public Page<Product> findProductByLimit(Page page) {
        int count = productDao.count();
        page.setTotalCount(count);
        int offset = page.getFirst();
        int limit = page.getPageSize();
        List<Product> result = productDao.selectByLimit(offset, limit);
        for (Product product : result) {
           CategorySecond cs = categorySecondService.findById(product.getCsid());
           product.setCategorySecond(cs);
           int state = product.getState();
           if(state == 0) {
               product.setStateDesc(ProductStateEnum.WITHDRAW.getDesc());
           } else {
               product.setStateDesc(ProductStateEnum.ONSALE.getDesc());
           }
        }
        page.setResult(result);
        return page;
    }

    @Override
    public Page<Product> findBySearchParam(Page page, AdminSearchParam searchParam) {
        int count = productDao.count();
        page.setTotalCount(count);
        int offset = page.getFirst();
        int limit = page.getPageSize();
        List<Product> result = productDao.selectBySearchParam(offset, limit, searchParam);
        for (Product product : result) {
            CategorySecond cs = categorySecondService.findById(product.getCsid());
            product.setCategorySecond(cs);
            int state = product.getState();
            if(state == 0) {
                product.setStateDesc(ProductStateEnum.WITHDRAW.getDesc());
            } else {
                product.setStateDesc(ProductStateEnum.ONSALE.getDesc());
            }
        }
        page.setResult(result);
        return page;
    }

    @Override
    public Product update(Product product) {
        productDao.updateById(product);
        return product;
    }

    @Override
    public Product add(Product product) {
        productDao.insert(product);
        return product;
    }
}

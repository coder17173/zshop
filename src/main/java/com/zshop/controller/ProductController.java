package com.zshop.controller;

import com.zshop.common.AdminSearchParam;
import com.zshop.common.Page;
import com.zshop.model.Category;
import com.zshop.model.CategorySecond;
import com.zshop.model.Product;
import com.zshop.service.ICategorySecondService;
import com.zshop.service.ICategoryService;
import com.zshop.service.IProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/25 10:14
 * Description
 */
@Controller
@RequestMapping(value = "/product")
public class ProductController {
    @Resource
    private IProductService productService;
    @Resource
    private ICategoryService categoryService;
    @Resource
    private ICategorySecondService categorySecondService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView listProduct(ModelAndView modelAndView, HttpServletRequest request) {
        Page<Product> page = new Page<Product>(request);
        page.setPageSize(12);
        page = productService.findProductByLimit(page);
        modelAndView.addObject("page", page);
        //商品类目
        List<Category> categories = categoryService.findAll();
        for (Category category : categories) {
            List<CategorySecond> csList = categorySecondService.findByCid(category.getCid());
            category.setCsList(csList);
        }
        modelAndView.addObject("categories",categories);
        modelAndView.setViewName("product/productList.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/findByCid/{cid}", method = RequestMethod.GET)
    public ModelAndView listProductByCid(ModelAndView modelAndView, HttpServletRequest request, @PathVariable("cid") Integer cid) {
        Page<Product> page = new Page<Product>(request);
        page.setPageSize(12);
        List<CategorySecond> csList = categorySecondService.findByCid(cid);
        List<Integer> list = new ArrayList<Integer>();
        for (CategorySecond categorySecond : csList) {
            list.add(categorySecond.getCsid());
        }
        AdminSearchParam searchParam = new AdminSearchParam();
        searchParam.setCsids(list);
        page = productService.findBySearchParam(page, searchParam);
        modelAndView.addObject("page", page);

        List<Category> categories = categoryService.findAll();
        for (Category category : categories) {
            List<CategorySecond> csAllList = categorySecondService.findByCid(category.getCid());
            category.setCsList(csAllList);
        }
        modelAndView.addObject("categories",categories);
        modelAndView.setViewName("product/productList.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/findByCsid/{csid}", method = RequestMethod.GET)
    public ModelAndView listProductByCsid(ModelAndView modelAndView, HttpServletRequest request, @PathVariable("csid") Integer csid) {
        Page<Product> page = new Page<Product>(request);
        page.setPageSize(12);
        List<Integer> list = new ArrayList<Integer>();
        list.add(csid);
        AdminSearchParam searchParam = new AdminSearchParam();
        searchParam.setCsids(list);
        page = productService.findBySearchParam(page, searchParam);
        modelAndView.addObject("page", page);

        List<Category> categories = categoryService.findAll();
        for (Category category : categories) {
            List<CategorySecond> csAllList = categorySecondService.findByCid(category.getCid());
            category.setCsList(csAllList);
        }
        modelAndView.addObject("categories",categories);
        modelAndView.setViewName("product/productList.jsp");
        return modelAndView;
    }
}

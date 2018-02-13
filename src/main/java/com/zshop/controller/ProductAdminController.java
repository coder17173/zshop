package com.zshop.controller;

import com.zshop.common.Constants;
import com.zshop.common.Page;
import com.zshop.model.CategorySecond;
import com.zshop.model.Product;
import com.zshop.service.ICategorySecondService;
import com.zshop.service.IProductService;
import com.zshop.util.Image;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/11 14:38
 * Description
 */
@Controller
@RequestMapping(value = "/admin/product")
public class ProductAdminController {
    private static final Logger logger = LoggerFactory.getLogger(ProductAdminController.class);

    @Resource
    private IProductService productService;
    @Resource
    private ICategorySecondService categorySecondService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getProduct(ModelAndView modelAndView, HttpServletRequest request) {
        Page<Product> page = new Page<Product>(request);
        page = productService.findProductByLimit(page);
        modelAndView.addObject("page", page);
        modelAndView.setViewName("admin/product/productAdmin.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(ModelAndView modelAndView, @PathVariable Integer id) {
        Product product = productService.findById(id);
        List<CategorySecond> csList = categorySecondService.findAll();
        modelAndView.addObject("product", product);
        modelAndView.addObject("csList", csList);
        modelAndView.setViewName("admin/product/productEdit.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/doEdit", method = RequestMethod.POST)
    public String doEdit(Product product, HttpSession session, @RequestParam(name = "file", required = false) MultipartFile file) {
        String url = null;
        if (file != null && !file.isEmpty()) {
            url = uploadImage(product, session, file);
        }
        product.setImage(url);
        productService.update(product);
        return "redirect:/admin/product";
    }

    private String uploadImage(Product product, HttpSession session, MultipartFile file) {
        String fileName = generateFileName();
        String[] path = generateFilePath(session);
        String serverFile1 = path[0] + "/" + fileName;
        String serverFile2 = path[1] + "/" + fileName;
        uploadAndSaveImg(session, file, fileName, path[0], serverFile1);
        uploadAndSaveImg(session, file, fileName, path[1], serverFile2);
        return ("/images/"+fileName);
    }

    private String[] generateFilePath(HttpSession session) {
        String[] strs = new String[2];
        String str = session.getServletContext().getRealPath("/images");
        String str2 = str.split("target")[0]+"src\\main\\webapp\\images";
        strs[0] = str;
        strs[1] = str2;
        System.out.println(str);
        System.out.println(str2);
        return strs;
    }

    private String generateFileName() {
        return System.currentTimeMillis() + ".jpg";
    }

    private void uploadAndSaveImg(HttpSession session, MultipartFile file, String fileName, String path, String serverFile) {
        try {
            logger.info(path);
            if (!new File(path).exists()) {
                new File(path).mkdirs();
            }
            if (!new File(serverFile).exists()) {
                new File(serverFile).createNewFile();
            }
            byte[] bytes = file.getBytes();
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(serverFile)));
            stream.write(bytes);
            stream.close();
            //缩放处理
            Image image = new Image(serverFile);
//          image.resize(Constants.IMG_WIDTH, Constants.IMG_HEIGHT);
            image.save();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

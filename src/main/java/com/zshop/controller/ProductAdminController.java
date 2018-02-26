package com.zshop.controller;

import com.zshop.common.AdminSearchParam;
import com.zshop.common.Constants;
import com.zshop.common.Page;
import com.zshop.model.Category;
import com.zshop.model.CategorySecond;
import com.zshop.model.Product;
import com.zshop.service.ICategorySecondService;
import com.zshop.service.ICategoryService;
import com.zshop.service.IProductService;
import com.zshop.util.EncodingTool;
import com.zshop.util.Image;
import com.zshop.util.ReflexObjectUtil;
import org.apache.commons.lang3.StringUtils;
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
import java.util.ArrayList;
import java.util.Date;
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
    @Resource
    private ICategoryService categoryService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getProduct(ModelAndView modelAndView, HttpServletRequest request, HttpSession session) {
        //判断管理员是否登录
        Object obj = session.getAttribute(Constants.LOGIN_ADMIN);
        if(obj == null ){
            modelAndView.setViewName("redirect:/admin/login");
            return modelAndView;
        }
        Page<Product> page = new Page<Product>(request);
        String pnameTmp = request.getParameter("pname");
        if(!StringUtils.isBlank(pnameTmp)){
            pnameTmp = EncodingTool.encodeStr(pnameTmp);
        }
        String pcodeTmp = request.getParameter("pcode");
        String pstateTmp = request.getParameter("pstate");

        String pname = StringUtils.isBlank(pnameTmp) ? null : pnameTmp;
        String pcode = StringUtils.isBlank(pcodeTmp) ? null : pcodeTmp;
        Integer pstate = StringUtils.isBlank(pstateTmp) ? null : Integer.valueOf(pstateTmp);
        AdminSearchParam searchParam = new AdminSearchParam(pname, pcode, pstate);
        String pcid = request.getParameter("pcid");
        String pcsid = request.getParameter("pcsid");
        List<Integer> csids = null;
        if(StringUtils.isNotBlank(pcsid)) {
            csids = new ArrayList<Integer>();
            csids.add(Integer.valueOf(pcsid));
            searchParam.setCsids(csids);
            searchParam.setCsid(Integer.valueOf(pcsid));
        } else if(StringUtils.isNotBlank(pcid)){
            csids = new ArrayList<Integer>();
            List<CategorySecond> categorySeconds = categorySecondService.findByCid(Integer.valueOf(pcid));
            for (CategorySecond categorySecond : categorySeconds) {
                csids.add(categorySecond.getCsid());
            }
            searchParam.setCsids(csids);
            searchParam.setCid(Integer.valueOf(pcid));
        }
        if(ReflexObjectUtil.isBlank(searchParam)) {
            page = productService.findProductByLimit(page);
        }else{
            page = productService.findBySearchParam(page, searchParam);
        }
        List<Category> cList = categoryService.findAll();
        List<CategorySecond> csList = categorySecondService.findAll();
        modelAndView.addObject("page", page);
        modelAndView.addObject("cList", cList);
        modelAndView.addObject("csList", csList);
        modelAndView.addObject("searchParam", searchParam);
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

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public ModelAndView add(ModelAndView modelAndView, HttpSession session){
        Object obj = session.getAttribute(Constants.LOGIN_ADMIN);
        if(obj == null ){
//            return "redirect:/admin/login";
            modelAndView.setViewName("redirect:/admin/login");
        }
        List<CategorySecond> csList = categorySecondService.findAll();
        modelAndView.addObject("csList", csList);
//        return "admin/product/productNew.jsp";
        modelAndView.setViewName("admin/product/productNew.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/doNew", method = RequestMethod.POST)
    public String doAdd(Product product, HttpSession session, @RequestParam(name = "imgFile", required = false) MultipartFile file){
        String imgURL = null;
        if (file != null && !file.isEmpty()) {
            imgURL = uploadImage(product, session, file);
        }
        product.setImage(imgURL);
        product.setCreateTime(new Date());
        productService.add(product);
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

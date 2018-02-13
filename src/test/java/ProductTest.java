import com.zshop.common.Page;
import com.zshop.model.Product;
import com.zshop.service.IProductService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.annotation.Resource;

/**
 * Author ZhangHang
 * Date 2018/2/11 12:27
 * Description
 */
public class ProductTest {
    @Resource
    private IProductService productService;

    @Before
    public void before() {
        @SuppressWarnings("resource")
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:applicationContext.xml"
                , "classpath:applicationContext-mybatis.xml"});
        productService = (IProductService) context.getBean("productService");
    }

    @Test
    public void test() {
        System.out.println("-----------");
        Product product = productService.findById(1);
        System.out.println(product.toString());
        Page<Product> page = new Page<Product>(1,10);
    }
}

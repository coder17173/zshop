import com.zshop.model.Category;
import com.zshop.model.CategorySecond;
import com.zshop.service.ICategorySecondService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.annotation.Resource;
import java.util.List;

/**
 * Author ZhangHang
 * Date 2018/2/11 9:37
 * Description
 */
public class CategorySecondTest {
    @Resource
    private ICategorySecondService categorySecondService;

    @Before
    public void before() {
        @SuppressWarnings("resource")
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:applicationContext.xml"
                , "classpath:applicationContext-mybatis.xml"});
        categorySecondService = (ICategorySecondService) context.getBean("categorySecondService");
    }

    @Test
    public void test() {
        System.out.println("-----------");
        CategorySecond categorySecond = categorySecondService.findById(1);
        Category category = categorySecond.getCategory();
        System.out.println(categorySecond.toString());
    }

    @Test
    public void test2() {
        System.out.println("------------");
        CategorySecond categorySecond = categorySecondService.findByName("风衣");
        System.out.println(categorySecond.toString());
    }

    @Test
    public void test3() {
        System.out.println("------------");
        List<CategorySecond> list = categorySecondService.findAll();
        for (CategorySecond categorySecond : list) {
            System.out.println(categorySecond.toString());
        }
    }
}

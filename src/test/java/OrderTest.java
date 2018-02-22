import com.zshop.model.Order;
import com.zshop.service.IOrderService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.annotation.Resource;

/**
 * Author ZhangHang
 * Date 2018/2/21 21:10
 * Description
 */
public class OrderTest {
    @Resource
    private IOrderService orderService;

    @Before
    public void before() {
        @SuppressWarnings("resource")
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:applicationContext.xml"
                , "classpath:applicationContext-mybatis.xml"});
        orderService = (IOrderService) context.getBean("orderService");
    }

    @Test
    public void test01() {
        System.out.println("--------");
        Order order = orderService.findById(1);
        System.out.println(order.toString());
    }
}

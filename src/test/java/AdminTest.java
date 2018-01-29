import com.zshop.model.Admin;
import com.zshop.service.IAdminService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.annotation.Resource;

/**
 * @author zhanghang
 * @description
 * @date 2018/1/27 16:50
 * @modified by
 */
public class AdminTest {
    @Resource
    private IAdminService adminService;

    @Before
    public void before() {
        @SuppressWarnings("resource")
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:applicationContext.xml"
                , "classpath:applicationContext-mybatis.xml"});
        adminService = (IAdminService) context.getBean("adminService");
    }

    @Test
    public void test() {
        /*Admin admin = new Admin();
        admin.setUserName("dudu");
        admin.setPassword("123123");
        adminService.insert(admin);*/
        System.out.println(adminService.count());
    }
}

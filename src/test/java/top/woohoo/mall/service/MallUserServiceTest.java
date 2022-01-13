package top.woohoo.mall.service;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import top.woohoo.mall.model.dto.user.MallUserListDTO;

@SpringBootTest
@RunWith(SpringRunner.class)
public class MallUserServiceTest {

    @Autowired
    private MallUserService userService;

    @Test
    public void listUserTest() {
        // Null Params
        // userService.listUser(null);

        // Normal Perform
        Assert.assertFalse(userService.listUser(new MallUserListDTO()).isEmpty());

        // Empty Result
        Assert.assertTrue(userService.listUser(new MallUserListDTO() {{
            this.setUserId(-1);
        }}).isEmpty());
    }
}

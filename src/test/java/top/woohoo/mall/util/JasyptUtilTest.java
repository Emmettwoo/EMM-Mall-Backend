package top.woohoo.mall.util;

import org.jasypt.encryption.StringEncryptor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
public class JasyptUtilTest {

    @Autowired
    private StringEncryptor encryptor;

    @Test
    public void encrypt() {
        System.out.println("*** Encrypted ***\n" +
                encryptor.encrypt("Test"));
    }
}

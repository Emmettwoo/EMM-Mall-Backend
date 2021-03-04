package top.woohoo.mall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import top.woohoo.mall.model.pojo.User;

import java.util.List;

/**
 * 商城用户表
 *
 * @author Emmett Woo
 * @since 2021/03/04
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

    int deleteByPrimaryKey(Integer id);

    @Override
    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);


    int checkUsername(String username);

    int checkEmail(String email);

    int checkEmailExceptSelf(@Param("email") String email, @Param("userId") Integer userId);


    User loginAuth(@Param("username") String username, @Param("password") String password);

    int checkPasswordByUserId(@Param("userId") Integer userId, @Param("password") String password);


    String selectQuestionByUsername(String username);

    int checkAnswer(@Param("username") String username, @Param("question") String question, @Param("answer") String answer);

    int updatePasswordByUsername(@Param("username") String username, @Param("password") String password);

    int countUserNumbers();

    List<User> listUser();
}

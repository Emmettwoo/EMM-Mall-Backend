package top.woohoo.mall.dao;

import org.apache.ibatis.annotations.Param;
import top.woohoo.mall.pojo.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);
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
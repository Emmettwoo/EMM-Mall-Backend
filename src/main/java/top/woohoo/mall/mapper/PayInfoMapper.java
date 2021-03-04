package top.woohoo.mall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import top.woohoo.mall.model.pojo.PayInfo;

/**
 * 支付信息表
 *
 * @author Emmett Woo
 * @since 2021/03/04
 */
@Mapper
public interface PayInfoMapper extends BaseMapper<PayInfo> {

    int deleteByPrimaryKey(Integer id);

    @Override
    int insert(PayInfo record);

    int insertSelective(PayInfo record);

    PayInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PayInfo record);

    int updateByPrimaryKey(PayInfo record);
}

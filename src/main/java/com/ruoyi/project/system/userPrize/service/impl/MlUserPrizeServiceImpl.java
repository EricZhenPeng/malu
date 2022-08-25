package com.ruoyi.project.system.userPrize.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.userPrize.mapper.MlUserPrizeMapper;
import com.ruoyi.project.system.userPrize.domain.MlUserPrize;
import com.ruoyi.project.system.userPrize.service.IMlUserPrizeService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 抽奖用户与奖品之间的绑定Service业务层处理
 * 
 * @author malu
 * @date 2022-07-26
 */
@Service
public class MlUserPrizeServiceImpl implements IMlUserPrizeService 
{
    @Autowired
    private MlUserPrizeMapper mlUserPrizeMapper;

    /**
     * 查询抽奖用户与奖品之间的绑定
     * 
     * @param userId 抽奖用户与奖品之间的绑定主键
     * @return 抽奖用户与奖品之间的绑定
     */
    @Override
    public List<MlUserPrize> selectMlUserPrizeByUserId(Long userId)
    {
        return mlUserPrizeMapper.selectMlUserPrizeByUserId(userId);
    }

    /**
     * 查询抽奖用户与奖品之间的绑定列表
     * 
     * @param mlUserPrize 抽奖用户与奖品之间的绑定
     * @return 抽奖用户与奖品之间的绑定
     */
    @Override
    public List<MlUserPrize> selectMlUserPrizeList(MlUserPrize mlUserPrize)
    {
        return mlUserPrizeMapper.selectMlUserPrizeList(mlUserPrize);
    }

    /**
     * 新增抽奖用户与奖品之间的绑定
     * 
     * @param mlUserPrize 抽奖用户与奖品之间的绑定
     * @return 结果
     */
    @Override
    public int insertMlUserPrize(MlUserPrize mlUserPrize)
    {
        return mlUserPrizeMapper.insertMlUserPrize(mlUserPrize);
    }

    /**
     * 修改抽奖用户与奖品之间的绑定
     * 
     * @param mlUserPrize 抽奖用户与奖品之间的绑定
     * @return 结果
     */
    @Override
    public int updateMlUserPrize(MlUserPrize mlUserPrize)
    {
        return mlUserPrizeMapper.updateMlUserPrize(mlUserPrize);
    }

    /**
     * 批量删除抽奖用户与奖品之间的绑定
     * 
     * @param userIds 需要删除的抽奖用户与奖品之间的绑定主键
     * @return 结果
     */
    @Override
    public int deleteMlUserPrizeByUserIds(String userIds)
    {
        return mlUserPrizeMapper.deleteMlUserPrizeByUserIds(Convert.toStrArray(userIds));
    }

    /**
     * 删除抽奖用户与奖品之间的绑定信息
     * 
     * @param userId 抽奖用户与奖品之间的绑定主键
     * @return 结果
     */
    @Override
    public int deleteMlUserPrizeByUserId(Long userId)
    {
        return mlUserPrizeMapper.deleteMlUserPrizeByUserId(userId);
    }

    @Override
    public List<MlUserPrize> selectMlUserPrizeByPrizeId(Long prizeId) {
        return mlUserPrizeMapper.selectMlUserPrizeByPrizeId(prizeId);
    }
}

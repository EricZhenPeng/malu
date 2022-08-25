package com.ruoyi.project.system.userPrize.mapper;

import java.util.List;

import com.ruoyi.project.system.user.domain.UserRole;
import com.ruoyi.project.system.userPrize.domain.MlUserPrize;

/**
 * 抽奖用户与奖品之间的绑定Mapper接口
 * 
 * @author malu
 * @date 2022-07-26
 */
public interface MlUserPrizeMapper 
{
    /**
     * 查询抽奖用户与奖品之间的绑定
     * 
     * @param userId 抽奖用户与奖品之间的绑定主键
     * @return 抽奖用户与奖品之间的绑定
     */
    public List<MlUserPrize> selectMlUserPrizeByUserId(Long userId);


    public List<MlUserPrize> selectMlUserPrizeByPrizeId(Long prizeId);
    /**
     * 查询抽奖用户与奖品之间的绑定列表
     * 
     * @param mlUserPrize 抽奖用户与奖品之间的绑定
     * @return 抽奖用户与奖品之间的绑定集合
     */
    public List<MlUserPrize> selectMlUserPrizeList(MlUserPrize mlUserPrize);

    /**
     * 新增抽奖用户与奖品之间的绑定
     * 
     * @param mlUserPrize 抽奖用户与奖品之间的绑定
     * @return 结果
     */
    public int insertMlUserPrize(MlUserPrize mlUserPrize);

    /**
     * 修改抽奖用户与奖品之间的绑定
     * 
     * @param mlUserPrize 抽奖用户与奖品之间的绑定
     * @return 结果
     */
    public int updateMlUserPrize(MlUserPrize mlUserPrize);

    /**
     * 删除抽奖用户与奖品之间的绑定
     * 
     * @param userId 抽奖用户与奖品之间的绑定主键
     * @return 结果
     */
    public int deleteMlUserPrizeByUserId(Long userId);

    /**
     * 批量删除抽奖用户与奖品之间的绑定
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMlUserPrizeByUserIds(String[] userIds);


    public int batchUserPrize(List<MlUserPrize> userPrizesList);
}

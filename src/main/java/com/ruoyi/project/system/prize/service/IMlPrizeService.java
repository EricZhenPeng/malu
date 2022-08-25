package com.ruoyi.project.system.prize.service;

import java.util.List;

import com.ruoyi.project.system.mluser.domain.MlUser;
import com.ruoyi.project.system.prize.domain.MlPrize;

/**
 * 奖品管理Service接口
 * 
 * @author pengz
 * @date 2022-07-25
 */
public interface IMlPrizeService 
{
    /**
     * 查询奖品管理
     * 
     * @param id 奖品管理主键
     * @return 奖品管理
     */
    public MlPrize selectMlPrizeById(Long id);

    /**
     * 查询奖品管理列表
     * 
     * @param mlPrize 奖品管理
     * @return 奖品管理集合
     */
    public List<MlPrize> selectMlPrizeList(MlPrize mlPrize);

    /**
     * 新增奖品管理
     * 
     * @param mlPrize 奖品管理
     * @return 结果
     */
    public int insertMlPrize(MlPrize mlPrize);

    /**
     * 修改奖品管理
     * 
     * @param mlPrize 奖品管理
     * @return 结果
     */
    public int updateMlPrize(MlPrize mlPrize);

    /**
     * 批量删除奖品管理
     * 
     * @param ids 需要删除的奖品管理主键集合
     * @return 结果
     */
    public int deleteMlPrizeByIds(String ids);

    /**
     * 删除奖品管理信息
     * 
     * @param id 奖品管理主键
     * @return 结果
     */
    public int deleteMlPrizeById(Long id);

    public List<MlPrize> selectPrizeByUserId(Long id);

    public String importUser(List<MlPrize> prizeList);
}

package com.ruoyi.project.system.prizeLog.service;

import java.util.List;
import com.ruoyi.project.system.prizeLog.domain.MlPrizeLog;

/**
 * 奖品日志Service接口
 * 
 * @author malu
 * @date 2022-07-27
 */
public interface IMlPrizeLogService 
{
    /**
     * 查询奖品日志
     * 
     * @param id 奖品日志主键
     * @return 奖品日志
     */
    public MlPrizeLog selectMlPrizeLogById(Long id);

    /**
     * 查询奖品日志列表
     * 
     * @param mlPrizeLog 奖品日志
     * @return 奖品日志集合
     */
    public List<MlPrizeLog> selectMlPrizeLogList(MlPrizeLog mlPrizeLog);

    /**
     * 新增奖品日志
     * 
     * @param mlPrizeLog 奖品日志
     * @return 结果
     */
    public int insertMlPrizeLog(MlPrizeLog mlPrizeLog);

    /**
     * 修改奖品日志
     * 
     * @param mlPrizeLog 奖品日志
     * @return 结果
     */
    public int updateMlPrizeLog(MlPrizeLog mlPrizeLog);

    /**
     * 批量删除奖品日志
     * 
     * @param ids 需要删除的奖品日志主键集合
     * @return 结果
     */
    public int deleteMlPrizeLogByIds(String ids);

    /**
     * 删除奖品日志信息
     * 
     * @param id 奖品日志主键
     * @return 结果
     */
    public int deleteMlPrizeLogById(Long id);

    public List<MlPrizeLog> selectMlPrizeLogByUserName(String userName);
}

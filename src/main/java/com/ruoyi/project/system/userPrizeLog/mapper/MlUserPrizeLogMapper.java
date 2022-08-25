package com.ruoyi.project.system.userPrizeLog.mapper;

import java.util.List;
import com.ruoyi.project.system.userPrizeLog.domain.MlUserPrizeLog;

/**
 * 日志与用户之间的关系Mapper接口
 * 
 * @author malu
 * @date 2022-07-27
 */
public interface MlUserPrizeLogMapper 
{
    /**
     * 查询日志与用户之间的关系
     * 
     * @param userId 日志与用户之间的关系主键
     * @return 日志与用户之间的关系
     */
    public MlUserPrizeLog selectMlUserPrizeLogByUserId(Long userId);

    /**
     * 查询日志与用户之间的关系列表
     * 
     * @param mlUserPrizeLog 日志与用户之间的关系
     * @return 日志与用户之间的关系集合
     */
    public List<MlUserPrizeLog> selectMlUserPrizeLogList(MlUserPrizeLog mlUserPrizeLog);

    /**
     * 新增日志与用户之间的关系
     * 
     * @param mlUserPrizeLog 日志与用户之间的关系
     * @return 结果
     */
    public int insertMlUserPrizeLog(MlUserPrizeLog mlUserPrizeLog);

    /**
     * 修改日志与用户之间的关系
     * 
     * @param mlUserPrizeLog 日志与用户之间的关系
     * @return 结果
     */
    public int updateMlUserPrizeLog(MlUserPrizeLog mlUserPrizeLog);

    /**
     * 删除日志与用户之间的关系
     * 
     * @param userId 日志与用户之间的关系主键
     * @return 结果
     */
    public int deleteMlUserPrizeLogByUserId(Long userId);

    /**
     * 批量删除日志与用户之间的关系
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMlUserPrizeLogByUserIds(String[] userIds);
}

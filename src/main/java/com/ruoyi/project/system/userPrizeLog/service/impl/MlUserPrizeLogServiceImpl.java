package com.ruoyi.project.system.userPrizeLog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.userPrizeLog.mapper.MlUserPrizeLogMapper;
import com.ruoyi.project.system.userPrizeLog.domain.MlUserPrizeLog;
import com.ruoyi.project.system.userPrizeLog.service.IMlUserPrizeLogService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 日志与用户之间的关系Service业务层处理
 * 
 * @author malu
 * @date 2022-07-27
 */
@Service
public class MlUserPrizeLogServiceImpl implements IMlUserPrizeLogService 
{
    @Autowired
    private MlUserPrizeLogMapper mlUserPrizeLogMapper;

    /**
     * 查询日志与用户之间的关系
     * 
     * @param userId 日志与用户之间的关系主键
     * @return 日志与用户之间的关系
     */
    @Override
    public MlUserPrizeLog selectMlUserPrizeLogByUserId(Long userId)
    {
        return mlUserPrizeLogMapper.selectMlUserPrizeLogByUserId(userId);
    }

    /**
     * 查询日志与用户之间的关系列表
     * 
     * @param mlUserPrizeLog 日志与用户之间的关系
     * @return 日志与用户之间的关系
     */
    @Override
    public List<MlUserPrizeLog> selectMlUserPrizeLogList(MlUserPrizeLog mlUserPrizeLog)
    {
        return mlUserPrizeLogMapper.selectMlUserPrizeLogList(mlUserPrizeLog);
    }

    /**
     * 新增日志与用户之间的关系
     * 
     * @param mlUserPrizeLog 日志与用户之间的关系
     * @return 结果
     */
    @Override
    public int insertMlUserPrizeLog(MlUserPrizeLog mlUserPrizeLog)
    {
        return mlUserPrizeLogMapper.insertMlUserPrizeLog(mlUserPrizeLog);
    }

    /**
     * 修改日志与用户之间的关系
     * 
     * @param mlUserPrizeLog 日志与用户之间的关系
     * @return 结果
     */
    @Override
    public int updateMlUserPrizeLog(MlUserPrizeLog mlUserPrizeLog)
    {
        return mlUserPrizeLogMapper.updateMlUserPrizeLog(mlUserPrizeLog);
    }

    /**
     * 批量删除日志与用户之间的关系
     * 
     * @param userIds 需要删除的日志与用户之间的关系主键
     * @return 结果
     */
    @Override
    public int deleteMlUserPrizeLogByUserIds(String userIds)
    {
        return mlUserPrizeLogMapper.deleteMlUserPrizeLogByUserIds(Convert.toStrArray(userIds));
    }

    /**
     * 删除日志与用户之间的关系信息
     * 
     * @param userId 日志与用户之间的关系主键
     * @return 结果
     */
    @Override
    public int deleteMlUserPrizeLogByUserId(Long userId)
    {
        return mlUserPrizeLogMapper.deleteMlUserPrizeLogByUserId(userId);
    }
}

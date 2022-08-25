package com.ruoyi.project.system.prizeLog.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.prizeLog.mapper.MlPrizeLogMapper;
import com.ruoyi.project.system.prizeLog.domain.MlPrizeLog;
import com.ruoyi.project.system.prizeLog.service.IMlPrizeLogService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 奖品日志Service业务层处理
 * 
 * @author malu
 * @date 2022-07-27
 */
@Service
public class MlPrizeLogServiceImpl implements IMlPrizeLogService 
{
    @Autowired
    private MlPrizeLogMapper mlPrizeLogMapper;

    /**
     * 查询奖品日志
     * 
     * @param id 奖品日志主键
     * @return 奖品日志
     */
    @Override
    public MlPrizeLog selectMlPrizeLogById(Long id)
    {
        return mlPrizeLogMapper.selectMlPrizeLogById(id);
    }

    /**
     * 查询奖品日志列表
     * 
     * @param mlPrizeLog 奖品日志
     * @return 奖品日志
     */
    @Override
    public List<MlPrizeLog> selectMlPrizeLogList(MlPrizeLog mlPrizeLog)
    {
        return mlPrizeLogMapper.selectMlPrizeLogList(mlPrizeLog);
    }

    /**
     * 新增奖品日志
     * 
     * @param mlPrizeLog 奖品日志
     * @return 结果
     */
    @Override
    public int insertMlPrizeLog(MlPrizeLog mlPrizeLog)
    {
        mlPrizeLog.setCreateTime(DateUtils.getNowDate());
        return mlPrizeLogMapper.insertMlPrizeLog(mlPrizeLog);
    }

    /**
     * 修改奖品日志
     * 
     * @param mlPrizeLog 奖品日志
     * @return 结果
     */
    @Override
    public int updateMlPrizeLog(MlPrizeLog mlPrizeLog)
    {
        mlPrizeLog.setUpdateBy(ShiroUtils.getSysUser().getUserName());
        return mlPrizeLogMapper.updateMlPrizeLog(mlPrizeLog);
    }

    /**
     * 批量删除奖品日志
     * 
     * @param ids 需要删除的奖品日志主键
     * @return 结果
     */
    @Override
    public int deleteMlPrizeLogByIds(String ids)
    {
        return mlPrizeLogMapper.deleteMlPrizeLogByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除奖品日志信息
     * 
     * @param id 奖品日志主键
     * @return 结果
     */
    @Override
    public int deleteMlPrizeLogById(Long id)
    {
        return mlPrizeLogMapper.deleteMlPrizeLogById(id);
    }

    @Override
    public List<MlPrizeLog> selectMlPrizeLogByUserName(String userName) {
        return mlPrizeLogMapper.selectMlPrizeLogByUserName(userName);
    }
}

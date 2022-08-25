package com.ruoyi.project.system.sd.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.sd.mapper.MlSdMapper;
import com.ruoyi.project.system.sd.domain.MlSd;
import com.ruoyi.project.system.sd.service.IMlSdService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 配置Service业务层处理
 * 
 * @author malu
 * @date 2022-08-18
 */
@Service
public class MlSdServiceImpl implements IMlSdService 
{
    @Autowired
    private MlSdMapper mlSdMapper;

    /**
     * 查询配置
     * 
     * @param id 配置主键
     * @return 配置
     */
    @Override
    public MlSd selectMlSdById(Long id)
    {
        return mlSdMapper.selectMlSdById(id);
    }

    /**
     * 查询配置列表
     * 
     * @param mlSd 配置
     * @return 配置
     */
    @Override
    public List<MlSd> selectMlSdList(MlSd mlSd)
    {
        return mlSdMapper.selectMlSdList(mlSd);
    }

    /**
     * 新增配置
     * 
     * @param mlSd 配置
     * @return 结果
     */
    @Override
    public int insertMlSd(MlSd mlSd)
    {
        return mlSdMapper.insertMlSd(mlSd);
    }

    /**
     * 修改配置
     * 
     * @param mlSd 配置
     * @return 结果
     */
    @Override
    public int updateMlSd(MlSd mlSd)
    {
        return mlSdMapper.updateMlSd(mlSd);
    }

    /**
     * 批量删除配置
     * 
     * @param ids 需要删除的配置主键
     * @return 结果
     */
    @Override
    public int deleteMlSdByIds(String ids)
    {
        return mlSdMapper.deleteMlSdByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除配置信息
     * 
     * @param id 配置主键
     * @return 结果
     */
    @Override
    public int deleteMlSdById(Long id)
    {
        return mlSdMapper.deleteMlSdById(id);
    }
}

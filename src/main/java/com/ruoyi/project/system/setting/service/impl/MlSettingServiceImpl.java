package com.ruoyi.project.system.setting.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.setting.mapper.MlSettingMapper;
import com.ruoyi.project.system.setting.domain.MlSetting;
import com.ruoyi.project.system.setting.service.IMlSettingService;
import com.ruoyi.common.utils.text.Convert;

/**
 * mlSetingService业务层处理
 * 
 * @author malu
 * @date 2022-08-17
 */
@Service
public class MlSettingServiceImpl implements IMlSettingService 
{
    @Autowired
    private MlSettingMapper mlSettingMapper;

    /**
     * 查询mlSeting
     * 
     * @param id mlSeting主键
     * @return mlSeting
     */
    @Override
    public MlSetting selectMlSettingById(Long id)
    {
        return mlSettingMapper.selectMlSettingById(id);
    }

    /**
     * 查询mlSeting列表
     * 
     * @param mlSetting mlSeting
     * @return mlSeting
     */
    @Override
    public List<MlSetting> selectMlSettingList(MlSetting mlSetting)
    {
        return mlSettingMapper.selectMlSettingList(mlSetting);
    }

    /**
     * 新增mlSeting
     * 
     * @param mlSetting mlSeting
     * @return 结果
     */
    @Override
    public int insertMlSetting(MlSetting mlSetting)
    {
        return mlSettingMapper.insertMlSetting(mlSetting);
    }

    /**
     * 修改mlSeting
     * 
     * @param mlSetting mlSeting
     * @return 结果
     */
    @Override
    public int updateMlSetting(MlSetting mlSetting)
    {
        return mlSettingMapper.updateMlSetting(mlSetting);
    }

    /**
     * 批量删除mlSeting
     * 
     * @param ids 需要删除的mlSeting主键
     * @return 结果
     */
    @Override
    public int deleteMlSettingByIds(String ids)
    {
        return mlSettingMapper.deleteMlSettingByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除mlSeting信息
     * 
     * @param id mlSeting主键
     * @return 结果
     */
    @Override
    public int deleteMlSettingById(Long id)
    {
        return mlSettingMapper.deleteMlSettingById(id);
    }
}

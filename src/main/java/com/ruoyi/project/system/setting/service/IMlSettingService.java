package com.ruoyi.project.system.setting.service;

import java.util.List;
import com.ruoyi.project.system.setting.domain.MlSetting;

/**
 * mlSetingService接口
 * 
 * @author malu
 * @date 2022-08-17
 */
public interface IMlSettingService 
{
    /**
     * 查询mlSeting
     * 
     * @param id mlSeting主键
     * @return mlSeting
     */
    public MlSetting selectMlSettingById(Long id);

    /**
     * 查询mlSeting列表
     * 
     * @param mlSetting mlSeting
     * @return mlSeting集合
     */
    public List<MlSetting> selectMlSettingList(MlSetting mlSetting);

    /**
     * 新增mlSeting
     * 
     * @param mlSetting mlSeting
     * @return 结果
     */
    public int insertMlSetting(MlSetting mlSetting);

    /**
     * 修改mlSeting
     * 
     * @param mlSetting mlSeting
     * @return 结果
     */
    public int updateMlSetting(MlSetting mlSetting);

    /**
     * 批量删除mlSeting
     * 
     * @param ids 需要删除的mlSeting主键集合
     * @return 结果
     */
    public int deleteMlSettingByIds(String ids);

    /**
     * 删除mlSeting信息
     * 
     * @param id mlSeting主键
     * @return 结果
     */
    public int deleteMlSettingById(Long id);
}

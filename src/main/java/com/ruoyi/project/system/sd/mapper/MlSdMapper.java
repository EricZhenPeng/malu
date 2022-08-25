package com.ruoyi.project.system.sd.mapper;

import java.util.List;
import com.ruoyi.project.system.sd.domain.MlSd;

/**
 * 配置Mapper接口
 * 
 * @author malu
 * @date 2022-08-18
 */
public interface MlSdMapper 
{
    /**
     * 查询配置
     * 
     * @param id 配置主键
     * @return 配置
     */
    public MlSd selectMlSdById(Long id);

    /**
     * 查询配置列表
     * 
     * @param mlSd 配置
     * @return 配置集合
     */
    public List<MlSd> selectMlSdList(MlSd mlSd);

    /**
     * 新增配置
     * 
     * @param mlSd 配置
     * @return 结果
     */
    public int insertMlSd(MlSd mlSd);

    /**
     * 修改配置
     * 
     * @param mlSd 配置
     * @return 结果
     */
    public int updateMlSd(MlSd mlSd);

    /**
     * 删除配置
     * 
     * @param id 配置主键
     * @return 结果
     */
    public int deleteMlSdById(Long id);

    /**
     * 批量删除配置
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMlSdByIds(String[] ids);
}

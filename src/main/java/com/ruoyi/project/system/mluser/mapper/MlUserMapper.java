package com.ruoyi.project.system.mluser.mapper;

import java.util.List;
import com.ruoyi.project.system.mluser.domain.MlUser;

/**
 * 抽奖用户管理Mapper接口
 * 
 * @author malu
 * @date 2022-07-25
 */
public interface MlUserMapper 
{
    /**
     * 查询抽奖用户管理
     * 
     * @param id 抽奖用户管理主键
     * @return 抽奖用户管理
     */
    public MlUser selectMlUserById(Long id);

    /**
     * 查询抽奖用户管理列表
     * 
     * @param mlUser 抽奖用户管理
     * @return 抽奖用户管理集合
     */
    public List<MlUser> selectMlUserList(MlUser mlUser);

    /**
     * 新增抽奖用户管理
     * 
     * @param mlUser 抽奖用户管理
     * @return 结果
     */
    public int insertMlUser(MlUser mlUser);

    /**
     * 修改抽奖用户管理
     * 
     * @param mlUser 抽奖用户管理
     * @return 结果
     */
    public int updateMlUser(MlUser mlUser);

    /**
     * 删除抽奖用户管理
     * 
     * @param id 抽奖用户管理主键
     * @return 结果
     */
    public int deleteMlUserById(Long id);

    /**
     * 批量删除抽奖用户管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMlUserByIds(String[] ids);

    public MlUser selectMlUserByName(String userName);
}

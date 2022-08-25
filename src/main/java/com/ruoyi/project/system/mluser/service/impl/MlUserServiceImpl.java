package com.ruoyi.project.system.mluser.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.project.system.user.domain.UserRole;
import com.ruoyi.project.system.userPrize.domain.MlUserPrize;
import com.ruoyi.project.system.userPrize.mapper.MlUserPrizeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.mluser.mapper.MlUserMapper;
import com.ruoyi.project.system.mluser.domain.MlUser;
import com.ruoyi.project.system.mluser.service.IMlUserService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 抽奖用户管理Service业务层处理
 * 
 * @author malu
 * @date 2022-07-25
 */
@Service
public class MlUserServiceImpl implements IMlUserService 
{
    @Autowired
    private MlUserMapper mlUserMapper;

    @Autowired
    private MlUserPrizeMapper mlUserPrizeMapper;

    /**
     * 查询抽奖用户管理
     * 
     * @param id 抽奖用户管理主键
     * @return 抽奖用户管理
     */
    @Override
    public MlUser selectMlUserById(Long id)
    {
        return mlUserMapper.selectMlUserById(id);
    }

    /**
     * 查询抽奖用户管理列表
     * 
     * @param mlUser 抽奖用户管理
     * @return 抽奖用户管理
     */
    @Override
    public List<MlUser> selectMlUserList(MlUser mlUser)
    {
        return mlUserMapper.selectMlUserList(mlUser);
    }

    /**
     * 新增抽奖用户管理
     * 
     * @param mlUser 抽奖用户管理
     * @return 结果
     */
    @Override
    public int insertMlUser(MlUser mlUser)
    {
        mlUser.setCreateBy(ShiroUtils.getLoginName());
        mlUser.setCreateTime(DateUtils.getNowDate());
        int row= mlUserMapper.insertMlUser(mlUser);
        //保存抽奖人员与奖品信息
        insertUserPrize(mlUser.getId(),mlUser.getPrizeIds());
        return row;
    }

    public void insertUserPrize(Long userId, Long[] prizeIds)
    {
        if (StringUtils.isNotNull(prizeIds))
        {
            // 新增用户与角色管理
            List<MlUserPrize> list = new ArrayList<MlUserPrize>();
            for (Long prizeId : prizeIds)
            {
                MlUserPrize ur = new MlUserPrize();
                ur.setUserId(userId);
                ur.setPrizeId(prizeId);
                list.add(ur);
            }
            if (list.size() > 0)
            {
                mlUserPrizeMapper.batchUserPrize(list);
            }
        }
    }

    /**
     * 修改抽奖用户管理
     * 
     * @param mlUser 抽奖用户管理
     * @return 结果
     */
    @Override
    public int updateMlUser(MlUser mlUser)
    {
        mlUserPrizeMapper.deleteMlUserPrizeByUserId(mlUser.getId());
        mlUser.setUpdateTime(DateUtils.getNowDate());
        insertUserPrize(mlUser.getId(),mlUser.getPrizeIds());
        return mlUserMapper.updateMlUser(mlUser);
    }

    /**
     * 批量删除抽奖用户管理
     * 
     * @param ids 需要删除的抽奖用户管理主键
     * @return 结果
     */
    @Override
    public int deleteMlUserByIds(String ids)
    {
        return mlUserMapper.deleteMlUserByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除抽奖用户管理信息
     * 
     * @param id 抽奖用户管理主键
     * @return 结果
     */
    @Override
    public int deleteMlUserById(Long id)
    {
        return mlUserMapper.deleteMlUserById(id);
    }

    @Override
    public MlUser selectMlUserByName(String userName) {
        return mlUserMapper.selectMlUserByName(userName);
    }


    @Override
    public String importUser(List<MlUser> userList)
    {

        if (StringUtils.isNull(userList) || userList.size() == 0)
        {
            throw new ServiceException("导入用户数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (MlUser user : userList)
        {
            try {
                //验证是否存在该用户
                MlUser chrckUser = mlUserMapper.selectMlUserByName(user.getUserName());
                if (StringUtils.isNull(chrckUser)) {
                    if (user.getDrawNum()>100)
                    {
                        failureNum++;
                        failureMsg.append("<br/>" + failureNum + "、账号 " + user.getUserName() + " 抽奖次数大于99");
                        continue;
                    }
                    String[] prizes = user.getPrizeNum().split("，");
                    Long[] longs = StringToLong(prizes);
                    if (user.getDrawNum()!=longs.length){
                        failureNum++;
                        failureMsg.append("<br/>" + failureNum + "、账号 " + user.getUserName() + " 抽奖次数与奖品数量不符");
                        continue;
                    }
                    user.setPrizeIds(longs);
                    insertMlUser(user);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + user.getUserName() + " 导入成功");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、账号 " + user.getUserName() + " 已存在");
                }
            }catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、账号 " +  user.getUserName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
            }

        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

    public  Long[] StringToLong(String[] str) {
        Long[] arr = new Long[str.length];
        for (int i = 0; i < str.length; i++) {
            arr[i] = Long.parseLong(str[i]);
        }
        return arr;
    }
}

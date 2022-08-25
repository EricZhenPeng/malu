package com.ruoyi.project.system.prize.service.impl;

import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.project.system.mluser.domain.MlUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.prize.mapper.MlPrizeMapper;
import com.ruoyi.project.system.prize.domain.MlPrize;
import com.ruoyi.project.system.prize.service.IMlPrizeService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 奖品管理Service业务层处理
 * 
 * @author pengz
 * @date 2022-07-25
 */
@Service
public class MlPrizeServiceImpl implements IMlPrizeService 
{
    @Autowired
    private MlPrizeMapper mlPrizeMapper;

    /**
     * 查询奖品管理
     * 
     * @param id 奖品管理主键
     * @return 奖品管理
     */
    @Override
    public MlPrize selectMlPrizeById(Long id)
    {
        return mlPrizeMapper.selectMlPrizeById(id);
    }

    /**
     * 查询奖品管理列表
     * 
     * @param mlPrize 奖品管理
     * @return 奖品管理
     */
    @Override
    public List<MlPrize> selectMlPrizeList(MlPrize mlPrize)
    {
        return mlPrizeMapper.selectMlPrizeList(mlPrize);
    }

    /**
     * 新增奖品管理
     * 
     * @param mlPrize 奖品管理
     * @return 结果
     */
    @Override
    public int insertMlPrize(MlPrize mlPrize)
    {
        mlPrize.setCreateTime(DateUtils.getNowDate());
        return mlPrizeMapper.insertMlPrize(mlPrize);
    }

    /**
     * 修改奖品管理
     * 
     * @param mlPrize 奖品管理
     * @return 结果
     */
    @Override
    public int updateMlPrize(MlPrize mlPrize)
    {
        mlPrize.setUpdateTime(DateUtils.getNowDate());
        return mlPrizeMapper.updateMlPrize(mlPrize);
    }

    /**
     * 批量删除奖品管理
     * 
     * @param ids 需要删除的奖品管理主键
     * @return 结果
     */
    @Override
    public int deleteMlPrizeByIds(String ids)
    {
        return mlPrizeMapper.deleteMlPrizeByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除奖品管理信息
     * 
     * @param id 奖品管理主键
     * @return 结果
     */
    @Override
    public int deleteMlPrizeById(Long id)
    {
        return mlPrizeMapper.deleteMlPrizeById(id);
    }

    @Override
    public List<MlPrize> selectPrizeByUserId(Long id) {
        return mlPrizeMapper.selectPrizeByUserId(id);
    }

    @Override
    public String importUser(List<MlPrize> prizeList) {
        if (StringUtils.isNull(prizeList) || prizeList.size() == 0)
        {
            throw new ServiceException("导入的数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (MlPrize prize : prizeList) {
            try {
                if (StringUtils.isNotEmpty(prize.getName())&&prize.getPrize()!=null){
                    prize.setState("0");
                    mlPrizeMapper.insertMlPrize(prize);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、奖品 " +  prize.getName() + " 导入成功");
                }else{
                    failureNum++;
                    String msg = "<br/>" + failureNum + "、奖品 " +  prize.getName() + " 导入失败：";
                }
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、奖品 " +  prize.getName() + " 导入失败：";
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
}

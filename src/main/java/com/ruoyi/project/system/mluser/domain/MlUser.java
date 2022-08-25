package com.ruoyi.project.system.mluser.domain;

import com.ruoyi.project.system.prize.domain.MlPrize;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

import java.util.List;

/**
 * 抽奖用户管理对象 ml_user
 * 
 * @author malu
 * @date 2022-07-25
 */
public class MlUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 用户名称 */
    @Excel(name = "用户名称")
    private String userName;

    /** 抽奖次数 */
    @Excel(name = "抽奖次数")
    private Integer drawNum;


    @Excel(name = "奖品设置")
    private String prizeNum;

    /**
     * 奖品集合
     */
    private List<MlPrize> prizes;

    /** 奖品组 */
    private Long[] prizeIds;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserName()
    {
        return userName;
    }
    public void setDrawNum(Integer drawNum)
    {
        this.drawNum = drawNum;
    }

    public Integer getDrawNum()
    {
        return drawNum;
    }

    public List<MlPrize> getPrizes() {
        return prizes;
    }

    public void setPrizes(List<MlPrize> prizes) {
        this.prizes = prizes;
    }

    public Long[] getPrizeIds() {
        return prizeIds;
    }

    public void setPrizeIds(Long[] prizeIds) {
        this.prizeIds = prizeIds;
    }

    public String getPrizeNum() {
        return prizeNum;
    }

    public void setPrizeNum(String prizeNum) {
        this.prizeNum = prizeNum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userName", getUserName())
            .append("drawNum", getDrawNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}

package com.ruoyi.project.system.prizeLog.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

import java.util.Date;

/**
 * 奖品日志对象 ml_prize_log
 * 
 * @author malu
 * @date 2022-07-27
 */
public class MlPrizeLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 抽奖用户 */
    @Excel(name = "抽奖用户")
    private String userName;

    /** 奖品金额 */
    @Excel(name = "奖品金额")
    private Double prize;

    /** 是否发放奖品 */
    @Excel(name = "是否发放奖品")
    private String falg;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

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
    public void setPrize(Double prize)
    {
        this.prize = prize;
    }

    public Double getPrize()
    {
        return prize;
    }
    public void setFalg(String falg)
    {
        this.falg = falg;
    }

    public String getFalg()
    {
        return falg;
    }

    @Override
    public Date getUpdateTime() {
        return updateTime;
    }

    @Override
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userName", getUserName())
            .append("prize", getPrize())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("falg", getFalg())
            .toString();
    }
}

package com.ruoyi.project.system.userPrize.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 抽奖用户与奖品之间的绑定对象 ml_user_prize
 * 
 * @author malu
 * @date 2022-07-26
 */
public class MlUserPrize extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户id */
    private Long userId;

    /** 奖品ID */
    private Long prizeId;

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setPrizeId(Long prizeId)
    {
        this.prizeId = prizeId;
    }

    public Long getPrizeId()
    {
        return prizeId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("prizeId", getPrizeId())
            .toString();
    }
}

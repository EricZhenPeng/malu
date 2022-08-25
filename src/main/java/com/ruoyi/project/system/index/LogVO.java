package com.ruoyi.project.system.index;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class LogVO {

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;

    private Double prize;

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Double getPrize() {
        return prize;
    }

    public void setPrize(Double prize) {
        this.prize = prize;
    }
}

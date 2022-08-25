package com.ruoyi.project.system.prizeLog.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.system.prizeLog.domain.MlPrizeLog;
import com.ruoyi.project.system.prizeLog.service.IMlPrizeLogService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 奖品日志Controller
 * 
 * @author malu
 * @date 2022-07-27
 */
@Controller
@RequestMapping("/system/prizeLog")
public class MlPrizeLogController extends BaseController
{
    private String prefix = "system/prizeLog";

    @Autowired
    private IMlPrizeLogService mlPrizeLogService;

    @RequiresPermissions("system:prizeLog:view")
    @GetMapping()
    public String prizeLog()
    {
        return prefix + "/prizeLog";
    }

    /**
     * 查询奖品日志列表
     */
    @RequiresPermissions("system:prizeLog:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MlPrizeLog mlPrizeLog)
    {
        startPage();
        List<MlPrizeLog> list = mlPrizeLogService.selectMlPrizeLogList(mlPrizeLog);
        return getDataTable(list);
    }

    @PostMapping("/listByUserName")
    @ResponseBody
    public TableDataInfo listByUserName(String userName){
        startPage();
        List<MlPrizeLog> list = mlPrizeLogService.selectMlPrizeLogByUserName(userName);
        return getDataTable(list);
    }

    /**
     * 导出奖品日志列表
     */
    @RequiresPermissions("system:prizeLog:export")
    @Log(title = "奖品日志", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MlPrizeLog mlPrizeLog)
    {
        List<MlPrizeLog> list = mlPrizeLogService.selectMlPrizeLogList(mlPrizeLog);
        ExcelUtil<MlPrizeLog> util = new ExcelUtil<MlPrizeLog>(MlPrizeLog.class);
        return util.exportExcel(list, "奖品日志数据");
    }

    /**
     * 新增奖品日志
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存奖品日志
     */
    @RequiresPermissions("system:prizeLog:add")
    @Log(title = "奖品日志", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MlPrizeLog mlPrizeLog)
    {
        return toAjax(mlPrizeLogService.insertMlPrizeLog(mlPrizeLog));
    }

    /**
     * 修改奖品日志
     */
    @RequiresPermissions("system:prizeLog:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MlPrizeLog mlPrizeLog = mlPrizeLogService.selectMlPrizeLogById(id);
       /* SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=sdf.format(mlPrizeLog.getUpdateTime());
        mlPrizeLog.setTime(time);*/
        mmap.put("mlPrizeLog", mlPrizeLog);
        return prefix + "/edit";
    }

    /**
     * 修改保存奖品日志
     */
    @RequiresPermissions("system:prizeLog:edit")
    @Log(title = "奖品日志", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MlPrizeLog mlPrizeLog)
    {
        return toAjax(mlPrizeLogService.updateMlPrizeLog(mlPrizeLog));
    }

    /**
     * 删除奖品日志
     */
    @RequiresPermissions("system:prizeLog:remove")
    @Log(title = "奖品日志", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mlPrizeLogService.deleteMlPrizeLogByIds(ids));
    }
}

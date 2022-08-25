package com.ruoyi.project.system.userPrizeLog.controller;

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
import com.ruoyi.project.system.userPrizeLog.domain.MlUserPrizeLog;
import com.ruoyi.project.system.userPrizeLog.service.IMlUserPrizeLogService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 日志与用户之间的关系Controller
 * 
 * @author malu
 * @date 2022-07-27
 */
@Controller
@RequestMapping("/system/userPrizeLog")
public class MlUserPrizeLogController extends BaseController
{
    private String prefix = "system/userPrizeLog";

    @Autowired
    private IMlUserPrizeLogService mlUserPrizeLogService;

    @RequiresPermissions("system:userPrizeLog:view")
    @GetMapping()
    public String userPrizeLog()
    {
        return prefix + "/userPrizeLog";
    }

    /**
     * 查询日志与用户之间的关系列表
     */
    @RequiresPermissions("system:userPrizeLog:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MlUserPrizeLog mlUserPrizeLog)
    {
        startPage();
        List<MlUserPrizeLog> list = mlUserPrizeLogService.selectMlUserPrizeLogList(mlUserPrizeLog);
        return getDataTable(list);
    }

    /**
     * 导出日志与用户之间的关系列表
     */
    @RequiresPermissions("system:userPrizeLog:export")
    @Log(title = "日志与用户之间的关系", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MlUserPrizeLog mlUserPrizeLog)
    {
        List<MlUserPrizeLog> list = mlUserPrizeLogService.selectMlUserPrizeLogList(mlUserPrizeLog);
        ExcelUtil<MlUserPrizeLog> util = new ExcelUtil<MlUserPrizeLog>(MlUserPrizeLog.class);
        return util.exportExcel(list, "日志与用户之间的关系数据");
    }

    /**
     * 新增日志与用户之间的关系
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存日志与用户之间的关系
     */
    @RequiresPermissions("system:userPrizeLog:add")
    @Log(title = "日志与用户之间的关系", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MlUserPrizeLog mlUserPrizeLog)
    {
        return toAjax(mlUserPrizeLogService.insertMlUserPrizeLog(mlUserPrizeLog));
    }

    /**
     * 修改日志与用户之间的关系
     */
    @RequiresPermissions("system:userPrizeLog:edit")
    @GetMapping("/edit/{userId}")
    public String edit(@PathVariable("userId") Long userId, ModelMap mmap)
    {
        MlUserPrizeLog mlUserPrizeLog = mlUserPrizeLogService.selectMlUserPrizeLogByUserId(userId);
        mmap.put("mlUserPrizeLog", mlUserPrizeLog);
        return prefix + "/edit";
    }

    /**
     * 修改保存日志与用户之间的关系
     */
    @RequiresPermissions("system:userPrizeLog:edit")
    @Log(title = "日志与用户之间的关系", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MlUserPrizeLog mlUserPrizeLog)
    {
        return toAjax(mlUserPrizeLogService.updateMlUserPrizeLog(mlUserPrizeLog));
    }

    /**
     * 删除日志与用户之间的关系
     */
    @RequiresPermissions("system:userPrizeLog:remove")
    @Log(title = "日志与用户之间的关系", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mlUserPrizeLogService.deleteMlUserPrizeLogByUserIds(ids));
    }
}

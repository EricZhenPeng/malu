package com.ruoyi.project.system.sd.controller;

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
import com.ruoyi.project.system.sd.domain.MlSd;
import com.ruoyi.project.system.sd.service.IMlSdService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 配置Controller
 * 
 * @author malu
 * @date 2022-08-18
 */
@Controller
@RequestMapping("/system/sd")
public class MlSdController extends BaseController
{
    private String prefix = "system/sd";

    @Autowired
    private IMlSdService mlSdService;

    @RequiresPermissions("system:sd:view")
    @GetMapping()
    public String sd()
    {
        return prefix + "/sd";
    }

    /**
     * 查询配置列表
     */
    @RequiresPermissions("system:sd:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MlSd mlSd)
    {
        startPage();
        List<MlSd> list = mlSdService.selectMlSdList(mlSd);
        return getDataTable(list);
    }

    /**
     * 导出配置列表
     */
    @RequiresPermissions("system:sd:export")
    @Log(title = "配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MlSd mlSd)
    {
        List<MlSd> list = mlSdService.selectMlSdList(mlSd);
        ExcelUtil<MlSd> util = new ExcelUtil<MlSd>(MlSd.class);
        return util.exportExcel(list, "配置数据");
    }

    /**
     * 新增配置
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存配置
     */
    @RequiresPermissions("system:sd:add")
    @Log(title = "配置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MlSd mlSd)
    {
        return toAjax(mlSdService.insertMlSd(mlSd));
    }

    /**
     * 修改配置
     */
    @RequiresPermissions("system:sd:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MlSd mlSd = mlSdService.selectMlSdById(id);
        mmap.put("mlSd", mlSd);
        return prefix + "/edit";
    }

    /**
     * 修改保存配置
     */
    @RequiresPermissions("system:sd:edit")
    @Log(title = "配置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MlSd mlSd)
    {
        return toAjax(mlSdService.updateMlSd(mlSd));
    }

    /**
     * 删除配置
     */
    @RequiresPermissions("system:sd:remove")
    @Log(title = "配置", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mlSdService.deleteMlSdByIds(ids));
    }
}

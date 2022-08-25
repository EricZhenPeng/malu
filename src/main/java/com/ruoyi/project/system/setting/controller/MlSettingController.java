package com.ruoyi.project.system.setting.controller;

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
import com.ruoyi.project.system.setting.domain.MlSetting;
import com.ruoyi.project.system.setting.service.IMlSettingService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * mlSetingController
 * 
 * @author malu
 * @date 2022-08-17
 */
@Controller
@RequestMapping("/system/setting")
public class MlSettingController extends BaseController
{
    private String prefix = "system/yangguang";

    @Autowired
    private IMlSettingService mlSettingService;

    @RequiresPermissions("system:setting:view")
    @GetMapping()
    public String setting()
    {

        return prefix + "/yang";
    }

    /**
     * 查询mlSeting列表
     */
    @RequiresPermissions("system:setting:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MlSetting mlSetting)
    {
        startPage();
        List<MlSetting> list = mlSettingService.selectMlSettingList(mlSetting);
        return getDataTable(list);
    }

    /**
     * 导出mlSeting列表
     */
    @RequiresPermissions("system:setting:export")
    @Log(title = "mlSeting", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MlSetting mlSetting)
    {
        List<MlSetting> list = mlSettingService.selectMlSettingList(mlSetting);
        ExcelUtil<MlSetting> util = new ExcelUtil<MlSetting>(MlSetting.class);
        return util.exportExcel(list, "mlSeting数据");
    }

    /**
     * 新增mlSeting
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存mlSeting
     */
    @RequiresPermissions("system:setting:add")
    @Log(title = "mlSeting", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MlSetting mlSetting)
    {
        return toAjax(mlSettingService.insertMlSetting(mlSetting));
    }

    /**
     * 修改mlSeting
     */
    @RequiresPermissions("system:setting:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MlSetting mlSetting = mlSettingService.selectMlSettingById(id);
        mmap.put("mlSetting", mlSetting);
        return prefix + "/edit";
    }

    /**
     * 修改保存mlSeting
     */
    @RequiresPermissions("system:setting:edit")
    @Log(title = "mlSeting", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MlSetting mlSetting)
    {
        return toAjax(mlSettingService.updateMlSetting(mlSetting));
    }

    /**
     * 删除mlSeting
     */
    @RequiresPermissions("system:setting:remove")
    @Log(title = "mlSeting", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mlSettingService.deleteMlSettingByIds(ids));
    }
}

package com.ruoyi.project.system.userPrize.controller;

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
import com.ruoyi.project.system.userPrize.domain.MlUserPrize;
import com.ruoyi.project.system.userPrize.service.IMlUserPrizeService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 抽奖用户与奖品之间的绑定Controller
 * 
 * @author malu
 * @date 2022-07-26
 */
@Controller
@RequestMapping("/system/userPrize")
public class MlUserPrizeController extends BaseController
{
    private String prefix = "system/userPrize";

    @Autowired
    private IMlUserPrizeService mlUserPrizeService;

    @RequiresPermissions("system:userPrize:view")
    @GetMapping()
    public String userPrize()
    {
        return prefix + "/userPrize";
    }

    /**
     * 查询抽奖用户与奖品之间的绑定列表
     */
    @RequiresPermissions("system:userPrize:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MlUserPrize mlUserPrize)
    {
        startPage();
        List<MlUserPrize> list = mlUserPrizeService.selectMlUserPrizeList(mlUserPrize);
        return getDataTable(list);
    }

    /**
     * 导出抽奖用户与奖品之间的绑定列表
     */
    @RequiresPermissions("system:userPrize:export")
    @Log(title = "抽奖用户与奖品之间的绑定", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MlUserPrize mlUserPrize)
    {
        List<MlUserPrize> list = mlUserPrizeService.selectMlUserPrizeList(mlUserPrize);
        ExcelUtil<MlUserPrize> util = new ExcelUtil<MlUserPrize>(MlUserPrize.class);
        return util.exportExcel(list, "抽奖用户与奖品之间的绑定数据");
    }

    /**
     * 新增抽奖用户与奖品之间的绑定
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存抽奖用户与奖品之间的绑定
     */
    @RequiresPermissions("system:userPrize:add")
    @Log(title = "抽奖用户与奖品之间的绑定", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MlUserPrize mlUserPrize)
    {
        return toAjax(mlUserPrizeService.insertMlUserPrize(mlUserPrize));
    }

    /**
     * 修改抽奖用户与奖品之间的绑定
     */
    @RequiresPermissions("system:userPrize:edit")
    @GetMapping("/edit/{userId}")
    public String edit(@PathVariable("userId") Long userId, ModelMap mmap)
    {
      //  MlUserPrize mlUserPrize = mlUserPrizeService.selectMlUserPrizeByUserId(userId);
     //   mmap.put("mlUserPrize", mlUserPrize);
        return prefix + "/edit";
    }

    /**
     * 修改保存抽奖用户与奖品之间的绑定
     */
    @RequiresPermissions("system:userPrize:edit")
    @Log(title = "抽奖用户与奖品之间的绑定", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MlUserPrize mlUserPrize)
    {
        return toAjax(mlUserPrizeService.updateMlUserPrize(mlUserPrize));
    }

    /**
     * 删除抽奖用户与奖品之间的绑定
     */
    @RequiresPermissions("system:userPrize:remove")
    @Log(title = "抽奖用户与奖品之间的绑定", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mlUserPrizeService.deleteMlUserPrizeByUserIds(ids));
    }
}

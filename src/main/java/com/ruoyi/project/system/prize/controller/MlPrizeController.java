package com.ruoyi.project.system.prize.controller;

import java.util.List;

import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.system.mluser.domain.MlUser;
import com.ruoyi.project.system.userPrize.domain.MlUserPrize;
import com.ruoyi.project.system.userPrize.service.IMlUserPrizeService;
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
import com.ruoyi.project.system.prize.domain.MlPrize;
import com.ruoyi.project.system.prize.service.IMlPrizeService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 奖品管理Controller
 * 
 * @author pengz
 * @date 2022-07-25
 */
@Controller
@RequestMapping("/system/prize")
public class MlPrizeController extends BaseController
{
    private String prefix = "system/prize";

    @Autowired
    private IMlPrizeService mlPrizeService;

    @Autowired
    private IMlUserPrizeService mlUserPrizeService;

    @RequiresPermissions("system:prize:view")
    @GetMapping()
    public String prize()
    {
        return prefix + "/prize";
    }

    /**
     * 查询奖品管理列表
     */
    @RequiresPermissions("system:prize:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MlPrize mlPrize)
    {
        startPage();
        List<MlPrize> list = mlPrizeService.selectMlPrizeList(mlPrize);
        return getDataTable(list);
    }

    /**
     * 导出奖品管理列表
     */
    @RequiresPermissions("system:prize:export")
    @Log(title = "奖品管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MlPrize mlPrize)
    {
        List<MlPrize> list = mlPrizeService.selectMlPrizeList(mlPrize);
        ExcelUtil<MlPrize> util = new ExcelUtil<MlPrize>(MlPrize.class);
        return util.exportExcel(list, "奖品管理数据");
    }

    /**
     * 新增奖品管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存奖品管理
     */
    @RequiresPermissions("system:prize:add")
    @Log(title = "奖品管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MlPrize mlPrize)
    {
        return toAjax(mlPrizeService.insertMlPrize(mlPrize));
    }

    /**
     * 修改奖品管理
     */
    @RequiresPermissions("system:prize:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MlPrize mlPrize = mlPrizeService.selectMlPrizeById(id);
        mmap.put("mlPrize", mlPrize);
        return prefix + "/edit";
    }

    /**
     * 修改保存奖品管理
     */
    @RequiresPermissions("system:prize:edit")
    @Log(title = "奖品管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MlPrize mlPrize)
    {
        return toAjax(mlPrizeService.updateMlPrize(mlPrize));
    }

    /**
     * 删除奖品管理
     */
    @RequiresPermissions("system:prize:remove")
    @Log(title = "奖品管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        String[] idsz = Convert.toStrArray(ids);
        for (String str:idsz){
            List<MlUserPrize> list = mlUserPrizeService.selectMlUserPrizeByPrizeId(Long.parseLong(str));
            if (list.size()>0){
                return AjaxResult.error("已分配奖品，无法删除");
            }
        }
        return toAjax(mlPrizeService.deleteMlPrizeByIds(ids));
    }

    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(MultipartFile file) throws Exception
    {
        ExcelUtil<MlPrize> util = new ExcelUtil<MlPrize>(MlPrize.class);
        List<MlPrize> userList = util.importExcel(file.getInputStream());
        String message = mlPrizeService.importUser(userList);
        return AjaxResult.success(message);
    }

    @GetMapping("/importTemplate")
    @ResponseBody
    public AjaxResult importTemplate()
    {
        ExcelUtil<MlPrize> util = new ExcelUtil<MlPrize>(MlPrize.class);
        return util.importTemplateExcel("用户数据");
    }

}

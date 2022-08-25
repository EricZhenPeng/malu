package com.ruoyi.project.system.mluser.controller;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.project.system.prize.domain.MlPrize;
import com.ruoyi.project.system.prize.service.IMlPrizeService;
import com.ruoyi.project.system.prizeLog.domain.MlPrizeLog;
import com.ruoyi.project.system.prizeLog.service.IMlPrizeLogService;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.project.system.userPrize.domain.MlUserPrize;
import com.ruoyi.project.system.userPrize.service.IMlUserPrizeService;
import com.ruoyi.project.system.userPrizeLog.domain.MlUserPrizeLog;
import com.ruoyi.project.system.userPrizeLog.service.IMlUserPrizeLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.system.mluser.domain.MlUser;
import com.ruoyi.project.system.mluser.service.IMlUserService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 抽奖用户管理Controller
 * 
 * @author malu
 * @date 2022-07-25
 */
@Controller
@RequestMapping("/system/mluser")
public class MlUserController extends BaseController
{
    private String prefix = "system/mluser";

    @Autowired
    private IMlUserService mlUserService;
    @Autowired
    private IMlPrizeService mlPrizeService;
    @Autowired
    private IMlUserPrizeService userPrizeService;

    @Autowired
    private IMlUserPrizeLogService mlUserPrizeLogService;

    @Autowired
    private IMlPrizeLogService mlPrizeLogService;

    @RequiresPermissions("system:mluser:view")
    @GetMapping()
    public String mluser()
    {
        return prefix + "/mluser";
    }

    @GetMapping("/prizeLog")
    public String prizeLog(String userName,ModelMap mmap)
    {
        mmap.put("userName",userName);

        return prefix + "/parent";
    }

    /**
     * 查询抽奖用户管理列表
     */
    @RequiresPermissions("system:mluser:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MlUser mlUser)
    {
        startPage();
        List<MlUser> list = mlUserService.selectMlUserList(mlUser);
        return getDataTable(list);
    }

    /**
     * 导出抽奖用户管理列表
     */
    @RequiresPermissions("system:mluser:export")
    @Log(title = "抽奖用户管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MlUser mlUser)
    {
        List<MlUser> list = mlUserService.selectMlUserList(mlUser);
        ExcelUtil<MlUser> util = new ExcelUtil<MlUser>(MlUser.class);
        return util.exportExcel(list, "抽奖用户管理数据");
    }

    /**
     * 新增抽奖用户管理
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {

        mmap.put("prizes", mlPrizeService.selectMlPrizeList(null));
        return prefix + "/add";
    }

    /**
     * 新增保存抽奖用户管理
     */
    @RequiresPermissions("system:mluser:add")
    @Log(title = "抽奖用户管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MlUser mlUser)
    {
        MlUser cuser = mlUserService.selectMlUserByName(mlUser.getUserName());
        if (!StringUtils.isNull(cuser))
        {
            return AjaxResult.error("用户名不能重复");
        }
        if (mlUser.getDrawNum()!=mlUser.getPrizeIds().length){

            return AjaxResult.error("抽奖次数与奖品数量不符");
        }
        return toAjax(mlUserService.insertMlUser(mlUser));
    }

    /**
     * 修改抽奖用户管理
     */
    @RequiresPermissions("system:mluser:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {

        MlUser mlUser = mlUserService.selectMlUserById(id);
        mmap.put("mlUser", mlUser);

        List<MlPrize> list = mlPrizeService.selectMlPrizeList(null);
        List<MlUserPrize> mlPrize = userPrizeService.selectMlUserPrizeByUserId(id);

        for (MlPrize mlPrize1:list)
        {
            for (MlUserPrize mlUserPrize:mlPrize)
            {
                if (mlPrize1.getId().longValue() == mlUserPrize.getPrizeId().longValue()){
                    mlPrize1.setFlag(true);
                    break;
                }
            }
        }
        mmap.put("prizes", list);
        return prefix + "/edit";
    }

    /**
     * 修改保存抽奖用户管理
     */
    @RequiresPermissions("system:mluser:edit")
    @Log(title = "抽奖用户管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MlUser mlUser)
    {
        if (mlUser.getDrawNum()!=mlUser.getPrizeIds().length){

            return AjaxResult.error("抽奖次数与奖品数量不符");
        }

        return toAjax(mlUserService.updateMlUser(mlUser));
    }

    /**
     * 删除抽奖用户管理
     */
    @RequiresPermissions("system:mluser:remove")
    @Log(title = "抽奖用户管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mlUserService.deleteMlUserByIds(ids));
    }

    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(MultipartFile file) throws Exception
    {
        ExcelUtil<MlUser> util = new ExcelUtil<MlUser>(MlUser.class);
        List<MlUser> userList = util.importExcel(file.getInputStream());
        String message = mlUserService.importUser(userList);
        return AjaxResult.success(message);
    }

    @GetMapping("/importTemplate")
    @ResponseBody
    public AjaxResult importTemplate()
    {
        ExcelUtil<MlUser> util = new ExcelUtil<MlUser>(MlUser.class);
        return util.importTemplateExcel("用户数据");
    }

    /**
     * 用户抽奖功能
     * @param userName
     * @return
     */
    @GetMapping( "/userForPrize")
    @ResponseBody
    @Async
    public AjaxResult userForPrize(String userName)
    {
        //查询是否存在用户
        MlUser user = mlUserService.selectMlUserByName(userName);
        if (StringUtils.isNull(user))
        {
            return  AjaxResult.error("不存在该用户");
        }
        //如果存在该用户则查询他的抽奖次数是否大于0
        if (user.getDrawNum()<1)
        {
            return  AjaxResult.error("抽奖次数不足");
        }
        List<MlPrize> list = mlPrizeService.selectPrizeByUserId(user.getId());
        Double prize=null;
        List<Long> prizeIds=new ArrayList<Long>();
        for (MlPrize mlPrize:list)
        {
            if (StringUtils.isNull(prize))
            {
                prize=mlPrize.getPrize();
            }else{
                prizeIds.add(mlPrize.getId());
            }
        }
        user.setDrawNum(user.getDrawNum()-1);
        user.setPrizeIds(prizeIds.stream().toArray(Long[]::new));
        MlPrizeLog mlPrizeLog=new MlPrizeLog();
        mlPrizeLog.setFalg("N");
        mlPrizeLog.setPrize(prize);
        mlPrizeLog.setUserName(userName);
        mlPrizeLogService.insertMlPrizeLog(mlPrizeLog);
        mlUserService.updateMlUser(user);
        return AjaxResult.success(prize);
    }
}

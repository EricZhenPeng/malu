package com.ruoyi.project.system.douyu;


import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.project.system.sd.domain.MlSd;
import com.ruoyi.project.system.sd.service.IMlSdService;
import com.ruoyi.project.system.setting.domain.MlSetting;
import com.ruoyi.project.system.setting.service.IMlSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/yangguang/douyu")
public class getForIndex extends BaseController {

    private String prefix = "malu";

    @Autowired
    private IMlSdService mlSdService;

    @Autowired
    private IMlSettingService mlSettingService;

    @GetMapping("/forIndex")
    public String forIndex(ModelMap mmap)
    {

        MlSetting mlset = mlSettingService.selectMlSettingList(null).get(0);
        mmap.put("mlset",mlset);
        return prefix + "/index";
    }

    @GetMapping("/fortoplife")
    public String fortoplife(ModelMap mmap)
    {
        MlSd mlsd = mlSdService.selectMlSdList(null).get(0);
        mmap.put("mlsd",mlsd);
        return  prefix +  "/toplife";
    }

}

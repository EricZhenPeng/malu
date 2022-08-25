package com.ruoyi.project.system.index;


import com.ruoyi.framework.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/malu/home")
public class IndexHomeController extends BaseController {

    @GetMapping()
    public String index(){

        return "home/index";
    }

}

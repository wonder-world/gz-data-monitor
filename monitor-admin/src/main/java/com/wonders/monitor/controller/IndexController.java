package com.wonders.monitor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @projectName:gz-data-monitor
 * @packageName:com.wonders.monitor.controller
 * @authorName:wangjiaming
 * @createDate:2019-01-21
 * @editor:IntelliJ IDEA
 * @other:
 **/
@Controller
@RequestMapping("/indexPage")
public class IndexController {

    @RequestMapping("/toIndex")
    public String toIndexPage(){
        System.out.println("1111");
        return "index";
    }
}

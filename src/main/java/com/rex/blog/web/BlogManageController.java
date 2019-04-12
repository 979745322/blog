package com.rex.blog.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import static com.rex.blog.web.WebURIMappingConstant.URI_BLOGMANAGE;

/**
 * 博客后台管理控制层
 */
@Controller
@RequestMapping(URI_BLOGMANAGE)
public class BlogManageController {
    /**
     * 默认首页
     * @return 返回首页
     */
    @RequestMapping("")
    public String index() {
        return "blogmanagement/index";
    }

    /**
     * 默认主页
     * @return 返回主页
     */
    @RequestMapping("/mainpage")
    public String zhuye() {
        return "blogmanagement/mainpage";
    }

    @RequestMapping("/blog")
    public String blogmanage() {
        return "blogmanagement/blogmanage";
    }
}

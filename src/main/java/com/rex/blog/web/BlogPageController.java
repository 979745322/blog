package com.rex.blog.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 博客页面控制层
 */
@Slf4j
@Controller
public class BlogPageController {
    /**
     * 默认首页
     *
     * @return 返回首页
     */
    @RequestMapping("")
    public String index() {
        return "blogshowpage/index";
    }

    /**
     * 博客页
     *
     * @return 返回博客页
     */
    @RequestMapping("/blog")
    public String blog() {
        return "blogshowpage/blog";
    }
}

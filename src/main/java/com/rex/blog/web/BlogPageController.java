package com.rex.blog.web;

import com.rex.blog.service.BlogTypeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 博客页面控制层
 */
@Slf4j
@Controller
public class BlogPageController {

    private final BlogTypeService blogTypeService;

    @Autowired
    public BlogPageController(BlogTypeService blogTypeService) {
        this.blogTypeService = blogTypeService;
    }

    /**
     * 默认首页
     *
     * @return 返回首页
     */
    @RequestMapping("")
    public ModelAndView index() {
        final ModelAndView mav = new ModelAndView();
        mav.addObject("blogTypeList", blogTypeService.selectBlogTypeAll());
        mav.setViewName("blogshowpage/index");

        return mav;
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

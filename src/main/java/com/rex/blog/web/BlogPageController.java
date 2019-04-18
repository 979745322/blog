package com.rex.blog.web;

import com.google.common.collect.Maps;
import com.rex.blog.service.BlogQueryCondition;
import com.rex.blog.service.BlogService;
import com.rex.blog.service.BlogTypeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * 博客页面控制层
 */
@Slf4j
@Controller
public class BlogPageController {

    private final BlogService blogService;
    private final BlogTypeService blogTypeService;

    @Autowired
    public BlogPageController(BlogService blogService, BlogTypeService blogTypeService) {
        this.blogService = blogService;
        this.blogTypeService = blogTypeService;
    }

    /**
     * 默认首页
     *
     * @return 返回首页
     */
    @RequestMapping({"","/","/index"})
    public ModelAndView index() {
        final ModelAndView mav = new ModelAndView();
        mav.addObject("blogTypeList", blogTypeService.selectBlogTypeAll());
        mav.setViewName("blogshowpage/index");

        return mav;
    }

    /**
     * 博客类型页
     *
     * @return 返回博客类型页
     */
    @RequestMapping("/blogType")
    public ModelAndView blogType() {
        final ModelAndView mav = new ModelAndView();
        mav.addObject("blogTypeList", blogTypeService.selectBlogTypeAll());
        mav.setViewName("blogshowpage/blogtype");

        return mav;
    }
    /**
     * 博客页
     *
     * @return 返回博客页
     */
    @RequestMapping("/bloglist")
    public ModelAndView blog(@RequestParam int pageNum) {
        log.info("pageNum:================={}",pageNum);
        final BlogQueryCondition condition = new BlogQueryCondition();
        condition.setPageNum(pageNum);
        final ModelAndView mav = new ModelAndView();
        mav.addObject("pageInfo", blogService.blogQueryPage(condition));
        mav.setViewName("blogshowpage/bloglist");

        return mav;
    }
}

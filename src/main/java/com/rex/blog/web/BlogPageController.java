package com.rex.blog.web;

import com.rex.blog.service.BlogQueryCondition;
import com.rex.blog.service.BlogService;
import com.rex.blog.service.BlogTypeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


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
    @RequestMapping({"", "/", "/index"})
    public ModelAndView welcome() {
        final ModelAndView mav = new ModelAndView();
        mav.setViewName("blogshowpage/welcome");

        return mav;
    }

    /**
     * 真正首页
     *
     * @return 返回首页
     */
    @RequestMapping("/welcomeBlogPage")
    public ModelAndView index() {
        final ModelAndView mav = new ModelAndView();
        mav.addObject("blogTypeList", blogTypeService.selectRecentBlogType());
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
        final BlogQueryCondition condition = new BlogQueryCondition();
        condition.setPageNum(pageNum);
        condition.setBlogState("2");
        final ModelAndView mav = new ModelAndView();
        mav.addObject("pageInfo", blogService.blogQueryPage(condition));
        mav.addObject("blogTypeList", blogTypeService.selectBlogTypeAll());
        mav.setViewName("blogshowpage/bloglist");

        return mav;
    }

    /**
     * 查看博客
     *
     * @return 返回博客详情页
     */
    @RequestMapping("/blog")
    public ModelAndView blog(@RequestParam Long blogId) {
        final ModelAndView mav = new ModelAndView();
        mav.addObject("blog", blogService.selectBlog(blogId));
        mav.setViewName("blogshowpage/blog");

        return mav;
    }

    /**
     * 根据博客类型查看博客
     *
     * @return 返回博客类型详情页
     */
    @RequestMapping("/blogTypeDetail")
    public ModelAndView blogTypeDetail(@RequestParam Long blogTypeId, @RequestParam int pageNum) {
        final BlogQueryCondition condition = new BlogQueryCondition();
        condition.setBlogType(String.valueOf(blogTypeId));
        condition.setPageNum(pageNum);
        condition.setBlogState("2");
        final ModelAndView mav = new ModelAndView();
        mav.addObject("pageInfo", blogService.blogQueryPage(condition));
        mav.addObject("blogType", blogTypeService.selectBlogType(blogTypeId));
        mav.setViewName("blogshowpage/blogtypedetail");

        return mav;
    }
}

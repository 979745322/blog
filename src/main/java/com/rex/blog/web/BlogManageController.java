package com.rex.blog.web;

import com.google.common.collect.Maps;
import com.rex.blog.entity.Blog;
import com.rex.blog.service.BlogQueryCondition;
import com.rex.blog.service.BlogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Map;

import static com.rex.blog.web.WebURIMappingConstant.URI_BLOGMANAGE;

/**
 * 博客后台管理控制层
 */
@Controller
@RequestMapping(URI_BLOGMANAGE)
@Slf4j
public class BlogManageController {

    private final BlogService blogService;

    @Autowired
    public BlogManageController(BlogService blogService) {
        this.blogService = blogService;
    }

    /**
     * 分页查询
     *
     * @param condition 分页参数
     * @return 返回查询结果
     */
    @ResponseBody
    @RequestMapping("/page")
    public Map<String, Object> blogQueryPage(@RequestBody BlogQueryCondition condition) {
        log.info("blogQueryPage入参:{}", condition);
        final Map<String, Object> map = Maps.newHashMap();
        map.put("state", "success");
        map.put("pageInfo", blogService.blogQueryPage(condition));
        return map;
    }

    /**
     * 根据ID修改博客
     * @param id 博客id
     * @return 返回编辑博客页
     */
    @ResponseBody
    @RequestMapping("/updateBlog")
    public ModelAndView updateBlog(String id) {
        final ModelAndView mav = new ModelAndView();
        mav.addObject("blog", blogService.selectBlog(Long.valueOf(id)));
        mav.setViewName("blogmanagement/updateblog");

        return mav;
    }

    /**
     * 根据ID修改博客
     * @param id 博客id
     * @return 返回博客实体
     */
    @ResponseBody
    @RequestMapping("/selectBlog")
    public Map<String, Object> selectBlog(String id) {
        final Map<String, Object> map = Maps.newHashMap();
        map.put("state", "success");
        map.put("blog", blogService.selectBlog(Long.valueOf(id)));

        return map;
    }

    /**
     * 根据ID删除博客
     * @param id 博客id
     * @return 返回博客实体
     */
    @ResponseBody
    @RequestMapping("/deleteBlog")
    public Map<String, Object> deleteBlog(@RequestBody String id) {
        final Map<String, Object> map = Maps.newHashMap();
        map.put("state", blogService.deleteBlog(Long.valueOf(id)));

        return map;
    }

    /**
     * 新增博客
     *
     * @param blog          博客实体
     * @param bindingResult 异常信息
     * @return 返回新增状态
     */
    @ResponseBody
    @RequestMapping("/addBlog")
    public Map<String, Object> addBlog(@Valid @RequestBody Blog blog, BindingResult bindingResult) {
        log.info("addBlog入参:{}", blog);
        final Map<String, Object> map = Maps.newHashMap();
        if (bindingResult.hasErrors()) {
            bindingResult.getAllErrors().forEach(error -> log.info("errors:{}", error.getDefaultMessage()));
            // 错误处理 （抛出异常交给全局处理或者在这里返回自定义的 JSON）
            map.put("state", bindingResult.getAllErrors().get(0).getDefaultMessage());
        } else if (blog.getId() == null || blog.getId().equals("")) {
            map.put("state", blogService.addBlog(blog));
        } else {
            map.put("state", blogService.updateBlog(blog));
        }

        return map;
    }

    /**
     * 默认首页
     *
     * @return 返回首页
     */
    @RequestMapping("")
    public String index() {
        return "blogmanagement/index";
    }

    /**
     * 默认主页
     *
     * @return 返回主页
     */
    @RequestMapping("/mainpage")
    public String zhuye() {
        return "blogmanagement/mainpage";
    }

    /**
     * 博客列表
     *
     * @return 返回博客列表页
     */
    @RequestMapping("/blogList")
    public String blogList() {
        return "blogmanagement/blogmanage";
    }

    /**
     * 写博客
     *
     * @return 写博客页
     */
    @RequestMapping("/blogWriting")
    public String blogWriting() {
        return "blogmanagement/blogwriting";
    }
}

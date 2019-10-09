package com.rex.blog.web;

import com.google.common.collect.Maps;
import com.rex.blog.entity.BlogMessage;
import com.rex.blog.service.*;
import com.rex.blog.utils.HttpClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Map;

import static com.rex.blog.web.WebURIMappingConstant.URI_BLOGPAGE;


/**
 * 博客页面控制层
 */
@Slf4j
@RequestMapping(URI_BLOGPAGE)
@Controller
public class BlogPageController {

    private final BlogService blogService;
    private final BlogTypeService blogTypeService;
    private final BlogPageImgService blogPageImgService;
    private final BlogMessageService blogMessageService;

    @Autowired
    public BlogPageController(BlogService blogService, BlogTypeService blogTypeService, BlogPageImgService blogPageImgService, BlogMessageService blogMessageService) {
        this.blogService = blogService;
        this.blogTypeService = blogTypeService;
        this.blogPageImgService = blogPageImgService;
        this.blogMessageService = blogMessageService;
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
        mav.addObject("blogPageImgList", blogPageImgService.queryBlogPageImg());
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

    /**
     * 留言板页面
     *
     * @return 返回留言板页面
     */
    @RequestMapping("/contact")
    public ModelAndView contact(@RequestParam int pageNum) {
        final BlogMessageQueryCondition condition = new BlogMessageQueryCondition();
        condition.setPageNum(pageNum);
        final ModelAndView mav = new ModelAndView();
        mav.setViewName("blogshowpage/contact");
        mav.addObject("pageInfo", blogMessageService.queryPageMessage(condition));
        mav.addObject("messageList", blogMessageService.queryPageAllMessage(condition));

        return mav;
    }

    /**
     * 新增留言
     *
     * @return 返回新增状态
     */
    @ResponseBody
    @RequestMapping("/addBlogMessage")
    public Map<String, Object> addBlogMessage(@Valid @RequestBody BlogMessage blogMessage, BindingResult bindingResult) {
        log.info("addBlogMessage入参:{}", blogMessage);
        final Map<String, Object> map = Maps.newHashMap();
        if (bindingResult.hasErrors()) {
            bindingResult.getAllErrors().forEach(error -> log.info("errors:{}", error.getDefaultMessage()));
            // 错误处理 （抛出异常交给全局处理或者在这里返回自定义的 JSON）
            map.put("state", bindingResult.getAllErrors().get(0).getDefaultMessage());
        } else {
            map.put("state", blogMessageService.addMessage(blogMessage));
            map.put("page", "blogshowpage/contact");
        }

        return map;
    }

    /**
     * 留言板页面
     *
     * @return 返回聊天机器人页面
     */
    @RequestMapping("/chatRobot")
    public ModelAndView chatRobot() {
        final ModelAndView mav = new ModelAndView();
        mav.setViewName("blogshowpage/chatrobot");

        return mav;
    }

    /**
     * 发送聊天消息
     *
     * @return 返回机器人聊天内容
     */
    @ResponseBody
    @RequestMapping("/chatMessage")
    public Map<String, Object> chatMessage(@RequestBody String chatStr) {
        chatStr = chatStr.substring(1, chatStr.length() - 1);
        log.info("chatMessage:{}", chatStr);
        final Map<String, Object> map = Maps.newHashMap();
        String url = "http://api.qingyunke.com/api.php?key=free&appid=0&msg=" + chatStr;
        map.put("chatMessage", HttpClient.doGet(url));

        return map;
    }

}

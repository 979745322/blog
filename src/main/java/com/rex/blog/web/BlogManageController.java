package com.rex.blog.web;

import com.google.common.collect.Maps;
import com.rex.blog.entity.Blog;
import com.rex.blog.entity.BlogPageImg;
import com.rex.blog.entity.BlogType;
import com.rex.blog.entity.User;
import com.rex.blog.service.*;
import com.rex.blog.utils.SaveFile;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
    private final BlogTypeService blogTypeService;
    private final BlogPageImgService blogPageImgService;
    private final BlogMessageService blogMessageService;
    private final SaveFile saveFile = new SaveFile();

    @Autowired
    public BlogManageController(BlogService blogService, BlogTypeService blogTypeService, BlogPageImgService blogPageImgService, BlogMessageService blogMessageService) {
        this.blogService = blogService;
        this.blogTypeService = blogTypeService;
        this.blogPageImgService = blogPageImgService;
        this.blogMessageService = blogMessageService;
    }
    /**=======================================登录======================================*/

    /**
     * 登录页面
     *
     * @return 返回编辑博客页
     */
    @ResponseBody
    @RequestMapping("/login")
    public ModelAndView login() {
        final ModelAndView mav = new ModelAndView();
        mav.setViewName("blogmanagement/login");
        return mav;
    }

    /**
     * 用户登录
     *
     * @return 登录成功返回博客管理页，登录失败返回登录页
     */
    @ResponseBody
    @RequestMapping("/userLogin")
    public Map<String, Object> userLogin(@RequestBody User user) {
        log.info(user.toString());
        final Map<String, Object> map = Maps.newHashMap();
        // 利用shiro验证登录
        final Subject subject = SecurityUtils.getSubject();
        final UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getPassword());
        try {
            //当前用户登录验证
            subject.login(token);
            map.put("state", "success");
            log.info("身份验证成功！");
        } catch (AuthenticationException e) {
            log.error("error:{}", e);
            map.put("state", "用户名或密码错误，请重新输入！");
            log.info("身份认证失败！");
        }

        return map;
    }

    /**
     * 退出登陆，跳转登录页面，
     *
     * @return 返回退出登录请求，重定向login.jsp页面
     */
    @RequestMapping("/logout")
    public String restLogin() {
        final Subject currentUser = SecurityUtils.getSubject();
        final String result = "blogmanagement/login";
        currentUser.logout();
        return result;
    }


    /**=======================================博客======================================*/
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
     *
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
     * 根据ID查询博客
     *
     * @param id 博客id
     * @return 返回博客实体
     */
    @ResponseBody
    @RequestMapping("/selectBlog")
    public Map<String, Object> selectBlog(@RequestBody String id) {
        log.info("id:{}", id);
        final Map<String, Object> map = Maps.newHashMap();
        map.put("state", "success");
        map.put("blog", blogService.selectBlog(Long.valueOf(id)));

        return map;
    }

    /**
     * 根据ID删除博客
     *
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
    /**=======================================博客类型======================================*/
    /**
     * 分页查询博客类型
     *
     * @param condition 分页参数
     * @return 返回查询结果
     */
    @ResponseBody
    @RequestMapping("/blogTypePage")
    public Map<String, Object> blogTypeQueryPage(@RequestBody BlogQueryCondition condition) {
        log.info("blogTypeQueryPage入参:{}", condition);
        final Map<String, Object> map = Maps.newHashMap();
        map.put("state", "success");
        map.put("pageInfo", blogTypeService.blogTypeQueryPage(condition));
        return map;
    }

    /**
     * 添加博客类型
     *
     * @return 返回添加状态
     */
    @ResponseBody
    @RequestMapping("/addBlogType")
    public Map<String, Object> addBlogType(@Valid @RequestBody BlogType blogType, BindingResult bindingResult) {
        log.info("addBlogType入参:{}", blogType);
        final Map<String, Object> map = Maps.newHashMap();
        if (bindingResult.hasErrors()) {
            bindingResult.getAllErrors().forEach(error -> log.info("errors:{}", error.getDefaultMessage()));
            // 错误处理 （抛出异常交给全局处理或者在这里返回自定义的 JSON）
            map.put("state", bindingResult.getAllErrors().get(0).getDefaultMessage());
        } else if (blogType.getId() == null || blogType.getId().equals("")) {
            map.put("state", blogTypeService.addBlogType(blogType));
        } else {
            map.put("state", blogTypeService.updateBlogType(blogType));
        }

        return map;
    }

    /**
     * 上传博客类型封面
     *
     * @param file 博客类型封面图片
     * @return 上传状态
     */
    @ResponseBody
    @RequestMapping("/uploadBlogTypeImg")
    public Map<String, Object> uploadBlogTypeImg(@RequestParam MultipartFile file) {
        final Map<String, Object> map = Maps.newHashMap();
        try {
            saveFile.saveFile(file);
        } catch (Exception e) {
            log.info("e:{}", e);
            map.put("state", "图片上传失败！");
            return map;
        }
        map.put("state", "图片上传成功！");
        return map;
    }

    /**
     * 根据ID查询博客类型
     *
     * @param id 博客id
     * @return 返回博客实体
     */
    @ResponseBody
    @RequestMapping("/selectBlogType")
    public Map<String, Object> selectBlogType(@RequestBody String id) {
        log.info("id:{}", id);
        final Map<String, Object> map = Maps.newHashMap();
        map.put("state", "success");
        map.put("blogType", blogTypeService.selectBlogType(Long.valueOf(id)));

        return map;
    }

    /**
     * 根据ID删除博客类型
     *
     * @param id 博客id
     * @return 返回删除状态
     */
    @ResponseBody
    @RequestMapping("/deleteBlogType")
    public Map<String, Object> deleteBlogType(@RequestBody String id) {
        log.info("id:{}", id);
        final Map<String, Object> map = Maps.newHashMap();
        map.put("state", blogTypeService.deleteBlogType(Long.valueOf(id)));

        return map;
    }

    /**
     * 查询所有博客类型
     *
     * @return 返回博客实体
     */
    @ResponseBody
    @RequestMapping("/selectBlogTypeAll")
    public Map<String, Object> selectBlogTypeAll() {
        final Map<String, Object> map = Maps.newHashMap();
        map.put("state", "success");
        map.put("blogTypeList", blogTypeService.selectBlogTypeAll());

        return map;
    }

    /**=======================================博客页面滚动图======================================*/

    /**
     * 博客页面管理
     *
     * @return 博客类别管理页
     */
    @RequestMapping("/blogShowPageManage")
    public ModelAndView blogShowPageManage() {
        final ModelAndView mav = new ModelAndView();
        mav.setViewName("blogmanagement/blogshowpagemanage");
        mav.addObject("list", blogPageImgService.queryBlogPageImg());
        return mav;
    }

    /**
     * 修改博客首页滚动图
     *
     * @return 返回修改状态
     */
    @ResponseBody
    @RequestMapping("/updateBlogPageImg")
    public Map<String, Object> updateBlogPageImg(@Valid @RequestBody BlogPageImg blogPageImg) {
        log.info("updateBlogPageImg入参:{}", blogPageImg);
        final Map<String, Object> map = Maps.newHashMap();
        map.put("state", blogPageImgService.updateBlogPageImg(blogPageImg));

        return map;
    }

    /**=======================================留言管理======================================*/

    /**
     * 留言管理页面
     *
     * @return 返回留言管理页面
     */
    @RequestMapping("/blogMessage")
    public String blogMessage() {
        return "blogmanagement/blogmessage";
    }

    /**
     * 留言分页查询
     *
     * @param condition 分页参数
     * @return 返回查询结果
     */
    @ResponseBody
    @RequestMapping("/blogMessagePage")
    public Map<String, Object> blogMessageQueryPage(@RequestBody BlogMessageQueryCondition condition) {
        log.info("blogMessageQueryPage入参:{}", condition);
        final Map<String, Object> map = Maps.newHashMap();
        map.put("state", "success");
        map.put("pageInfo", blogMessageService.queryMessage(condition));
        return map;
    }


    /**=======================================页面跳转======================================*/
    /**
     * 默认首页
     *
     * @return 返回首页
     */
    @RequestMapping({"", "/", "/index"})
    public String index() {
        return "blogmanagement/index";
    }

    /**
     * 默认主页
     *
     * @return 返回主页
     */
    @RequestMapping("/mainPage")
    public String mainPage() {
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

    /**
     * 博客类别管理
     *
     * @return 博客类别管理页
     */
    @RequestMapping("/blogTypeManage")
    public String blogTypeManage() {
        return "blogmanagement/blogtypemanage";
    }


}

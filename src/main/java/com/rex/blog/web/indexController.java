package com.rex.blog.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by DELL on 2019/4/28.
 */
@Controller
public class indexController {
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
}

package com.rex.blog.utils.shiro;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 自定义shirofilt拦截器，
 * 对未登录(身份认证失效)用户的ajax请求或页面跳转作出响应
 */
public class ShiroLoginFilter extends FormAuthenticationFilter {

    /**
     * 在访问controller前判断是否登录，返回json，不进行重定向。
     *
     * @param request  请求
     * @param response 响应
     * @return true-继续往下执行，false-该filter过滤器已经处理，不继续执行其他过滤器
     * @throws IOException 抛出异常
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        final HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        if (isAjax(request)) {
            // 返回json格式信息
            httpServletResponse.setCharacterEncoding("UTF-8");
            httpServletResponse.setContentType("application/json");
            httpServletResponse.sendError(401); // 401判断为未登录
        } else {
            // 非ajax请求重定向为登录页面
            saveRequestAndRedirectToLogin(request, response);
        }
        return false;
    }

    /**
     * 判断是否为ajax请求
     *
     * @param request 请求
     * @return 返回判断结果
     */
    private boolean isAjax(ServletRequest request) {
        final String header = ((HttpServletRequest) request).getHeader("X-Requested-With");
        if ("XMLHttpRequest".equalsIgnoreCase(header)) {
            return Boolean.TRUE;
        }
        return Boolean.FALSE;
    }

}
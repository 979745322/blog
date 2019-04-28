package com.rex.blog.utils.shiro;

import com.rex.blog.service.UserService;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.MemoryConstrainedCacheManager;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.session.mgt.eis.MemorySessionDAO;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.context.annotation.Lazy;

import javax.servlet.Filter;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Shiro的配置
 *
 * @Author Rocky
 * @Create 2018-11-06 10:20
 */
@Configuration
public class ShiroConfig {

    /*@Lazy
    @Autowired
    final private UserService userService;

    public ShiroConfig(UserService userService) {
        this.userService = userService;
    }*/

    @Bean(name = "sessionDAO")
    public MemorySessionDAO getMemorySessionDAO() {
        return new MemorySessionDAO();
    }

    @Bean(name = "sessionIdCookie")
    public SimpleCookie getSimpleCookie() {
        SimpleCookie simpleCookie = new SimpleCookie();
        simpleCookie.setName("SHRIOSESSIONID");
        return simpleCookie;
    }

    //配置shiro session 的一个管理器
    @Bean(name = "sessionManager")
    public DefaultWebSessionManager getDefaultWebSessionManager() {
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        sessionManager.setSessionDAO(getMemorySessionDAO());
        sessionManager.setSessionIdCookie(getSimpleCookie());
        return sessionManager;
    }

    //配置session的缓存管理器
    @Bean(name = "shiroCacheManager")
    public MemoryConstrainedCacheManager getMemoryConstrainedCacheManager() {
        return new MemoryConstrainedCacheManager();
    }

    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean shiroFilter(DefaultWebSecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
        shiroFilter.setSecurityManager(securityManager);
        // 登录配置
        shiroFilter.setLoginUrl("/blogpage/");
//        shiroFilter.setSuccessUrl("/welcomeBlogPage");
        shiroFilter.setUnauthorizedUrl("/404");
        // 自定义过滤器
        Map<String, Filter> filtersMap = new LinkedHashMap<String, Filter>();
        filtersMap.put("shiroLoginFilter", new ShiroLoginFilter());
        shiroFilter.setFilters(filtersMap);
        // 拦截配置
        Map<String, String> filterChainDefinitions = new LinkedHashMap<>();
        filterChainDefinitions.put("/error", "anon");
        filterChainDefinitions.put("/404.jsp", "anon");
        filterChainDefinitions.put("/blogshowpage/**", "anon");
        filterChainDefinitions.put("/blogpage/**", "anon");
        filterChainDefinitions.put("/uploadImg/**", "anon");
        filterChainDefinitions.put("/ueditor/**", "anon");
        filterChainDefinitions.put("/blogmanagement/js/**", "anon");
        filterChainDefinitions.put("/blogmanagement/css/**", "anon");
        filterChainDefinitions.put("/blogmanagement/img/**", "anon");
        filterChainDefinitions.put("/blogmanagement/fonts/**", "anon");
        filterChainDefinitions.put("/blogmanage/login", "anon");
        filterChainDefinitions.put("/blogmanagement/login.jsp", "anon");
        filterChainDefinitions.put("/blogmanage/userLogin", "anon");
        //配置退出 过滤器,其中的具体的退出代码Shiro已经替我们实现了
        filterChainDefinitions.put("/logout", "logout");
        //<!-- authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问-->
//        filterChainDefinitions.put("/**", "anon");
        filterChainDefinitions.put("/**", "shiroLoginFilter");
        shiroFilter.setFilterChainDefinitionMap(filterChainDefinitions);
        shiroFilter.setFilters(filtersMap);
        return shiroFilter;
    }

    @Bean(name = "shiroRealm")
    @DependsOn("lifecycleBeanPostProcessor")
    public ShiroRealm shiroRealm() {
        ShiroRealm userRealm = new ShiroRealm(getMemorySessionDAO());
//        userRealm.setCredentialsMatcher(credentialsMatcher());
        return userRealm;
    }

    @Bean(name = "securityManager")
    public DefaultWebSecurityManager securityManager() {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(shiroRealm());
        securityManager.setCacheManager(cacheManager());
        securityManager.setSessionManager(getDefaultWebSessionManager());
        return securityManager;
    }

    @Bean(name = "cacheManager")
    public EhCacheManager cacheManager() {
        EhCacheManager cacheManager = new EhCacheManager();
        cacheManager.setCacheManagerConfigFile("classpath:ehcache.xml");
        return cacheManager;
    }

    @Bean(name = "credentialsMatcher")
    public HashedCredentialsMatcher credentialsMatcher() {
        HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
        credentialsMatcher.setHashAlgorithmName("md5");  //散列算法
        credentialsMatcher.setHashIterations(3);  //散列次数
        return credentialsMatcher;
    }

    @Bean(name = "lifecycleBeanPostProcessor")
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        LifecycleBeanPostProcessor lifecycleBeanPostProcessor = new LifecycleBeanPostProcessor();
        return lifecycleBeanPostProcessor;
    }

    /**
     * shiro里实现的Advisor类,用来拦截注解的方法 .
     */
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor() {
        AuthorizationAttributeSourceAdvisor advisor = new AuthorizationAttributeSourceAdvisor();
        advisor.setSecurityManager(securityManager());
        return advisor;
    }

    @Bean
    @DependsOn({"lifecycleBeanPostProcessor"})
    public DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        advisorAutoProxyCreator.setProxyTargetClass(true);
        return advisorAutoProxyCreator;
    }
}

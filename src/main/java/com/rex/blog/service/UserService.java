package com.rex.blog.service;

import com.rex.blog.entity.User;

/**
 * 用户接口层
 */
public interface UserService {
    /**
     * 用户登录
     * @return 返回用户
     */
    User loginUser(User user);
}

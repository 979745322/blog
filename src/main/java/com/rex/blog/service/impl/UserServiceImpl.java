package com.rex.blog.service.impl;

import com.rex.blog.entity.User;
import com.rex.blog.mapper.UserMapper;
import com.rex.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户接口实现层
 */
@Service
public class UserServiceImpl implements UserService {

    final private UserMapper userMapper;
    @Autowired
    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public User loginUser(User user) {
        return userMapper.loginUser(user);
    }
}

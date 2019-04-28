package com.rex.blog.mapper;

import com.rex.blog.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 用户dao层接口
 */
@Mapper
@Repository
public interface UserMapper {
    /**
     * 用户登录
     *
     * @return 返回用户
     */
    User loginUser(User user);
}
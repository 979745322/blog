package com.rex.blog.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * 用户实体类
 */
@Getter
@Setter
public class User {
    private Long id;
    private String userName;
    private String password;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", passWorld='" + password + '\'' +
                '}';
    }
}

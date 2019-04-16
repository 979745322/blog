package com.rex.blog.entity;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * 博客类型实体层
 */
@Getter
@Setter
public class BlogType {
    // 博客id
    private Long id;

    // 博客类型名称
    @NotBlank(message = "博客类型不能为空！")
    private String blogTypeName;

    // 博客类型图片路径
    private String blogTypeImg;

    // 博客类型描述
    private String blogTypeDescription;

    @Override
    public String toString() {
        return "BlogType{" +
                "id=" + id +
                ", blogTypeName='" + blogTypeName + '\'' +
                ", blogTypeImg='" + blogTypeImg + '\'' +
                ", blogTypeDescription='" + blogTypeDescription + '\'' +
                '}';
    }
}

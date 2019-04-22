package com.rex.blog.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * 博客页面滚动图实体
 */
@Getter
@Setter
public class BlogPageImg {
    // 博客页面滚动图id
    private Long id;

    // 博客页面滚动图标题
    private String imgTitle;

    // 博客页面滚动图文件名
    private String imgUrl;
}

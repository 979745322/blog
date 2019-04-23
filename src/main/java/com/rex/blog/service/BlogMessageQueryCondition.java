package com.rex.blog.service;

import lombok.Getter;
import lombok.Setter;

/**
 * 博客分页查询条件实体
 */
@Getter
@Setter
public class BlogMessageQueryCondition {
    /**
     * 每页个数
     */
    final Integer pageSize = 10;

    /**
     * 最大页数
     */
    final Integer navigatePages = 6;

    /**
     * 页数
     */
    Integer pageNum;

    /**
     * 留言昵称
     */
    String name;

    /**
     * 留言内容
     */
    String content;

    /**
     * 创建时间
     */
    String startTime;

    /**
     * 创建时间
     */
    String endTime;

    @Override
    public String toString() {
        return "BlogMessageQueryCondition{" +
                "pageSize=" + pageSize +
                ", navigatePages=" + navigatePages +
                ", pageNum=" + pageNum +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                '}';
    }
}

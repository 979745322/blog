package com.rex.blog.service;

import lombok.Getter;
import lombok.Setter;

/**
 * 博客分页查询条件实体
 */
@Getter
@Setter
public class BlogQueryCondition {
    /**
     * 每页个数
     */
    final Integer pageSize = 5;

    /**
     * 最大页数
     */
    final Integer navigatePages = 6;

    /**
     * 页数
     */
    Integer pageNum;

    /**
     * 博客标题
     */
    String blogTitle;

    /**
     * 博客类型
     */
    String blogType;

    /**
     * 博客状态
     */
    String blogState;
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
        return "BlogQueryCondition{" +
                "pageSize=" + pageSize +
                ", navigatePages=" + navigatePages +
                ", pageNum=" + pageNum +
                ", blogTitle='" + blogTitle + '\'' +
                ", blogType='" + blogType + '\'' +
                ", blogState='" + blogState + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                '}';
    }
}

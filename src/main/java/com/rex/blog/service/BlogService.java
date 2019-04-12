package com.rex.blog.service;

import com.rex.blog.entity.Blog;

/**
 * 博客接口层
 */
public interface BlogService {
    /**
     * 新增博客
     * @param blog 博客实体
     * @return 返回新增状态
     */
    String addBlog(Blog blog);

    /**
     * 修改博客
     * @param blog 博客实体
     * @return 返回修改状态
     */
    String updateBlog(Blog blog);
}

package com.rex.blog.service;

import com.github.pagehelper.PageInfo;
import com.rex.blog.entity.Blog;

/**
 * 博客接口层
 */
public interface BlogService {
    /**
     * 新增博客
     *
     * @param blog 博客实体
     * @return 返回新增状态
     */
    String addBlog(Blog blog);

    /**
     * 修改博客
     *
     * @param blog 博客实体
     * @return 返回修改状态
     */
    String updateBlog(Blog blog);

    /**
     * 分页查询博客
     *
     * @param condition 查询条件
     * @return 返回查询结果
     */
    PageInfo blogQueryPage(BlogQueryCondition condition);

    /**
     * 根据ID查找博客
     * @param id 博客id
     * @return 返回博客实体
     */
    Blog selectBlog(Long id);

    /**
     * 根据ID删除博客
     * @param id 博客id
     * @return 返回删除博客结果
     */
    String deleteBlog(Long id);
}

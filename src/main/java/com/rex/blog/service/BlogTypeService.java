package com.rex.blog.service;

import com.github.pagehelper.PageInfo;
import com.rex.blog.entity.BlogType;
import org.springframework.web.multipart.MultipartFile;

/**
 * 博客类型接口层
 */
public interface BlogTypeService {
    /**
     * 新增博客
     *
     * @param blogType 博客实体
     * @return 返回新增状态
     */
    String addBlogType(BlogType blogType);

    /**
     * 修改博客
     *
     * @param blogType 博客实体
     * @return 返回修改状态
     */
    String updateBlogType(BlogType blogType);

    /**
     * 分页查询博客
     *
     * @param condition 查询条件
     * @return 返回查询结果
     */
    PageInfo blogTypeQueryPage(BlogQueryCondition condition);

    /**
     * 根据ID查找博客
     *
     * @param id 博客id
     * @return 返回博客实体
     */
    BlogType selectBlogType(Long id);

    /**
     * 根据ID删除博客
     *
     * @param id 博客id
     * @return 返回删除博客结果
     */
    String deleteBlogType(Long id);
}

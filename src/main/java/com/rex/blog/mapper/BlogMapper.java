package com.rex.blog.mapper;

import com.rex.blog.entity.Blog;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 博客dao层接口
 */
@Mapper
@Repository
public interface BlogMapper {
    /**
     * 新增博客
     * @param blog 博客实体
     */
    void addBlog(Blog blog);

    /**
     * 修改博客
     * @param blog 博客实体
     */
    void updateBlog(Blog blog);
}

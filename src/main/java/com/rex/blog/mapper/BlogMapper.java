package com.rex.blog.mapper;

import com.rex.blog.entity.Blog;
import com.rex.blog.service.BlogQueryCondition;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    /**
     * 分页查询博客
     *
     * @param condition 查询条件
     * @return 返回查询结果
     */
    List<Blog> blogQueryPage(BlogQueryCondition condition);

    /**
     * 根据ID查找博客
     * @param id 博客id
     * @return 返回博客实体
     */
    Blog selectBlog(@Param("id") Long id);
}

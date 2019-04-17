package com.rex.blog.mapper;

import com.rex.blog.entity.BlogType;
import com.rex.blog.service.BlogQueryCondition;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 博客类型dao层接口
 */
@Mapper
@Repository
public interface BlogTypeMapper {
    /**
     * 新增博客类型
     * @param blogType 博客类型实体
     */
    void addBlogType(BlogType blogType);

    /**
     * 修改博客类型
     * @param blogType 博客类型实体
     */
    void updateBlogType(BlogType blogType);

    /**
     * 分页查询博客类型
     *
     * @param condition 查询条件
     * @return 返回查询结果
     */
    List<BlogType> blogTypeQueryPage(BlogQueryCondition condition);

    /**
     * 根据ID查找博客类型
     * @param id 博客类型id
     * @return 返回博客类型实体
     */
    BlogType selectBlogType(@Param("id") Long id);

    /**
     * 根据ID删除博客类型
     * @param id 博客类型id
     */
    void deleteBlogType(@Param("id") Long id);

    /**
     * 根据ID查找博客类型
     * @return 返回博客类型实体
     */
    List<BlogType> selectBlogTypeAll();

    /**
     * 查询该博客类型下的博客数量
     * @param id 博客类型id
     * @return 返回博客数量
     */
    Integer countBlog(@Param("id") Long id);
}

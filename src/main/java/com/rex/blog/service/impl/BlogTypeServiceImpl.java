package com.rex.blog.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rex.blog.entity.BlogType;
import com.rex.blog.mapper.BlogTypeMapper;
import com.rex.blog.service.BlogQueryCondition;
import com.rex.blog.service.BlogTypeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 博客类型接口实现层
 */
@Slf4j
@Service
public class BlogTypeServiceImpl implements BlogTypeService {
    // 文件工具类
    final private BlogTypeMapper blogTypeMapper;

    @Autowired
    public BlogTypeServiceImpl(BlogTypeMapper blogTypeMapper) {
        this.blogTypeMapper = blogTypeMapper;
    }

    @Override
    public String addBlogType(BlogType blogType) {
        try{
            blogTypeMapper.addBlogType(blogType);
        }catch (Exception e){
            log.info("e:{}",e);
            return "新增失败！";
        }
        return "新增成功！";
    }

    @Override
    public String updateBlogType(BlogType blogType) {
        try{
            blogTypeMapper.updateBlogType(blogType);
        }catch (Exception e){
            log.info("e:{}",e);
            return "修改失败！";
        }
        return "修改成功！";
    }

    @Override
    public PageInfo blogTypeQueryPage(BlogQueryCondition condition) {
        PageHelper.startPage(condition.getPageNum(), condition.getPageSize());
        final List<BlogType> list = blogTypeMapper.blogTypeQueryPage(condition);
        return new PageInfo(list, condition.getNavigatePages());
    }

    @Override
    public BlogType selectBlogType(Long id) {
        return blogTypeMapper.selectBlogType(id);
    }

    @Override
    public String deleteBlogType(Long id) {
        try{
            // 查询该博客类型下是否存在博客 若存在则提示“该博客类型存在博客，删除失败”
            if(blogTypeMapper.countBlog(id)>0){
                return "该博客类型存在博客，删除失败！";
            }
            blogTypeMapper.deleteBlogType(id);
        }catch (Exception e){
            log.info("e:{}",e);
            return "删除失败！";
        }
        return "删除成功！";
    }

    @Override
    public List<BlogType> selectBlogTypeAll() {
        return blogTypeMapper.selectBlogTypeAll();
    }

    @Override
    public List<BlogType> selectRecentBlogType() {
        return blogTypeMapper.selectRecentBlogType();
    }
}

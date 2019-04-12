package com.rex.blog.service.impl;

import com.rex.blog.entity.Blog;
import com.rex.blog.mapper.BlogMapper;
import com.rex.blog.service.BlogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 博客接口实现层
 */
@Service
@Slf4j
public class BlogServiceImpl implements BlogService {

    private final BlogMapper blogMapper;

    @Autowired
    public BlogServiceImpl(BlogMapper blogMapper) {
        this.blogMapper = blogMapper;
    }

    @Override
    public String addBlog(Blog blog) {
        try{
            blogMapper.addBlog(blog);
        }catch (Exception e){
            log.info("e:{}",e);
            return "新增失败";
        }
        return "新增成功";
    }

    @Override
    public String updateBlog(Blog blog) {
        return null;
    }
}

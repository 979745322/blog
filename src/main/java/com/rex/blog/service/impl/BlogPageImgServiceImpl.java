package com.rex.blog.service.impl;

import com.rex.blog.entity.BlogPageImg;
import com.rex.blog.mapper.BlogPageImgMapper;
import com.rex.blog.service.BlogPageImgService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class BlogPageImgServiceImpl implements BlogPageImgService {

    final private BlogPageImgMapper blogPageImgMapper;

    @Autowired
    public BlogPageImgServiceImpl(BlogPageImgMapper blogPageImgMapper) {
        this.blogPageImgMapper = blogPageImgMapper;
    }

    @Override
    public List<BlogPageImg> queryBlogPageImg() {
        return blogPageImgMapper.queryBlogPageImg();
    }

    @Override
    public String updateBlogPageImg(BlogPageImg blogPageImg) {
        try{
            blogPageImgMapper.updateBlogPageImg(blogPageImg);
        }catch (Exception e){
            log.info("e:{}",e);
            return "修改失败！";
        }
        return "修改成功！";
    }
}

package com.rex.blog.service;

import com.rex.blog.entity.BlogPageImg;

import java.util.List;
/**
 * 博客页面滚动图接口
 */
public interface BlogPageImgService {
    /**
     * 查询页面滚动图信息
     * @return 页面滚动图信息
     */
    List<BlogPageImg> queryBlogPageImg();

    /**
     * 修改页面滚动图信息
     * @param blogPageImg 页面滚动图信息
     */
    String updateBlogPageImg(BlogPageImg blogPageImg);
}

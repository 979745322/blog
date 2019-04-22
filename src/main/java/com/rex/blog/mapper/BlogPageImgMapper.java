package com.rex.blog.mapper;

import com.rex.blog.entity.BlogPageImg;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BlogPageImgMapper {
    /**
     * 查询页面滚动图信息
     * @return 页面滚动图信息
     */
    List<BlogPageImg> queryBlogPageImg();

    /**
     * 修改页面滚动图信息
     * @param blogPageImg 页面滚动图信息
     */
    void updateBlogPageImg(BlogPageImg blogPageImg);
}

package com.rex.blog.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rex.blog.entity.BlogMessage;
import com.rex.blog.mapper.BlogMessageMapper;
import com.rex.blog.service.BlogMessageQueryCondition;
import com.rex.blog.service.BlogMessageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 留言接口实现层
 */
@Service
@Slf4j
public class BlogMessageServiceImpl implements BlogMessageService {

    final private BlogMessageMapper blogMessageMapper;

    @Autowired
    public BlogMessageServiceImpl(BlogMessageMapper blogMessageMapper) {
        this.blogMessageMapper = blogMessageMapper;
    }

    @Override
    public PageInfo queryMessage(BlogMessageQueryCondition condition) {
        PageHelper.startPage(condition.getPageNum(), condition.getPageSize());
        final List<BlogMessage> list = blogMessageMapper.queryMessage(condition);
        return new PageInfo(list, condition.getNavigatePages());
    }

    @Override
    public String addMessage(BlogMessage blogMessage) {
        try{
            blogMessageMapper.addMessage(blogMessage);
        }catch (Exception e){
            log.info("e:{}",e);
            return "留言失败！";
        }
        return "发表成功！";
    }

    @Override
    public String deleteMessage(Long id) {
        return null;
    }
}

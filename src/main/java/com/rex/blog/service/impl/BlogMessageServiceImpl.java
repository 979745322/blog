package com.rex.blog.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
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
    public PageInfo queryPageMessage(BlogMessageQueryCondition condition) {
        PageHelper.startPage(condition.getPageNum(), condition.getPageSize());
        // 留言集合（不含回复）
        final List<BlogMessage> list = blogMessageMapper.queryPageMessage();
        return new PageInfo(list, condition.getNavigatePages());
    }

    @Override
    public List queryPageAllMessage(BlogMessageQueryCondition condition) {
        PageHelper.startPage(condition.getPageNum(), condition.getPageSize());
        // 留言集合（不含回复）
        final List<BlogMessage> list = blogMessageMapper.queryPageMessage();
        // 留言集合（包含回复）
        final List allList = Lists.newArrayList();
        list.forEach(blogMessage->{
            final List detailList = Lists.newArrayList();
            detailList.add(blogMessage);
            detailList.addAll(blogMessageMapper.queryPageMessageDetail(blogMessage.getId()));
            allList.add(detailList);
        });
        return allList;
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
        try{
            blogMessageMapper.deleteMessage(id);
        }catch (Exception e){
            log.info("e:{}",e);
            return "删除失败！";
        }
        return "删除成功！";
    }
}

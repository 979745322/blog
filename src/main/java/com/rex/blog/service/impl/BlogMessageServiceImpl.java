package com.rex.blog.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.rex.blog.entity.BlogMessage;
import com.rex.blog.mapper.BlogMessageMapper;
import com.rex.blog.service.BlogMessageQueryCondition;
import com.rex.blog.service.BlogMessageService;
import com.rex.blog.utils.mail.IMailServiceImpl;
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
    private final IMailServiceImpl mailService;
    final private BlogMessageMapper blogMessageMapper;

    @Autowired
    public BlogMessageServiceImpl(BlogMessageMapper blogMessageMapper, IMailServiceImpl mailService) {
        this.blogMessageMapper = blogMessageMapper;
        this.mailService = mailService;
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
        log.info("通知自己邮件发送结果：{}",sendEmailMe(blogMessage));
        if (blogMessage.getReplyId()!=null&&!blogMessage.getReplyId().equals("")){
            final String sendResult = sendEmail(blogMessageMapper.findMessageById(blogMessage.getReplyId()),blogMessage);
            log.info("邮件发送结果：{}",sendResult);
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

    /**
     * 发送邮件
     * @param toBlogMessage 发送到留言人
     * @param replyBlogMessage 回复留言人
     * @return 返回发送状态
     */
    private String sendEmail(BlogMessage toBlogMessage, BlogMessage replyBlogMessage){
        String result = "邮件发送成功!!";
        final String to = toBlogMessage.getEmail();
        final String subject = "留言回复";
        final String content = "您在个人博客的留言:\""+toBlogMessage.getContent()+"\"有新的回复:\""+replyBlogMessage.getContent()+"\"";
        try {
            mailService.sendSimpleMail(to,subject,content);
        }catch (Exception ex){
            ex.printStackTrace();
            result = "邮件发送失败!!";
            return result;
        }
        return result;
    }
    /**
     * 发送邮件给自己
     * @param replyBlogMessage 回复留言人
     * @return 返回发送状态
     */
    private String sendEmailMe(BlogMessage replyBlogMessage){
        String result = "通知自己邮件发送成功!!";
        final String to = "979745322@qq.com";
        final String subject = "留言回复";
        final String content = "您的个人博客有新的留言:\""+replyBlogMessage.getContent()+"\"";
        try {
//            mailService.sendSimpleMail("979745322@qq.com","SpringBoot Email","这是一封普通的SpringBoot测试邮件");
            mailService.sendSimpleMail(to,subject,content);
        }catch (Exception ex){
            ex.printStackTrace();
            result = "通知自己邮件发送失败!!";
            return result;
        }
        return result;
    }
}

package com.rex.blog.service;

import com.github.pagehelper.PageInfo;
import com.rex.blog.entity.BlogMessage;

import java.util.List;

/**
 * 留言接口层
 */
public interface BlogMessageService {
    /**
     * 查询留言
     * @return 返回留言集合
     */
    PageInfo queryMessage(BlogMessageQueryCondition condition);

    /**
     * 新增留言
     * @param blogMessage 留言实体
     * @return 返回新增状态
     */
    String addMessage(BlogMessage blogMessage);

    /**
     * 删除留言
     * @param id 留言id
     * @return 返回删除状态
     */
    String deleteMessage(Long id);
}

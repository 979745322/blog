package com.rex.blog.mapper;

import com.rex.blog.entity.BlogMessage;
import com.rex.blog.service.BlogMessageQueryCondition;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 留言Dao层
 */
@Mapper
@Repository
public interface BlogMessageMapper {
    /**
     * 查询留言
     * @return 返回留言集合
     */
    List<BlogMessage> queryMessage(BlogMessageQueryCondition condition);

    /**
     * 新增留言
     * @param blogMessage 留言实体
     */
    void addMessage(BlogMessage blogMessage);

    /**
     * 删除留言
     * @param id 留言id
     */
    void deleteMessage(@Param("id") Long id);
}

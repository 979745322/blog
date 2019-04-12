package com.rex.blog.entity;

import com.rex.blog.utils.DateTimeHelper;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import java.util.Date;

/**
 * 博客实体层
 */
@Getter
@Setter
public class Blog {
    // 博客id
    private Long id;

    // 博客类型
    @NotBlank(message = "博客类型不能为空！")
    private String blogType;

    // 博客标题
    @NotBlank(message = "博客标题不能为空！")
    private String blogTitle;

    // 博客内容
    private String blogContent;

    // 作者
    private String blogAuthor;

    // 创建时间
    private Date createTime;

    // 更新时间
    private Date updateTime;

    public String getCreateTime() {
        return DateTimeHelper.formatToString(createTime,DateTimeHelper.FORMAT_24);
    }

    public String getUpdateTime() {
        return DateTimeHelper.formatToString(updateTime,DateTimeHelper.FORMAT_24);
    }

}

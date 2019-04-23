package com.rex.blog.entity;

import com.rex.blog.utils.DateTimeHelper;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import java.util.Date;

@Getter
@Setter
public class BlogMessage {
    /**
     * 留言id
     */
    private Long id;
    /**
     * 留言昵称
     */
    @NotBlank(message = "留言昵称不能为空！")
    private String name;
    /**
     * 留言内容
     */
    @NotBlank(message = "留言内容不能为空！")
    private String content;
    /**
     * 留言手机
     */
    private Long phone;
    /**
     * 留言邮箱
     */
    private String email;
    /**
     * 回复ID
     */
    private Long replyId;
    /**
     * 留言时间
     */
    private Date createTime;

    public String getCreateTime() {
        return createTime == null ? "" : DateTimeHelper.formatToString(createTime, DateTimeHelper.FORMAT_24);
    }

    @Override
    public String toString() {
        return "BlogMessage{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", phone=" + phone +
                ", email='" + email + '\'' +
                ", replyId=" + replyId +
                ", createTime=" + createTime +
                '}';
    }
}

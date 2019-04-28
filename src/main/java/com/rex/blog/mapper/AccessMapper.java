package com.rex.blog.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 访问记录dao层接口
 */
@Mapper
@Repository
public interface AccessMapper {
    /**
     * 新增来访记录
     */
    void addAccess(@Param("ip") String ip);

    /**
     * 根据日期查询来访人数
     * @return 返回来访人数集合
     */
    List selectByDate();

}

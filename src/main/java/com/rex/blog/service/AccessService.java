package com.rex.blog.service;

import java.util.List;

/**
 * 访问记录接口层
 */
public interface AccessService {
    /**
     * 新增来访记录
     */
    void addAccess(String ip);

    /**
     * 根据日期查询来访人数
     * @return 返回来访人数集合
     */
    List selectByDate();
}

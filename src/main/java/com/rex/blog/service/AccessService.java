package com.rex.blog.service;

/**
 * 访问记录接口层
 */
public interface AccessService {
    /**
     * 新增来访记录
     */
    void addAccess(String ip);
}

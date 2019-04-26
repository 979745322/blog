package com.rex.blog.service.impl;

import com.rex.blog.mapper.AccessMapper;
import com.rex.blog.service.AccessService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 访问记录接口实现层
 */
@Service("accessService")
@Slf4j
public class AccessServiceImpl implements AccessService {

    final private AccessMapper accessMapper;
    @Autowired
    public AccessServiceImpl(AccessMapper accessMapper) {
        this.accessMapper = accessMapper;
    }

    @Override
    public void addAccess(String ip) {
        log.info("新增来访记录，ip:{}",ip);
        accessMapper.addAccess(ip);
    }
}

package com.rex.blog.service;

import java.util.List;

/**
 * 访问记录接口层
 */
public interface AccessService {
    /**
     * 新增来访记录
     *
     * @param ip      ip地址
     * @param country 国家
     * @param region  省份
     * @param city    城市
     * @param county  县
     * @param isp     运营商
     */
    void addAccess(String ip, String country, String region, String city, String county, String isp);

    /**
     * 根据日期查询来访人数
     *
     * @return 返回来访人数集合
     */
    List selectByDate();
}

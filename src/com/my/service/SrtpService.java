package com.my.service;

import net.sf.json.JSONObject;

import java.util.List;

public interface SrtpService {

    /**
     * 返回limit条数据，每条数据以json格式
     * @param limit
     * @return
     */
    public List<JSONObject> myJsons(Integer limit);

    /**
     * 返回limit条数据，每条数据以json 字符串的形式（后期没用到）
     * @param limit
     * @return
     */
    public List<String> myJsonStr(Integer limit);
}

package com.my.service;

import net.sf.json.JSONObject;

import java.util.List;

public interface CheckService {

    /**
     * 用于按年度查询，输入起止年份，返回json格式数据
     * @param startYear
     * @param endYear
     * @return
     */
    public List<JSONObject> CheckYear(String startYear,String endYear);

    /**
     * 用于按月查询，输入查询年份，返回这一年各个月份体量变化
     * @param checkYear
     * @return
     */
    public List<JSONObject> CheckMonth(String checkYear);

    /**
     *通过输入一个日期，返回所在周的体量变化
     * @param checkYear
     * @param checkMonth
     * @param checkDate
     * @return
     */
    public List<JSONObject> CheckWeek(String checkYear, String checkMonth,String checkDate);
}

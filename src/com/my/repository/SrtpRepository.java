package com.my.repository;

import com.my.entity.ChangeStruct;
import com.my.entity.Volume;

import java.util.List;

public interface SrtpRepository {
    /**
     * 输出从index开始，limit条数据
     * @param index
     * @param limit
     * @return
     */
    public List<Volume> srtpList(Integer index , Integer limit);

    /**
     * 计算总共多少条数据
     * @return
     */
    public Integer count();

    /**
     *查找日期从 startStr 到 endStr 所有的数据
     * @param startStr
     * @param endStr
     * @return
     */
    public List<Volume> checkList(String startStr , String endStr);

    /**计算某一天/月/年的总量
     * 计算某一天/月/年的变化总和
     * @param regexp  是一个日期的正则表达式（类型是String）
     * @return
     */
    public Double ChangeRe(String regexp);

    /**
     *
     * @param regexp  是一个日期的正则表达式（类型是String）
     * @return
     */
    public Double SumRe(String regexp);
}

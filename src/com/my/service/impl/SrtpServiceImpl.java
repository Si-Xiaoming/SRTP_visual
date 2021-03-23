package com.my.service.impl;

import com.my.entity.Volume;
import com.my.repository.SrtpRepository;
import com.my.repository.impl.SrtpRepositoryImpl;
import com.my.service.SrtpService;
import net.sf.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class SrtpServiceImpl implements SrtpService {
    SrtpRepository srtpRepository = new SrtpRepositoryImpl();

    /**
     * 返回limit条数据，每条数据以json格式
     * @param limit
     * @return
     */
    @Override
    public List<JSONObject> myJsons(Integer limit) {
        Integer index = srtpRepository.count()-limit;
        List<Volume> vlist = srtpRepository.srtpList(index,limit);
        List<JSONObject> jlist = new ArrayList<>();
        for(int i = 0 ; i<vlist.size() ; i++){
            jlist.add(JSONObject.fromObject(vlist.get(i)));
        }
        return jlist;
    }

    /**
     * 返回limit条数据，每条数据以json 字符串的形式（后期没用到）
     * @param limit
     * @return
     */
    @Override
    public List<String> myJsonStr(Integer limit) {
        Integer index = srtpRepository.count()-limit;
        List<Volume> vlist = srtpRepository.srtpList(index,limit);
        List<String> jlist = new ArrayList<>();
        for(int i = 0 ; i<vlist.size() ; i++){
            jlist.add(JSONObject.fromObject(vlist.get(i)).toString());
        }
        return jlist;
    }

}

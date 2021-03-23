package com.my.service.impl;

import com.my.entity.ChangeStruct;
import com.my.entity.Volume;
import com.my.repository.SrtpRepository;
import com.my.repository.impl.SrtpRepositoryImpl;
import com.my.service.CheckService;
import net.sf.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.*;

public class CheckServiceImpl implements CheckService {

    /**
     * 用于按年度查询，输入起止年份，返回json格式数据
     * @param startYear
     * @param endYear
     * @return
     */
    @Override
    public List<JSONObject> CheckYear(String startYear, String endYear) {
        Integer start = Integer.parseInt(startYear);
        Integer end = Integer.parseInt(endYear);
        Integer item = null;
        Double change =null;
        Double sum =null;
        List<JSONObject> jlist = new ArrayList<>();
        //ChangeStruct changeStruct =null;
        SrtpRepository srtpRepository =new SrtpRepositoryImpl();
        for(item=start;item<=end;item++){
            change = srtpRepository.ChangeRe(item.toString());
            sum = srtpRepository.SumRe(item.toString());
            jlist.add(JSONObject.fromObject(new ChangeStruct(item.toString()+"年",change,sum)));
        }
        return jlist;
    }


    /**
     * 用于按月查询，输入查询年份，返回这一年各个月份体量变化
     * @param checkYear
     * @return
     */
    @Override
    public List<JSONObject> CheckMonth(String checkYear) {
        Integer item = null;
        Double change =null;
        Double sum =null;
        List<JSONObject> jlist =new ArrayList<JSONObject>();
        ChangeStruct changeStruct =null;
        String str = null;
        SrtpRepository srtpRepository =new SrtpRepositoryImpl();
        for(item =1; item<=12;item++){
            str=checkYear+"-[0]?"+item.toString()+"-";
            change = srtpRepository.ChangeRe(str);
            sum = srtpRepository.SumRe(str);
            jlist.add(JSONObject.fromObject(new ChangeStruct(item.toString()+"月",change,sum)));
        }
        return jlist;
    }

    /**
     * 计算这一周第一天的日期
     * @param date
     * @return
     */
    public static Date getThisWeekMonday(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        // 获得当前日期是一个星期的第几天
        int dayWeek = cal.get(Calendar.DAY_OF_WEEK);
        if (1 == dayWeek) {
            cal.add(Calendar.DAY_OF_MONTH, -1);
        }
        // 设置一个星期的第一天，按中国的习惯一个星期的第一天是星期一
        cal.setFirstDayOfWeek(Calendar.MONDAY);
        // 获得当前日期是一个星期的第几天
        int day = cal.get(Calendar.DAY_OF_WEEK);
        cal.add(Calendar.DATE, cal.getFirstDayOfWeek() - day);
        return cal.getTime();
    }


    /**
     * 通过输入一个日期，返回所在周的体量变化
     * @param checkYear
     * @param checkMonth
     * @param checkDate
     * @return
     */
    @Override
    public List<JSONObject> CheckWeek(String checkYear, String checkMonth,String checkDate) {
        Calendar c = Calendar.getInstance();
        c.set(Calendar.YEAR,Integer.valueOf(checkYear));
        c.set(Calendar.MONTH,Integer.valueOf(checkMonth)-1);
        c.set(Calendar.DATE,Integer.valueOf(checkDate));
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date first = getThisWeekMonday(c.getTime());
        cal.setTime(first);

        SrtpRepository srtpRepository = new SrtpRepositoryImpl();
        List<JSONObject> jlist = new ArrayList<>();
        Double change = null;
        Double sum = null;
        List<String> weekStr = Arrays.asList("周一","周二","周三","周四","周五","周六","周日");
        cal.add(Calendar.DATE,-1);
        for(int i = 0;i<7;i++){
            cal.add(Calendar.DATE,+1);
            String datetime= sdf.format(cal.getTime());
            //System.out.println(datetime);

            change = srtpRepository.ChangeRe(datetime);
            sum = srtpRepository.SumRe(datetime);

            jlist.add(JSONObject.fromObject(new ChangeStruct(weekStr.get(i),change,sum)));
        }
        return jlist;
    }

//    public static void main(String[] args) {
//        CheckService checkService =new CheckServiceImpl();
//        List<JSONObject> list =checkService.CheckYear("2018","2021");
//        List<JSONObject> mlist=checkService.CheckMonth("2019");
//        List<JSONObject> wlist=checkService.CheckWeek("2019","12","25");
//        for(int i = 0 ;i<list.size();i++){
//            System.out.println(list.get(i).toString());
//        }
//        System.out.println("---------------------");
//        for(int i = 0 ;i<mlist.size();i++){
//
//            System.out.println(mlist.get(i).toString());
//        }
//        System.out.println("---------------------");
//        for(int i = 0 ;i<wlist.size();i++){
//
//            System.out.println(wlist.get(i).toString());
//        }
//        System.out.println("---------------------");
//    }

}

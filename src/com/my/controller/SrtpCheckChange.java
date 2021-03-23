package com.my.controller;

import com.my.service.CheckService;
import com.my.service.SrtpService;
import com.my.service.impl.CheckServiceImpl;
import com.my.service.impl.SrtpServiceImpl;
import com.mysql.cj.Session;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.util.List;
import java.util.zip.Checksum;

@WebServlet("/check_change")
public class SrtpCheckChange extends HttpServlet {
    CheckService checkService =new CheckServiceImpl();
    SrtpService srtpService = new SrtpServiceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String mycheck = (String)req.getParameter("mycheck");
        String check_year =(String)req.getParameter("check_year");  //开始年份也是check_year
        String check_eyear =(String)req.getParameter("check_eyear");
        String check_month =(String)req.getParameter("check_month");
        String check_date =(String)req.getParameter("check_date");
        List<JSONObject> list =srtpService.myJsons(7);
        req.setAttribute("mycheck",mycheck);
        req.setAttribute("check_year",check_year);
        req.setAttribute("check_eyear",check_eyear);
        req.setAttribute("check_month",check_month);
        req.setAttribute("check_date",check_date);
        req.setAttribute("list",list);

        if(mycheck.equals("0")){ //年度
            List<JSONObject> newlist = checkService.CheckYear(check_year,check_eyear);
            req.setAttribute("newlist",newlist);
            req.getRequestDispatcher("LargeView.jsp").forward(req,resp);

        }
        if(mycheck.equals("1")){
            List<JSONObject> newlist = checkService.CheckMonth(check_year);
            req.setAttribute("newlist",newlist);
            req.getRequestDispatcher("LargeView.jsp").forward(req,resp);
        }
        if(mycheck.equals("2")){         //mycheck =="2" 这样写不行
            List<JSONObject> newlist = checkService.CheckWeek(check_year,check_month,check_date);
            req.setAttribute("newlist",newlist);
            req.getRequestDispatcher("LargeView.jsp").forward(req,resp);
        }
    }
}

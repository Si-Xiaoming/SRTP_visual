package com.my.controller;

import com.my.service.CheckService;
import com.my.service.SrtpService;
import com.my.service.impl.CheckServiceImpl;
import com.my.service.impl.SrtpServiceImpl;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/view")
public class SrtpServlet extends HttpServlet {
    SrtpService srtpService = new SrtpServiceImpl();
    CheckService checkService =new CheckServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        List<JSONObject> newlist = checkService.CheckYear("2018","2021");
        List<JSONObject> list =srtpService.myJsons(7);
        req.setAttribute("list",list);
        req.setAttribute("newlist",newlist);
        req.getRequestDispatcher("LargeView.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<JSONObject> list =srtpService.myJsons(7);
        req.setAttribute("list",list);
        req.getRequestDispatcher("index.jsp").forward(req,resp);
        int i = 0;
    }
}

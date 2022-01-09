package Controller;

import DAO.Service_JavaBean.articles_impl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "addartServlet", value = "/addartServlet")
public class addartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String content = request.getParameter("content");
        String profile_pic = request.getParameter("profile_pic");
        String sql = "insert into articles values('"+name+"', '"+content+"', '"+profile_pic+"',now())";
//        System.out.println(sql);
        articles_impl art = new articles_impl();
        if(art.artUpdate(sql)>0){
            out.println(1);
        }
        else {
            out.println(0);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

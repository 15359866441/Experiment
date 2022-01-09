package Controller;

import DAO.Service_JavaBean.trolley_impl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "addtroServlet", value = "/addtroServlet")
public class addtroServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        int sno = Integer.parseInt(request.getParameter("sno"));
        String identifier = request.getParameter("identifier");
        String depiction = request.getParameter("depiction");
        double item_price = Double.parseDouble(request.getParameter("item_price"));
        int bookNum = Integer.parseInt(request.getParameter("bookNum"));
        String book_pic = request.getParameter("book_pic");

        String sql = "insert into trolleyinfor values("+sno+", '"+identifier+"','"+depiction+"', "+item_price+", "
                +bookNum+", '"+book_pic+"')";
//        System.out.println("sql语句为："+sql);
        trolley_impl tro = new trolley_impl();
        if(tro.troUpdate(sql)>0){
            out.println(1);
            out.flush();
            out.close();
        }
        else{
            out.println(0);
            out.flush();
            out.close();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

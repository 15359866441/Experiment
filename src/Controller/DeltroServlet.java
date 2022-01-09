package Controller;

import DAO.Service_JavaBean.trolley_impl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeltroServlet", value = "/DeltroServlet")
public class DeltroServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        int sno = Integer.parseInt(request.getParameter("sno"));
        String  depiction = request.getParameter("depiction");
        String sql ="delete from trolleyinfor where sno='"+sno+"' and depiction = '"+depiction+"'";
//        System.out.println("sql语句为："+sql);
        trolley_impl tro = new trolley_impl();
        PrintWriter out = response.getWriter();
        try {
            if (tro.troUpdate(sql)>0){
//              request.getRequestDispatcher("queryStudents.jsp").forward(request,response);
//              此处不使用请求转发的原因是请求发送的地址栏不发生变化，网页回退后不会重新刷新，导致回退时仍能看到已删除的数据
                response.sendRedirect("trolley.jsp");
            }
            else{
                out.println("<script>");
                out.println("alert('删除失败');");
                out.println("window.location='trolley.jsp';");
                out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

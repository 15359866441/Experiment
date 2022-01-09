package Controller;

import DAO.Service_JavaBean.bookinfor_impl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RepulseServlet", value = "/RepulseServlet")
public class RepulseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String identifier = request.getParameter("identifier");
        String sql = "delete from bookinfor where identifier='"+identifier+"'";
        bookinfor_impl book = new bookinfor_impl();
        PrintWriter out = response.getWriter();
        try {
            if (book.bookUpdate(sql)>0){
//              request.getRequestDispatcher("queryStudents.jsp").forward(request,response);
//              此处不使用请求转发的原因是请求发送的地址栏不发生变化，网页回退后不会重新刷新，导致回退时仍能看到已删除的数据
                response.sendRedirect("waitcheck.jsp");
            }
            else{
                out.println("<script>");
                out.println("alert('操作失败');");
                out.println("window.location='waitcheck.jsp';");
                out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

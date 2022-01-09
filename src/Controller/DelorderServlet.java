package Controller;

import DAO.Service_JavaBean.orders_impl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DelorderServlet",value = "/DelorderServlet")
public class DelorderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String o_num = request.getParameter("o_num");
        String sql ="delete from orders where o_num='"+o_num+"'";
//        System.out.println("sql语句为："+sql);
        orders_impl book = new orders_impl();
        PrintWriter out = response.getWriter();
        try {
            if (book.orderUpdate(sql)>0){
//              request.getRequestDispatcher("queryStudents.jsp").forward(request,response);
//              此处不使用请求转发的原因是请求发送的地址栏不发生变化，网页回退后不会重新刷新，导致回退时仍能看到已删除的数据
                response.sendRedirect("orders.jsp");
            }
            else{
                out.println("<script>");
                out.println("alert('删除失败');");
                out.println("window.location='orders.jsp';");
                out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


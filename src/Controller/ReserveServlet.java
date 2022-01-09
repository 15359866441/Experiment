package Controller;

import DAO.Service_JavaBean.reserve;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ReserveServlet", value = "/ReserveServlet")
public class ReserveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String calln = request.getParameter("calln");
        String bookname = request.getParameter("bookname");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String remark = request.getParameter("remark");
        reserve re =  new reserve();
        re.insertres(username,calln,bookname,quantity,remark);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

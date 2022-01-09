package Controller;

import DAO.Service_JavaBean.bookinfor_impl;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "addbookServlet", value = "/addbookServlet")
public class addbookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        // 1.获取表单信息
        String identifier = request.getParameter("identifier");
        String depiction = request.getParameter("depiction");
        String supplier = request.getParameter("supplier");
        String kinds = request.getParameter("kinds");
        double new_price = Double.parseDouble(request.getParameter("new_price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String book_pic = request.getParameter("book_pic");
        String put_time = request.getParameter("put_time");
        bookinfor_impl book = new bookinfor_impl();
        if(book.addbook(identifier,depiction,supplier,kinds,new_price,quantity,book_pic,put_time)>0){
            out.println("<script>");
            out.println("alert('添加成功，请等待管理员审核');");
            out.println("window.location='showcommodity.jsp';");
            out.println("</script>");
        }
        else{
            out.println("<script>");
            out.println("alert('添加失败，请重新添加');");
            out.println("window.location='addgoods.jsp';");
            out.println("</script>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

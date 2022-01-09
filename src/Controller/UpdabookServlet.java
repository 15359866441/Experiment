package Controller;

import DAO.Service_JavaBean.bookinfor_impl;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdabookServlet", value = "/UpdabookServlet")
public class UpdabookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String identifier = request.getParameter("identifier");
        String depiction = request.getParameter("depiction");
        String supplier = request.getParameter("supplier");
        String kinds = request.getParameter("kinds");
        double new_price = Double.parseDouble(request.getParameter("new_price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String book_pic = request.getParameter("book_pic");
        String put_time = request.getParameter("put_time");
        bookinfor_impl book = new bookinfor_impl();
        String sql = "update bookinfor set depiction='"+depiction+"',supplier='"+supplier+"',kinds='"+kinds+"',new_price="+
                new_price+",quantity="+quantity+",book_pic='"+book_pic+"',put_time='"+put_time+"' where identifier='"+identifier+"'";
//        System.out.println("sql语句为："+sql);
        if(book.bookUpdate(sql)>0){
            out.println("<script>");
            out.println("alert('修改成功');");
            out.println("window.location='showcommodity.jsp';");
            out.println("</script>");
        }
        else{
            out.println("<script>");
            out.println("alert('修改失败，请重新提交');");
            out.println("window.location='updatebook.jsp';");
            out.println("</script>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

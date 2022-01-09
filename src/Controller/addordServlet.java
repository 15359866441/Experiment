package Controller;

import DAO.Service_JavaBean.orders_impl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "addordServlet", value = "/addordServlet")
public class addordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        /*获取订单号*/
        Date ss = new Date();
        SimpleDateFormat format0 = new SimpleDateFormat("yyyyMMddHHmmss");
        String time = format0.format(ss.getTime());//这个就是把时间戳经过处理得到期望格式的时间

        String o_num = "D"+time;
        String username = request.getParameter("username");
        String identifier = request.getParameter("identifier");
        String quantity = request.getParameter("quantity");
        String order_price = request.getParameter("order_price");

        String sql = "insert into orders values('"+o_num+"', '"+username+"', '"+identifier+"', "+quantity+","+order_price+",now())";
//        System.out.println("sql语句为："+sql);
        orders_impl orders = new orders_impl();
        if(orders.orderUpdate(sql)>0){
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

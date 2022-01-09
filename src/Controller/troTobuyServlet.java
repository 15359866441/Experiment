package Controller;

import DAO.Service_JavaBean.orders_impl;
import DAO.Service_JavaBean.trolley_impl;
import com.mysql.cj.PingTarget;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "troTobuyServlet", value = "/troTobuyServlet")
public class troTobuyServlet extends HttpServlet {
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
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double order_price = Double.parseDouble(request.getParameter("order_price"));
        double all_price = quantity*order_price;
        System.out.println("总价是："+all_price);
        String sql1 = "insert into orders values('"+o_num+"', '"+username+"', '"+identifier+"', "+quantity+","+all_price+",now())";
//        System.out.println("sql语句为："+sql1);
        orders_impl orders = new orders_impl();

        trolley_impl tro = new trolley_impl();
//        同时删除相应购物车记录
        int sno = Integer.parseInt(request.getParameter("sno"));
        String  depiction = request.getParameter("depiction");
        String sql2 ="delete from trolleyinfor where sno='"+sno+"' and depiction = '"+depiction+"'";
//        System.out.println("sql语句为："+sql2);
        int imp1 = orders.orderUpdate(sql1);
        int imp2 = tro.troUpdate(sql2);
//        System.out.println("删除语句执行，imp2的值："+imp2);

        if(imp1>0&&imp2>0){
            out.println("<script>");
//          out.println("alert('结算成功！');");
            out.println("window.location='orders.jsp';");
            out.println("</script>");
        }
        else if(imp1>0&&imp2==0){
            out.println("<script>");
            out.println("alert('删除购物车失败，请重新尝试');");
            out.println("window.location='trolley.jsp';");
            out.println("</script>");
        }else {
            out.println("<script>");
            out.println("alert('结算失败');");
            out.println("window.location='trolley.jsp';");
            out.println("</script>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

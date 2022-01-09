package Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
//格式化输出结果
import java.text.DecimalFormat;

@WebServlet(name = "BMIServlet", value = "/BMIServlet")
public class BMIServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("服务端已经接受了ajax的请求");
//        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        DecimalFormat twopoints = new DecimalFormat("#.00");
        PrintWriter out = response.getWriter();
        double weight = Double.parseDouble(request.getParameter("weight"));
        double height = Double.parseDouble(request.getParameter("height"));
        double result = weight/(height*height);
        out.println("您的BMI为："+twopoints.format(result));
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

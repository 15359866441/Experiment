package Controller;
import DAO.Service_JavaBean.userinfor_impl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 对应结果的编码方式设置
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        // 1.获取表单信息
        String username = request.getParameter("username");
        String number = request.getParameter("number");
        int sno = Integer.parseInt(request.getParameter("sno"));
        String pwd = request.getParameter("pwd");
        String college = request.getParameter("college");
        String major = request.getParameter("major");
        userinfor_impl db = new userinfor_impl();
        // 4.进行用户注册
        switch (db.register(username, number, sno, pwd, college, major)) {
            case 0:
                out.println("<script>");
                out.println("alert('系统错误');");
                out.println("window.location='Register.jsp';");
                out.println("</script>");
                break;
            case 1:
                out.println("<script>");
                out.println("alert('注册成功，请登录');");
                out.println("window.location='LoginE.jsp';");
                out.println("</script>");
                break;
            case 2:
                out.println("<script>");
                out.println("alert('注册失败');");
                out.println("window.location='Register.jsp';");
                out.println("</script>");
                break;
            case 3:
                out.println("<script>");
                out.println("alert('注册失败，该用户已存在');");
                out.println("window.location='Register.jsp';");
                out.println("</script>");
                break;
        }
        // 刷新、关闭
        out.flush();
        out.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

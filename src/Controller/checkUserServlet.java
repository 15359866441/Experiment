package Controller;

import DAO.Service_JavaBean.userinfor_impl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "checkUserServlet",urlPatterns = "/checkUserServlet")
public class checkUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置编码方式
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        // 内容输出
        PrintWriter out = response.getWriter();

        // 获取页面提交的信息
        String username = request.getParameter("username");

            // 连接dbHelper工具类
            userinfor_impl db = new userinfor_impl();
            // 实现用户查询
            int rs = db.updataShow(username);
            try {
                // 判断用户名状态
                if (rs>0){
                    out.print("该用户名已存在，请更换一个");
                }
            } catch(Exception e){
                e.printStackTrace();
            }
//        }
        // 刷新\关闭
        out.flush();
        out.close();
    }
}


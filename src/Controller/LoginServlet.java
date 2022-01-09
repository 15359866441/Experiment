package Controller;
import DAO.Service_JavaBean.userinfor_impl;
import DAO.data_JavaBean.userinfor;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@javax.servlet.annotation.WebServlet(urlPatterns = "/LoginServlet")
//下方的类就是该注解所对应的类
public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws  IOException {
//        服务端响应时的编码
        response.setContentType("text/html;charset=UTF-8");
//      客户端请求时的编码，tomcat8.0以上默认utf-8
        request.setCharacterEncoding("UTF-8");

//      response.getWriter()返回的是PrintWriter，这是一个打印输出流
//      response.getWriter().print()不仅可以打印输出文本格式（包括html标签），
//      还可以将一个对象以默认的编码方式转换为二进制字节输出
        PrintWriter out = response.getWriter();

        //获取表单提交的信息
//      request.getParameter()通过容器的实现来取得通过get或者post方式提交给服务端的数据，方法返回String类型的数据
        String username = request.getParameter("username");
        String pwd = request.getParameter("pwd");

        //连接数据库
        userinfor_impl db = new userinfor_impl();
        List<userinfor> lst = db.login(username, pwd);
//        ObjectMapper map = new ObjectMapper();
//        String json1 = map.writeValueAsString(map);
//        System.out.println("json值为："+json1);
        HttpSession session = request.getSession();
        if(lst.size()!=0){
            session.setAttribute("username", lst.get(0).getUsername());
            session.setAttribute("profile_pic",lst.get(0).getProfile_pic());
            session.setAttribute("userid",lst.get(0).getUserid());
            session.setAttribute("sno",lst.get(0).getSno());
            out.println("<script>");
            out.println("window.location='IndexEsuper.jsp';"); //跳转到用户信息页面
            out.println("</script>");
        }
        else{
            out.println("<script>");
            out.println("alert('密码或账号错误，请重新登录！');");
            out.println("window.location='LoginE.jsp';"); // 跳转回登陆页面
            out.println("</script>");
        }
//        将缓冲信息输出到页面
        out.flush();
//        关闭out所占用的资源
        out.close();
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws  IOException {
//      doGet()和doPost()对数据的处理方法一致;
        this.doPost(request,response);
    }
}
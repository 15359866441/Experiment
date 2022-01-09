package def;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCTest {
    public static  void main(String[] args){
        Connection con = null;
        PreparedStatement pStatement = null;
        ResultSet res = null;
        try{
            // 1.注册驱动
            Driver driver = new com.mysql.cj.jdbc.Driver();
            DriverManager.registerDriver(driver);

            //2.获取连接
            String url = "jdbc:mysql://localhost:3306/test?serverTimezone=UTC";
            String user = "root";
            String password = "123456";
            con = DriverManager.getConnection(url, user, password);

            //3.获取数据库操作对象
            String sql = "select * from students where sno=?";
            pStatement = con.prepareStatement(sql);
            pStatement.setInt(1,1026);

            //4.执行sql语句
            res = pStatement.executeQuery();

            //5.处理查询结果集
            if(res.next()){
                System.out.println("查询成功，查询结果如下：");
                System.out.print("学号为："+res.getInt(1));
                System.out.print("  姓名为："+res.getString("name"));
                System.out.print("  分数为："+res.getInt(3));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
              //6.释放资源，try中的变量无法在finally中使用，关闭资源需从小到大依次关闭
//            close()方法会返回异常
//            在fianlly中关闭资源保证资源一定释放（在try块中若其中一个语句抛出异常，则后面语句中的.close()会无法执行）
            try {
                if (res != null) {
                    res.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (pStatement != null) {
                    pStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }
}

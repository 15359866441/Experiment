package DAO;
//import java.sql.*;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class DBConnection {
    //final成员变量表示常量，只能被赋值一次，赋值后值不再改变。
    private static final String url = "jdbc:mysql://localhost:3306/experiment?serverTimezone=UTC";
    private static final String user = "root";
    private static final String password = "root";

    /** 返回连接 */
    public static Connection getConnection() {
        Connection dbConnection = null;
        try {
//            类加载方法，可加载类中的静态方法
//            Class.forName(DRIVER_CLASS);
            Driver driver = new com.mysql.cj.jdbc.Driver();
//            第一个Driver是接口，第二个Driver是实现类
            DriverManager.registerDriver(driver);
            dbConnection = DriverManager.getConnection(url,user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("数据库连接成功");
        return dbConnection;
    }

    /** 关闭连接*/
    public static void closeConnection(Connection dbConnection) {
        try {
            if (dbConnection != null && (!dbConnection.isClosed())) {
                dbConnection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /** 关闭PreparedStatement语句*/
    public static void closeStatement(PreparedStatement pStatement) {
        try {
            if (pStatement != null) {
                pStatement.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /** 关闭Statement语句*/
    public static void closeStatement(Statement statement) {
        try {
            if (statement != null) {
                statement.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**关闭结果集*/
    public static void closeResultSet(ResultSet res) {
        try {
            if (res != null) {
                res.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

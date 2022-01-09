package DAO.Service_JavaBean;
import DAO.DBConnection;
import DAO.data_JavaBean.userinfor;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class userinfor_impl {
    // 声明成员变量
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public List<userinfor> login(String username, String password){
        List<userinfor> lst= new ArrayList<>();
        try {
            DBConnection db = new DBConnection();
            connection = db.getConnection();
            String sql = "select * from userinfor where username=? and pwd=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,password);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                userinfor userinfo = new userinfor();
                userinfo.setUserid(resultSet.getInt(1));
                userinfo.setUsername(resultSet.getString(2));
                userinfo.setNumber(resultSet.getString(3));
                userinfo.setSno(resultSet.getInt(4));
                userinfo.setPwd(resultSet.getString(5));
                userinfo.setCollege(resultSet.getString(6));
                userinfo.setMajor(resultSet.getString(7));
                userinfo.setProfile_pic(resultSet.getString(8));
                lst.add(userinfo);
            }
        } catch (Exception e){
            e.printStackTrace();
        }finally {
            DBConnection.closeResultSet(resultSet);
            DBConnection.closeStatement(preparedStatement);
            DBConnection.closeConnection(connection);
        }
        return lst;
    }

//判断用户是否存在
    public boolean existUser(String username){
        try {
            String sql = "select * from userinfor where username=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,username);
            resultSet = preparedStatement.executeQuery();
            // 判断用户是否已经存在
            if (resultSet.next()){
                return false;
            } else {
                return true;
            }
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            DBConnection.closeResultSet(resultSet);
            DBConnection.closeStatement(preparedStatement);
        }
    }

    public int register(String username, String number, int sno, String pwd, String college, String major){
        try{
            // 1.连接数据库
            connection = DBConnection.getConnection();
            // 2.判断用户是否可以创建
            if(existUser(username)){
                String sql = "insert into userinfor values(2,?,?,?,?,?,?,'images/默认头像.png')";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1,username);
                preparedStatement.setString(2,number);
                preparedStatement.setInt(3,sno);
                preparedStatement.setString(4,pwd);
                preparedStatement.setString(5,college);
                preparedStatement.setString(6,major);
                int num = preparedStatement.executeUpdate();
                if(num>0){
                    return 1;
                }else {
                    return 2;
                }
            }else{
                return 3;
            }
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }finally {
            DBConnection.closeStatement(preparedStatement);
            DBConnection.closeConnection(connection);
        }
    }

    // 实时查看用户名是否存在
    public Integer updataShow(String username){
        int flag=0;
        try{
            connection = DBConnection.getConnection();
            String sql = "select * from userinfor where username=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,username);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                flag++;
            }
        }catch (Exception e){
            e.printStackTrace();
//          需注意关闭连接，否则报错“Too many connections”，但连接又不能在结果集处理之前关闭
//          否则会报错“Operation not allowed after ResultSet closed（结果集关闭后不允许其他关于结果集的操作进行）”
        } finally {
            DBConnection.closeResultSet(resultSet);
            DBConnection.closeStatement(preparedStatement);
            DBConnection.closeConnection(connection);
        }
        return flag;
    }
    }

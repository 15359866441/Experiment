package DAO.Service_JavaBean;

import DAO.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class reserve {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    public void insertres(String username, String calln, String bookname, int quantity, String remark){
        try{
            connection = DBConnection.getConnection();
            String sql = "insert into reserve(username,calln,bookname,quantity,remark,b_date) values(?,?,?,?,?,now())";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,calln);
            preparedStatement.setString(3,bookname);
            preparedStatement.setInt(4,quantity);
            preparedStatement.setString(5,remark);
            preparedStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBConnection.closeStatement(preparedStatement);
            DBConnection.closeConnection(connection);
        }
    }
}

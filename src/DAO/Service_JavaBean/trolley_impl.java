package DAO.Service_JavaBean;

import DAO.DBConnection;
import DAO.data_JavaBean.trolley;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class trolley_impl {
    Connection connection = null;      //连接
    PreparedStatement preparedStatement = null;    //语句
    ResultSet resultSet = null;        //结果集

    public List<trolley> getTrolley(String sql){
        List<trolley> lst = new ArrayList<>();
        try{
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                trolley trolley = new trolley();
                trolley.setSno(resultSet.getInt("sno"));
                trolley.setIdentifier(resultSet.getString("identifier"));
                trolley.setDepiction(resultSet.getString("depiction"));
                trolley.setSum_price(resultSet.getString("sum_price"));
                trolley.setBookNum(resultSet.getString("bookNum"));
                trolley.setBook_pic(resultSet.getString("book_pic"));
                lst.add(trolley);
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally{
            DBConnection.closeResultSet(resultSet);
            DBConnection.closeConnection(connection);
            DBConnection.closeStatement(preparedStatement);
        }
        return lst;
    }

    public Integer troUpdate(String sql) {
        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            int row = preparedStatement.executeUpdate();
            return row; //如果有记录受到影响，则表示更新操作成功
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            DBConnection.closeStatement(preparedStatement);
            DBConnection.closeConnection(connection);
        }
    }

}

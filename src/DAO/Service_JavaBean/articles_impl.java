package DAO.Service_JavaBean;

import DAO.DBConnection;
import DAO.data_JavaBean.articles;
import DAO.data_JavaBean.orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class articles_impl {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public List<articles> getarticles(String sql){
        List<articles> lst = new ArrayList<>();
        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            //遍历结果集对象
            while(resultSet.next()){
                articles art = new articles();
                art.setName(resultSet.getString("name"));
                art.setContent(resultSet.getString("content"));
                art.setProfile_pic(resultSet.getString("profile_pic"));
                art.setC_time(resultSet.getString("c_time"));
                lst.add(art);
            }

        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally {
            DBConnection.closeResultSet(resultSet);
            DBConnection.closeStatement(preparedStatement);
            DBConnection.closeConnection(connection);
        }
        return lst;
    }


    //  增删改操作
    public Integer artUpdate(String sql) {
        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            int row = preparedStatement.executeUpdate();
            System.out.println(row);
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

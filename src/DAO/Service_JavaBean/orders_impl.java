package DAO.Service_JavaBean;

import DAO.DBConnection;
import DAO.data_JavaBean.orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class orders_impl {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    public List<orders> getorders(String sql){
        List<orders> lst = new ArrayList<>();
        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            //遍历结果集对象
            while(resultSet.next()){
                orders orderin = new orders();
                orderin.setO_num(resultSet.getString("o_num"));
                orderin.setUsername(resultSet.getString("username"));
                orderin.setIdentifier(resultSet.getString("identifier"));
                orderin.setNew_price(resultSet.getDouble("new_price"));
                orderin.setQuantity(resultSet.getInt("quantity"));
                orderin.setOrder_price(resultSet.getDouble("order_price"));
                orderin.setO_date(resultSet.getString("o_date"));
                orderin.setBook_pic(resultSet.getString("book_pic"));
                orderin.setDepiction(resultSet.getString("depiction"));
                lst.add(orderin);
            }

            for (orders stu : lst) {
                System.out.println(stu.getO_num()+","+stu.getUsername()+","+","+stu.getIdentifier()+","+stu.getNew_price()+","+
                        stu.getQuantity()+","+stu.getOrder_price()+","+stu.getO_date()+","+stu.getBook_pic()+","+stu.getDepiction());
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

    public Integer orderUpdate(String sql) {
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

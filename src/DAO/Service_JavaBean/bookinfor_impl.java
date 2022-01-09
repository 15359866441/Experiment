package DAO.Service_JavaBean;

import DAO.DBConnection;
import DAO.data_JavaBean.bookinfor;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class bookinfor_impl {
    Connection connection = null;
    Statement state = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public List<bookinfor> getboooks(String sql) {
        List<bookinfor> lst = new ArrayList<>();
        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            //遍历结果集对象
            while (resultSet.next()) {
                bookinfor bookin = new bookinfor();
                bookin.setIdentifier(resultSet.getString("identifier"));
                bookin.setStatus(resultSet.getInt("status"));
                bookin.setBook_pic(resultSet.getString("book_pic"));
                bookin.setDepiction(resultSet.getString("depiction"));
                bookin.setQuantity(resultSet.getInt("quantity"));
                bookin.setNew_price(resultSet.getDouble("new_price"));
                bookin.setOld_price(resultSet.getDouble("old_price"));
                bookin.setMon_sell(resultSet.getInt("mon_sell"));
                bookin.setKinds(resultSet.getString("kinds"));
                bookin.setSupplier(resultSet.getString("supplier"));
                bookin.setPut_time(resultSet.getString("put_time"));
                lst.add(bookin);
            }
//            for (bookinfor stu : lst) {
//                System.out.println(stu.getIdentifier()+","+stu.getBook_pic()+","+stu.getDepiction()+","+
//                        stu.getNew_price()+","+stu.getOld_price()+","+stu.getMon_sell());
//            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            DBConnection.closeResultSet(resultSet);
            DBConnection.closeStatement(preparedStatement);
            DBConnection.closeConnection(connection);
        }
        return lst;
    }

//  增删改操作
    public Integer bookUpdate(String sql) {
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

    public int addbook(String identifier, String depiction, String supplier, String kinds, double new_price,
                       int quantity, String book_pic, String put_time) {
        try {
            connection = DBConnection.getConnection();
            state = connection.createStatement();
            String sql = "insert into bookinfor values('"+identifier+"',0,'newimage/"+book_pic+"','"+depiction+"',"+quantity+","+
                    +new_price+","+new_price+",0,'"+kinds+"','"+supplier+"','"+put_time+"')";
            System.out.println("sql语句为："+sql);
            int num = state.executeUpdate(sql);
            return num;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            DBConnection.closeStatement(state);
            DBConnection.closeConnection(connection);
        }
    }


}


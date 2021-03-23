package com.my.repository.impl;
import com.my.entity.ChangeStruct;
import com.my.entity.Volume;
import com.my.repository.SrtpRepository;
import com.my.utils.JDBCTools;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
public class SrtpRepositoryImpl implements SrtpRepository {


    /**
     * 输出从index开始，limit条数据
     * @param index
     * @param limit
     * @return
     */
    @Override
    public List<Volume> srtpList(Integer index, Integer limit) {
        Connection connection = JDBCTools.getconnection();
        String sql = "select * from srtp limit ?,?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Volume> list = new ArrayList<>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, index);
            statement.setInt(2, limit);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Timestamp timestamp = resultSet.getTimestamp(1);
                String datetime = df.format(timestamp);
                list.add(new Volume(datetime, resultSet.getDouble(2), resultSet.getDouble(3)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return list;
    }


    /**
     * 计算总共多少条数据
     * @return
     */
    @Override
    public Integer count() {
        Connection connection = JDBCTools.getconnection();
        String sql = "select count(*) from srtp";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Integer count = 0;
        try {
            statement = connection.prepareStatement(sql);
            resultSet =statement.executeQuery();
            while (resultSet.next()){
                count = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return count;
    }


    /**
     * 查找日期从 startStr 到 endStr 所有的数据
     * @param startstr
     * @param endstr
     * @return
     */
    @Override
    public List<Volume> checkList(String startstr, String endstr) {
        Connection connection = JDBCTools.getconnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Volume> list = new ArrayList<>();
        String sql = "select * from srtp where date>STR_TO_DATE(?,'%Y-%m-%d %H:%i:%s') AND date<STR_TO_DATE(?,'%Y-%m-%d %H:%i:%s')";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1,startstr);
            statement.setString(2,endstr);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Timestamp timestamp = resultSet.getTimestamp(1);
                String datetime = df.format(timestamp);
                list.add(new Volume(datetime, resultSet.getDouble(2), resultSet.getDouble(3)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return list;
    }

    /**
     * 计算某一天/月/年的变化总和
     * @param regexp  是一个日期的正则表达式（类型是String）
     * @return
     */
    @Override
    public Double ChangeRe(String regexp) {
        Connection connection = JDBCTools.getconnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Double changeRe =null;
        String sql = "select SUM(datachange) FROM srtp where date regexp ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1,regexp);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                changeRe = resultSet.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return changeRe;
    }

    /**
     * 计算某一天/月/年的总量
     * @param regexp 是一个日期的正则表达式（类型是String）
     * @return
     */
    @Override
    public Double SumRe(String regexp) {
        Connection connection = JDBCTools.getconnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Double sumRe =null;
        String sql = "select (sumvolume) FROM srtp where date regexp ?";

        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1,regexp);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                sumRe = resultSet.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return sumRe;
    }

//    public static void main(String[] args) {
//        SrtpRepository srtpRepository =new SrtpRepositoryImpl();
//        Double d =srtpRepository.SumRe("2019-[0]?11");
//        System.out.println(d.toString());
//    }
}

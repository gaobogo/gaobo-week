package com.gaobo.jdbc;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author gaobo
 * @Date 2021/6/6 18:47
 */
public class MyJDBC {

    /**
     * 执行增删改的SQL语句的方法
     *
     * @param sql
     * @param params
     * @return
     * @throws SQLException
     */
    public int update(String sql, Object... params) throws SQLException {
        // 获取连接对象
        Connection connection = JDBCUtils.getConnection();
        // 预编译sql
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        // 获取参数个数
        ParameterMetaData parameterMetaData = preparedStatement.getParameterMetaData();
        int parameterCount = parameterMetaData.getParameterCount();
        for (int i = 1; i <= parameterCount; i++) {
            preparedStatement.setObject(i, params[i - 1]);
        }
        // 执行sql
        int count = preparedStatement.executeUpdate();
        // 关闭资源
        JDBCUtils.closeAll(null, preparedStatement, connection);
        return count;
    }

    /**
     * @param sql
     * @param clazz
     * @param params
     * @param <T>
     * @return
     * @throws Exception
     */
    public <T> List<T> queryList(String sql, Class<T> clazz, Object... params) throws Exception {
        // 获取连接对象
        Connection connection = JDBCUtils.getConnection();
        // 预编译sql
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        // 获取参数个数
        ParameterMetaData parameterMetaData = preparedStatement.getParameterMetaData();
        int parameterCount = parameterMetaData.getParameterCount();
        for (int i = 1; i <= parameterCount; i++) {
            preparedStatement.setObject(i, params[i - 1]);
        }
        // 执行sql
        ResultSet resultSet = preparedStatement.executeQuery();
        ResultSetMetaData metaData = resultSet.getMetaData();
        int columnCount = metaData.getColumnCount();
        List<T> list = new ArrayList<>();
        while (resultSet.next()) {
            T t = clazz.newInstance();
            for (int i = 1; i <= columnCount; i++) {
                //获取列的名称
                String columnName = metaData.getColumnName(i);
                // 获取每一行数据的各个字段的数据
                Object columnValue = resultSet.getObject(columnName);
                PropertyDescriptor propertyDescriptor = new PropertyDescriptor(columnName, clazz);
                Method writeMethod = propertyDescriptor.getWriteMethod();
                writeMethod.invoke(t, columnValue);
            }
            list.add(t);
        }
        // 关闭资源
        JDBCUtils.closeAll(resultSet, preparedStatement, connection);
        return list;
    }
}


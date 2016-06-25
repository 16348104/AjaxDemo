package util;

import com.mysql.jdbc.Driver;

import java.sql.*;

/**
 * Created by mingfei.net@gmail.com
 * 2016/6/25.
 */
public class DB {
    private static final String URL = "jdbc:mysql:///db_ajax?user=root&password=123456";
//    private static Connection connection;

    public static Connection getConnection() {
//        if (connection == null) {
        try {
            new Driver();
            return DriverManager.getConnection(URL);
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        }
        return null;
    }


    public static void close(ResultSet resultSet, Statement statement, Connection connection) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

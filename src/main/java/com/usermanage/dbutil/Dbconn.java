package com.usermanage.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 数据库连接工具类
 * 提供获取数据库连接和关闭资源的方法
 */
public class Dbconn {

    /** 数据库连接URL */
    private static final String URL = "jdbc:mysql://localhost:3306/userdb?useSSL=false&characterEncoding=utf8";

    /** 数据库用户名 */
    private static final String USER = "root";

    /** 数据库密码 */
    private static final String PASSWORD = "root";

    /** 数据库驱动类名（mysql-connector-java-5.1.5） */
    private static final String DRIVER = "com.mysql.jdbc.Driver";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("数据库驱动加载失败", e);
        }
    }

    /**
     * 获取数据库连接
     *
     * @return Connection 数据库连接对象
     * @throws SQLException 如果获取连接失败
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    /**
     * 关闭数据库资源
     *
     * @param conn  数据库连接对象，可为null
     * @param stmt  Statement对象，可为null
     * @param rs    ResultSet对象，可为null
     */
    public static void close(Connection conn, Statement stmt, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 关闭数据库资源（无ResultSet）
     *
     * @param conn  数据库连接对象
     * @param stmt  Statement对象
     */
    public static void close(Connection conn, Statement stmt) {
        close(conn, stmt, null);
    }
}

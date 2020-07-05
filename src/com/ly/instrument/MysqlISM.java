package com.ly.instrument;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * jdbc 数据库驱动和配置
 */
public class MysqlISM {
    /**
     * 加载数据库驱动
     */
    public MysqlISM() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    /**
     * 链接数据库
     */
    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bookmall?characterEncoding=UTF-8","admin","1999");
    }
}

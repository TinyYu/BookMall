package com.ly.dao;

import com.ly.entity.User;
import com.ly.instrument.MysqlISM;

import java.sql.*;

public class UserDAO {
    MysqlISM mysqlISM = new MysqlISM();

    /**
     * 注册用户 add
     * @param user 用户对象
     */
    public void addHero(User user){
        Connection c = null;
        PreparedStatement ps = null;
        String sql = "insert into user value(?,?,?,?,null,?)";
        try {
            c = mysqlISM.getConnection();
            ps = c.prepareStatement(sql);
            ps.setString(1,user.getUsername()); // 用户名
            ps.setString(2,user.getUserpassword()); // 密码
            ps.setString(3,user.getUsereamil()); // 邮箱
            ps.setInt(4,user.getUserstatus()); // 身份
            ps.setDouble(5,user.getUsermoney()); // 金额
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()){
                int id = rs.getInt(1);
                user.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 返回用户所有信息
     * @param username 用户名
     * @return 用户对象
     */
    public User getUser(String username){
        StringBuffer sb = new StringBuffer();
        sb.append("\'");
        sb.append(username);
        sb.append("\'");
        User user = new User();
        Connection c = null;
        Statement s = null;
        String sql = "select * from user where username=" + sb;

        try {
            c = mysqlISM.getConnection();
            s = c.createStatement();
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()){
                user.setUsername(rs.getString("username")); // 用户名
                user.setUserpassword(rs.getString("userpassword")); // 密码
                user.setUsereamil(rs.getString("usereamil")); // 邮箱
                user.setUserstatus(rs.getInt("userstatus")); // 身份
                user.setId(rs.getInt("userid")); // 用户id
                user.setUsermoney(rs.getDouble("usermoney")); // 用户金额
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    /**
     * 返回用户所有信息
     * @param usereamil 用户邮箱
     * @return 用户邮箱
     */
    public User getUserEamil(String usereamil){
        StringBuffer sb = new StringBuffer();
        sb.append("\'");
        sb.append(usereamil);
        sb.append("\'");
        User user = new User();

        Connection c = null;
        Statement s = null;
        String sql = "select * from user where usereamil=" + sb;

        try {
            c = mysqlISM.getConnection();
            s = c.createStatement();
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()){
                user.setUsername(rs.getString("username")); // 用户名
                user.setUserpassword(rs.getString("userpassword")); // 密码
                user.setUsereamil(rs.getString("usereamil")); // 邮箱
                user.setUserstatus(rs.getInt("userstatus")); // 身份
                user.setId(rs.getInt("userid")); // 用户id
                user.setUsermoney(rs.getDouble("usermoney")); // 用户金额
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    /**
     * 跟新用户信息
     * @param user
     */
    public void update(User user){
        Connection c = null;
        PreparedStatement ps = null;
        String sql = "UPDATE user SET username=?,userpassword=?,usereamil=?,usermoney=? WHERE userid=?";
        try {
            c = mysqlISM.getConnection();
            ps = c.prepareStatement(sql);
            ps.setString(1,user.getUsername());
            ps.setString(2,user.getUserpassword());
            ps.setString(3,user.getUsereamil());
            ps.setDouble(4,user.getUsermoney());
            ps.setInt(5,user.getId());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

package com.ly.dao;

import com.ly.entity.Book;
import com.ly.instrument.MysqlISM;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    MysqlISM mysqlISM = new MysqlISM();

    /**
     * 返回销量前4的图书
     * @return
     */
    public List<Book> listBook_bestsellers(){
        String sql = "SELECT * from book ORDER BY bookvolume DESC LIMIT 0,4";
        Connection c = null;
        Statement s = null;
        List<Book> book_list = new ArrayList();
        try {
            c = mysqlISM.getConnection();
            s = c.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()){
                Book book = new Book();
                book.setBook_id(rs.getInt("bookid"));
                book.setBook_name(rs.getString("bookname"));
                book.setBook_type(rs.getString("booktype"));
                book.setBook_intro(rs.getString("bookintro"));
                book.setBook_money(rs.getDouble("bookmoney"));
                book.setBook_volume(rs.getInt("bookvolume"));
                book.setBook_path(rs.getString("bookpath"));
                book.setBook_userid(rs.getInt("bookuserid"));
                book_list.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book_list;
    }

    /**
     * 返回全部图书
     */
    public List<Book> bookList(){
        List<Book> list = new ArrayList<>();
        String sql = "select * from book";
        Connection c = null;
        Statement s = null;
        try {
            c = mysqlISM.getConnection();
            s = c.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()){
                Book book = new Book();
                book.setBook_id(rs.getInt("bookid"));
                book.setBook_name(rs.getString("bookname"));
                book.setBook_type(rs.getString("booktype"));
                book.setBook_intro(rs.getString("bookintro"));
                book.setBook_money(rs.getDouble("bookmoney"));
                book.setBook_volume(rs.getInt("bookvolume"));
                book.setBook_path(rs.getString("bookpath"));
                book.setBook_userid(rs.getInt("bookuserid"));
                list.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 添加图书
     */
    public void addBook(Book book){
        String sql = "insert into book value(null,?,?,?,?,?,?,?)";
        Connection c = null;
        PreparedStatement ps = null;
        try {
            c = mysqlISM.getConnection();
            ps = c.prepareStatement(sql);
            ps.setString(1,book.getBook_name()); // 书名
            ps.setString(2,book.getBook_type()); // 书类型
            ps.setString(3,book.getBook_intro()); // 简介
            ps.setDouble(4,book.getBook_money()); // 价格
            ps.setInt(5,0); // 销量
            ps.setString(6,book.getBook_path()); // 封面
            ps.setInt(7,book.getBook_userid()); // 上架的用户id
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()){
                int id = rs.getInt(1);
                book.setBook_id(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

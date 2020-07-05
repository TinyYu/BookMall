package com.ly.dao;

import com.ly.entity.Book;
import com.ly.instrument.MysqlISM;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * book表
 */
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

    /**
     * 返回指定图书
     */
    public Book getBook(String book_id){
        Book book = new Book();
        String sql = "select * from book where bookid=" + Integer.parseInt(book_id);
        Connection c = null;
        Statement s = null;
        try {
            c = mysqlISM.getConnection();
            s = c.createStatement();
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()){
                book.setBook_id(rs.getInt("bookid")); //图书id
                book.setBook_name(rs.getString("bookname")); //书名
                book.setBook_type(rs.getString("booktype")); //类型
                book.setBook_intro(rs.getString("bookintro")); //简介
                book.setBook_money(rs.getDouble("bookmoney")); //价格
                book.setBook_volume(rs.getInt("bookvolume")); //销量
                book.setBook_userid(rs.getInt("bookuserid")); //上架用户id
                book.setBook_path(rs.getString("bookpath")); //封面
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    /**
     * 更新图书信息
     */
    public void update(Book book){
        String sql = "UPDATE book SET bookvolume=? WHERE bookid=?";
        Connection c = null;
        PreparedStatement ps = null;
        try {
            c = mysqlISM.getConnection();
            ps = c.prepareStatement(sql);
            ps.setInt(1,book.getBook_volume());
            ps.setInt(2,book.getBook_id());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据返回用户上架图书
     */
    public List<Book> userGetBook(int userId){
        List<Book> userPutawayBook = new ArrayList<>();
        String sql = "select * from book where bookuserid=" + userId;
        Connection c = null;
        Statement s = null;
        try {
            c = mysqlISM.getConnection();
            s = c.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()){
                Book book = new Book();
                book.setBook_id(rs.getInt("bookid")); //图书id
                book.setBook_name(rs.getString("bookname")); //书名
                book.setBook_type(rs.getString("booktype")); //类型
                book.setBook_intro(rs.getString("bookintro")); //简介
                book.setBook_money(rs.getDouble("bookmoney")); //价格
                book.setBook_volume(rs.getInt("bookvolume")); //销量
                book.setBook_userid(rs.getInt("bookuserid")); //上架用户id
                book.setBook_path(rs.getString("bookpath")); //封面
                userPutawayBook.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userPutawayBook;
    }

    /**
     * 删除图书
     */
    public void deleteBook(String bookid){
        String sql = "delete from book where bookid=" + Integer.parseInt(bookid);
        Connection c = null;
        Statement s = null;
        try {
            c = mysqlISM.getConnection();
            s = c.createStatement();
            s.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据图书名返回图书
     */
    public List<Book> getQueryBook(String bookName){
        List<Book> list = new ArrayList<>();
        StringBuffer sb = new StringBuffer();
        sb.append("\"");
        sb.append(bookName);
        sb.append("\"");
        String sql = "select * from book where bookname = " + sb;
        Connection c = null;
        Statement s = null;

        try {
            c = mysqlISM.getConnection();
            s = c.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()){
                Book book = new Book();
                book.setBook_id(rs.getInt("bookid")); //图书id
                book.setBook_name(rs.getString("bookname")); //书名
                book.setBook_type(rs.getString("booktype")); //类型
                book.setBook_intro(rs.getString("bookintro")); //简介
                book.setBook_money(rs.getDouble("bookmoney")); //价格
                book.setBook_volume(rs.getInt("bookvolume")); //销量
                book.setBook_userid(rs.getInt("bookuserid")); //上架用户id
                book.setBook_path(rs.getString("bookpath")); //封面
                list.add(book);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}

package com.ly.dao;

import com.ly.entity.Book;
import com.ly.instrument.MysqlISM;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    MysqlISM mysqlISM = new MysqlISM();

    /**
     * 返回全部图书
     * @return
     */
    public List listBook(){
        String sql = "select * from book";
        Connection c = null;
        Statement s = null;
        List book_list = new ArrayList();
        Book book = new Book();
        try {
            c = mysqlISM.getConnection();
            s = c.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()){
                book.setBook_id(rs.getInt("bookid"));
                book.setBook_name(rs.getString("bookname"));
                book.setBook_type(rs.getString("booktype"));
                book.setBook_intro(rs.getString("bookintro"));
                book.setBook_money(rs.getDouble("bookmoney"));
                book.setBook_volume(rs.getInt("bookvolume"));
                book_list.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book_list;
    }
}

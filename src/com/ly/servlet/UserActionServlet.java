package com.ly.servlet;

import com.ly.dao.BookDAO;
import com.ly.dao.UserDAO;
import com.ly.entity.Book;
import com.ly.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "UserActionServlet")
public class UserActionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null){
            if (request.getParameter("action").equals("buybook")){
                BuyBook(request,response,session);
            }
        } else {
            response.sendRedirect("user/userlogin.jsp");
        }


    }

    // 处理购买图书
    public void BuyBook(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
        UserDAO userDAO = new UserDAO();
        BookDAO bookDAO = new BookDAO();
        String book_id = request.getParameter("bookid");
        User user = (User) session.getAttribute("user");
        Book book = bookDAO.getBook(book_id);
        String userbook = user.getUserbook();
        String[] userbookArrays = userbook.split(",");
        boolean time = true;
        for (String s : userbookArrays){
            if (s.equals(book_id)){
                time = false;
                break;
            }
        }
        if (time && book.getBook_userid() != user.getId()){

            // 写入图书id到用户表中
            StringBuffer sb = new StringBuffer();
            sb.append(user.getUserbook());
            sb.append(",");
            sb.append(book_id);
            user.setUserbook(sb.toString());

            // 扣除金额
            user.setUsermoney(user.getUsermoney() - book.getBook_money());

            // 上架图书用户添加金额
            User user1 = userDAO.getUser(book.getBook_userid());
            user1.setUsermoney(user1.getUsermoney() + book.getBook_money());

            // 图书销量增加
            book.setBook_volume(book.getBook_volume() + 1);

            // 更新购买用户信息
            userDAO.update(user);

            // 更新上架图书用户信息
            userDAO.update(user1);

            // 更新图书信息
            bookDAO.update(book);
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("userbook/userLibrary.jsp");
        }

    }
}

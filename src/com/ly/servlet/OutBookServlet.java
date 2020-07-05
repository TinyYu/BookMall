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
import java.io.IOException;
import java.util.List;

/**
 * 下架图书
 */
@WebServlet(name = "OutBookServlet")
public class OutBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("action").equals("outbook")){
            BookDAO bookDAO = new BookDAO();
            UserDAO userDAO = new UserDAO();

            String bookid = request.getParameter("bookid");

            // 返回图书信息
            Book book = bookDAO.getBook(bookid);


            // 返回上架用户
            User user = userDAO.getUser(book.getBook_userid());

            // 扣除违约金
            user.setUsermoney(user.getUsermoney() - (book.getBook_money() * 0.8 * book.getBook_volume()));
            // 更新上架用户信息
            userDAO.update(user);

            // 返回购买用户违约金
            List<User> users = userDAO.getUserBuyBook();
            for (User user1 : users){
                // 判断用户是否已经购买过图书
                String userbook = user1.getUserbook();
                String[] userbookArrays = userbook.split(",");
                // 删除图书
                StringBuffer sb = new StringBuffer();
                for (int i = 0;i < userbookArrays.length;i++){
                    if (userbookArrays[i].equals(bookid)){
                        userbookArrays[i] = "";
                        // 退还金额
                        user1.setUsermoney(user1.getUsermoney() + (book.getBook_money() * 0.6));
                    }
                    sb.append(",");
                    sb.append(userbookArrays[i]);
                }

                user1.setUserbook(sb.toString());

                // 更新用户信息
                userDAO.update(user1);
            }
            // 删除图书
            bookDAO.deleteBook(bookid);
            response.sendRedirect("userbook/userLibrary.jsp");
        }
    }
}

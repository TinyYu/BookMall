package com.ly.servlet;

import com.ly.dao.BookDAO;
import com.ly.entity.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 返回查询图书
 */
@WebServlet(name = "queryBookServlet")
public class queryBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String bookName = request.getParameter("bookName");

        BookDAO bookDAO = new BookDAO();
        List<Book> list = bookDAO.getQueryBook(bookName);
        request.setAttribute("listbooks",list);
        request.getRequestDispatcher("user/queryBook.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

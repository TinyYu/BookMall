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
import java.util.ArrayList;
import java.util.List;

/**
 * 用户书库
 */
@WebServlet(name = "UserLibraryServlet")
public class UserLibraryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        request.setAttribute("userBuyBook",userBuyBook(request,response,session));        
        request.setAttribute("userPutawayBook",userPutawayBook(request,response,session));
        request.getRequestDispatcher("userbook/userLibrary.jsp").forward(request,response);
    }

    // 返回用户已购买图书
    public List<Book> userBuyBook(HttpServletRequest request, HttpServletResponse response, HttpSession session){
        List<Book> listBook = new ArrayList<>();
        UserDAO userDAO = new UserDAO();
        BookDAO bookDAO = new BookDAO();
        /**
         * 获取用户已购买图书id
         */
        // 获取当前登陆用户信息
        User user = (User) session.getAttribute("user");
        // 用户已购买图书
        String userbook = user.getUserbook();
        String[] userBookArrays = userbook.split(",");

        // 根据图书id查找图书
        int count = 0;
        for (String s : userBookArrays){
            if (!s.equals("") && count != 4){
                Book book = new Book();
                book = bookDAO.getBook(s);
                listBook.add(book);
                count++;
            } else {
                continue;
            }

        }
        return listBook;
    }

    // 返回用户上架的图书
    public List<Book> userPutawayBook(HttpServletRequest request, HttpServletResponse response, HttpSession session){
        List<Book> listBooks = new ArrayList<>();
        BookDAO bookDAO = new BookDAO();

        // 获取当前用户id
        User user = (User) session.getAttribute("user");
        listBooks = bookDAO.userGetBook(user.getId());

        List<Book> listBook = new ArrayList<>();
        int count = 0;
        for (Book s : listBooks){
            if (count != 16){
                listBook.add(s);
            }
        }
        return listBook;
    }
}

package com.ly.servlet;

import com.ly.dao.BookDAO;
import com.ly.dao.UserDAO;
import com.ly.entity.Book;
import com.ly.entity.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 首页显示、用户上架图书、分类页显示
 */
@WebServlet(name = "BookServlet")
public class BookServlet extends HttpServlet {

    /**
     * 用户上架图书
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDAO bookDAO = new BookDAO();
        // 处理上架图书
        Book book = book_path(request,response);
        bookDAO.addBook(book);
        response.sendRedirect("index.jsp");
    }

    /**
     * 返回图书到页面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * 首页
         */
        if (request.getParameter("action") ==null){
            // 将图书返回给首页
            BookDAO bookDAO = new BookDAO();

            // 畅销小说
            List<Book> list = bookDAO.listBook_bestsellers();
            request.setAttribute("listBook_bestsellers",list);

            // 对小说分类
            List<Book> list1 = bookDAO.bookList();

            request.setAttribute("bookList_xh",classify("玄幻",list1));
            request.setAttribute("bookList_kh",classify("科幻",list1));
            request.setAttribute("bookList_ds",classify("都市",list1));
            request.setAttribute("bookList_wx",classify("武侠",list1));

            request.getRequestDispatcher("index.jsp").forward(request,response);
        } else if (request.getParameter("action").equals("book_xh")){           // 分类页
            BookDAO bookDAO = new BookDAO();
            List<Book> list1 = bookDAO.bookList();
            request.setAttribute("bookList_xh",classifys("玄幻",list1));
            request.getRequestDispatcher("booktype/book_xh.jsp").forward(request,response);
        } else if (request.getParameter("action").equals("book_kh")){           // 分类页
            BookDAO bookDAO = new BookDAO();
            List<Book> list1 = bookDAO.bookList();
            request.setAttribute("bookList_kh",classifys("科幻",list1));
            request.getRequestDispatcher("booktype/book_kh.jsp").forward(request,response);
        } else if (request.getParameter("action").equals("book_ds")){           // 分类页
            BookDAO bookDAO = new BookDAO();
            List<Book> list1 = bookDAO.bookList();
            request.setAttribute("bookList_ds",classifys("都市",list1));
            request.getRequestDispatcher("booktype/book_ds.jsp").forward(request,response);
        } else if (request.getParameter("action").equals("book_wx")){           // 分类页
            BookDAO bookDAO = new BookDAO();
            List<Book> list1 = bookDAO.bookList();
            request.setAttribute("bookList_wx",classifys("武侠",list1));
            request.getRequestDispatcher("booktype/book_wx.jsp").forward(request,response);
        } else if (request.getParameter("action").equals("have_bought")){       // 已购买图书分页
            HttpSession session = request.getSession();
            if (userBuyBook(request,response,session) == null){
                request.setAttribute("userBuyBook","您还没有消费过!");
            } else {
                request.setAttribute("userBuyBook",userBuyBook(request,response,session));
            }
            request.getRequestDispatcher("userbook/have_bought.jsp").forward(request,response);
        } else if (request.getParameter("action").equals("my_sell")){           // 已上架图书分页
            HttpSession session = request.getSession();
            List<Book> list = userPutawayBook(request,response,session);
            Book book = new Book();
            for (Book s : list){
                book = s;
                break;
            }
            if (book.getBook_name() == null){
                request.setAttribute("userPutawayBook","您还未上架过图书!");
            } else {
                request.setAttribute("userPutawayBook",userPutawayBook(request,response,session));
            }
            request.getRequestDispatcher("userbook/My_sell.jsp").forward(request,response);
        }
    }

    // 对小说分类 -- 首页
    public List<Book> classify(String type,List<Book> lists){
        List<Book> list = new ArrayList<>();
        int count = 0;
        for (Book book : lists){
            if (book.getBook_type().equals(type)){
                if (count != 4){
                    list.add(book);
                    count++;
                } else {
                    break;
                }
            }
        }
        return list;
    }

    // 对小说分类 -- 分类页
    public List<Book> classifys(String type,List<Book> lists){
        List<Book> list = new ArrayList<>();
        for (Book book : lists){
            if (book.getBook_type().equals(type)){
                list.add(book);
            }
        }
        return list;
    }

    /**
     * 处理上架图书，获取封面等信息
     *      封面保存到image/book_image/
     * @param request
     * @param response
     * @return
     */
    public Book book_path(HttpServletRequest request,HttpServletResponse response){
        Book book = new Book();
        // 1.判断是否是多段长传数据(只有是多段的数据，才是文件上传)
        if (ServletFileUpload.isMultipartContent(request)){
            // 创建FileItemFactory工厂实现类
            FileItemFactory fileItemFactory = new DiskFileItemFactory();
            // 用于解析上传文件的工具类
            ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);


            try {
                // 解析上传的数据,得到每一个表单项
                List<FileItem> list = servletFileUpload.parseRequest(request);

                // 判断，每一个表单项，是普通类型，还是上传文件
                for (FileItem fileItem : list){
                    if (fileItem.isFormField()){
                        // 普通表单项
                        if(fileItem.getFieldName().equals("book_name")){
                            book.setBook_name(fileItem.getString("UTF-8"));
                        }
                        if (fileItem.getFieldName().equals("book_type")){
                            book.setBook_type(fileItem.getString("UTF-8"));
                        }
                        if (fileItem.getFieldName().equals("book_intro")){
                            book.setBook_intro(fileItem.getString("UTF-8"));
                        }
                        if (fileItem.getFieldName().equals("book_money")){
                            book.setBook_money(Double.parseDouble(fileItem.getString("UTF-8")));
                        }
                        if (fileItem.getFieldName().equals("userid")){
                            if(fileItem.getString() == null){
                                book.setBook_userid(0);
                            } else {
                                book.setBook_userid(Integer.parseInt(fileItem.getString()));
                            }
                        }
                    } else {
                        // 上传文件
                        fileItem.write(new File("F:\\exploit\\Trchnology\\BookMall\\web\\image\\book_image\\" + fileItem.getName()));
                        StringBuffer sb = new StringBuffer();
                        sb.append("\"image/book_image/");
                        sb.append(fileItem.getName());
                        sb.append("\"");
                        book.setBook_path(sb.toString());
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return book;
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
        for (String s : userBookArrays){
            if (!s.equals("")){
                Book book = new Book();
                book = bookDAO.getBook(s);
                listBook.add(book);
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
        return listBooks;
    }

}

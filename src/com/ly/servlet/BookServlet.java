package com.ly.servlet;

import com.ly.dao.BookDAO;
import com.ly.entity.Book;
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
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BookServlet")
public class BookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDAO bookDAO = new BookDAO();
        // 处理上架图书
        Book book = book_path(request,response);
        bookDAO.addBook(book);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

    }

    // 对小说分类
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

    // 处理上架图书
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



}

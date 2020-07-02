package com.ly.servlet;

import com.ly.dao.UserDAO;
import com.ly.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * 注册
 */
@WebServlet(name = "UserServlet")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("login")){ // 登陆
            String username = request.getParameter("username");
            String userpassword = request.getParameter("userpassword");
            if (loginYz(username,userpassword)){ // 验证用户名、密码
                User user = new UserDAO().getUser(username);
                // 创建session
                HttpSession session = request.getSession();
                session.setAttribute("user",user);
                request.getRequestDispatcher("index.jsp").forward(request,response);
            } else {
                request.setAttribute("loginYz","用户名或密码错误!");
                request.setAttribute("username",username);
                request.getRequestDispatcher("user/userlogin.jsp").forward(request,response);
            }

        } else if (action.equals("register")){ // 注册

            String username = request.getParameter("username");
            String usereamil = request.getParameter("usereamil");

            if (!usernameYz(username)){ // 如果用户名已存在
                request.setAttribute("usernameYz","该用户名已存在!");
                request.setAttribute("username",username);
                request.getRequestDispatcher("user/userRegister.jsp").forward(request,response);
            } else if (!eamilYz(usereamil)){// 如果邮箱已存在
                request.setAttribute("eamilYz","该邮箱已被使用!");
                request.getRequestDispatcher("user/userRegister.jsp").forward(request,response);
            } else {
                String userpassword = request.getParameter("userpassword");
                double usermoney = 10000;
                int userstatus = 1;
                String userbook = null;
                User user = new User(username,userpassword,usereamil,userstatus,usermoney,userbook);
                new UserDAO().addHero(user);
                request.setAttribute("username",username);
                request.getRequestDispatcher("user/userlogin.jsp").forward(request,response);

            }
        } else if (action.equals("newPassword")){ // 修改密码、用户名
            String username = request.getParameter("username");
            User user = new UserDAO().getUser(username);
            user.setUserpassword(request.getParameter("userpassword"));
            user.setUsername(request.getParameter("newUsername"));
            new UserDAO().update(user);
            response.sendRedirect("user/userlogin.jsp");

        } else if (action.equals("eamil")) { // 验证邮箱
            String eamil = request.getParameter("usereamil");
            if (eamilYz(eamil)){
                User user = new UserDAO().getUserEamil(eamil);
                request.setAttribute("username",user.getUsername());
                request.getRequestDispatcher("user/userNewPassword.jsp").forward(request,response);
            } else {
                request.setAttribute("eamil",eamil);
                request.setAttribute("eamilYz","该邮箱不存在!");
                request.getRequestDispatcher("user/userEamil.jsp").forward(request,response);
            }
        } else if (action.equals("newName")){
            HttpSession session = request.getSession();
            System.out.println(session == null);
            if (session == null){
                response.sendRedirect("user/userlogin.jsp");
            } else {
                String newName = request.getParameter("newUserName");
                User user = (User) session.getAttribute("user");
                new  UserDAO().update(user);
                response.sendRedirect("index.jsp");
            }

        }
    }

    // 登陆 -- 验证密码是否正确
    public boolean loginYz(String username,String password){
        User user = new UserDAO().getUser(username);
        if (password.equals(user.getUserpassword())){
            return true; // 用户名已存在
        } else {
            return false; // 用户名不存在，用户名可用
        }
    }

    // 验证邮箱
    public boolean eamilYz(String usereamil){
        User user = new UserDAO().getUserEamil(usereamil);
        if (usereamil.equals(user.getUsereamil())){
            return true; // 邮箱已存在
        } else {
            return false; // 邮箱不存在，邮箱可用
        }
    }

    // 验证用户名
    public boolean usernameYz(String username){
        User user = new UserDAO().getUser(username);
        if (username.equals(user.getUsername())){
            return false; // 用户名已存在，不能使用
        } else {
            return true; // 用户名可以使用
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action.equals("outuser")){ // 注销用户
            // 销毁session
            HttpSession session = req.getSession();
            session.invalidate();
            resp.sendRedirect("index.jsp");
        }
    }
}

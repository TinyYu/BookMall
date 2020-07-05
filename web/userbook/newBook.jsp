<%--
  Created by IntelliJ IDEA.
  User: 22978
  Date: 2020/7/1
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上架图书</title>
    <script src="<%=request.getContextPath()%>/lib/particles.min.js"></script>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        body{
            height: 100vh;
            /*background-color: #f5f6fa;*/
            font-family: FangSong;

        }
        a{
            text-decoration: none;
            color: #f5f6fa;
            font-size: 10px;
        }
        ul{
            list-style: none;
            width: 200px;
            height: 100%;
            background-color: #949FAC;
            box-shadow: 0px 0px 10px #888888;
        }
        li{
            height: 40px;
            color: #f5f6fa;
            text-align: center;
            padding-top: 15px;
        }
        .liHead{
            height: 100px;
            background-color: #949FAC;
        }
        .liHead:hover{
            background-color: #949FAC;
        }
        .liNa:hover{
            background-color: #353b48;
            cursor:pointer;
        }

        .spanUserName{
            color: #f5f6fa;
            font-size: 10px;
        }
        .liImg{
            display: inline-block;
            vertical-align: middle;
            width: 17px;
            height: 17px;
        }

        .newBookBox{
            position: absolute;
            top: 200px;
            left: 800px;
            width: 400px;
            height: 500px;
            background-color: #FDFDFD;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0px 0px 10px #888888;
        }
        .newBookBox input[type="text"]{
            background: transparent;
            display: inline-block;
            outline: none;
            border: 2px solid #E2E4E7;
            width: 200px;
            height: 20px;
            border-radius: 20px;
            text-align: center;
            margin: 10px auto;
        }
        .newBookBox input[type="submit"]{
            border: none;
            background-color: #3B9AFF;
            display: block;
            outline: none;
            width: 200px;
            height: 40px;
            border-radius: 20px;
            text-align: center;
            margin: 15px auto;
            color: #FDFDFD;
        }
        .newBookBox input[type="submit"]:hover{
            background-color: #007BFF;
        }
        label{
            display: inline-block;
            font-size: 18px;
            margin-top: 10px;
        }
        .background{
            position: absolute;
            display: block;
            top: 0;
            left: 0;
            z-index: -1;
        }
    </style>
    <script>
        window.onload = function () {
            Particles.init({
                selector:'.background',
                maxParticles: 200,
                minDistance:120,
                connectParticles:true
            });
        }
    </script>
</head>
<body>
    <%--    导航栏--%>
    <ul style="position: fixed;">
        <li class="liHead">
            <a href="../user/userUpdate.jsp" id="userMessage" style="display: inline-block;width: 50px;height: 50px;">
                <img src="../image/head1.png" width="50px" height="50px"/>
            </a>
            <br>
            <span class="spanUserName" id="span1">${sessionScope.user.getUsername() == null ? "用户名" : sessionScope.user.getUsername()}</span>
            <span id="span2" class="spanUserName"> | 余额: ${sessionScope.user.getUsername() == null ? "" : sessionScope.user.getUsermoney()}</span>

            <br>
            <span id="userSpan">${sessionScope.user.getUsername() == null ? "<a href=\"user/userlogin.jsp\">登陆</a> | <a href=\"user/userRegister.jsp\">注册</a>" : "<a href=\"http://localhost:8080/BookMall/user?action=outuser\">注销用户</a>"}</span>
        </li>

        <a href="../index.jsp"><li class="liNa"><img src="../image/Navigation_page.png" class="liImg"/> 首页</li></a>
        <a href="userLibrary.jsp"><li class="liNa"><img src="../image/Navigation_book.png" class="liImg"/> 我的书库</li></a>
        <a href="newBook.jsp"><li class="liNa" ><img src="../image/Navigation_store.png" class="liImg"/> 上架图书</li></a>
    </ul>

    <div class="newBookBox">
        <form action="http://localhost:8080/BookMall/book" method="post" enctype="multipart/form-data">
            <label>书名: </label><input name="book_name" type="text">
            <br/>
            <label style="position: absolute;left: 77px">类型: </label>
            <select name="book_type" style="position: absolute;top: 52px;left: 122px">
                <option value="玄幻">玄幻</option>
                <option value="科幻">科幻</option>
                <option value="都市">都市</option>
                <option value="武侠">武侠</option>
            </select>
            <br/>
            <label style="position: relative;top: -180px;">简介: </label><textarea name="book_intro" style="width: 200px;height: 200px;margin-top: 20px">小说简介 --作者</textarea>
            <br/>
            <label style="position: absolute;left: 50px">售价 ￥:</label><input name="book_money" type="text" style="margin-left: 50px">
            <br/>
            <label style="position: absolute;left: 77px">封面: </label><input type="file" name="book_path" style="margin-left: 100px;margin-top: 10px">
            <input type="hidden" value="${sessionScope.user.getId()}" name="userid">
            <input type="submit" value="上架图书">
        </form>
    </div>
    <canvas class="background"></canvas>
</body>
</html>

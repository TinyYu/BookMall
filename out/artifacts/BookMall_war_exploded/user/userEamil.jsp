<%--
  Created by IntelliJ IDEA.
  User: 22978
  Date: 2020/6/25
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>验证邮箱</title>
    <script src="<%=request.getContextPath()%>/lib/particles.min.js"></script>
    <style>
        /* 全局 */
        *{
            margin: 0;
            padding: 0;
        }
        body{
            height: 100vh;
            color: #718093;
            font-family: FangSong;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 16px;
        }
        .background{
            position: absolute;
            display: block;
            top: 0;
            left: 0;
            z-index: -1;
        }
        a{
            text-decoration: none;
            color: #3B9AFF;
        }

        /* 登陆模块 */
        .loginBox{
            width: 400px;
            height: 364px;
            background-color: #FDFDFD;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0px 0px 10px #888888;
        }

        /* 用户名和密码输入框 */
        .loginBox input[type="email"]{
            background: transparent;
            display: block;
            outline: none;
            border: 2px solid #E2E4E7;
            width: 300px;
            height: 40px;
            border-radius: 20px;
            text-align: center;
            margin: 10px auto;
        }

        /* 提交按钮 */
        .loginBox input[type="submit"]{
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
        .loginBox input[type="submit"]:hover{
            background-color: #007BFF;
        }
        /* 文字 */
        h2{
            display: inline-block;
            margin-top: 10px;
        }
        label{
            display: inline-block;
            font-size: 18px;
            margin-top: 40px;
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
    <div class="loginBox">
        <h2>验证邮箱</h2>
        <form action="http://localhost:8080/BookMall/user" method="post">
            <label>输入邮箱重置密码</label>
            <input type="email" name="usereamil" value="${eamil}"/>
            <span style="color: red">${requestScope.eamilYz ? "" : requestScope.eamilYz}</span>
            <input type="submit" value="重置密码"/>
            <input type="hidden" name="action" value="eamil">
            <span>知道你的密码?</span><a href="userlogin.jsp">登陆</a>
        </form>
    </div>
    <canvas class="background"></canvas>
</body>
</html>

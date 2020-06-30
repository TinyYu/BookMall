<%--
  Created by IntelliJ IDEA.
  User: 22978
  Date: 2020/6/25
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重置密码</title>
    <script src="<%=request.getContextPath()%>/lib/particles.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/jquery.min.js"></script>
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
            height: 500px;
            background-color: #FDFDFD;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0px 0px 10px #888888;
        }
        /* 用户名和密码输入框 */
        .loginBox input[type="password"],.loginBox input[type="text"]{
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
            margin-top: 20px;
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
        $(function () {
            $("#newPassword").click(function () {
                // 验证密码
                var password = $("#password").val();
                var userpasswordPatt = /^\w{5,12}$/
                if (!userpasswordPatt.test(password)){
                    $("#span").html("密码长度5~12位!");
                    return false;
                }

                var password = $("#password").val();
                var password1 = $("#password1").val();
                if (password != password1) {
                    $("#span").html("密码不一致!");
                    return false;
                }

                // 验证用户名:必须由字母，数字下划线组成，并且长度5~12位
                // 1.获取用户名输入框里的内容
                var usernameText = $("#newUsername").val();
                // 2.创建正则表达式
                var usernamePatt = /^\w{5,12}$/
                // 3.使用test方法验证
                if (!usernamePatt.test(usernameText)){
                    // 4.提示用户结果
                    $("#span").html("用户名必须由字母，数字下划线组成，并且长度5~12位!");
                    return false;
                }
            });

        })
    </script>
</head>
<body>
    <div class="loginBox">
        <h2>重置密码</h2>
        <form action="http://localhost:8080/BookMall/user" method="post">
            <label>新用户名</label>
            <input type="text" name="newUsername" id="newUsername">
            <label>新密码</label>
            <input type="password" name="userpassword" id="password"/>
            <label>确认新密码</label>
            <input type="password" name="userpassword1" id="password1"/>
            <span id="span" style="color: red"></span>
            <input type="hidden" name="action" value="newPassword">
            <input type="hidden" name="username" value="${username}">
            <input type="submit" value="重置密码和用户名" id="newPassword">
            <span>知道你的密码?</span><a href="userlogin.jsp">登陆</a>
        </form>
    </div>
    <canvas class="background"></canvas>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 22978
  Date: 2020/6/25
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
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

        /* 登陆模块 */
        .loginBox{
            width: 400px;
            height: 500px;
            background-color: #FDFDFD;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0px 0px 10px #888888;
            position: absolute;
        }
        /* 用户名、密码和邮箱输入框 */
        .loginBox input[type="text"],.loginBox input[type="password"],.loginBox input[type="email"]{
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

        /* 注册按钮 */
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
            position: relative;
            display: inline-block;
            font-size: 18px;
            margin-top: 10px;
            margin-right: 200px;
        }
        span{
            color: red;
            background-color: #FDFDFD;
            box-shadow: 0px 0px 10px #888888;
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
            $("#register").click(function () {
                // 验证用户名:必须由字母，数字下划线组成，并且长度5~12位
                // 1.获取用户名输入框里的内容
                var usernameText = $("#username").val();
                // 2.创建正则表达式
                var usernamePatt = /^\w{5,12}$/
                // 3.使用test方法验证
                if (!usernamePatt.test(usernameText)){
                    // 4.提示用户结果
                    $("#span").html("用户名必须由字母，数字下划线组成，并且长度5~12位!");
                    return false;
                }

                // 验证密码
                var userpasswordText = $("#userpassword").val();
                var userpasswordPatt = /^\w{5,12}$/
                if (!userpasswordPatt.test(userpasswordText)){
                    $("#span").html("密码长度5~12位!");
                    return false;
                }

                // 确认密码
                var userpasswordText1 = $("#userpassword1").val();
                if (userpasswordText1 != userpasswordText) {
                    $("#span").html("确认密码和密码不一致!");
                    return false;
                }

                $("#span").html("");


            });
        })
    </script>
</head>
<body>
    <div class="loginBox">
        <h2>注册账号</h2>
        <form action="http://localhost:8080/BookMall/user" method="post">
            <label>用户名</label>
            <input type="text" name="username" required="required" id="username" value="${requestScope.username}"/>
            <label>邮箱</label>
            <input type="email" name="usereamil" required="required" id="usereamil"/>
            <label>密码</label>
            <input type="password" name="userpassword" required="required" id="userpassword"/>
            <label>确认密码</label>
            <input type="password" name="userpassword1" required="required" id="userpassword1"/>
            <input type="hidden" name="action" value="register">
            <span id="span" style="color: red ">${empty requestScope.usernameYz ? "" : requestScope.usernameYz}</span>
            <input type="submit" value="注册" id="register">
        </form>
    </div>
    <canvas class="background"></canvas>
</body>
</html>

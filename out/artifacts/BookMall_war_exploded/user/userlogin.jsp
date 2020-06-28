<%--
  Created by IntelliJ IDEA.
  User: 22978
  Date: 2020/6/25
  Time: 8:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
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
        .loginBox input[type="text"],.loginBox input[type="password"]{
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

        /* 登陆按钮 */
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

    <div class="loginBox">
        <h2>登陆小说书城</h2>
        <form action="http://localhost:8080/BookMall/user" method="post">

            <label>用户名</label>
            <input type="text" name="username" required="required" value="${username}"/>

            <label>密码</label>
            <input type="password" name="userpassword" required="required"/>

            <!-- 登陆错误信息 -->
            <span style="color: red">${requestScope.loginYz ? "" : requestScope.loginYz}</span>

            <!-- 返回是登陆业务 -->
            <input type="hidden" name="action" value="login">

            <input type="submit" value="登陆"/>
            <img src="../image/lock.png" width="10px" height="10px"><a href="userEamil.jsp">忘记了密码?</a>
            <br/>
            <br/>
            <span>没有账户?</span><a href="userRegister.jsp">注册</a>
        </form>
    </div>
    <canvas class="background"></canvas>
</body>
</html>

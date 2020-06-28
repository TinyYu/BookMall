<%--
  Created by IntelliJ IDEA.
  User: 22978
  Date: 2020/6/28
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户信息</title>
    <script src="<%=request.getContextPath()%>/lib/particles.min.js"></script>
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
    <style>
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
        label{
            display: inline-block;
            font-size: 18px;
            margin-top: 10px;
        }
        .updateBox{
            width: 400px;
            height: 364px;
            background-color: #FDFDFD;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0px 0px 10px #888888;
        }
        .updateBox input[type="text"],.updateBox input[type="password"]{
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
        .updateBox input[type="submit"]{
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
        .updateBox input[type="submit"]:hover{
            background-color: #007BFF;
        }
        .background{
            position: absolute;
            display: block;
            top: 0;
            left: 0;
            z-index: -1;
        }

    </style>
</head>
<body>
    <div class="updateBox">
        <form action="" method="post" >
            <img src="../image/head1.png" width="50px" height="50px">
            <input type="file" name="newUserHead">
            <label>新的用户名</label>
            <input type="text" name="newUserName" value="">
            <label>余额</label>
            <input type="text" name="userMonye" value=""><a href="#">充值</a>
            <input type="submit" value="确定">
            <a href="<%=request.getContextPath()%>/index.jsp">取消</a>
        </form>
    </div>
    <canvas class="background"></canvas>
</body>
</html>

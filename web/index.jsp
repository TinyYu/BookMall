<%--
  Created by IntelliJ IDEA.
  User: 22978
  Date: 2020/6/24
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>小说书城</title>
    <link href="<%=request.getContextPath()%>/css/index_Navigation_Bar.css" type="text/css" rel="stylesheet"/>
    <script src="<%=request.getContextPath()%>/lib/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/particles.min.js"></script>
    <script>
      window.onload = function () {
        Particles.init({
          selector:'.background',
          maxParticles: 50,
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
        <a href="user/userUpdate.jsp" id="userMessage" style="display: inline-block;width: 50px;height: 50px;">
          <img src="image/head1.png" width="50px" height="50px"/>

        </a>
        <br>
        <a id="a1" style="cursor:pointer"><span class="spanUserName">${sessionScope.user.getUsername() == null ? "用户名" : sessionScope.user.getUsername()}</span></a>
        <a id="a2" style="cursor:pointer"><span class="spanUserName">| 余额:</span><span class="spanUserName">${sessionScope.user.getUsername() == null ? "" : sessionScope.user.getUsermoney()}</span></a>

        <br>
        <span id="userSpan">${sessionScope.user.getUsername() == null ? "<a href=\"user/userlogin.jsp\">登陆</a> | <a href=\"user/userRegister.jsp\">注册</a>" : "<a href=\"http://localhost:8080/BookMall/user?action=outuser\">注销用户</a>"}</span>
      </li>

      <li class="liNa"><img src="image/Navigation_page.png" class="liImg"/> 首页</li>
      <li class="liNa"><img src="image/Navigation_book.png" class="liImg"/> 我的书库</li>
      <li class="liNa"><img src="image/Navigation_store.png" class="liImg"/> 开设书店</li>
      <li class="liNa"><img src="image/Navigational_shopping_cart.png" class="liImg"/> 购物车</li>
      <li class="liNa"><img src="image/Navigation_collection.png" class="liImg"/> 收藏</li>
    </ul>
    <span class="spanSeek"><img src="image/seek.png" class="spanImg"><input type="text" name="bookName" class="spanSeekInput" placeholder="查找书名..."></span>
    <canvas class="background"></canvas>
  </body>
</html>

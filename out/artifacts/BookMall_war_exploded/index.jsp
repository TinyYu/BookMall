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
    <script>
      $(function () {
        <%response.sendRedirect("http://localhost:8080/BookMall/book");%>
      })
    </script>
    <style>

    </style>
  </head>
  <body>
<%--    导航栏--%>
    <ul style="position: fixed;">
      <li class="liHead">
        <a href="user/userUpdate.jsp" id="userMessage" style="display: inline-block;width: 50px;height: 50px;">
          <img src="image/head1.png" width="50px" height="50px"/>
        </a>
        <br>
        <span class="spanUserName" id="span1">${sessionScope.user.getUsername() == null ? "用户名" : sessionScope.user.getUsername()}</span>
        <span id="span2" class="spanUserName"> | 余额: ${sessionScope.user.getUsername() == null ? "" : sessionScope.user.getUsermoney()}</span>

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

    <div class="div1">
      <div class="div_herd">
        <h2>畅销小说</h2>
        <hr/>

        <div class="container">
          <div class="box">
            <div class="imgBx">
              <img src="image/book_image/DouPoCangQong.jpg">
            </div>
            <div class="content">
              <h2>斗破苍穹</h2>
              <p>这里是属于斗气的世界，
                没有花俏艳丽的魔法，
                有的，仅仅是繁衍到巅峰的斗气！--天蚕土豆</p>
              <a href="#">￥ 68</a>
            </div>
          </div>

          <div class="box">
            <div class="imgBx">
              <img src="image/book_image/DiBa.jpg">
            </div>
            <div class="content">
              <h2>帝霸</h2>
              <p>千万年前，李七夜栽下一株翠竹。 　　
                八百万年前，李七夜养了一条鲤鱼。 　　
                五百万年前，李七夜收养一个小女孩。 　　
                今天，李七夜一觉醒来，
                翠竹修练成神灵，鲤鱼化作金龙，
                小女孩成为九界女帝。--厌笔萧生</p>
              <a href="#">￥ 50</a>
            </div>
          </div>

          <div class="box">
            <div class="imgBx">
              <img src="image/book_image/XianNi.jpg">
            </div>
            <div class="content">
              <h2>仙逆</h2>
              <p>顺为凡，逆则仙，只在心中一念间…… --耳根</p>
              <a href="#">￥ 70</a>
            </div>
          </div>

          <div class="box">
            <div class="imgBx">
              <img src="image/book_image/ZheTian.jpg">
            </div>
            <div class="content">
              <h2>遮天</h2>
              <p>冰冷与黑暗并存的宇宙深处，九具庞大的龙尸拉着一口青铜古棺，
                亘古长存。
                这是太空探测器在枯寂的宇宙中捕捉到的一幅极其震撼的画面。
                九龙拉棺，究竟是回到了上古，还是来到了星空的彼... --辰东</p>
              <a href="#">￥ 108</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

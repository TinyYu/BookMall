<%--
  Created by IntelliJ IDEA.
  User: 22978
  Date: 2020/6/24
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>
    <title>小说书城</title>
    <link href="<%=request.getContextPath()%>/css/index_Navigation_Bar.css" type="text/css" rel="stylesheet"/>
    <script src="<%=request.getContextPath()%>/lib/jquery.min.js"></script>
    <script>
      $(function () {
          <c:if test="${empty listBook_bestsellers}">
              <%response.sendRedirect("http://localhost:8080/BookMall/book");%>
          </c:if>
      })
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
        <span class="spanUserName" id="span1">${sessionScope.user.getUsername() == null ? "用户名" : sessionScope.user.getUsername()}</span>
        <span id="span2" class="spanUserName"> | 余额: ${sessionScope.user.getUsername() == null ? "" : sessionScope.user.getUsermoney()}</span>

        <br>
        <span id="userSpan">${sessionScope.user.getUsername() == null ? "<a href=\"user/userlogin.jsp\">登陆</a> | <a href=\"user/userRegister.jsp\">注册</a>" : "<a href=\"http://localhost:8080/BookMall/user?action=outuser\">注销用户</a>"}</span>
      </li>

      <li class="liNa"><img src="image/Navigation_page.png" class="liImg"/> 首页</li>
      <li class="liNa"><img src="image/Navigation_book.png" class="liImg"/> 我的书库</li>
        <a href="book/newBook.jsp" id="newBook"><li class="liNa" ><img src="image/Navigation_store.png" class="liImg"/> 上架图书</li></a>
      <li class="liNa"><img src="image/Navigational_shopping_cart.png" class="liImg"/> 购物车</li>
    </ul>
    <span class="spanSeek"><img src="image/seek.png" class="spanImg"><input type="text" name="bookName" class="spanSeekInput" placeholder="查找书名..."></span>

    <div class="div1">
        <div class="div_herd">
            <h2>畅销小说</h2>
            <hr/>
            <div class="container">
                <c:forEach items="${listBook_bestsellers}" var="listbook" varStatus="st">
                    <div class="box">
                        <div class="imgBx">
                            <img src=${listbook.getBook_path()}>
                        </div>
                        <div class="content">
                            <h2>${listbook.getBook_name()}</h2>
                            <p>${listbook.getBook_intro()}</p>
                            <p>销量:${listbook.getBook_volume()}</p>
                            <a href="#">￥ ${listbook.getBook_money()}</a>
                            <a href="#">加入购物车</a>
                        </div>
                    </div>
                </c:forEach>
            </div> <!-- container -->
        </div> <!-- div_herd -->

        <div class="div_herd" style="top: 600px;">
            <h2>玄幻</h2>
            <a href="#">更多 》</a>
            <hr/>
            <div class="container">
                <c:forEach items="${bookList_xh}" var="listbook" varStatus="st">
                    <div class="box">
                        <div class="imgBx">
                            <img src=${listbook.getBook_path()}>
                        </div>
                        <div class="content">
                            <h2>${listbook.getBook_name()}</h2>
                            <p>${listbook.getBook_intro()}</p>
                            <p>销量:${listbook.getBook_volume()}</p>
                            <a href="#">￥ ${listbook.getBook_money()}</a>
                            <a href="#">加入购物车</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="div_herd" style="top: 1200px;">
            <h2>科幻</h2>
            <a href="#">更多 》</a>
            <hr/>
            <div class="container">
                <c:forEach items="${bookList_kh}" var="listbook" varStatus="st">
                    <div class="box">
                        <div class="imgBx">
                            <img src=${listbook.getBook_path()}>
                        </div>
                        <div class="content">
                            <h2>${listbook.getBook_name()}</h2>
                            <p>${listbook.getBook_intro()}</p>
                            <p>销量:${listbook.getBook_volume()}</p>
                            <a href="#">￥ ${listbook.getBook_money()}</a>
                            <a href="#">加入购物车</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="div_herd" style="top: 1800px;">
            <h2>都市</h2>
            <a href="#">更多 》</a>
            <hr/>
            <div class="container">
                <c:forEach items="${bookList_ds}" var="listbook" varStatus="st">
                    <div class="box">
                        <div class="imgBx">
                            <img src=${listbook.getBook_path()}>
                        </div>
                        <div class="content">
                            <h2>${listbook.getBook_name()}</h2>
                            <p>${listbook.getBook_intro()}</p>
                            <p>销量:${listbook.getBook_volume()}</p>
                            <a href="#">￥ ${listbook.getBook_money()}</a>
                            <a href="#">加入购物车</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="div_herd" style="top: 2400px;">
            <h2>武侠</h2>
            <a href="#">更多 》</a>
            <hr/>
            <div class="container">
                <c:forEach items="${bookList_wx}" var="listbook" varStatus="st">
                    <div class="box">
                        <div class="imgBx">
                            <img src=${listbook.getBook_path()}>
                        </div>
                        <div class="content">
                            <h2>${listbook.getBook_name()}</h2>
                            <p>${listbook.getBook_intro()}</p>
                            <p>销量:${listbook.getBook_volume()}</p>
                            <a href="#">￥ ${listbook.getBook_money()}</a>
                            <a href="#">加入购物车</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
  </body>
</html>

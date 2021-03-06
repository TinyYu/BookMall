<%--
  Created by IntelliJ IDEA.
  User: 22978
  Date: 2020/7/5
  Time: 7:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>玄幻小说</title>
    <link href="<%=request.getContextPath()%>/css/index_Navigation_Bar.css" type="text/css" rel="stylesheet"/>
    <script src="<%=request.getContextPath()%>/lib/jquery.min.js"></script>
    <script>
        $(function () {
            <c:if test="${empty bookList_xh}">
            <%response.sendRedirect("http://localhost:8080/BookMall/book?action=book_xh");%>
            </c:if>
            $("a.buybook").click(function () {
                var truthBeTold = window.confirm("注意:图书下架，回返图书价格60%!");
                if (truthBeTold){
                    return true;
                } else {
                    return false;
                }
            });
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

        <a href="index.jsp"><li class="liNa"><img src="image/Navigation_page.png" class="liImg"/> 首页</li></a>
        <a href="userbook/userLibrary.jsp"><li class="liNa"><img src="image/Navigation_book.png" class="liImg"/> 我的书库</li></a>
        <a href="userbook/newBook.jsp"><li class="liNa" ><img src="image/Navigation_store.png" class="liImg"/> 上架图书</li></a>
    </ul>

    <form action="http://localhost:8080/BookMall/query_book" method="post">
            <span class="spanSeek">
                <img src="<%=request.getContextPath()%>/image/seek.png" class="spanImg">
                <input type="text" name="bookName" class="spanSeekInput" placeholder="查找书名...">
                <input type="hidden" value="seek">
            </span>
    </form>

    <div class="div1">
        <div class="div_herd">
            <h2>玄幻小说</h2>
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
                            <a href="http://localhost:8080/BookMall/user_action?action=buybook&bookid=${listbook.getBook_id()}" class="buybook">￥ ${listbook.getBook_money()}</a>
                        </div>
                    </div>
                </c:forEach>
            </div> <!-- container -->
        </div> <!-- div_herd -->
    </div>
</body>
</html>

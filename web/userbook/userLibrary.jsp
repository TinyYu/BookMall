<%--
  Created by IntelliJ IDEA.
  User: 22978
  Date: 2020/7/2
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>我的书库</title>
    <link href="<%=request.getContextPath()%>/css/index_Navigation_Bar.css" type="text/css" rel="stylesheet"/>
    <script src="<%=request.getContextPath()%>/lib/jquery.min.js"></script>
<%--    <style>--%>
<%--        /* 导航栏 */--%>
<%--        *{--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--        }--%>
<%--        body{--%>
<%--            height: 100vh;--%>
<%--            /*background-color: #f5f6fa;*/--%>
<%--            font-family: FangSong;--%>

<%--        }--%>
<%--        a{--%>
<%--            text-decoration: none;--%>
<%--            color: #f5f6fa;--%>
<%--            font-size: 10px;--%>
<%--        }--%>
<%--        ul{--%>
<%--            list-style: none;--%>
<%--            width: 200px;--%>
<%--            height: 100%;--%>
<%--            background-color: #949FAC;--%>
<%--            box-shadow: 0px 0px 10px #888888;--%>
<%--        }--%>
<%--        li{--%>
<%--            height: 40px;--%>
<%--            color: #f5f6fa;--%>
<%--            text-align: center;--%>
<%--            padding-top: 15px;--%>
<%--        }--%>
<%--        .liHead{--%>
<%--            height: 100px;--%>
<%--            background-color: #949FAC;--%>
<%--        }--%>
<%--        .liHead:hover{--%>
<%--            background-color: #949FAC;--%>
<%--        }--%>
<%--        .liNa:hover{--%>
<%--            background-color: #353b48;--%>
<%--            cursor:pointer;--%>
<%--        }--%>
<%--        .spanUserName{--%>
<%--            color: #f5f6fa;--%>
<%--            font-size: 10px;--%>
<%--        }--%>
<%--        .liImg{--%>
<%--            display: inline-block;--%>
<%--            vertical-align: middle;--%>
<%--            width: 17px;--%>
<%--            height: 17px;--%>
<%--        }--%>

<%--        /* 搜索栏 */--%>
<%--        .spanSeek{--%>
<%--            position: fixed;--%>
<%--            left: 30%;--%>
<%--            top: 1%;--%>
<%--            background-color: #949FAC;--%>
<%--            display: inline-block;--%>
<%--            width: 800px;--%>
<%--            height: 40px;--%>
<%--            text-align: center;--%>
<%--            line-height: 40px;--%>
<%--            border-radius: 5px;--%>
<%--            z-index: 2;--%>

<%--        }--%>
<%--        .spanImg{--%>
<%--            width: 30px;--%>
<%--            height: 30px;--%>
<%--            position: absolute;--%>
<%--            top: 5px;--%>
<%--            left: 4px;--%>
<%--        }--%>
<%--        .spanSeekInput{--%>
<%--            position: absolute;--%>
<%--            left: 40px;--%>
<%--            top: 5px;--%>
<%--            height: 30px;--%>
<%--            width: 750px;--%>
<%--            border: none;--%>
<%--            background-color: transparent;--%>
<%--            outline: none;--%>
<%--        }--%>

<%--        /* 商品 */--%>
<%--        .div1 {--%>
<%--            position: relative;--%>
<%--            left: 200px;--%>
<%--            background-color: #353b48;--%>
<%--            width: 1700px;--%>
<%--            height: 3000px;--%>
<%--        }--%>
<%--        .div1 .div_herd{--%>
<%--            position: absolute;--%>
<%--            width: 70%;--%>
<%--            top: 100px;--%>
<%--            left: 200px;--%>
<%--            color: #f5f6fa;--%>
<%--        }--%>
<%--        .container{--%>
<%--            position: relative;--%>
<%--            width: 100%;--%>
<%--            display: flex;--%>
<%--            flex-wrap: wrap;--%>
<%--            justify-content: space-around;--%>
<%--        }--%>
<%--        .container .box{--%>
<%--            position: relative;--%>
<%--            width: 280px;--%>
<%--            height: 400px;--%>
<%--            margin: 20px 0;--%>
<%--            box-sizing: border-box;--%>
<%--            overflow: hidden; /* 隐藏溢出内容 */--%>
<%--        }--%>
<%--        .container .box .imgBx{--%>
<%--            position: absolute;--%>
<%--            top: 0;--%>
<%--            left: 0;--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--            background: #000;--%>
<%--            clip-path: circle(400px at center 100px);--%>
<%--            transition: 0.5s;--%>
<%--        }--%>
<%--        .container .box .imgBx img{--%>
<%--            width: 280px;--%>
<%--            height: 400px;--%>
<%--        }--%>
<%--        .container .box:hover .imgBx{--%>
<%--            clip-path: circle(80px at center 100px);--%>
<%--        }--%>
<%--        .container .box:hover .imgBx img{--%>
<%--            position: absolute;--%>
<%--            top: 0;--%>
<%--            left: 0;--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--            object-fit: cover;--%>
<%--        }--%>
<%--        .container .box .content{--%>
<%--            position: absolute;--%>
<%--            bottom: 0;--%>
<%--            left: 0;--%>
<%--            height: 55%;--%>
<%--            padding: 20px;--%>
<%--            box-sizing: border-box;--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--        .container .box .content h2{--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--        }--%>
<%--        .container .box .content a{--%>
<%--            text-decoration: none;--%>
<%--            background: #000;--%>
<%--            color: #fff;--%>
<%--            padding: 5px;--%>
<%--            display: inline-block;--%>
<%--        }--%>
<%--        .container .box .content h2,--%>
<%--        .container .box .content p,--%>
<%--        .container .box .content a{--%>
<%--            opacity: 0;--%>
<%--            transition: 0.5s;--%>
<%--            transform: translateY(20px);--%>
<%--        }--%>
<%--        .container .box:hover .content h2{--%>
<%--            opacity: 1;--%>
<%--            transform: translateY(0px);--%>
<%--            transition-delay: 0.5s;--%>
<%--        }--%>
<%--        .container .box:hover .content p{--%>
<%--            opacity: 1;--%>
<%--            transform: translateY(0px);--%>
<%--            transition-delay: 0.7s;--%>
<%--        }--%>
<%--        .container .box:hover .content a{--%>
<%--            opacity: 1;--%>
<%--            transform: translateY(0px);--%>
<%--            transition-delay: 0.9s;--%>
<%--        }--%>
<%--    </style>--%>
    <script>
        $(function () {
            <c:if test="${empty userBuyBook}">
                <%response.sendRedirect("http://localhost:8080/BookMall/user_library");%>
            </c:if>

            $("a#outbook").click(function () {
                var truthBeTold = window.confirm("注意:下架图书将从您的账户中扣除 (图书价格80%) * (销售量) 的违约金!");
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
            <img src="<%=request.getContextPath()%>/image/head1.png" width="50px" height="50px"/>
            <br>
            <span class="spanUserName" id="span1">${sessionScope.user.getUsername() == null ? "用户名" : sessionScope.user.getUsername()}</span>
            <span id="span2" class="spanUserName"> | 余额: ${sessionScope.user.getUsername() == null ? "" : sessionScope.user.getUsermoney()}</span>
            <br>
            <span id="userSpan">${sessionScope.user.getUsername() == null ? "<a href=\"user/userlogin.jsp\">登陆</a> | <a href=\"user/userRegister.jsp\">注册</a>" : "<a href=\"http://localhost:8080/BookMall/user?action=outuser\">注销用户</a>"}</span>
        </li>

        <a href="<%=request.getContextPath()%>/index.jsp"><li class="liNa"><img src="<%=request.getContextPath()%>/image/Navigation_page.png" class="liImg"/> 首页</li></a>
        <a href="<%=request.getContextPath()%>/userbook/userLibrary.jsp"><li class="liNa"><img src="<%=request.getContextPath()%>/image/Navigation_book.png" class="liImg"/> 我的书库</li></a>
        <a href="<%=request.getContextPath()%>/userbook/newBook.jsp"><li class="liNa" ><img src="<%=request.getContextPath()%>/image/Navigation_store.png" class="liImg"/> 上架图书</li></a>
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
            <h2>已购买</h2>
            <a href="<%=request.getContextPath()%>/userbook/have_bought.jsp">更多 》</a>
            <hr/>
            <div class="container">
                <c:forEach items="${userBuyBook}" var="listbook" varStatus="st">
                    <div class="box">
                        <div class="imgBx">
                            <img src=${listbook.getBook_path()}>
                        </div>
                        <div class="content">
                            <h2>${listbook.getBook_name()}</h2>
                            <p>${listbook.getBook_intro()}</p>
                            <p>销量:${listbook.getBook_volume()}</p>
                            <a href="#">阅读</a>
                        </div>
                    </div>
                </c:forEach>
            </div> <!-- container -->
        </div> <!-- div_herd -->

        <div class="div_herd" style="top: 600px;">
            <h2>我的上架</h2>
            <a href="<%=request.getContextPath()%>/userbook/My_sell.jsp">更多 》</a>
            <hr/>
            <div class="container">
                <c:forEach items="${userPutawayBook}" var="listbook" varStatus="st">
                    <div class="box">
                        <div class="imgBx">
                            <img src=${listbook.getBook_path()}>
                        </div>
                        <div class="content">
                            <h2>${listbook.getBook_name()}</h2>
                            <p>${listbook.getBook_intro()}</p>
                            <p>销量:${listbook.getBook_volume()}</p>
                            <a href="#">￥ ${listbook.getBook_money()}</a>
                            <a href="http://localhost:8080/BookMall/out_book?action=outbook&bookid=${listbook.getBook_id()}" id="outbook">下架图书</a>
                            <a href="#">阅读</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>


</body>
</html>

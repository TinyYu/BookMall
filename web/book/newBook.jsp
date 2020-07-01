<%--
  Created by IntelliJ IDEA.
  User: 22978
  Date: 2020/7/1
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上架图书</title>
</head>
<body>
    <form action="http://localhost:8080/BookMall/book" method="post" enctype="multipart/form-data">
        书名: <input name="book_name" type="text">
        类型:
        <select name="book_type">
            <option value="玄幻">玄幻</option>
            <option value="科幻">科幻</option>
            <option value="都市">都市</option>
            <option value="武侠">武侠</option>
        </select>
        简介: <textarea name="book_intro">小说简介 --作者</textarea>
        售价 ￥:<input name="book_money" type="text">
        封面: <input type="file" name="book_path">
        <input type="hidden" value="${sessionScope.user.getId()}" name="userid">
        <input type="submit" value="上架图书">
    </form>
</body>
</html>

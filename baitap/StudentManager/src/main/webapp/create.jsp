<%--
  Created by IntelliJ IDEA.
  User: NGO MAI
  Date: 25/01/2022
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Creat new student</h1>
<from action="/students?param=createPost" method="post">
    <label>ID:
        <input type="text" name="id">
    </label><br>
    <label>Name:
        <input type="text" name="name">
    </label><br>
    <label>Age:
        <input type="text" name="age">
    </label><br>
    <label>Address:
        <input type="text" name="address">
    </label><br>
    <label>Avg:
        <input type="text" name="avg">
    </label><br>
    <button type="submit">Create</button>
</from>
</body>
</html>

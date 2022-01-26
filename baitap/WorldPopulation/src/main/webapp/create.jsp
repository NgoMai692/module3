<%--
  Created by IntelliJ IDEA.
  User: NGO MAI
  Date: 26/01/2022
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create City</title>
</head>
<body>
<h1>Create new city</h1>
<form action="/cities?param=createPost" method="post">
    <label>ID:
        <input type="text" name="id">
    </label><br>
    <label>Name:
        <input type="text" name="name">
    </label><br>
    <label>Acreage:
        <input type="text" name="acreage">
    </label><br>
    <label>Population:
        <input type="text" name="population">
    </label><br>
    <label>GDP:
        <input type="text" name="gdp">
    </label><br>
    <label>Country:
        <input type="text" name="country">
    </label><br>
    <button type="submit">Create</button>
</form>
</body>
</html>

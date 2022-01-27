<%--
  Created by IntelliJ IDEA.
  User: NGO MAI
  Date: 27/01/2022
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Create new product</h1>
<form action="/products?action=createPost" method="post">
  <label>ID:
    <input type="text" name="id">
  </label><br>
  <label>Name:
    <input type="text" name="name">
  </label><br>
  <label>Price:
    <input type="text" name="price">
  </label><br>
  <label>:Quantity:
    <input type="text" name="quantity">
  </label><br>
  <label>Description:
    <input type="text" name="description">
  </label><br>
  <button type="submit">Create</button>
</form>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: NGO MAI
  Date: 25/01/2022
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h2>Product Discount Calculator</h2>
<form  action="/DiscountServlet" method="post">
    <label>Product: </label><br/>
    <input type="text" name="product" placeholder="Description" value="22000"/><br/>
    <label>Price: </label><br/>
    <input type="text" name="price" placeholder="List Price" value="0"/><br/>
    <label>Discount Percent: </label><br/>
    <input type="text" name="discount_percent" placeholder="Discount Percent" value="0"/><br/>
    <input type = "submit" id = "submit" value = "Converter"/>
</form>
</body>
</html>

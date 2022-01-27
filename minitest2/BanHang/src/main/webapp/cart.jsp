<%--
  Created by IntelliJ IDEA.
  User: NGO MAI
  Date: 27/01/2022
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Your Cart</h1>
<br/>
<br/>
<table>
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Price</td>
        <td>Quantity</td>
        <td>Description</td>
        <td colspan="2">Action</td>
    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getQuantity()}</td>
            <td>${product.getDescription()}</td>
            <td>
                <button><a style="text-decoration: none" href="/products?action=delete&id=${product.getId()}">Delete</a></button>
            </td>
        </tr>
    </c:forEach>
    <button><a style="text-decoration: none" href="/products?action=pay"></a> Pay</button>
</table>
</body>
</html>

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
<button><a style="text-decoration: none" href="/products"></a> Back home</button>
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
    <c:forEach items="${carts}" var="cart">
        <tr>
            <td>${cart.getId()}</td>
            <td>${cart.getName()}</td>
            <td>${cart.getPrice()}</td>
            <td>${cart.getQuantity()}</td>
            <td>${cart.getDescription()}</td>
            <td>
                <button><a style="text-decoration: none" href="/products?action=delete&id=${cart.getId()}">Delete</a></button>
            </td>
        </tr>
    </c:forEach>
    <a style="text-decoration: none" href="/products?action=pay"> Pay</a>
</table>
</body>
</html>

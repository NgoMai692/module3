<%--
  Created by IntelliJ IDEA.
  User: NGO MAI
  Date: 27/01/2022
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>All Products</title>
</head>
<body>
<h1>All Product</h1>
<button type="submit"><a style="text-decoration: none" href="/products?action=sortIncrease">Sap xep tang</a> </button>
<button type="submit"><a style="text-decoration: none" href="/products?action=sortDecrease">Sap xep giam</a> </button>
<button type="submit"><a style="text-decoration: none" href= "/products?action=cart">Sang gio hang</a> </button>
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
                <button><a style="text-decoration: none" href="/products?action=detail&id=${product.getId()}">detail</a></button>
            </td>
            <td>
                <button><a style="text-decoration: none" href="/products?action=cartAdd&id=${product.getId()}">Add cart</a></button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

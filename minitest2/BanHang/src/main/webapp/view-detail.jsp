<%--
  Created by IntelliJ IDEA.
  User: NGO MAI
  Date: 27/01/2022
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product</h1>
<p>Id: ${product.getId()}</p>
<p>Name: ${product.getName()}</p>
<p>Price: ${product.getPrice()}</p>
<p>Quantity: ${product.getQuantity()}</p>
<p>Description: ${product.getDescription()}</p>
</body>
</html>

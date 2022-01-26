<%--
  Created by IntelliJ IDEA.
  User: NGO MAI
  Date: 26/01/2022
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        table,tr,th{
            border: solid black;
            width: 100%;
        }
    </style>
</head>
<body>
<h1>All Cities</h1>
<button><a href="/cities?param=createGet">Create new City</a></button>
<button><a href="/cities?param=sort">Sắp xếp theo dân số</a></button>
<br>
<br>
<form action="/cities?param=search" method="post">
    <label><input type="text" name="search-name"></label>
    <button type="submit">Search</button>
</form>

<table>
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Acreage</td>
        <td>Population</td>
        <td>GDP</td>
        <td>Country</td>
        <td colspan="2">Action</td>
    </tr>

    <c:forEach items="${cities}" var="city">
        <tr>
            <td>${city.getId()}</td>
            <td>${city.getName()}</td>
            <td>${city.getAcreage()}</td>
            <td <c:if test="${city.getPopulation() > 1000000}"> style="color: red" </c:if>>${city.getPopulation()}</td>
            <td <c:if test="${city.getGdp() < 10000}">style="color: red" </c:if>>${city.getGdp()}</td>
            <td>${city.getCountry()}</td>
            <td>
                <button><a href="">Edit</a></button>
            </td>
            <td>
                <button><a href="">Delete</a></button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

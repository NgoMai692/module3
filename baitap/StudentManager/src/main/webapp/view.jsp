<%--
  Created by IntelliJ IDEA.
  User: NGO MAI
  Date: 25/01/2022
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>All Students</h1>
<button><a href="/students?param=createGet">Create new student</a></button>
<button><a href="/students?param=sort">Sắp xếp</a></button>
<button><a href="/students?param=great">SV giỏi</a></button>
<br>
<br>
<form >
    <label><input type="text" name="search"></label>
    <button>Search</button>
</form>
<table>
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Age</td>
        <td>Address</td>
        <td>Average</td>
        <td colspan="2">Action</td>
    </tr>
    <c:forEach items="${students}" var="student">
        <tr>
            <td>${student.getId()}</td>
            <td>${student.getName()}</td>
            <td>${student.getAge()}</td>
            <td>${student.getAddress()}</td>
            <td>${student.getAvg()}</td>
            <td><button><a href="">Edit</a> </button></td>
            <td><button><a href="">Delete</a> </button></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>

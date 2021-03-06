<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Search result</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />

</head>
<body>
<h1>Search results</h1>

<c:choose>
  <c:when test="${!empty foundedUsers}">
  <table class="tg">
    <tr>
      <th width="80">ID</th>
      <th width="120">Name</th>
      <th width="120">Age</th>
      <th width="120">Admin</th>
      <th width="120">CreateDate</th>
      <th width="60">Edit</th>
      <th width="60">Delete</th>
    </tr>
    <c:forEach items="${foundedUsers}" var="user">
      <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.age}</td>
        <td>${user.admin}</td>
        <td><fmt:formatDate value="${user.createDate}" />"</td>
        <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
        <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
      </tr>
    </c:forEach>
  </table>
      <br>
      <h3> <a href="<c:url value="/users"/>">Back</a></h3>
  </c:when>
  <c:when test="${empty foundedUsers}">
    <h3>There is nothing to show.</h3>
      <h3> <a href="<c:url value="/users"/>">Back</a></h3>

  </c:when>
</c:choose>

<form:form method="post" commandName="user" action="findUser">

  <form:label path="name">Name</form:label>
  <form:input path="name"/>

</form:form>
</body>
</html>

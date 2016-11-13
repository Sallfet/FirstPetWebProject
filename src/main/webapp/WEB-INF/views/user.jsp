<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ page session="false" %>
<html>
<head>
    <title>Users Page</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
    <body>
<c:url var="addAction" value="/user/add"/>

<form:form action="${addAction}" commandName="user">
    <table>
        <c:if test="${!empty user.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="Age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Edit User"/>"/>
                </c:if>
                <c:if test="${empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Add User"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

<h1>Users list</h1>

<table>
    <display:table border="1" id="user" name="listUsers" requestURI="" pagesize="8" >
        <display:column property="id" title="ID" sortable="true"/>
        <display:column property="name" title="User Name" sortable="true"/>
        <display:column property="age" title="User Age" sortable="true"/>
        <display:column property="admin" title="Admin" sortable="true"/>
        <display:column property="createDate" title="CreateDate" sortable="true"/>
        <display:column property="link1" title="Edit"/>
        <display:column property="link2" title="Delete"/>
    </display:table>
</table>

<br/>
<br/>
<br/>

<a href="<c:url value="/search"/>" target="_blank">Search</a>
<br>
<a href="../../index.jsp">Back to main menu</a>
    </body>
</html>

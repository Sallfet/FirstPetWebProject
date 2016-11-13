<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Users Page</title>
    <style>

        html, body, div, span, applet, object, iframe,
        p, blockquote, pre,
        a, abbr, acronym, address, big, cite, code,
        del, dfn, em, font, img, ins, kbd, q, s, samp,
        small, strike, strong, sub, sup, tt, var,
        b, u, i, center,
        dl, dt, dd, ol, ul, li,
        fieldset, label, legend,
        caption, tbody, tfoot, thead, tr, th, td {
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            font-size: 100%;

            background: transparent;
        }
        body {
            line-height: 1;
        }
        ol, ul {
            list-style: none;
        }
        blockquote, q {
            quotes: none;
        }
        blockquote:before, blockquote:after, q:before, q:after {
            content: ''; content: none;
        }
        :focus {
            outline: 0;
        }
        del {
            text-decoration: line-through;
        }
        table {
            border-spacing: 0;
        }
        
        body{
            font-family:Fedra Sans, Helvetica, sans-serif;
        }
        a:link {
            color: #666;
            font-weight: bold;
            text-decoration:none;
        }
        a:visited {
            color: #666;
            font-weight:bold;
            text-decoration:none;
        }
        a:active,
        a:hover {
            color: #bd5a35;
            text-decoration:underline;
        }

        #add{
            position: absolute;
            left: 800px;
            top: 45px;

        }

        #tab{

        }

        #back{

        }

        table a:link {
            color: #666;
            font-weight: bold;
            text-decoration:none;
        }
        table a:visited {
            color: #999999;
            font-weight:bold;
            text-decoration:none;
        }
        table a:active,
        table a:hover {
            color: #bd5a35;
            text-decoration:underline;
        }
        table {
            font-family:Arial, Helvetica, sans-serif;
            color:#666;
            font-size:12px;
            text-shadow: 1px 1px 0px #fff;
            background:#eaebec;
            margin:20px;
            border:#ccc 1px solid;

            -moz-border-radius:3px;
            -webkit-border-radius:3px;
            border-radius:3px;

            -moz-box-shadow: 0 1px 2px #d1d1d1;
            -webkit-box-shadow: 0 1px 2px #d1d1d1;
            box-shadow: 0 1px 2px #d1d1d1;
        }
        table th {
            padding:21px 25px 22px 25px;
            border-top:1px solid #fafafa;
            border-bottom:1px solid #e0e0e0;

            background: #ededed;
            background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
            background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
        }
        table th:first-child{
            text-align: left;
            padding-left:20px;
        }
        table tr:first-child th:first-child{
            -moz-border-radius-topleft:3px;
            -webkit-border-top-left-radius:3px;
            border-top-left-radius:3px;
        }
        table tr:first-child th:last-child{
            -moz-border-radius-topright:3px;
            -webkit-border-top-right-radius:3px;
            border-top-right-radius:3px;
        }
        table tr{
            text-align: center;
            padding-left:20px;
        }
        table tr td:first-child{
            text-align: left;
            padding-left:20px;
            border-left: 0;
        }
        table tr td {
            padding:18px;
            border-top: 1px solid #ffffff;
            border-bottom:1px solid #e0e0e0;
            border-left: 1px solid #e0e0e0;

            background: #fafafa;
            background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
            background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
        }
        table tr.even td{
            background: #f6f6f6;
            background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
            background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
        }
        table tr:last-child td{
            border-bottom:0;
        }
        table tr:last-child td:first-child{
            -moz-border-radius-bottomleft:3px;
            -webkit-border-bottom-left-radius:3px;
            border-bottom-left-radius:3px;
        }
        table tr:last-child td:last-child{
            -moz-border-radius-bottomright:3px;
            -webkit-border-bottom-right-radius:3px;
            border-bottom-right-radius:3px;
        }
        table tr:hover td{
            background: #f2f2f2;
            background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
            background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);
        }

    </style>


</head>
    <body>

    <div id="add">
    <c:url var="addAction" value="/user/add"/>

    <br>
    <h3>Add a new user</h3>
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
                               value="<spring:message text="Edit user"/>"/>
                        <button onclick="window.location.href=window.location.href;">Cancel</button>
                    </c:if>
                    <c:if test="${empty user.name}">
                        <input type="submit"
                               value="<spring:message text="Add User"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>
</div>
<h3 >Users list</h3>

<div id="tab">
<table>
    <display:table border="1" id="user" name="listUsers" requestURI="" pagesize="8" >
        <display:column property="id" title="ID" sortable="true"/>
        <display:column property="name" title="User Name" sortable="true"/>
        <display:column property="age" title="User Age" sortable="true"/>
        <display:column property="admin" title="Admin" sortable="true"/>
        <display:column property="createDate" title="CreateDate" sortable="true"/>
        <display:column property="edit" title="Edit"/>
        <display:column property="delete" title="Delete"/>
    </display:table>
</table>
</div>
<br/>



<br>
<h3>Search</h3>
<br>

<form:form method="post" commandName="user" action="findUser">

    <form:label path="name">Name</form:label>
    <form:input path="name"/>

</form:form>

    <div id="back">
<br>
<a href="../../index.jsp">Back to main menu</a>
<br>
        </div>
    </body>
</html>

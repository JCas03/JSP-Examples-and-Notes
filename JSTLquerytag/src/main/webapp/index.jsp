<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>&lt;sql:param&gt; Demo</title>
</head>
<body>
    <h1>&lt;sql:param&gt; Demo</h1>
    <form name="newCitizenForm"
        action="${pageContext.request.contextPath}"
        method="POST">
        <table border="0">
            <tr>
                <td>* Enter SSN:</td>
                <td><input type="text" name="ssn" />
            </tr>
            <tr>
                <td>* Enter First Name:</td>
                <td><input type="text" name="firstName" />
            </tr>
            <tr>
                <td>* Enter Last Name:</td>
                <td><input type="text" name="lastName" />
            </tr>
            <tr>
                <td>* Enter Address:</td>
                <td><textarea rows="10" cols="5" name="address"></textarea>
            </tr>
            <tr>
                <td>* Enter Tel:</td>
                <td><input type="text" name="tel" />
            </tr>
            <tr>
                <td><input type="submit" value="Submit"/></td>
            </tr>
        </table>

    </form>
    <br/><br/>
    <sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/jstl_query" user="root" password="" />

    <c:choose>
    <c:when test="${not empty param.ssn
                                   && not empty param.firstName
                                   && not empty param.lastName
                                   && not empty param.address
                                   && not empty param.tel}">
        <sql:update dataSource="${myDS}" var="newCitizen">
            INSERT INTO user
                           (ssn,first_name, last_name, address, telephone) VALUES (?, ?, ?, ?,?)
            <sql:param value="${param.ssn}" />
            <sql:param value="${param.firstName}" />
            <sql:param value="${param.lastName}" />
            <sql:param value="${param.address}" />
            <sql:param value="${param.tel}" />
        </sql:update>
    </c:when>
    <c:otherwise>
        <font color="#cc0000">Please enter mandatory information.</font>
    </c:otherwise>
    </c:choose>

    <br/><br/>
    <sql:query dataSource="${myDS}" var="citizens">
        SELECT * from user;
    </sql:query>
    <table border="1">
        <c:forEach var="row" items="${citizens.rows}">
            <tr>
                <td><c:out value="${row.ssn}" /></td>
                <td><c:out value="${row.first_name}" /></td>
                <td><c:out value="${row.last_name}" /></td>
                <td><c:out value="${row.address}" /></td>
                <td><c:out value="${row.telephone}" /></td>
            </tr>
        </c:forEach>
    </table>
   </body>
</html>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.niit.hiberweb.UserDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Hibernate Demo</title>
</head>
<body>
<jsp:useBean id="userBean" class="com.niit.hiberweb.User"></jsp:useBean>
<jsp:setProperty property="*" name="userBean"/>
<%
int i=UserDao.register(userBean);
if(i>0)
	out.print("You are successfully resolved");
%>
</body>
</html>
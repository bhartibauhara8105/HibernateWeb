<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,com.niit.hiberweb.User" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DML Operations</title>
</head>
<body>
<h1>Hql DML Operations</h1>
<%
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf=cfg.buildSessionFactory();
Session sess=sf.openSession();
Transaction t=sess.beginTransaction();
String hql="update User set password=:password where id=:id";

Query query=sess.createQuery(hql);
query.setParameter("password","testing@123");
query.setParameter("id",3);

int rowAffected=query.executeUpdate();
if(rowAffected>0)
out.println("Rows Affected :"+rowAffected);
String hql1="delete from User where id=:id";
query=sess.createQuery(hql1);
query.setParameter("id",new Integer(10));

rowAffected= query.executeUpdate();
if(rowAffected>0)
{
	out.println("Deleted "+rowAffected+" rows");
}
t.commit();
sess.close();
sf.close();
%>
</body>
</html>
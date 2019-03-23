<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,com.niit.hiberweb.User,org.hibernate.criterion.*" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Criteria Object in Hibernate</title>
</head>
<body>
<%
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf=cfg.buildSessionFactory();
Session sess=sf.openSession();
//Transaction t=sess.beginTransaction();
Criteria cr=sess.createCriteria(User.class);

//cr.add(Restrictions.like("name","a%"));
cr.addOrder(Order.asc("name"));
cr.setMaxResults(5);
//cr.setFirstResult(1);
//cr.add(Restrictions.eq("id",2));

List<User> list=(List<User>) cr.list();
out.println("List of Users ::"+"<br>");
out.println("<table border='1'>");
out.println("<tr bgcolor='yellow'>");
out.println("<th>User Id</th>");
out.println("<th>User Name</th>");
out.println("<th>Email</th>");
out.println("</tr>");
Iterator it=list.iterator();
while(it.hasNext())
{
	User u=(User)it.next();
	out.println("<tr bgcolor='aqua'>");
	out.println("<td>"+u.getId()+"</th>");
	out.println("<td>"+u.getName()+"</th>");
	out.println("<td>"+u.getEmail()+"</th>");
	out.println("</tr>");
}
out.println("</table>");
//t.commit();
sess.close();
sf.close();

%>
</body>
</html>
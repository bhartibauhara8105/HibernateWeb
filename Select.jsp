<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,com.niit.hiberweb.User" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HQL Select</title>
</head>
<body>
<%
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf=cfg.buildSessionFactory();
Session sess=sf.openSession();
Transaction t=sess.beginTransaction();
Query query=sess.createQuery("from User");
List<User> list=(List<User>)query.list();
out.println("List of Employee::"+"<br>");
for(User st:list)
{
	out.println(st.getId()+" "+st.getName()+" "+st.getEmail()+"<br>");
}
out.println("<br/>");
String hql="select U.name from User U";
query=sess.createQuery(hql);
List<String> list1=query.list();
out.println("List the Names::"+"<br>");
for(String st : list1)
{
	out.println(st+"<br>");
}
out.println("<br/>");
query=sess.createQuery("select count(*) from User");
List<Integer> list2=query.list();
out.println("Total Names :"+"<br>");
out.println(list2.get(0)+"<br>");
out.println("<br/>");

query=sess.createQuery("from User U where U.id=:id");
query.setInteger("id",2);
List<User> list3=(List<User>) query.list();
out.println("List of Employees with Criteria ::"+"<br>");
for(User st:list3)
{
	out.println(st.getId()+","+st.getName()+","+st.getEmail()+"<br>");
}
query=sess.createQuery("select U.name from User U order by  U.name ");
List<String> list4=query.list();
out.println("List the Names::"+"<br>");
for(String st : list4)
{
	out.println(st+"<br>");
}

t.commit();
sess.close();
sf.close();
%>
</body>
</html>
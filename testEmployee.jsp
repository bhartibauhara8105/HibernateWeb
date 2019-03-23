<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,org.hibernate.*,org.hibernate.cfg.Configuration,com.niit.hiberweb.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hibernate Collection Mpapping Demo</title>
</head>
<body>
<%
Session sess=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
Transaction t=sess.beginTransaction();

Employee employee=new Employee();
employee.setEmployeeName("Bharti");
Set<String> phoneNumbers=new HashSet<String>();
phoneNumbers.add("9999994");
phoneNumbers.add("334235452");
phoneNumbers.add("46276376");
employee.setPhoneNumbers(phoneNumbers);
sess.save(employee);
t.commit();

Query query=sess.createQuery("from Employee");
List<Employee> list=(List<Employee>)query.list();
Iterator<Employee> itr=list.iterator();
while(itr.hasNext())
{
 Employee emp=itr.next();
 out.println("Employee Name :"+emp.getEmployeeName());
 
 Set<String> set=emp.getPhoneNumbers();
 Iterator<String> itr2=set.iterator();
 while(itr2.hasNext())
 {
	 out.println(itr2.next());
	 out.println();
 }
 out.println("<br>");
}
sess.close();
out.println("Success");
%>
</body>
</html>
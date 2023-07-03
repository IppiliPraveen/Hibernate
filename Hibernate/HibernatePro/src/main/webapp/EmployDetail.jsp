<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@page import="HibernateProject.HibernatePro.Employ"%>
<%@page import="java.util.List"%>
<%@page import="HibernateProject.HibernatePro.EmployDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
EmployDAO empDAO = new EmployDAO();
List<Employ> emp=null;

if(request.getParameter("empNo")!=null){
	out.println(request.getParameter("empNo"));
	emp = empDAO.getEmploy(Integer.parseInt(request.getParameter("empNo")));
	%>
<form action="UpdateEmploy.jsp">
<div id="details" align="center">
<table align="center" border="1" >
<tr>
<th>EmpNo</th>
<th>Employ Name</th>
<th>Gender</th>
<th>Dept</th>
<th>Desig</th>
<th>Basic</th>
</tr>

<%for(Employ em:emp ){
	%>
	<tr>
	<td><%=em.getEmpNo() %></td>
	<td><%=em.getName()%></td>
	<td><%=em.getGender()%></td>
	<td><%=em.getDept()%></td>
	<td><%=em.getDesig()%></td>
	<td><%=em.getBasic()%></td>
	</tr>
	<tr>
	<td><a href=UpdateEmploy.jsp?empNo=<%=em.getEmpNo() %>>
	<input type="submit" name="update" value="Update Employ"></a>
	</td>
	</tr>
	<% 
	request.setAttribute("empNo", request.getParameter("empNo"));
}%>
</table>

</div>
<%

%>
<div id="updateDtls">

</div>

</form>
<%}
%>
</body>
</html>
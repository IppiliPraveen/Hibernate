<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
EmployDAO obj = new EmployDAO();
List<Employ> emp=null;
if(request.getParameter("empNo")!=null){
	obj.setRederTbl(true);
}
String button = request.getParameter("reset");
if ("Reset".equals(button)) {
	obj.resetSearch();
}
%>
<form method="get" >
<table align="center" >
<tr>
<th>EmpNo</th>
<td><input type="text" id="empno" name="empNo"/></td>
<br>
<br>
</tr>
<tr>
<td></td>
<td  align="center" >&nbsp;&nbsp;<input type="submit" value="Search" action="SearchEmploy.jsp" />&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Reset" name="reset" action="SearchEmploy.jsp"/>
<td>
</tr>
</table>
</form>
<%if(obj.isRederTbl()){ %>
<table align="center" border="1" class="tableClass.css">
<tr>
<th>EmpNo</th>
<th>Employ Name</th>
<th>Gender</th>
<th>Dept</th>
<th>Desig</th>
<th>Basic</th>
</tr>
 <%

if(request.getParameter("empNo")!=null && request.getParameter("empNo")!=""){

emp =  obj.getEmploy1(Integer.parseInt(request.getParameter("empNo")));
for(Employ em:emp ){
	%>
	<tr>
	<td><a href=EmployDetail.jsp?empNo=<%=em.getEmpNo() %>><%=em.getEmpNo() %></a></td>
	<td><a href=EmployDetail.jsp?empNo=<%=em.getEmpNo() %>><%=em.getName()%></a></td>
	<td><%=em.getGender()%></td>
	<td><%=em.getDept()%></td>
	<td><%=em.getDesig()%></td>
	<td><%=em.getBasic()%></td>
	</tr>
	<% 
}
}
else{
	emp=obj.searchAll();
	for(Employ em:emp ){
		%>
		<tr>
		<td><%=em.getEmpNo()%></td>
		<td><%=em.getName()%></td>
		<td><%=em.getGender()%></td>
		<td><%=em.getDept()%></td>
		<td><%=em.getDesig()%></td>
		<td><%=em.getBasic()%></td>
		</tr>
		<% 
	}
}
}
%>
</table>
</body>
</html>

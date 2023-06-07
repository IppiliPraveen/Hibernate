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
out.println(request.getAttribute("empNo"));
String empNo=String.valueOf(request.getAttribute("empNo"));
out.println(empNo);
//emp = empDAO.getEmploy(Integer.parseInt(empNo));
if(empNo==null){
	out.println("empNo : "+empNo);
	
	}

/* if(empNo!=null){
	out.println("23 "+empNo);
	emp = empDAO.getEmploy(Integer.parseInt(empNo));
} */
	%>

<form action="UpdateEmploy.jsp" >
<%-- <%for(Employ em:emp){ 

%> --%>

<table align="center" border="1" >
<tr>
<th>EmpNo</th><td><input type="number" id="empno"   name="empNo"/></td>
</tr>
<tr>
<th>Employ Name</th><td><input type="text" id="empname" name="name"/></td>
</tr>
<tr>
<th>Gender</th><td><select name="gender" id="genderId">
<option value="">Please Select One</option>
<option value="MALE">MALE</option>
<option value="FEMALE">FEMALE</option></td>
</tr>
<tr>
<th>Dept</th><td><input type="text" id="deptId" name="dept"/></td>
</tr>
<tr>
<th>Desig</th><td><input type="text" id="desigId" name="desig"/></td>
</tr>
<tr>
<th>Basic</th><td><input type="number" step="0.01" id="basicId" name="basic" placeholder="0.00"></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="Update Employ"></td>
</tr>
</table>
<%-- <%} %> --%>
</form>
<jsp:useBean id="employ"  class="HibernateProject.HibernatePro.Employ">
<jsp:setProperty name="employ" property="*"/>
</jsp:useBean>
<%
if(employ.getEmpNo()!=0){
empDAO.addEmploy(employ);
}
%>
</body>
</html>
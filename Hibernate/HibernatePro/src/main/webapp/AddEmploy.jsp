<%@page import="HibernateProject.HibernatePro.EmployDAO"%>
<%@page import="HibernateProject.HibernatePro.Employ"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color: #fff;
}
html, body {
    height: 100%;
    color: #232333;
    
}


</style>

<meta charset="ISO-8859-1">
<title>Add Employ</title>
</head>
<body>
<h2 align="center">Add Employ </h2>
<form action="AddEmploy.jsp" >
<table align="center" border="1" >
<tr>
<th>EmpNo</th><td><input type="number" id="empno" name="empNo"/></td>
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
<td colspan="2" align="center"><input type="submit" value="Add Employ"></td>
</tr>
</table>
</form>
<%
EmployDAO empDAO=new EmployDAO();
%>

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
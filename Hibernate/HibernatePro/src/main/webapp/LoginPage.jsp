<%@page import="HibernateProject.HibernatePro.EmployDAO"%>
<%@page import="HibernateProject.HibernatePro.Credentials"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
<h5 style="color:red" align="center"> 
<span>
<% if(request.getParameter("errmsg")!=null) {
	
%> 
Cdga
<%=request.getParameter("errmsg") %>
<%
}
%>
</span> </h5>
<form action="LoginPage.jsp" align="center">
<center>
<table>
<tr>
<th>User Name</th><td><input type="text" name="uname" id="uName" placeholder="Enter User Name"/></td>
</tr>
<tr>
<th>Password</th><td><input type="Password" name="pswd" id="pwd"/></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" name="Log In"/></td>
</tr>
</table>
</center>
</form>

<jsp:useBean id="credentials"  class="HibernateProject.HibernatePro.Credentials">
<jsp:setProperty name="credentials" property="*"/>
</jsp:useBean>
<%
if(credentials.getUname()!=null && credentials.getPswd()!=null){
	EmployDAO empDAO=new EmployDAO();
	int flag = empDAO.logIn(credentials.getUname(), credentials.getPswd());
	if(flag==1){%>
	<h5 type="hidden" s align="center" id="errorMsg1" name="errmsg1"></h5>
	<jsp:forward page="MainPage.jsp"></jsp:forward>
	<%}
	else{%>
		<h5 type="hidden" style="color:red" align="center" id="errorMsg" name="errmsg">Invalid Credentials</h5>
	<%}
}
%>
</body>
<script type="text/javascript">

function errMsg(){
	var msg= document.getElementById("e")
	
}



</script>
</html>
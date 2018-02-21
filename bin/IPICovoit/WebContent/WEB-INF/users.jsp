<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Liste des utilisateurs</title>
    <link type="text/css" rel="stylesheet" href="./css/styles.css" />
</head>
<body>
   	<c:import url="/WEB-INF/menu/menu.jsp" />
   	<table>
   		<tr>
   			<th>Email</th>
   			<th>Nom</th>
   		</tr>
   		<%
   		int cpt = 0;
   		%>
   		<c:forEach var="tst" items="${ users }">
   			<% 
   			String cl;
   			if(cpt % 2 == 0)
   			{
   				cl = "pair";
   			}
   			else
   			{
   				cl = "impair";
   			}
   			cpt++;
   			%>
	   		<tr class="<%=cl%>">
		       <td>${ tst.key }</td>
		       <td>${ tst.value.name }</td>
		   </tr>
   		</c:forEach>
	</table>
</body>
</html>
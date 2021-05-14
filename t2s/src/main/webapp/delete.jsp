<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="t2s.connection.ConnectionFactory" %>  

<% 
String deleteValue= null;
String deleteInput= null;
String errorMessageDelete= null;
String deleteResposta = null;
try{
deleteValue = request.getParameter("cli").toString();
deleteInput = request.getParameter("nrc").toString();

Connection connection = ConnectionFactory.getConnection();

PreparedStatement preparedstatement = connection.prepareStatement("DELETE FROM container WHERE numero_container = ?");

preparedstatement.setString(1, deleteInput);

int rows = preparedstatement.executeUpdate();
if(rows > 0) {
	deleteResposta = "Excluído";
	response.sendRedirect("about.jsp");
}
	connection.close();
}
catch(Exception ex){
	errorMessageDelete = "Não foi possível localizar o container nos registros"; 
}
%> 
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>T2S</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<%@include file="WEB-INF/jspf/header.jspf" %>
		</div>
	</div>
<h3><%= deleteValue %></h3> 
<h3><%= deleteInput %></h3> 
<h3><%= deleteResposta %></h3>
<h3><%= errorMessageDelete %></h3>

	<div class="row p-3 my-3 text-primary">
		<div class="col-sm-4">
		</div>
		<div class="col-sm-4">	
			<%@include file="WEB-INF/jspf/footer.jspf" %>
		</div>
		<div class="col-sm-4">
	</div>
	</div>
</div>
</body>
</html>
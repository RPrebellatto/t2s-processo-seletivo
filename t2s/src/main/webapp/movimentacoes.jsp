<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="t2s.connection.ConnectionFactory" %>  

<% 

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
<%if (session.getAttribute("user.log") == "true"){ %>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<%@include file="WEB-INF/jspf/header.jspf" %>
		</div>		
	</div>
	<div class="row">
	<ul class="list-inline text-center col-sm-12">
  			<li class="list-inline-item">
    			<a href="index.jsp?" class="btn btn-outline-primary" role="button">Containeres</a>	
  			</li>
			<li class="list-inline-item">
			    <a href="movimentacoes.jsp?" class="btn btn-outline-primary" role="button">Movimentações</a>
			</li>
			</ul>	
	</div>
		<%@include file="WEB-INF/jspf/movimentacao.jspf" %>

		<div class="row">
		<div class="col-sm-12">
			<%@include file="WEB-INF/jspf/footer.jspf" %>
		</div>	
	</div>
</div>
<%} else { %> <p>Favor se conectar utilizando as páginas principais: <a href="index.jsp">voltar</a></p>  <% } %>
</body>
</html>
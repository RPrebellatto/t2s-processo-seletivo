<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://developers.google.com/speed/libraries/devguide#jquery%22%3E"></script>
	<link rel="stylesheet" href="//cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
	<script src="//cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script src="https://www.jsdelivr.com/package/npm/jquery"></script>
	
<title>T2S</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<%@include file="WEB-INF/jspf/header.jspf" %>
		</div>
	</div>
	<%if (session.getAttribute("user.log") == "true"){
	%>
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
		
					
		
		<%@include file="WEB-INF/jspf/container.jspf" %>	
	
	<%} 
	//Conteúdo fora de Session
	else { %>
	<% if(request.getAttribute("btn-sign-in") !=null){ %>
	<div class="row">
		<div class="col-sm-4">
		</div>
		<div class="col-sm-4">
			<form>
				<div class="form-group">
					<label for="nome">Nome</label>
					<input type="text" class="form-control" id="nome" name="nome_usuario" required><br/>
				</div>
			  	<div class="form-group">
			  		<label for="email">Email</label>
			  		<input type="email" class="form-control" id="email" name="email_usuario" required><br/>
			  	</div>
			  	<div class="form-group">
			  		<label for="senha">Senha</label> 
			  		<input type="password" class="form-control" id="senha" name="senha_usuario" required><br/>
			  	</div>
			  	<div class="text-right">
					<button type="submit" name="btn-criar_conta" class="btn btn-primary">Cadastre-se</button>
				</div>
	 		</form>
		</div>
		<div class="col-sm-4">
		</div>
	</div>
<%} %>
	
	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8">
		<div class="card-body my-2">
			<h2>Já conhece nossos serviços?</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Ut quis aliquam est. Etiam hendrerit nulla nec pulvinar volutpat. 
			Sed vitae vehicula nulla, id fermentum eros. Duis ut scelerisque sem, bibendum finibus lacus.
			 Nam egestas rutrum blandit. Aliquam dui odio, luctus a vulputate at, cursus et tellus. 
			 Proin sed turpis vitae tortor blandit luctus. 
			 Phasellus ligula nibh, semper ut augue ut, varius faucibus tortor.
			  Curabitur sed auctor leo, eu faucibus magna. Nunc dictum euismod magna. 
			</p>
		</div>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
	<%} %>
	<div class="row">
		<div class="col-sm-12">
			<%@include file="WEB-INF/jspf/footer.jspf" %>
		</div>	
	</div>
</div>
</body>
</html>
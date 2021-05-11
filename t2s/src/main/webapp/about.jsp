<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Sobre Nós</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<%@include file="WEB-INF/jspf/header.jspf" %>
		</div>
	</div>
<% if(request.getAttribute("session.sign-in") !=null){ %>
	<div class="row">
		<div class="col-sm-4">
		</div>
		<div class="col-sm-4">
		<form>
		  <div class="form-group">
		  <label for="nome">Nome</label> <input type="text" class="form-control" id="nome" name="nome_usuario" required><br/>
		  </div>
		  <div class="form-group">
		  <label for="email">Email</label> <input type="email" class="form-control" id="email" name="email_usuario" required><br/>
		  </div>
		  <div class="form-group">
		  <label for="senha">Senha</label> <input type="password" class="form-control" id="senha" name="senha_usuario" required><br/>
		  </div>
			<input type="submit" name="criar_conta" value="Criar Conta">
		</form>
		</div>
		<div class="col-sm-4">
		</div>
	</div>
<%} 
//Conteúdo fora de Session
else { %>

<h3>Resumo do Produto</h3>
<p>
	O T2S SGMC é uma aplicação web voltada para a área portuária que possui a finalidade de oferecer um <br/>banco de dados
	para armazenamento de containeres e registros de movimentações.
</p>

<h2>Nota de Atualização do Software 1.0.0</h2>
<h3>Geral</h3>
<p>
	Produto: T2S SGMC: Software de Gerenciamento de Movimentações de Containeres<br/>
	Versão Atual: 1.0.0<br/>
	Data de Lançamento: 11/05/2021
</p>

<h3>Sumário do Lançamento</h3>
<p>
	O T2S SGMC foi lançado, em sua versão 1.0.0, com as seguintes funcionalidades:<br/>
	- Página Inicial;<br/>
	- Página Sobre;<br/>
	- Banco de Dados de Usuário;<br/>
	- Cadastramento de Usuário;<br/>
	- Login de Usuário;<br/>
	- Banco de Dados de Containeres;<br/>
	- Cadastramento de Containeres;<br/>
	- Lista de Containeres Cadastrados;<br/>
	- Banco de Dados de Movimentações;<br/>
	- Encerramento de Sessão.
</p>

<%} %>

<div class="row">
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
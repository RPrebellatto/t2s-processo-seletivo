<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<%

String jbdcURL = "jdbc:postgresql://127.0.0.1:5432/t2s_pseletivo";
String username = "postgres";
String password = "admin";
String connectionResponse;
String insertResponse=null;


//teste de conexão com o servidor. Pendente de exclusão das respostas visiveis ao usuário
try {
	Connection connection = DriverManager.getConnection(jbdcURL,username,password);
	connectionResponse = "Conexão com Postgres estabelecida";

	connection.close();
} catch (Exception e) {
	connectionResponse = "Erro ao tentar conexão com o banco de dados";
	e.printStackTrace(new java.io.PrintWriter(out));
}

String clienteInput=null;
String nrContainerInput=null;
String statusInput = null; 
String categoriaInput = null;
int tipoInput= 0;
String errorMessage = null;
//Cadastramento de container no banco de dados
try{
	clienteInput = request.getParameter("cliente").toString();
	nrContainerInput = request.getParameter("nr_container").toString();
	tipoInput = Integer.parseInt(request.getParameter("tipo"));
	statusInput = request.getParameter("status");
	categoriaInput = request.getParameter("categoria");
	
	Connection connection = DriverManager.getConnection(jbdcURL,username,password);

	
	String sql = "INSERT INTO container (cliente, numero_container, tipo_20_40, status_vazio_cheio, categoria_imp_exp)"
			+ "VALUES (?,?,?,?,?)";
	
	PreparedStatement preparedstatement = connection.prepareStatement(sql);
	
	preparedstatement.setString(1, clienteInput);
	preparedstatement.setString(2, nrContainerInput);
	preparedstatement.setInt(3, tipoInput);
	preparedstatement.setString(4, statusInput);
	preparedstatement.setString(5, categoriaInput);
	
	int rows = preparedstatement.executeUpdate();
	if(rows > 0) {
		insertResponse = "Foi feita uma inclusão no banco";
	}
}
catch (Exception ex){
	errorMessage = "Dados inválidos";
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
	<%if (session.getAttribute("user.log") == "true"){
	%>	
	
	<div style="border:1px solid black; width:45vw;">
	<h3>Cadastrar Container</h3>
	<form method="post" action="">
	<!-- TODO: Validation checks past html inputs -->
	Cliente <input type="text" name="cliente" required>
	Número do Container <input type="text" name="nr_container" placeholder="AAAA8888888" pattern="[A-Za-z]{4}[0-9]{7}" style="text-transform:uppercase;" required><br/>
	Tipo
	<input type="radio" id="20" name="tipo" value=20 required><label for="20">20<label/>
	<input type="radio" id="40" name="tipo" value=40 required><label for="40">40<label/><br/>
	Status
	<input type="radio" id="vazio" name="status" value="vazio" required><label for="vazio">Vazio<label/>
	<input type="radio" id="cheio" name="status" value="cheio" required><label for="cheio">Cheio<label/><br/>
	Categoria
	<input type="radio" id="imp" name="categoria" value="importação" required><label for="imp">Importação<label/>
	<input type="radio" id="exp" name="categoria" value="exportação" required><label for="exp">Exportação<label/>
	<br/>
	<input type="submit" value="Enviar">
	</form>
	
	</div>
	
	<br/><br/>
	<%if(insertResponse != null){ %> <h3><%= insertResponse %></h3><%}%>
	
	<br/><br/>
	
	<table border="1">
	<thead><td>Cliente</td><td>Container</td><td>Tipo</td><td>Status</td><td>Categoria</td></thead>
	<%
		String sql = "SELECT * FROM container";
		
	    Connection connection = DriverManager.getConnection(jbdcURL,username,password);
		
	    Statement statement = connection.createStatement();
		
		ResultSet result = statement.executeQuery(sql);
		
		while (result.next()) {
			String cliente = result.getString("cliente");
			String numero = result.getString("numero_container");
			int tipo = result.getInt("tipo_20_40");
			String status = result.getString("status_vazio_cheio");
			String categoria = result.getString("categoria_imp_exp");
			
			%><tr>
			<td><%= cliente %> </td>
			<td><%= numero %> </td>
			<td><%= tipo %> </td>
			<td><%= status %> </td>
			<td><%= categoria %> </td></tr><%
		}
		connection.close();
	%>
	</table>
	
	<%} 
	//apresentação de input de Cadastramento de Usuário
	else if(request.getAttribute("session.sign-in") !=null){ %>
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
	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8">
			<h2>Já conhece nossos serviços?</h2>
			<h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Ut quis aliquam est. Etiam hendrerit nulla nec pulvinar volutpat. 
			Sed vitae vehicula nulla, id fermentum eros. Duis ut scelerisque sem, bibendum finibus lacus.
			 Nam egestas rutrum blandit. Aliquam dui odio, luctus a vulputate at, cursus et tellus. 
			 Proin sed turpis vitae tortor blandit luctus. 
			 Phasellus ligula nibh, semper ut augue ut, varius faucibus tortor.
			  Curabitur sed auctor leo, eu faucibus magna. Nunc dictum euismod magna. 
			</h4>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
	<%} %>
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
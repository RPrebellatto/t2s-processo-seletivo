<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<%
String jbdcURL = "jdbc:postgresql://127.0.0.1:5432/t2s_pseletivo";
String username = "postgres";
String password = "admin";
String connectionResponse;
String insertResponse=null;

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

try{
	clienteInput = request.getParameter("cliente").toString();
	nrContainerInput = request.getParameter("nr_container").toString();
	tipoInput = Integer.parseInt(request.getParameter("tipo"));
	statusInput = request.getParameter("status");
	categoriaInput = request.getParameter("categoria");
	
	Connection connection = DriverManager.getConnection(jbdcURL,username,password);
	System.out.println("Conexão com Postgres estabelecida");
	
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
<html>
<head>
<meta charset="utf-8">
<title>T2S</title>
</head>
<body>
<h1>Hello World</h1>
<h3><%= new java.util.Date() %></h3>
<h2><%= connectionResponse %></h2>

<div style="border:1px solid black; width:45vw;">
<h3>Cadastrar Container</h3>
<form method="post" action="">

Cliente <input type="text" name="cliente" required>
Número do Container <input type="text" name="nr_container" required><br/>
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
<%if(errorMessage != null){ %> <h3><%= errorMessage %></h3><%}%>
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


<br/><br/><br/><br/>
<h1>Teste</h1>
<h2><%= clienteInput %> </h2>
<h2><%= nrContainerInput %></h2>
<h2><%= tipoInput %></h2>
<h2><%= statusInput %></h2>
<h2><%= categoriaInput %></h2>
</body>
</html>
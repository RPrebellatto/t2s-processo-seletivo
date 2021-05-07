<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<%
String jbdcURL = "jdbc:postgresql://127.0.0.1:5432/t2s_pseletivo";
String username = "postgres";
String password = "admin";
String connectionResponse;

try {
	Connection connection = DriverManager.getConnection(jbdcURL,username,password);
	connectionResponse = "Conexão com Postgres estabelecida";


} catch (Exception e) {
	connectionResponse = "Erro ao tentar conexão com o banco de dados";
	e.printStackTrace(new java.io.PrintWriter(out));
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
</body>
</html>
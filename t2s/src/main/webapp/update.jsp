<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="t2s.connection.ConnectionFactory" %>   
    

<%
		String updateCliente= null;
		String updateContainer= null;
		String updateTipo= null;
		String updateStatus = null;
		String updateCategoria = null;
	    String errorMessageUpdate= null;
	    String resultUpdate = null;
	 
	    try{
		updateCliente = request.getParameter("cliente-up").toString();
		updateContainer = request.getParameter("nr_container-up").toString();
		updateTipo = request.getParameter("tipo-up").toString();
		updateStatus = request.getParameter("status-up").toString();
		updateCategoria = request.getParameter("categoria-up").toString();
		
		
		Connection connection = ConnectionFactory.getConnection();
		
		PreparedStatement preparedstatement = connection.prepareStatement("UPDATE container SET cliente = ?, numero_container = ?, tipo_20_40 = ?, status_vazio_cheio = ?, categoria_imp_exp = ? WHERE numero_container = ?");
		
		preparedstatement.setString(1, updateCliente);
		preparedstatement.setString(2, updateContainer);
		preparedstatement.setString(3, updateTipo);
		preparedstatement.setString(4, updateStatus);
		preparedstatement.setString(5, updateCategoria);
		preparedstatement.setString(6, updateContainer);
		
		int rows = preparedstatement.executeUpdate();
		if(rows > 0) {
			resultUpdate = "Updated!";
		}
		
		connection.close();
		}
		catch(Exception ex){
			errorMessageUpdate = "Não foi possível atualizar o container nos registros"; 
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
<%if (session.getAttribute("user.log") == "true"){ %>
<div class="container-fluid">

	<div class="row">
		<div class="col-sm-12">
			<%@include file="WEB-INF/jspf/header.jspf" %>
		</div>
	</div>
	
<div class="row">
			<div class="col-sm-3">
			</div>
			<div class="col-sm-7 p-3 m-5 border border-1"  style="width:60vw;">
				<div class="text-center p-3 m-3  text-primary rounded-sm">
					<h3>Alterar Container</h3>
				</div>
					<!-- TODO: Validation checks past html inputs -->
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-8">
						<h3><%= request.getParameter("nrc") %></h3>
						<form method="post" action="">
							<div class="form-group">
						  		<label for="cliente">Cliente</label>
						  		<input type="text" class="form-control" id="cliente" name="cliente-up" value="<%= request.getParameter("cli") %>" required>
						 	</div>
							<div class="form-group">
						  		<label for="nr_container">Número do Container</label>
						  		<input type="text" class="form-control" id="nr_container" name="nr_container-up" value="<%= request.getParameter("nrc") %>" pattern="[A-Za-z]{4}[0-9]{7}" style="text-transform:uppercase;" required><br/>
						 	</div>
							<label for="tipo">Tipo: </label>
							<div class="form-check-inline">
						 		<label class="form-check-label" for="tpo-atual">
								<input type="radio" id="tpo-atual" name="tipo-up" class="form-check-input" value="<%= request.getParameter("tpo") %>" required><%= request.getParameter("tpo") %> [Atual]</label>
							</div>
						 	<div class="form-check-inline">
						 		<label class="form-check-label" for="20">
								<input type="radio" id="20" name="tipo-up" class="form-check-input" value="20" required>20</label>
							</div>
						 	<div class="form-check-inline">
								<label class="form-check-label" for="40">
								<input type="radio" id="40" name="tipo-up" class="form-check-input" value="40" required>40</label>
						 	</div>
						 	<br/>
						 	<label for="status">Status: </label>
						 	<div class="form-check-inline">
						 		<label class="form-check-label" for="stsatual">
								<input type="radio" id="stsatual" name="status-up" class="form-check-input" value="<%= request.getParameter("sts") %>" required><%= request.getParameter("sts") %> [Atual]</label>
							</div>
						 	<div class="form-check-inline">
						 		<label class="form-check-label" for="vazio">
								<input type="radio" id="vazio" name="status-up" class="form-check-input" value="vazio" required>Vazio</label>
							</div>
						 	<div class="form-check-inline">
						 		<label class="form-check-label" for="cheio">	
								<input type="radio" id="cheio" name="status-up" class="form-check-input" value="cheio" required>Cheio</label>
							</div>
							<br/>
							<label for="categoria">Categoria: </label>
							<div class="form-check-inline">
						 		<label class="form-check-label" for="ctgatual">
								<input type="radio" id="ctgatual" name="categoria-up" class="form-check-input"value="<%= request.getParameter("ctg") %>" required><%= request.getParameter("ctg") %> [Atual]</label>
							</div>
						 	<div class="form-check-inline">
						 		<label class="form-check-label" for="imp">
								<input type="radio" id="imp" name="categoria-up" class="form-check-input" value="importação" required>Importação</label>
							</div>
						 	<div class="form-check-inline">
						 		<label class="form-check-label" for="exp">	
								<input type="radio" id="exp" name="categoria-up" class="form-check-input" value="exportação" required>Exportação</label>
							</div>
							<br/>
							<div class="my-3 text-right">
								<button type="submit" name="btn-up" class="btn btn-primary">Alterar</button>
							</div>
						</form>						
					</div>
					<div class="col-sm-2">
					</div>
				</div>
			</div>
			<div class="col-sm-2">
			</div>
		</div>



	
	
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
<%} else { %> <p>Favor se conectar utilizando as páginas principais</p> <% } %>
</body>
</html>
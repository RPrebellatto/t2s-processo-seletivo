<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="t2s.connection.ConnectionFactory" %>   
    

<%
String errorMessageUpdate= null;
String resultUpdate = null;

if(request.getParameter("btn-alterar-container")!=null){
		String updateCliente= null;
		String updateContainer= null;
		String updateTipo= null;
		String updateStatus = null;
		String updateCategoria = null;
		errorMessageUpdate= null;
		resultUpdate = null;
	 
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
			resultUpdate = "Atualizado!";
		}
		
		connection.close();
		}
		catch(Exception ex){
			errorMessageUpdate = "Não foi possível realizar a alteração."; 
		}
}
if(request.getParameter("btn-alterar-mov")!=null){
	 
	String updateTipoMov = null;
	String updateContainerMov = null;
	String updateDataI = null;
	String updateHoraI = null;
	String updateDataF = null;
	String updateHoraF = null;
	errorMessageUpdate= null;
	resultUpdate = null;

 
    try{
    int updateId = Integer.parseInt(request.getParameter("id-mov"));
	updateContainerMov = request.getParameter("c-mov").toString().toUpperCase();
	updateTipoMov = request.getParameter("tp-mov").toString();
	updateDataI = request.getParameter("di-mov").toString();
	updateHoraI = request.getParameter("hi-mov").toString();
	updateDataF = request.getParameter("df-mov").toString();
	updateHoraF = request.getParameter("hf-mov").toString();
	
	Connection connection = ConnectionFactory.getConnection();
	
	PreparedStatement preparedstatement = connection.prepareStatement("UPDATE movimentacao SET tipo_movimentacao = ?, container_mov = ?, data_inicio = ?, hora_inicio = ?, data_fim = ?, hora_fim = ? WHERE id = ?");
	
	preparedstatement.setString(1, updateTipoMov);
	preparedstatement.setString(2, updateContainerMov);
	preparedstatement.setString(3, updateDataI);
	preparedstatement.setString(4, updateHoraI);
	preparedstatement.setString(5, updateDataF);
	preparedstatement.setString(6, updateHoraF);
	preparedstatement.setInt(7, updateId);
	
	int rows = preparedstatement.executeUpdate();
	if(rows > 0) {
		resultUpdate = "Updated!";
		response.sendRedirect("movimentacoes.jsp");
	}
	
	connection.close();
	}
	catch(Exception ex){
		errorMessageUpdate = "Não foi possível atualizar o container nos registros"; 
	}
}
else {String vish = "dff";}

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
<%if(request.getParameter("nrc")!= null){ %>	

<div class="row">
			<div class="col-sm-1">
			</div>
			<div class="col-sm-10 p-1 m-5 border border-1">  <!-- style="width:60vw;" -->
				<div class="text-center p-1 m-3  text-primary rounded-sm">
					<h3>Alterar Container</h3>
				</div>
					<!-- TODO: Validation checks past html inputs -->
				<div class="row">
					<div class="col-sm-12">
						<form method="post" action="">
						
						<div class="row">
						<div class="form-inline col-6">
							<div class="form-group col-sm-6">
						  		<label for="cliente">Cliente</label>
						  		<input type="text" class="form-control" id="cliente" name="cliente-up" value="<%= request.getParameter("cli") %>" required>
						 	</div>
						 	<div class="form-group col-sm-6">
						  		<label for="nr_container">Número do Container</label>
						  		<input type="text" class="form-control" id="nr_container" name="nr_container-up" value="<%= request.getParameter("nrc") %>" pattern="[A-Za-z]{4}[0-9]{7}" style="text-transform:uppercase;" required><br/>
						  	</div>
						</div>
						<div class="form-inline col-6">
							<div class="form-group col-2">
						 	<label class="text-primary text-center" for="tipo">Tipo </label>
						 	<div class="form-check">
						 	<span class="border border-right-0 border-left-0 border-top-0 border-bottom-1 border-primary">
						 		<label class="form-check-label" for="tpo-atual">
								<input type="radio" id="tpo-atual" name="tipo-up" class="form-check-input" value="<%= request.getParameter("tpo") %>" required><%= request.getParameter("tpo") %></label>
							</span>
							</div>
						 	<div class="form-check">
						 		<label class="form-check-label" for="20">
								<input type="radio" id="20" name="tipo-up" class="form-check-input" value="20" required>20</label>
							</div>
						 	<div class="form-check">
								<label class="form-check-label" for="40">
								<input type="radio" id="40" name="tipo-up" class="form-check-input" value="40" required>40</label>
						 	</div>
						 	</div>
						 	<div class="form-group col-2">
						 	<label class="text-primary text-center" for="status">Status </label>
						 		<div class="form-check">
						 		<span class="border border-right-0 border-left-0 border-top-0 border-bottom-1 border-primary">
						 		<label class="form-check-label" for="stsatual">
								<input type="radio" id="stsatual" name="status-up" class="form-check-input" value="<%= request.getParameter("sts") %>" required><%= request.getParameter("sts") %></label>
								</span>
							</div>
						 	<div class="form-check">
						 		<label class="form-check-label" for="vazio">
								<input type="radio" id="vazio" name="status-up" class="form-check-input" value="vazio" required>Vazio</label>
							</div>
						 	<div class="form-check">
						 		<label class="form-check-label" for="cheio">	
								<input type="radio" id="cheio" name="status-up" class="form-check-input" value="cheio" required>Cheio</label>
							</div>
							</div>
							<div class="form-group col-4">
							<label class="text-primary text-center" for="categoria">Categoria </label>
						 	
						 	<div class="form-check">
						 	<span class="border border-right-0 border-left-0 border-top-0 border-bottom-1 border-primary">
						 		<label class="form-check-label" for="ctgatual">
								<input type="radio" id="ctgatual" name="categoria-up" class="form-check-input"value="<%= request.getParameter("ctg") %>" required><%= request.getParameter("ctg") %> [Atual]</label>
							</span>
							</div>
						
						 	<div class="form-check">
						 		<label class="form-check-label" for="imp">
								<input type="radio" id="imp" name="categoria-up" class="form-check-input" value="importação" required>Importação</label>
							</div>
						 	<div class="form-check">
						 		<label class="form-check-label" for="exp">	
								<input type="radio" id="exp" name="categoria-up" class="form-check-input" value="exportação" required>Exportação</label>
							</div>
							</div>
					
							<div class="my-3 text-right col-1">
								<button type="submit" name="btn-alterar-container" class="btn btn-primary">Alterar</button>
							</div>
							
						</div>
							
						</div>
							<%if (resultUpdate != null && request.getParameter("btn-alterar-container") != null){ %><p><%= resultUpdate %></p><%} 
							else if(errorMessageUpdate != null && request.getParameter("btn-alterar-container") != null){ %><p><%= errorMessageUpdate %> </p><%} %>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-1">
			</div>
		</div>



<%} else if (request.getParameter("nri")!=null) { %>

<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-7">
						<form>
							<div class="form-group">
						  		<label for="id-mov">Código de Movimentação</label>
						  		<input type="text" class="form-control" id="id-mov" name="id-mov" value="<%=request.getParameter("nri")%>" required>
						 	</div>
							<div class="form-group">
						  		<label for="c-mov">Container</label>
						  		<input type="text" class="form-control" id="c-mov" name="c-mov" value="<%=request.getParameter("contmov")%>" placeholder="AAAA8888888" pattern="[A-Za-z]{4}[0-9]{7}" style="text-transform:uppercase;" required>
						 	</div>
							<div class="form-group">
							  <label for="tp-mov">Tipo de Movimentação</label>
							  <select class="form-control" required name="tp-mov" id="tp-mov" value="<%=request.getParameter("tpomov")%>">
							    <option value="Embarque">Embarque</option>
							    <option value="Descarga">Descarga</option>
							    <option value="Gate In">Gate In</option>
							    <option value="Gate Out">Gate Out</option>
							    <option value="Posicionamento">Posicionamento</option>
							    <option value="Pilha">Pilha</option>
							    <option value="Pesagem">Pesagem</option>
							    <option value="Scanner">Scanner</option>
							  </select>
							</div>
							<div class="form-group">
						  		<label for="hi-mov">Horário Início</label>
						  		<input type="text" class="form-control" id="hi-mov"  placeholder="00:00" pattern="[0-9]{2}:[0-9]{2}" name="hi-mov" value="<%=request.getParameter("hoi")%>" required>
						 	</div>
						 	<div class="form-group">
						  		<label for="di-mov">Data Início</label>
						  		<input type="text" class="form-control" id="di-mov" placeholder="YYYY-mm-dd" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" name="di-mov" value="<%=request.getParameter("dtmov")%>" required>
						 	</div>
						 	<div class="form-group">
						  		<label for="hf-mov">Horário Fim</label>
						  		<input type="text" class="form-control" id="hf-mov" placeholder="00:00" pattern="[0-9]{2}:[0-9]{2}" name="hf-mov"value="<%=request.getParameter("hof")%>" required>
						 	</div>
						 	<div class="form-group">
						  		<label for="df-mov">Data Fim</label>
						  		<input type="text" class="form-control" id="df-mov" placeholder="YYYY-mm-dd" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" name="df-mov" value="<%=request.getParameter("dtf")%>" required>
						 	</div>
						 	<div class="my-3 text-right">
								<button type="submit" name="btn-alterar-mov" class="btn btn-primary">Alterar</button>
							</div>
							<%if (resultUpdate != null && request.getParameter("btn-alterar-mov") != null){ %><p><%= resultUpdate %></p><%} 
							else if(errorMessageUpdate != null && request.getParameter("btn-alterar-mov") != null){ %><p><%= errorMessageUpdate %> </p><%} %>
						</form>
					</div>
					<div class="col-sm-2">
					</div>
				</div>
			</div>
			<div class="col-sm-2">
			</div>

<%} %>	

	<div class="row">
		<div class="col-sm-12">
			<%@include file="WEB-INF/jspf/footer.jspf" %>
		</div>	
	</div>


<%} else { %> <p>Favor se conectar utilizando as páginas principais: <a href="index.jsp">voltar</a></p> <% } %>
</body>
</html>
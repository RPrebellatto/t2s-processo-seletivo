package t2s.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionServer {

	public static void main(String[] args) {
		String jbdcURL = "jdbc:postgresql://191.238.218.44:5432/t2s_pseletivo";
		String username = "postgres";
		String password = "admin";
		
		try {
			Connection connection = DriverManager.getConnection(jbdcURL,username,password);
			System.out.println("Conexão com Postgres estabelecida");
			
			String sql = "INSERT INTO container (cliente, numero_container, tipo_20_40, status_vazio_cheio, categoria_imp_exp)"
					+ "VALUES (?,?,?,?,?)";
			
			PreparedStatement preparedstatement = connection.prepareStatement(sql);
			
			preparedstatement.setString(1, "MSC");
			preparedstatement.setString(2, "DOPK5584123");
			preparedstatement.setInt(3, 40);
			preparedstatement.setString(4, "cheio");
			preparedstatement.setString(5, "exportação");
			
			int rows = preparedstatement.executeUpdate();
			if(rows > 0) {
				System.out.println("Foi feita uma inclusão no banco");
			}
			
			sql = "SELECT * FROM container";
			
			Statement statement = connection.createStatement();
			
			ResultSet result = statement.executeQuery(sql);
			
			while (result.next()) {
				String cliente = result.getString("cliente");
				String numero = result.getString("numero_container");
				int tipo = result.getInt("tipo_20_40");
				String status = result.getString("status_vazio_cheio");
				String categoria = result.getString("categoria_imp_exp");
				
				System.out.printf("%s %s %d %s %s \n", cliente, numero, tipo, status, categoria);
			}

			connection.close();
		} catch (Exception e) {
			System.out.println("Erro ao tentar conexão com o banco de dados");
			e.printStackTrace();
		}
	}

}

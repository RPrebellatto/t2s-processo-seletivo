package t2s.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionServer {

	public static void main(String[] args) {
		String jbdcURL = "jdbc:postgresql://127.0.0.1:5432/t2s_pseletivo";
		String username = "postgres";
		String password = "";
		
		try {
			Connection connection = DriverManager.getConnection(jbdcURL,username,password);
			System.out.println("Conexão com Postgres estabelecida");
			
			String sql = "INSERT INTO container (cliente, numero_container, tipo_20_40, status_vazio_cheio, categoria_imp_exp)"
					+ "VALUES (?,?,?,?,?)";
			
			PreparedStatement statement = connection.prepareStatement(sql);
			
			statement.setString(1, "MSC");
			statement.setString(2, "FWEF2324123");
			statement.setInt(3, 40);
			statement.setString(4, "cheio");
			statement.setString(5, "exportação");
			
			int rows = statement.executeUpdate();
			if(rows > 0) {
				System.out.println("Foi feita uma inclusão no banco");
			}
			
			connection.close();
		} catch (Exception e) {
			System.out.println("Erro ao tentar conexão com o banco de dados");
			e.printStackTrace();
		}
	}

}

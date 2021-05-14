package t2s.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	public static Connection getConnection() {
		
		try {
			final String jbdcURL = "jdbc:postgresql://127.0.0.1:5432/t2s_pseletivo?verifyServerCertificate=false&useSSL=true";
			final String username = "postgres";
			final String password = "admin";
			
			return DriverManager.getConnection(jbdcURL, username, password);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}

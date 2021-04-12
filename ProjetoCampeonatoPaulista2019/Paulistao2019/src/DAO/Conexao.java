
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

private static String local = "jdbc:sqlserver://PCPOSITIVO1\\SQLEXPRESS;databaseName=bdCampeonatoPaulista2019;IntegratedSecurity=true;";
	
	private static String usuario = "";
	
	
	
	 private static String senha ="";

	private static Connection conexao;
	
	
	
	public static  Connection getConexao() {
		
	
	
	try {
		
		 conexao =  DriverManager.getConnection(local, usuario, senha);
		
		return conexao;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.err.println(e);
	}
	
	
	return null;
	
	}
	
	public static  void fechar(Connection conexao) {
		
		try {
			conexao.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
}

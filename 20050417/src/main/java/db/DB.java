package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
	public static Connection get() throws Exception  {
		Class.forName("oracle.jdbc.OracleDriver");
		return DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	}
}

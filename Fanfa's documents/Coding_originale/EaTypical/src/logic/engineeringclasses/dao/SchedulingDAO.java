package logic.engineeringclasses.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import logic.engineeringclasses.others.Connect;
import logic.engineeringclasses.query.QueryScheduling;
import logic.model.Scheduling;
import logic.model.Tourist;

public class SchedulingDAO {
	
	private SchedulingDAO() {}
	
	public static void delete(Tourist tourist) throws ClassNotFoundException, SQLException {
		// Step 1: declarations
		Statement stmt=null;
		Connection conn=null;
		
		try {
			// Step 2: connection opening
			conn = Connect.getInstance().getDBConnection();
			
			// Step 3: creation and execution of query
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			QueryScheduling.deleteScheduling(stmt, tourist.getUsername());
			
		}
		
		finally {
			try {
				if(stmt!=null) {
					stmt.close();
				}
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			
		}
		
	}
	
	public static void delete(String username) throws ClassNotFoundException, SQLException {
		Tourist tourist = new Tourist(null, null, username, null, null, null);
		delete(tourist);
	}
	
	public static void insert(Scheduling schedEntity) throws ClassNotFoundException, SQLException {
		// Step 1: declarations
		Statement stmt=null;
		Connection conn=null;
		
		try {
			// Step 2: connection opening
			conn = Connect.getInstance().getDBConnection();
			
			// Step 3: creation and execution of query
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			String itaHour;
			if(schedEntity.isAtLunch()) itaHour="Pranzo";
			else itaHour="Cena";
			QueryScheduling.insertScheduling(stmt, schedEntity.getTourist().getUsername(), schedEntity.getDate(), itaHour, schedEntity.getRest().getName());
			
		}
		
		finally {
			try {
				if(stmt!=null) {
					stmt.close();
				}
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			
		}		
	}

}

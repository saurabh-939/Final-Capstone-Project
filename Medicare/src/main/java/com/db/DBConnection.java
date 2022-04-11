package com.db;
import java.sql.*;

public class DBConnection {

    private static Connection connection;
    
    public DBConnection(){}
    static{
         
          
            try {
            	  Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicare", "root", "root");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
 
    	
    }
    public static Connection getCon() {
    	return connection;
    }
    	}

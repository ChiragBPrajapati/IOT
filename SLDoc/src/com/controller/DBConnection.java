package com.controller;
import java.sql.Connection;

import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class DBConnection
{
	public static Connection getConnection(){
		 
        Connection connSQL = null;
        
        Statement smt;
        ResultSet rs = null;
        try {
        	
        	//DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        	//String dbURL = "jdbc:sqlserver://NIDHI-PC\\sqlexpress;databaseName=SL_IOT";
        	String dbURL = "jdbc:sqlserver://ANALYZERSERVER\\sqlexpress;databaseName=Service_Doc_Portal";
        	
        	
       // String dbURL = "jdbc:sqlserver://hrserver\\sqlexpress";
            String user = "sa";
            String pass = "sql@2018";
            
            
           /* String dbURL = "jdbc:sqlserver://IOTSERVER\\sqlexpress;databaseName=SL_IOT";
        	
        	
            // String dbURL = "jdbc:sqlserver://hrserver\\sqlexpress";
                 String user = "sa";
                 String pass = "slt";*/
            
            connSQL = DriverManager.getConnection(dbURL, user, pass);
            
           
            
            if (connSQL != null)
            {
              //System.out.println("connected successfully..");
            }
            
 
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        catch (ClassNotFoundException e)
        {
        	// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connSQL;
    }
}

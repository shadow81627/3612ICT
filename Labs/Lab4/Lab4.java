//STEP 1. Import required packages
import java.sql.*;
import java.util.*;

public class Lab4 {
   // JDBC driver name and database URL
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   static final String DB_URL = "jdbc:mysql://localhost/hotelDB";

   //  Database credentials
   static final String USER = "root@localhost";
   static final String PASS = "password";
   
   public static void main(String[] args) {
   Connection conn = null;
   Statement stmt = null;
      //STEP 2: Register JDBC driver
try {
      Class.forName(JDBC_DRIVER);
} catch (ClassNotFoundException e) {
    System.out.println("Where is your MySQL JDBC Driver?");
    e.printStackTrace();
    return;
}

   try{
      //STEP 3: Open a connection
      System.out.println("Connecting to database...");
      conn = DriverManager.getConnection(DB_URL,USER,PASS);

      //STEP 4: Execute a query
      System.out.println("Creating statement...");
      stmt = conn.createStatement();
      String sql;
	  Scanner reader = new Scanner(System.in);  // Reading from System.in
      System.out.println("Enter a hotel number: "); // Prompt for user input of hotel number
	  int number = reader.nextInt(); // Scans the next token of the input as an int
      sql = "SELECT roomNo, price FROM room WHERE hotelNo = " + number; // Build sql query
      ResultSet rs = stmt.executeQuery(sql);

      //STEP 5: Extract data from result set
      while(rs.next()){
         //Retrieve by column name
         int roomNo  = rs.getInt("roomNo");

         //Display values
         System.out.print("Room ID: " + roomNo);
      }
      //STEP 6: Clean-up environment
      rs.close();
      stmt.close();
      conn.close();
   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
   }finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            stmt.close();
      }catch(SQLException se2){
      }// nothing we can do
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try
   System.out.println("Goodbye!");
}//end main
}//end lab4
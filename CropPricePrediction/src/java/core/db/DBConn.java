package core.db;


import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConn {
    public static void main(String[] args) throws Exception {
      
    }

    static String url = "jdbc:mysql://localhost:3306/";
    static String dbName = "croppriceprediction";
    static String driver = "com.mysql.jdbc.Driver";
    static String userName = "root";
    static String password = "";
    static Connection connection = null;
    static Statement statement = null;

    public static Connection getConnection() throws Exception {
        Class.forName(driver).newInstance();
        connection = DriverManager.getConnection(url + dbName, userName, password);
        return connection;
    }

    public static Statement connect() throws Exception {
        try {
            // If we are going to insert a Duplicate entry for PRIMARYKEY, we will get an exception
            // com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException
            connection = getConnection();
            statement = connection.createStatement();
            //System.out.println("Connected to the database");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return statement;
    }

    public static void close() {
        try {
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBConn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static long getInsertId() {
        try {
            Object[] insertIds = getInsertIds();
            return Long.parseLong("" + insertIds[0]);
        } catch (Exception e) {
            return -1;
        }
    }

    public static Object[] getInsertIds() {
        try {
            if (statement != null) {
                DBConn.statement = statement;
            } else {
                statement = DBConn.statement;
            }
            ResultSet generatedKeys = statement.getGeneratedKeys();
            ArrayList<Long> keys = new ArrayList<Long>();
            while (generatedKeys.next()) {
                keys.add(generatedKeys.getLong(1));
            }
            return keys.toArray();
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
            return null;
        }
    }
}
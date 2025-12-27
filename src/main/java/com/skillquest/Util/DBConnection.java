package com.skillquest.Util;

import java.sql.*;

public abstract class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/skillquest";

    private static final String USER = "root";

    private static final String PASSWORD = "rejan@1";

    //loading the diver class
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
    }

    protected Connection getConnection() throws SQLException{
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

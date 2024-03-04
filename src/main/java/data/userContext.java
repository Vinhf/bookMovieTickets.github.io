/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author QuocHai
 */
public class userContext {
     private static Connection conn = null;

    public static Connection connect() {
        // Doi ten database cac thu o day
        String server = "localhost";
        String port = "1433";
        String database = "Database_movie";
        String user = "sa";
        String password = "1234";

        try {
            // Khai bao driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://"
                    + server + ":" + port + ";databaseName=" + database + ";"
                    + "user=" + user + ";password=" + password
                    + ";encrypt=true;" + "trustServerCertificate=true;");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(userContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
}

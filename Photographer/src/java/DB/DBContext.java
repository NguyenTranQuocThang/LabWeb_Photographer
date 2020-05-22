/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.jsp.jstl.core.Config;

/**
 *
 * @author thang
 */
public abstract class DBContext {

    static Connection connect= null;
    static String HOSTNAME;
    static String PORT;
    static String DATABASENAME;
    static String IMAGE;

    public static String getValue(String txt) throws Exception {
        try {
            InitialContext init = new InitialContext();
            Context cont = (Context) init.lookup("java:/comp/env");
            return (String) cont.lookup(txt);
        } catch (Exception ex) {
            throw ex;
        }
    }

    static {
        try {
            HOSTNAME = getValue("HOSTNAME");
            PORT = getValue("PORT");
            DATABASENAME = getValue("DATABASENAME");
            IMAGE = getValue("IMAGE");

        } catch (Exception ex) {
            Logger.getLogger(Config.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + HOSTNAME + ":" + PORT + ";" + "databaseName=" + DATABASENAME;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection(url, "sa", "123");
        } catch (Exception ex) {
            throw ex;
        }
        return connect;
    }

    public static void closeConnection(ResultSet rs, PreparedStatement ps, Connection con) throws Exception {

        if (rs != null && !rs.isClosed()) {
            rs.close();
        }
        if (ps != null && !ps.isClosed()) {
            ps.close();
        }
        if (con != null && !con.isClosed()) {
            con.close();
        }
    }

}

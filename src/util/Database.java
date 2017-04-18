
package   util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author GJC
 */
public class Database {

    static final String DATABASE = "lbms";

    private static String URL = "jdbc:mysql://localhost:3306/" + DATABASE;
    private static String USER = "root";
    private static String PASS = "root";

    public static Connection getConnection() {

        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }
        return connection;
    }
}

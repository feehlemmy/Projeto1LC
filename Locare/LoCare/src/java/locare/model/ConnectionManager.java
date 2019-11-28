package locare.model;

import java.sql.Connection;
import java.sql.SQLException;
import org.postgresql.ds.PGPoolingDataSource;

public class ConnectionManager {

    private PGPoolingDataSource dataSource;

    public Connection getConnection() throws SQLException {
        Connection conn = dataSource.getConnection();
        conn.setAutoCommit(false);
        return conn;
    }

    private static ConnectionManager instance;

    private ConnectionManager() {
        dataSource = new PGPoolingDataSource();
        dataSource.setDataSourceName("locare_v2");
        dataSource.setServerName("localhost");
        dataSource.setDatabaseName("locare_v2");
        dataSource.setUser("postgres");
        dataSource.setPassword("");

        dataSource.setMaxConnections(20);
        dataSource.setInitialConnections(5);
    }

    public static ConnectionManager getInstance() {
        if (instance == null) {
            instance = new ConnectionManager();
        }
        return instance;
    }

}

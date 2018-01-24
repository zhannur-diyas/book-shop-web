package kz.epam.zd.listener;

import kz.epam.zd.exception.ConnectionPoolException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import kz.epam.zd.cp.ConnectionPool;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ConnectionPoolListener implements ServletContextListener {

    private static final Logger log = LoggerFactory.getLogger(ConnectionPoolListener.class);
    private static ConnectionPool pool;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        pool = new ConnectionPool();

        try {
            pool.configure();
        } catch (ConnectionPoolException e) {
            try {
                pool.close();
            } catch (ConnectionPoolException e1) {
                log.error("Listener failed to start: " + e1);
            }
            log.error("Initializing a CP failed, error in fill() method." + e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        try {
            pool.close();
        } catch (ConnectionPoolException e) {
            log.error("Couldn't close connection pool", e);
        }
    }

    public static ConnectionPool getPool() {
        return pool;
    }
}
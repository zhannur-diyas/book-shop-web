package zd.dao.jdbc;

import zd.cp.PooledConnection;
import zd.dao.UserDao;
import zd.exception.JdbcDaoException;
import zd.model.user.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class JdbcUserDao extends JdbcDao<User> implements UserDao {

    JdbcUserDao(PooledConnection connection) {
        super(connection);
    }

    @Override
    protected void setPsFields(PreparedStatement statement, User user) throws JdbcDaoException {

    }

    @Override
    protected User createEntityFromRs(ResultSet rs) throws SQLException, JdbcDaoException {
        return null;
    }

    @Override
    protected String getInsertQuery() {
        return null;
    }

    @Override
    protected String getDeleteQuery() {
        return null;
    }

    @Override
    protected String getUpdateQuery() {
        return null;
    }

    @Override
    protected String getSelectByIdQuery(int id) {
        return null;
    }

    @Override
    protected String getSelectAllQuery() {
        return null;
    }

    @Override
    public List<User> getAllByQuery(String query) throws JdbcDaoException {
        return null;
    }
}
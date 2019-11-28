package locare.model.base;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

public interface BaseDAO<E extends BaseEntity> {

    public void create(Connection connection, E entity) throws Exception;

    public E readById(Connection connection, Long id) throws Exception;

    public List<E> readByCriteria(Connection connection, Map<Long, Object> criteria, Long limit, Long offset) throws Exception;

    public void update(Connection connection, E entity) throws Exception;

    public void delete(Connection connection, Long id) throws Exception;
}


package by.belkevich.repository;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

interface Repository <T extends Serializable, K extends Serializable> {

    void setType(Class<T> type);

    void add(T newInstance);

    T get(K id);

    T update(T obj);

    void delete(T obj);

    void deleteById(K id);

    int getCount();

    List<T> getAll();

    List<T> getAll(int offset, int limit);

    List<T> getAllByNamedQuery(String namedQueryName, Map<String, Object> params);

    List<T> getAllByNamedQuery(String namedQueryName, Map<String, Object> params, int offset, int limit);
}

package by.belkevich.repository;

import org.springframework.context.annotation.Scope;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@org.springframework.stereotype.Repository
@Scope("prototype")
public class RepositoryJPAImpl<T extends Serializable, K extends Serializable> implements Repository<T,K> {


    private Class<T> type;

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void setType(Class<T> type) {
        this.type = type;
    }

    @Override
    public void add(T newInstance) {
        entityManager.persist(newInstance);
    }

    @Override
    public T get(K id) {
        return entityManager.find(type,id);
    }

    @Override
    public T update(T obj) {
        return entityManager.merge(obj);
    }

    @Override
    public void delete(T obj) {
        entityManager.remove(obj);
    }

    @Override
    public void deleteById(K id) {
        T obj = this.get(id);
        this.delete(obj);
    }

    @Override
    public List<T> getAll() {
        return entityManager.createQuery("FROM " + type.getSimpleName(),type).getResultList();
    }

    @Override
    public List<T> getAll(int offset, int limit) {
        return entityManager.createQuery("FROM " + type.getSimpleName(), type)
                .setFirstResult(offset)
                .setMaxResults(limit)
                .getResultList();
    }

    @Override
    public int getCount() {
        return entityManager
                .createQuery("SELECT count(t.id) FROM " + type.getSimpleName() + " t", Long.class)
                .getSingleResult().intValue();
    }

    public List<T> getAllByNamedQuery(String namedQueryName, Map<String, Object> params) {
        TypedQuery<T> q =  entityManager.createNamedQuery(namedQueryName,type);

        for (Map.Entry<String,Object> entry : params.entrySet()){
            q.setParameter(entry.getKey(),entry.getValue());
        }

        return q.getResultList();
    }

    @Override
    public List<T> getAllByNamedQuery(String namedQueryName, Map<String, Object> params, int offset, int limit) {
        TypedQuery<T> q = entityManager.createNamedQuery(namedQueryName, type);


        for (Map.Entry<String, Object> entry : params.entrySet()) {
            q.setParameter(entry.getKey(), entry.getValue());
        }

        return q.setFirstResult(offset)
                .setMaxResults(limit)
                .getResultList();
    }
}

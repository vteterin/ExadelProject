package by.belkevich.services;

import by.belkevich.repository.RepositoryJPAImpl;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

abstract class ParentService<T extends Serializable>  implements Service<T>{

    RepositoryJPAImpl<T,Long> repositoryJPA;

    //TODO: Need to add logging
    //TODO: Add exception handling


    ParentService(RepositoryJPAImpl<T, Long> repositoryJPA) {
        //WHEEL... getting real class from generic type

        Class<?> paramClass = this.getClass().getSuperclass();
        Class<T> domainClass =  (Class<T>) ((ParameterizedType)
                getClass().getGenericSuperclass()).getActualTypeArguments()[0];

        this.repositoryJPA = repositoryJPA;
        this.repositoryJPA.setType(domainClass);
    }

    @Override
    public void add(T obj) {
        this.repositoryJPA.add(obj);
    }

    @Override
    @Transactional
    public void addInTransaction(T obj) {
       this.add(obj);
    }

    @Override
    public T get(Long id) {
        return this.repositoryJPA.get(id);
    }

    @Override
    @Transactional
    public T getInTransaction(Long id) {
        return this.get(id);
    }

    @Override
    public void update(T obj) {
        this.repositoryJPA.update(obj);
    }

    @Override
    @Transactional
    public void updateInTransaction(T obj) {
        this.update(obj);
    }

    @Override
    @Transactional
    public void deleteInTransaction(T obj) {
        this.repositoryJPA.delete(obj);
    }

    @Override
    @Transactional
    public void deleteByIdInTransaction(Long id) {
        this.repositoryJPA.deleteById(id);
    }

    @Override
    @Transactional
    public List<T> getAll() {
        return this.repositoryJPA.getAll();
    }

    @Override
    @Transactional
    public List<T> getAllLimit(int offset, int limit) {
        return this.repositoryJPA.getAll(offset, limit);
    }

    @Override
    @Transactional
    public int getCount() {
        return repositoryJPA.getCount();
    }
}

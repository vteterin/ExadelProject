package by.belkevich.services;

import by.belkevich.entities.Category;
import by.belkevich.repository.RepositoryJPAImpl;
import by.belkevich.services.util.ParametersBuilder;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@org.springframework.stereotype.Service
public class CategoryServiceImpl extends ParentService<Category> implements CategoryService {

    @Autowired
    public CategoryServiceImpl(RepositoryJPAImpl<Category, Long> repositoryJPA) {
        super(repositoryJPA);
    }

    @Override
    public Category getCategoryByName(String categoryName) {

        List<Category> categories = repositoryJPA.getAllByNamedQuery("GET_CATEGORY_BY_NAME",
                ParametersBuilder.newBuilder().addParam("category_name", categoryName).build());
        if (categories.isEmpty()) {
            return null;
        } else {
            return categories.get(0);
        }

    }
}

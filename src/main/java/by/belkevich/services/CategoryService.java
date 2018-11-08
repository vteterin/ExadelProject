package by.belkevich.services;

import by.belkevich.entities.Category;

public interface CategoryService extends Service<Category> {

    Category getCategoryByName(String categoryName);
}

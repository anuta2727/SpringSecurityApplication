package com.example.springsecurityapplication.repositories;

import com.example.springsecurityapplication.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

//Указываем, с какой моделью будем работать и какой тип данных id
@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

    //Метод по извлечению категории
    Category findByName(String name);
}

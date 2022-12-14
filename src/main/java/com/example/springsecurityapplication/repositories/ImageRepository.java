package com.example.springsecurityapplication.repositories;

import com.example.springsecurityapplication.models.Image;
import com.example.springsecurityapplication.models.Person;
import com.example.springsecurityapplication.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;


@Transactional
//Указываем, с какой моделью будем работать и какой тип данных id
@Repository
public interface ImageRepository extends JpaRepository<Image, Integer> {

 //List<Image> findById(Person person);
 List<Image> findById(Product product);

    @Modifying
    @Query(value = "delete from image where id=?1", nativeQuery = true)
    void deleteImage(int id_image);

}
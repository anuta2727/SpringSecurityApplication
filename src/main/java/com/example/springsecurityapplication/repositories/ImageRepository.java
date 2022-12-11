package com.example.springsecurityapplication.repositories;

import com.example.springsecurityapplication.models.Image;
import com.example.springsecurityapplication.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

//Указываем, с какой моделью будем работать и какой тип данных id
@Repository
public interface ImageRepository extends JpaRepository<Image, Integer> {

//    List<Image> findByPerson(Person person);


}

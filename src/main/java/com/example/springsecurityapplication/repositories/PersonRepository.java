package com.example.springsecurityapplication.repositories;

import com.example.springsecurityapplication.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

//Указываем, с какой моделью будем работать и какой тип данных id
public interface PersonRepository extends JpaRepository<Person, Integer> {
    // Получаем запись из БД по логину
    Optional<Person> findByLogin(String login);
    Optional<Person> findByRole(String role);

}

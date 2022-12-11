package com.example.springsecurityapplication.repositories;

import com.example.springsecurityapplication.models.Category;
import com.example.springsecurityapplication.models.Order;
import com.example.springsecurityapplication.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

//Указываем, с какой моделью будем работать и какой тип данных id
@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
    List<Order> findByPerson(Person person);

    @Query(value="select * from orders where (lower(number)) LIKE %?1", nativeQuery = true)
    List<Order> findByLastFourCharacters(String s);


}
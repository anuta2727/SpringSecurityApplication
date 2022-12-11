package com.example.springsecurityapplication.services;

import com.example.springsecurityapplication.models.Product;
import com.example.springsecurityapplication.repositories.OrderRepository;
import com.example.springsecurityapplication.models.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class OrderService {
    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @Autowired
    public List<Order> getAllOrder() {
        return orderRepository.findAll();
    }

    @Transactional
    public void deleteProduct(int id){
        orderRepository.deleteById(id);
    }

    public Order getOrderId(int id){
        Optional<Order> optionalOrder = orderRepository.findById(id);
        return optionalOrder.orElse(null);
    }

    @Transactional
    public void updateOrderStatus(Order order){
        orderRepository.save(order);
    }

    @Transactional
    public List findByLastFourCharacters(String s){
        List<Order> orders = orderRepository.findByLastFourCharacters(s);
        return orders;
    }






}
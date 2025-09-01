package com.example.jasperDemo.service;

import com.example.jasperDemo.dto.CustomerOrderDTO;
import com.example.jasperDemo.entity.Customer;
import com.example.jasperDemo.repository.CustomerOrderRepository;
import com.example.jasperDemo.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CustomerService {

    private final CustomerRepository customerRepository;
    private final CustomerOrderRepository customerOrderRepository;

    // Fetch all customers
    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }

    // Save customer
    public Customer saveCustomer(Customer customer) {
        return customerRepository.save(customer);
    }

    // Fetch all customer orders as DTO
    public List<CustomerOrderDTO> getAllCustomerOrders() {
        return customerOrderRepository.findAll()
                .stream()
                .map(order -> new CustomerOrderDTO(
                        order.getCustomer().getName(),
                        order.getProductName(),
                        order.getQuantity(),
                        order.getPrice(),
                        order.getTotal()
                ))
                .collect(Collectors.toList());
    }
}

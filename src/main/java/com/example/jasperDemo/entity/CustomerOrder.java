package com.example.jasperDemo.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "customer_orders")
public class CustomerOrder {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String productName;
    private Integer quantity;
    private Double price;
    private Double total;

    @ManyToOne
    @JoinColumn(name = "customer_id") // FK to customer table
    private Customer customer;
}

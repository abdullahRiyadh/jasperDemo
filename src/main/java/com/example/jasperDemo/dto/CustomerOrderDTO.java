package com.example.jasperDemo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerOrderDTO {
    private String customerName;
    private String productName;
    private Integer quantity;
    private Double price;
    private Double total;
}

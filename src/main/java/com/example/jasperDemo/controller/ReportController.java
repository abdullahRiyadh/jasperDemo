package com.example.jasperDemo.controller;

import com.example.jasperDemo.service.ReportService;
import lombok.RequiredArgsConstructor;
import net.sf.jasperreports.engine.JRException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class ReportController {

    private final ReportService reportService;

    @GetMapping("/report/customer-orders")
    public ResponseEntity<byte[]> getCustomerOrderReport() throws JRException {
        byte[] data = reportService.generateCustomerOrderReport();
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=customer_orders.pdf")
                .contentType(MediaType.APPLICATION_PDF)
                .body(data);
    }
}

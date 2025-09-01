package com.example.jasperDemo.service;

import com.example.jasperDemo.dto.CustomerOrderDTO;
import lombok.RequiredArgsConstructor;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ReportService {

    private final CustomerService customerService;

    public byte[] generateCustomerOrderReport() throws JRException {
        // Load jrxml template
        InputStream reportStream = this.getClass()
                .getResourceAsStream("/reports/customerOrderReport.jrxml");
        JasperReport jasperReport = JasperCompileManager.compileReport(reportStream);

        // Fetch data from DB
        List<CustomerOrderDTO> customerOrders = customerService.getAllCustomerOrders();
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(customerOrders);

        // Parameters
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("createdBy", "Riyadh");

        // Fill report
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);

        return JasperExportManager.exportReportToPdf(jasperPrint);
    }
}

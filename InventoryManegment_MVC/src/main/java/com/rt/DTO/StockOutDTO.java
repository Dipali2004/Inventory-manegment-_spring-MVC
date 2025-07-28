package com.rt.DTO;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StockOutDTO {

    private int stockOutId;        
    private Integer quantitySold;   
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime saleDate;
    private String customerName;  
    private int productId;         
    private int createdBy; 

}

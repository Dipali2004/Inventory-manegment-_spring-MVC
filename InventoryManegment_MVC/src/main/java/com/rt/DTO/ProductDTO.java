package com.rt.DTO;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {

    private int productId;         
    private String productName;
    private String category;
    private int supplierId;        
    private String supplierName;    
    private int quantityInStock;
    private int reorderLevel;
    private double pricePerUnit;
//    private String User;
}

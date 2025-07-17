package com.rt.DTO;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductUpdate {

    private int productId;         
    private String productName;
    private String category;
      
    private int quantityInStock;
    private int reorderLevel;
    private double pricePerUnit;
   
}

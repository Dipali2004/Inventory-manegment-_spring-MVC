package com.rt.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductReoprtDTO {
	   private Integer productId;
	    private String productName;
	    private String category;
	    private Integer quantityInStock;
	    private Integer reorderLevel;
	    private String status; 
}

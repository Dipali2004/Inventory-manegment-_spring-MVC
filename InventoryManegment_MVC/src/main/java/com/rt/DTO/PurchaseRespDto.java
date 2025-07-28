package com.rt.DTO;

import java.time.LocalDate;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseRespDto {

	
	   private int purchaseId;
	    private ProductDTO product;           
	    private SupplierRespDTO supplier;      
	    private int quantityPurchased;
	    private LocalDate purchaseDate;

}
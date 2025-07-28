package com.rt.DTO;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseDTO {

	private int purchaseId;

	private int productId;

	private int supplierId;

	private int quantityPurchased;

	private LocalDate purchaseDate;

}
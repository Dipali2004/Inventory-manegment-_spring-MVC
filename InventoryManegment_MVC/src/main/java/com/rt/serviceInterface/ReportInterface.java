package com.rt.serviceInterface;

import java.time.LocalDate;
import java.util.List;

import com.rt.DTO.ProductReoprtDTO;
import com.rt.DTO.ProductRespDTO;
import com.rt.DTO.PurchaseDTO;
import com.rt.DTO.PurchaseRespDto;
import com.rt.DTO.StockOutRepDTO;
import com.rt.DTO.SupplierRespDTO;

public interface ReportInterface {

	List<ProductReoprtDTO> stockReport();

	List<ProductReoprtDTO> LowStock();

	List<SupplierRespDTO> supplierPurchase();

	List<ProductRespDTO> ProductPurchase();

	List<PurchaseRespDto> getAll();


	List<StockOutRepDTO> saleReport();

}

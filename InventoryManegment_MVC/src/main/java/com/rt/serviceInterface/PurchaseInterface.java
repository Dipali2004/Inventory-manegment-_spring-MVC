package com.rt.serviceInterface;

import java.util.List;

import com.rt.DTO.ProductRespDTO;
import com.rt.DTO.PurchaseDTO;
import com.rt.DTO.PurchaseRespDto;
import com.rt.DTO.SupplierRespDTO;

public interface PurchaseInterface {

	PurchaseRespDto add(PurchaseDTO purchaseDTO);

	List<SupplierRespDTO> supplierPurchase();

	List<ProductRespDTO> ProductPurchase();

	List<PurchaseRespDto> getAll();

	PurchaseRespDto getData(int id);

	PurchaseRespDto update(PurchaseDTO purchaseDTO);

}

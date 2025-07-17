package com.rt.serviceInterface;

import java.util.List;

import com.rt.DTO.SupplierReqDTO;
import com.rt.DTO.SupplierRespDTO;

public interface SupplierInt {

	SupplierRespDTO add(SupplierReqDTO supplierReqDTO);

	List<SupplierRespDTO> getAll();

	SupplierRespDTO update(int id);

	SupplierReqDTO dataUpdate(SupplierReqDTO supplierReqDTO);

}

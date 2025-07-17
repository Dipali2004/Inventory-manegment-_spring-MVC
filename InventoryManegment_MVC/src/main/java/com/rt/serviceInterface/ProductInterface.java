package com.rt.serviceInterface;

import java.util.List;

import com.rt.DTO.ProductDTO;
import com.rt.DTO.ProductRespDTO;
import com.rt.DTO.ProductUpdate;
import com.rt.DTO.SupplierRespDTO;

public interface ProductInterface {

	ProductRespDTO addProduct(ProductDTO productDTO);

	List<SupplierRespDTO> supplier();

	List<ProductRespDTO> getall();

	ProductRespDTO update(int id);

	ProductRespDTO updateData(ProductDTO productDTO);

}

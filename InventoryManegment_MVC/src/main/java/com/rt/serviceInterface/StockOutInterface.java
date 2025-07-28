package com.rt.serviceInterface;

import java.util.List;

import com.rt.DTO.ProductRespDTO;
import com.rt.DTO.StockOutDTO;
import com.rt.DTO.StockOutRepDTO;

public interface StockOutInterface {

	StockOutRepDTO add(StockOutDTO stockOutDTO);

	List<ProductRespDTO> stock();

	List<StockOutRepDTO> getAll();

	StockOutRepDTO GetDataId(int id);

	StockOutRepDTO updateData(StockOutDTO stockOutDTO);

}

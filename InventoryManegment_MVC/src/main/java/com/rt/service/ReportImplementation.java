package com.rt.service;


import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.DTO.ProductReoprtDTO;
import com.rt.DTO.ProductRespDTO;
import com.rt.DTO.PurchaseRespDto;
import com.rt.DTO.StockOutRepDTO;
import com.rt.DTO.SupplierRespDTO;
import com.rt.serviceInterface.ReportInterface;

@Service
public class ReportImplementation implements ReportInterface{
	@Autowired
	private RestTemplate restTemplate;
	@Override
	public List<ProductReoprtDTO> stockReport() {
		String url = "http://localhost:8085/report/stockReport";

		ProductReoprtDTO[] response = restTemplate.getForObject(url, ProductReoprtDTO[].class);

		List<ProductReoprtDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;

		
	}
	@Override
	public List<ProductReoprtDTO> LowStock() {
		String url = "http://localhost:8085/report/getData";

		ProductReoprtDTO[] response = restTemplate.getForObject(url, ProductReoprtDTO[].class);

		List<ProductReoprtDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;

	}
	@Override
	public List<SupplierRespDTO> supplierPurchase() {
		String url = "http://localhost:8085/report/supplierPurchaseReport";

		SupplierRespDTO[] response = restTemplate.getForObject(url, SupplierRespDTO[].class);

		List<SupplierRespDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;
	}
	@Override
	public List<ProductRespDTO> ProductPurchase() {
		String url = "http://localhost:8085/report/productPurchaseReport";

		ProductRespDTO[] response = restTemplate.getForObject(url, ProductRespDTO[].class);

		List<ProductRespDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;
	}
	@Override
	public List<PurchaseRespDto> getAll() {
		String url = "http://localhost:8085/report/purchaseReport";
		PurchaseRespDto[] response = restTemplate.getForObject(url, PurchaseRespDto[].class);

		List<PurchaseRespDto> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;
	}
	@Override
	public List<StockOutRepDTO> saleReport() {
		String url = "http://localhost:8085/report/getSale";

		StockOutRepDTO[] response = restTemplate.getForObject(url, StockOutRepDTO[].class);

		List<StockOutRepDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;
	
	}
	


}

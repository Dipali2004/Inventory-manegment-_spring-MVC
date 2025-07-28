package com.rt.service;

import java.util.Arrays;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.DTO.ProductRespDTO;
import com.rt.DTO.PurchaseDTO;
import com.rt.DTO.PurchaseRespDto;
import com.rt.DTO.SupplierRespDTO;
import com.rt.serviceInterface.PurchaseInterface;
@Service
public class PurchaseImpl implements PurchaseInterface {

	@Autowired
    private RestTemplate restTemplate;
	@Override
	public PurchaseRespDto add(PurchaseDTO purchaseDTO) {
		 String url = "http://localhost:8000/purchase/add";

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);

	        HttpEntity<PurchaseDTO> request = new HttpEntity<>(purchaseDTO, headers);

	        PurchaseRespDto response = restTemplate.postForObject(url, request, PurchaseRespDto.class);

	        System.out.println("Response from external service: " + response);
	        return response;
	}

	@Override
	public List<SupplierRespDTO> supplierPurchase() {
		String url = "http://localhost:8000/purchase/supplierPurchase";

		SupplierRespDTO[] response = restTemplate.getForObject(url, SupplierRespDTO[].class);

		List<SupplierRespDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;

	}

	@Override
	public List<ProductRespDTO> ProductPurchase() {
		String url = "http://localhost:8000/purchase/productPurchase";

		ProductRespDTO[] response = restTemplate.getForObject(url, ProductRespDTO[].class);

		List<ProductRespDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;
	}

	@Override
	public List<PurchaseRespDto> getAll() {
		String url = "http://localhost:8000/purchase/getallPurchase";
		PurchaseRespDto[] response = restTemplate.getForObject(url, PurchaseRespDto[].class);

		List<PurchaseRespDto> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;
	}

	@Override
	public PurchaseRespDto getData(int id) {
		String url = "http://localhost:8000/purchase/getFormId/" + id;
		PurchaseRespDto data = restTemplate.getForObject(url, PurchaseRespDto.class);
		return data;
	}

	@Override
	public PurchaseRespDto update(PurchaseDTO purchaseDTO) {
		String url = "http://localhost:8000/purchase/updatePurchase";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<PurchaseDTO> request = new HttpEntity<>(purchaseDTO, headers);

		PurchaseRespDto response = restTemplate.postForObject(url, request, PurchaseRespDto.class);

		System.out.println("Response from external service: " + response);
		return response;
	}

}

package com.rt.service;

import java.util.Arrays;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.DTO.ProductDTO;
import com.rt.DTO.ProductRespDTO;
import com.rt.DTO.ProductUpdate;
import com.rt.DTO.SupplierReqDTO;
import com.rt.DTO.SupplierRespDTO;
import com.rt.serviceInterface.ProductInterface;

@Service
public class ProductImplementation implements ProductInterface {

	@Autowired
	private RestTemplate restTemplate;

	@Override
	public ProductRespDTO addProduct(ProductDTO productDTO) {
		String url = "http://localhost:8000/product/add";

		System.out.println(productDTO);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<ProductDTO> request = new HttpEntity<>(productDTO, headers);

		ProductRespDTO response = restTemplate.postForObject(url, request, ProductRespDTO.class);

		System.out.println("Response from external service: " + response);
		return response;
	}

	@Override
	public List<SupplierRespDTO> supplier() {
		String url = "http://localhost:8000/product/supplier";

		SupplierRespDTO[] response = restTemplate.getForObject(url, SupplierRespDTO[].class);

		List<SupplierRespDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;

	}

	@Override
	public List<ProductRespDTO> getall() {
		String url = "http://localhost:8000/product/getall";

		ProductRespDTO[] response = restTemplate.getForObject(url, ProductRespDTO[].class);

		List<ProductRespDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;

	}

	@Override
	public ProductRespDTO update(int id) {
		String url = "http://localhost:8000/product/update/" + id;
		ProductRespDTO data = restTemplate.getForObject(url, ProductRespDTO.class);
		return data;

	}

	@Override
	public ProductRespDTO updateData(ProductDTO productDTO) {
		String url = "http://localhost:8000/product/updateform";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<ProductDTO> request = new HttpEntity<>(productDTO, headers);

		ProductRespDTO response = restTemplate.postForObject(url, request, ProductRespDTO.class);

		System.out.println("Response from external service: " + response);
		return response;
	}

}

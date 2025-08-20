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
import com.rt.DTO.StockOutDTO;
import com.rt.DTO.StockOutRepDTO;
import com.rt.serviceInterface.StockOutInterface;

@Service

public class StockOutService implements StockOutInterface {
	@Autowired
	private RestTemplate restTemplate;

	
	@Override
	public StockOutRepDTO add(StockOutDTO stockOutDTO) {
		String url = "http://localhost:8085/stock/add";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<StockOutDTO> request = new HttpEntity<>(stockOutDTO, headers);

		StockOutRepDTO response = restTemplate.postForObject(url, request, StockOutRepDTO.class);

		System.out.println("Response from external service: " + response);
		return response;

	}


	@Override
	public List<ProductRespDTO> stock() {
		String url = "http://localhost:8085/stock/productPurchase";

		ProductRespDTO[] response = restTemplate.getForObject(url, ProductRespDTO[].class);

		List<ProductRespDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;
	
	}


	@Override
	public List<StockOutRepDTO> getAll() {
		String url = "http://localhost:8085/stock/getallStock";

		StockOutRepDTO[] response = restTemplate.getForObject(url, StockOutRepDTO[].class);

		List<StockOutRepDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;
		
	}


	@Override
	public StockOutRepDTO GetDataId(int id) {
		String url = "http://localhost:8085/stock/GetId/" + id;
		StockOutRepDTO data = restTemplate.getForObject(url, StockOutRepDTO.class);
		return data;
		
	}


	@Override
	public StockOutRepDTO updateData(StockOutDTO stockOutDTO) {
		String url = "http://localhost:8085/stock/UpdateStock";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<StockOutDTO> request = new HttpEntity<>(stockOutDTO, headers);

		StockOutRepDTO response = restTemplate.postForObject(url, request, StockOutRepDTO.class);

		System.out.println("Response from external service: " + response);
		return response;
	}
	

}

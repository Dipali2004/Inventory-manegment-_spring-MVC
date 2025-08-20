package com.rt.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.DTO.ProductRespDTO;
import com.rt.serviceInterface.FilterInterface;
@Service 
public class FilterImplementation implements FilterInterface {
	@Autowired
	private RestTemplate restTemplate;
	@Override
	public List<ProductRespDTO> Invetory() {
		String url = "http://localhost:8085/filter2/Inventory";

		ProductRespDTO[] response = restTemplate.getForObject(url, ProductRespDTO[].class);

		List<ProductRespDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;

	}

}

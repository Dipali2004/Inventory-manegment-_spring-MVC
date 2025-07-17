package com.rt.service;

import java.util.Arrays;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.DTO.SupplierReqDTO;
import com.rt.DTO.SupplierRespDTO;
import com.rt.serviceInterface.SupplierInt;
@Service
public class SupplierService implements SupplierInt  {
	@Autowired
	private RestTemplate restTemplate;

	@Override
	public SupplierRespDTO add(SupplierReqDTO supplierReqDTO) {
		String url = "http://localhost:8000/api1/add";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<SupplierReqDTO> request = new HttpEntity<>(supplierReqDTO, headers);

		SupplierRespDTO response = restTemplate.postForObject(url, request, SupplierRespDTO.class);

		System.out.println("Response from external service: " + response);
		return response;
	}

	@Override
	public List<SupplierRespDTO> getAll() {
		String url = "http://localhost:8000/api1/get";

		SupplierRespDTO[] response = restTemplate.getForObject(url, SupplierRespDTO[].class);

		List<SupplierRespDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;
	
	}

	@Override
	public SupplierRespDTO update(int id) {
		String url = "http://localhost:8000/api1/update/" + id;
		SupplierRespDTO data =restTemplate.getForObject(url, SupplierRespDTO.class); 
		return data;
	}

	@Override
	public SupplierReqDTO dataUpdate(SupplierReqDTO supplierReqDTO) {
		String url = "http://localhost:8000/api1/updateForm";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<SupplierReqDTO> request = new HttpEntity<>(supplierReqDTO, headers);

		SupplierReqDTO response = restTemplate.postForObject(url, request, SupplierReqDTO.class);

		System.out.println("Response from external service: " + response);
		return response;
	}

}

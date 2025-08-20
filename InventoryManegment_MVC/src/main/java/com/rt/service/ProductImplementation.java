package com.rt.service;

import java.util.Arrays;



import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.DTO.ProductDTO;
import com.rt.DTO.ProductRespDTO;
import com.rt.DTO.SupplierRespDTO;
import com.rt.serviceInterface.ProductInterface;

@Service
public class ProductImplementation implements ProductInterface {

	@Autowired
	private RestTemplate restTemplate;

	@Override
	public ProductRespDTO addProduct(ProductDTO productDTO) {
		String url = "http://localhost:8085/product/add";

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
		String url = "http://localhost:8085/product/supplier";

		SupplierRespDTO[] response = restTemplate.getForObject(url, SupplierRespDTO[].class);

		List<SupplierRespDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;

	}

	@Override
	public List<ProductRespDTO> getall(int page, int size) {
		 String url = "http://localhost:8085/product/getall?page=" + page + "&size=" + size;

	        // Get the response as Map
	        Map<String, Object> response = restTemplate.getForObject(url, Map.class);

	        // Extract "content" which is the list of products
	        List<Map<String, Object>> content = (List<Map<String, Object>>) response.get("content");

	        // Convert each map to ProductRespDTO
	        List<ProductRespDTO> productList = content.stream()
	            .map(map -> {
	                ProductRespDTO dto = new ProductRespDTO();
	                dto.setProductId((Integer) map.get("productId"));
	                dto.setProductName((String) map.get("productName"));
	                dto.setCategory((String) map.get("category"));
	                dto.setSupplierId((Integer) map.get("supplierId"));
	                dto.setSupplierName((String) map.get("supplierName"));
	                dto.setQuantityInStock((Integer) map.get("quantityInStock"));
	                dto.setReorderLevel((Integer) map.get("reorderLevel"));
	                dto.setPricePerUnit(Double.valueOf(map.get("pricePerUnit").toString()));
	                return dto;
	            }).collect(Collectors.toList());

	        return productList;
	    
	}

	@Override
	public ProductRespDTO update(int id) {
		String url = "http://localhost:8085/product/update/" + id;
		ProductRespDTO data = restTemplate.getForObject(url, ProductRespDTO.class);
		return data;

	}

	@Override
	public ProductRespDTO updateData(ProductDTO productDTO) {
		String url = "http://localhost:8085/product/updateform";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<ProductDTO> request = new HttpEntity<>(productDTO, headers);

		ProductRespDTO response = restTemplate.postForObject(url, request, ProductRespDTO.class);

		System.out.println("Response from external service: " + response);
		return response;
	}

	@Override
	public List<ProductRespDTO> getall() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void DeleteProduct(int id) {
		
		  String url = "http://localhost:8085/product/delete/{id}";
		    
		   
		    RestTemplate restTemplate = new RestTemplate();
		
		    restTemplate.delete(url, id);
		    
		    System.out.println("Product with ID " + id + " deleted successfully!");
	}

	

}

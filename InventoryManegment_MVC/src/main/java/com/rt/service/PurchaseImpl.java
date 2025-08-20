
package com.rt.service;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.DTO.ProductDTO;
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
		 String url = "http://localhost:8085/purchase/add";

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);

	        HttpEntity<PurchaseDTO> request = new HttpEntity<>(purchaseDTO, headers);

	        PurchaseRespDto response = restTemplate.postForObject(url, request, PurchaseRespDto.class);

	        System.out.println("Response from external service: " + response);
	        return response;
	}

	@Override
	public List<SupplierRespDTO> supplierPurchase() {
		String url = "http://localhost:8085/purchase/supplierPurchase";

		SupplierRespDTO[] response = restTemplate.getForObject(url, SupplierRespDTO[].class);

		List<SupplierRespDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;

	}

	@Override
	public List<ProductRespDTO> ProductPurchase() {
		String url = "http://localhost:8085/purchase/productPurchase";

		ProductRespDTO[] response = restTemplate.getForObject(url, ProductRespDTO[].class);

		List<ProductRespDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;
	}

//	@Override
//	public List<PurchaseRespDto> getAll() {
//		String url = "http://localhost:8085/purchase/getallPurchase";
//		PurchaseRespDto[] response = restTemplate.getForObject(url, PurchaseRespDto[].class);
//
//		List<PurchaseRespDto> responseList = Arrays.asList(response);
//
//		System.out.println("Response from external service: " + response);
//		return responseList;
//	}

	@Override
	public PurchaseRespDto getData(int id) {
		String url = "http://localhost:8085/purchase/getFormId/" + id;
		PurchaseRespDto data = restTemplate.getForObject(url, PurchaseRespDto.class);
		return data;
	}

	@Override
	public PurchaseRespDto update(PurchaseDTO purchaseDTO) {
		String url = "http://localhost:8085/purchase/updatePurchase";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<PurchaseDTO> request = new HttpEntity<>(purchaseDTO, headers);

		PurchaseRespDto response = restTemplate.postForObject(url, request, PurchaseRespDto.class);

		System.out.println("Response from external service: " + response);
		return response;
	}

	@Override
	public List<PurchaseRespDto> getAll(int page, int size) {

	    String url = "http://localhost:8085/purchase/getallPurchase?page=" + page + "&size=" + size;

	    // Get the response as Map
	    Map<String, Object> response = restTemplate.getForObject(url, Map.class);

	    // Extract content list
	    List<Map<String, Object>> content = (List<Map<String, Object>>) response.get("content");

	    // Convert each map to DTO
	    List<PurchaseRespDto> productList = content.stream()
	        .map(map -> {
	        	PurchaseRespDto dto = new PurchaseRespDto();

	            // Purchase Id
	            dto.setPurchaseId((Integer) map.get("purchaseId"));

	            // Product (nested DTO mapping)
	            Map<String, Object> productMap = (Map<String, Object>) map.get("product");
	            if (productMap != null) {
	                ProductDTO product = new ProductDTO();
	                product.setProductId((Integer) productMap.get("productId"));
	                product.setProductName((String) productMap.get("productName"));
	                // set other fields if available
	                dto.setProduct(product);
	            }

	            // Supplier (nested DTO mapping)
	            Map<String, Object> supplierMap = (Map<String, Object>) map.get("supplier");
	            if (supplierMap != null) {
	                SupplierRespDTO supplier = new SupplierRespDTO();
	                supplier.setSupplierId((Integer) supplierMap.get("supplierId"));
	                supplier.setName((String) supplierMap.get("supplierName"));
	                // set other fields if available
	                dto.setSupplier(supplier);
	            }

	            // Quantity
	            dto.setQuantityPurchased((Integer) map.get("quantityPurchased"));

	            // Purchase Date (convert to LocalDate if String comes from API)
	            Object dateObj = map.get("purchaseDate");
	            if (dateObj != null) {
	                dto.setPurchaseDate(LocalDate.parse(dateObj.toString()));
	            }

	            return dto;
	        })
	        .collect(Collectors.toList());

	    return productList;
	}


}

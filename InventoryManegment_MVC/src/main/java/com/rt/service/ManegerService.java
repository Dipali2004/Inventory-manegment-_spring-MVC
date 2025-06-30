package com.rt.service;

import java.util.Arrays;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.DTO.GetAllManegerDTO;
import com.rt.DTO.ManegerDTO;
import com.rt.DTO.ManegerRepDTO;
import com.rt.DTO.UpdateManagerDTO;
import com.rt.serviceInterface.ManegerInterface;

@Service
public class ManegerService implements ManegerInterface {

	@Autowired
	private RestTemplate restTemplate;

	@Override
	public ManegerRepDTO addManeger(ManegerDTO manegerDTO) {

		String url = "http://localhost:8000/api/maneger";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<ManegerDTO> request = new HttpEntity<>(manegerDTO, headers);

		ManegerRepDTO response = restTemplate.postForObject(url, request, ManegerRepDTO.class);

		System.out.println("Response from external service: " + response);
		return response;

	}

	@Override
	public List<GetAllManegerDTO> getAll() {
		String url = "http://localhost:8000/api/getAllData";

		GetAllManegerDTO[] response = restTemplate.getForObject(url, GetAllManegerDTO[].class);

		List<GetAllManegerDTO> responseList = Arrays.asList(response);

		System.out.println("Response from external service: " + response);
		return responseList;
	}

	@Override
	public UpdateManagerDTO updateManeger(int id) {

		String url = "http://localhost:8000/api/update/" + id;
		System.out.println(id);
		UpdateManagerDTO empDTO = restTemplate.getForObject(url, UpdateManagerDTO.class);

		return empDTO;

	}

	@Override
	public GetAllManegerDTO update(GetAllManegerDTO getAllManegerDTO) {
		String url = "http://localhost:8000/api/update";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<GetAllManegerDTO> request = new HttpEntity<>(getAllManegerDTO, headers);

		GetAllManegerDTO response = restTemplate.postForObject(url, request, GetAllManegerDTO.class);

		System.out.println("Response from external service: " + response);
		return null;
	}

	
}

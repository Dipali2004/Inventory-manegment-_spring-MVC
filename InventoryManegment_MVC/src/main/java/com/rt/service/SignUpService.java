package com.rt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.DTO.SignUpDTO;
import com.rt.serviceInterface.SignUpInterface;
@Service
public class SignUpService implements  SignUpInterface {

	@Autowired
	private RestTemplate restTemplate;
	
	
	@Override
	public boolean signup(SignUpDTO signUpDTO) {
	
//		System.out.println(signUpDTO.getFullName());
//		System.out.println(signUpDTO.getEmail());
//		System.out.println(signUpDTO.getPhone());
//		System.out.println(signUpDTO.getPassword());
//
//		System.out.println(signUpDTO.getRole());
		 String url = "http://localhost:8000/main/SignUp"; 
		  
		  HttpHeaders headers = new HttpHeaders();
         headers.setContentType(MediaType.APPLICATION_JSON);
         
         HttpEntity <SignUpDTO> request=new HttpEntity<>(signUpDTO,headers);

	        // Send POST request with studentDTO as body, expecting String response
	        Boolean response = restTemplate.postForObject(url,request , Boolean.class);

	        return response;
		
	}

}

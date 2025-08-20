package com.rt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders; // ✅ Correct import
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.rt.DTO.ReqLoginDTO;
import com.rt.DTO.RespLoginDTO;
import com.rt.serviceInterface.LoginServiceInt;

@Service
public class LoginImplementation implements LoginServiceInt {

    @Autowired
    private RestTemplate restTemplate;

    @Override
    public RespLoginDTO login(ReqLoginDTO reqLoginDTO) throws RestClientException {
//    	System.out.println("service");
//    	System.out.println(reqLoginDTO.getEmail());
//    	System.out.println(reqLoginDTO.getPassword());
//    	System.out.println(reqLoginDTO.getRole());
        String url = "http://localhost:8085/api/login";

        HttpHeaders headers = new HttpHeaders(); 
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<ReqLoginDTO> request = new HttpEntity<>(reqLoginDTO, headers);

       
        RespLoginDTO response = restTemplate.postForObject(url, request, RespLoginDTO.class);

       
        return response;
    }
}

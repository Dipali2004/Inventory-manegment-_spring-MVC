package com.rt.controller;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.rt.DTO.ReqLoginDTO;
import com.rt.DTO.RespLoginDTO;
import com.rt.serviceInterface.LoginServiceInt;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

	@Autowired
	private LoginServiceInt serviceInterface;

	

	@PostMapping("login")
	public String Login(@ModelAttribute ReqLoginDTO reqLoginDTO, Model model, HttpSession session) {
		System.out.println(reqLoginDTO.getEmail());
    	System.out.println(reqLoginDTO.getPassword());
    	System.out.println(reqLoginDTO.getRole());

		RespLoginDTO data = serviceInterface.login(reqLoginDTO);
//		System.out.println(data.getEmail());
//		System.out.println(data.getPassword());
//		System.err.println(data.getRole());

		

		if (data != null) {
			session.setAttribute("userEmail", data.getEmail());

			session.setAttribute("userRole", data.getRole());
			return "index";
		}

		return "login";
	}
}

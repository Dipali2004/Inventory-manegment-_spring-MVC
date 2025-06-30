package com.rt.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.rt.DTO.SignUpDTO;
import com.rt.serviceInterface.SignUpInterface;

import ch.qos.logback.core.model.Model;
@Controller
public class SignUpController {
	@Autowired
	private SignUpInterface signUpInterface;
	
	@GetMapping("/")
	public String main() {
		return "login";
	}

	
@GetMapping("/signup")
public String main1() {

	return "signup";
}

@PostMapping("/singupPage")
public String signup(@ModelAttribute SignUpDTO signUpDTO,Model model ) {

//	System.out.println(signUpDTO.getFullName());
//	System.out.println(signUpDTO.getEmail());
//	System.out.println(signUpDTO.getPhone());
//	System.out.println(signUpDTO.getPassword());
//	
//	System.out.println(signUpDTO.getRole());
	boolean userStatus=signUpInterface.signup(signUpDTO);
	if(userStatus) {
		return "index";
	}
	return "signup";
	
}

}

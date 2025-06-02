package com.rt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class LoginController {
@GetMapping("/login")
	public String main() {
		return "login";
	}

@GetMapping("/signup")
public String main1() {
	return "signup";
}


}

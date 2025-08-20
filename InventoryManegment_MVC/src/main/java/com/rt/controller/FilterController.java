package com.rt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rt.DTO.ProductRespDTO;
import com.rt.serviceInterface.FilterInterface;


@Controller
public class FilterController {
	@Autowired
	private FilterInterface filterInterface;
//	@GetMapping("/filterData")
//	public String Filter() {
//		return "Filter";
//	}
	
	@GetMapping("/filterData")
	public String Invetory(Model model) {
		List<ProductRespDTO> product = filterInterface.Invetory();
		System.out.println("all data come here"+product);
		model.addAttribute("product", product);
		return "Filter";
	}
}

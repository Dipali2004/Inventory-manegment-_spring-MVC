package com.rt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rt.DTO.SupplierReqDTO;
import com.rt.DTO.SupplierRespDTO;
import com.rt.serviceInterface.SupplierInt;

import jakarta.servlet.http.HttpSession;

@Controller
public class SupplierController {
	@Autowired
	private SupplierInt supplierInt;

	@GetMapping("/supplier")
	public String supplier() {
		return "suppiler";
	}

	@PostMapping("/supplierform")
	public SupplierRespDTO add(
	        @ModelAttribute SupplierReqDTO supplierReqDTO, 
	        Model model, 
	        HttpSession session) {

	   
	    String email = (String) session.getAttribute("userEmail");

	   
	    supplierReqDTO.setUser(email);

	    SupplierRespDTO response = supplierInt.add(supplierReqDTO);

	 
	    return response;
	}

	@GetMapping("/view")
	public String getAll(Model model) {
		List<SupplierRespDTO> list = supplierInt.getAll();
		model.addAttribute("managers", list);

		return "viewSupplier";
	}

	@GetMapping("/update")
	public String update(@RequestParam int id, Model model) {
		SupplierRespDTO data = supplierInt.update(id);
		
		System.out.println(".........."+data.getSupplierId());
		if (data != null) {
			model.addAttribute("updateData", data);
			return "SupplierUpdate";
		}
		return "viewSupplier";

	}
	@PostMapping("/updateSupplier")
	public SupplierReqDTO dataUpdate(@ModelAttribute SupplierReqDTO supplierReqDTO,Model model ,HttpSession session ) {
		String email = (String) session.getAttribute("userEmail");
		supplierReqDTO.setUser(email);
		SupplierReqDTO data= supplierInt.dataUpdate(supplierReqDTO);
		System.out.println(data.getSupplierId());
		System.out.println(data.getAddress());
		System.out.println(data.getContactInfo());
		return data;
	}

}

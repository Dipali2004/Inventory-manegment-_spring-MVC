package com.rt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rt.DTO.ProductDTO;
import com.rt.DTO.ProductRespDTO;
import com.rt.DTO.PurchaseDTO;
import com.rt.DTO.PurchaseRespDto;
import com.rt.DTO.SupplierRespDTO;
import com.rt.serviceInterface.PurchaseInterface;

@Controller
public class PurchaseController {
	@Autowired
	private PurchaseInterface purchaseInterface;

	@PostMapping("/purchaseSave")
	public PurchaseRespDto add(@ModelAttribute PurchaseDTO purchaseDTO) {
		System.out.println("purachase data herer now" + purchaseDTO);
		return purchaseInterface.add(purchaseDTO);
	}

	@GetMapping("/Purchase")
	public String purchaseForm(Model model) {

		List<SupplierRespDTO> suppliers = purchaseInterface.supplierPurchase();
		List<ProductRespDTO> products = purchaseInterface.ProductPurchase();

		model.addAttribute("suppliers", suppliers);
		model.addAttribute("products", products);

		model.addAttribute("productDTO", new ProductDTO());

		return "Purchese";
	}
	
	@GetMapping("/getAllPurchase")
	public String getAll(Model model) {
		List<PurchaseRespDto> purchase = purchaseInterface.getAll(0, 100);
		model.addAttribute("purchase",purchase);
		
		return "ViewPurchase";
		
	}
	@GetMapping("/updatepurchase")
	public  String getData(@RequestParam int id, Model model) {
		PurchaseRespDto data = purchaseInterface.getData(id);
		System.out.println("data is present herre"+data);
		if(data!=null) {
		model.addAttribute("data",data);
		return "PurchaseUpdate";
		}
		return "ViewPurchase";
		
	}
	@PostMapping("/purchaseUpdate")
	public String update(@ModelAttribute PurchaseDTO purchaseDTO ) {
		System.out.println("data is presend in purchase"+purchaseDTO);
		PurchaseRespDto data = purchaseInterface.update(purchaseDTO);
//		System.out.println("data is presend in purchase"+data);
		return "redirect:/getAllPurchase";
		
	}
	

}

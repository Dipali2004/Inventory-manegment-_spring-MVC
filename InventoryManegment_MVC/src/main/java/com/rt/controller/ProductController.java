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
import com.rt.serviceInterface.ProductInterface;

@Controller
public class ProductController<SupplierRespDTO> {
	@Autowired
	private ProductInterface productInterface;

	@GetMapping("/productsdata")
	public String supplier(Model model) {
		List<com.rt.DTO.SupplierRespDTO> suppliers = productInterface.supplier();

		model.addAttribute("suppliers", suppliers);
		model.addAttribute("productDTO", new ProductDTO());
		return "product";
	}

	@PostMapping("/saveProduct")
	public ProductRespDTO addProduct(@ModelAttribute ProductDTO productDTO) {

		System.out.println(productDTO);
		System.out.println(productDTO.getSupplierName());
		return productInterface.addProduct(productDTO);
	}

	@GetMapping("/getAll")
	public String getall(Model model) {
		List<ProductRespDTO> product = productInterface.getall();
		model.addAttribute("product", product);
		return "ViewProduct";
	}

	@GetMapping("/updatedata")
	public String update(@RequestParam int id, Model model) {
	    ProductRespDTO data = productInterface.update(id);
	    if (data != null) {
	        model.addAttribute("data", data);
	        return "productUpdate";
	    }
	    return "ViewProduct";
	}
	@PostMapping("/updateProduct")
	public String updateData(@ModelAttribute ProductDTO productDTO, Model model) {
	    System.out.println("Updating product: " + productDTO);

	    ProductRespDTO data = productInterface.updateData(productDTO);

		/*
		 * if (data == null) { model.addAttribute("error",
		 * "Failed to update product. Product may not exist."); return "productUpdate";
		 * }
		 */
	    model.addAttribute("message", "Product updated successfully!");
	    return "redirect:/getAll";
	}

	
	
	
	
}

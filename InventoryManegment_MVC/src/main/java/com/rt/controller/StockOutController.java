package com.rt.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rt.DTO.ProductRespDTO;
import com.rt.DTO.StockOutDTO;
import com.rt.DTO.StockOutRepDTO;
import com.rt.serviceInterface.StockOutInterface;

import jakarta.servlet.http.HttpSession;

@Controller
public class StockOutController {
	@Autowired
	private StockOutInterface stockOutInterface;

	@GetMapping("/Add_stocks")
	public String stock(Model model) {
		List<ProductRespDTO> products = stockOutInterface.stock();

		model.addAttribute("products", products);
		return "StockOut";
	}

	@PostMapping("/saveStockOut")
	public StockOutRepDTO add(@ModelAttribute StockOutDTO stockOutDTO, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");

		if (userId == null) {
			throw new RuntimeException("User is not logged in");
		}

		stockOutDTO.setCreatedBy(userId);
		StockOutRepDTO data = stockOutInterface.add(stockOutDTO);
		return data;
	}
	
	@GetMapping("/Viewstocks")
	public String getAll(Model model) {
	    List<StockOutRepDTO> stockOutList = stockOutInterface.getAll();
	    model.addAttribute("stockOutList", stockOutList);
	    return "ViewStockOut"; 
	}
	@GetMapping("/updateStock")
	public String GetDataId(@RequestParam int id ,Model model) {
		StockOutRepDTO data=	stockOutInterface.GetDataId(id);
		if(data!=null) {
			model.addAttribute("data",data);
			return "StockOutUpdate";
		}
		return "ViewStockOut";
		 
	}
	public StockOutRepDTO updateData(@ModelAttribute StockOutDTO stockOutDTO ) {
		StockOutRepDTO data = 	stockOutInterface.updateData(stockOutDTO);
		return data;
	}
	

}

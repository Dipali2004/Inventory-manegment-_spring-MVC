package com.rt.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rt.DTO.ProductDTO;
import com.rt.DTO.ProductReoprtDTO;
import com.rt.DTO.ProductRespDTO;
import com.rt.DTO.PurchaseRespDto;
import com.rt.DTO.StockOutRepDTO;
import com.rt.DTO.SupplierRespDTO;
import com.rt.serviceInterface.ReportInterface;

@Controller
public class ReportController {
	@Autowired
	private ReportInterface reportInterface;

	@GetMapping("/viewStockReports")
	public String stockReport(Model model) {
		
		List<ProductReoprtDTO> productReportList= reportInterface.stockReport();
		System.out.println(" i want to data here @@@@@@@@@@@@@@@@"+productReportList);
		 model.addAttribute("productReportList", productReportList);
		    return "StockReport"; 
		
}
	@GetMapping("/lowStock")
	public String LowStock(Model model) {
		List<ProductReoprtDTO> productReportList= reportInterface.LowStock();
		model.addAttribute("productReportList", productReportList);
		return "ViewLowStock";
	}
	
//	purchase Report
	
	@GetMapping("/getPurchaseData")
	public String purchaseReport(Model model) {
	    List<SupplierRespDTO> suppliers = reportInterface.supplierPurchase();
	    List<ProductRespDTO> products = reportInterface.ProductPurchase();
	    List<PurchaseRespDto> purchase = reportInterface.getAll();

	    model.addAttribute("suppliers", suppliers);
	    model.addAttribute("products", products);
	    model.addAttribute("purchase", purchase);
	    model.addAttribute("productDTO", new ProductDTO());

	    return "PurchaseReport";
	
	}
	
	@GetMapping("/getSaleReport")
	public String saleReport(Model model) {
		 List<StockOutRepDTO> stockOutList = reportInterface.saleReport();
		
		    model.addAttribute("stockOutList", stockOutList);
		    return "SaleReport"; 
	

}
}

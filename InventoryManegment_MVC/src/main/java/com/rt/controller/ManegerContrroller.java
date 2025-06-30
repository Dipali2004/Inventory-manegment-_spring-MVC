package com.rt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.rt.DTO.GetAllManegerDTO;
import com.rt.DTO.ManegerDTO;
import com.rt.DTO.ManegerRepDTO;
import com.rt.DTO.UpdateManagerDTO;
import com.rt.serviceInterface.ManegerInterface;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ManegerContrroller {
	@Autowired
	private ManegerInterface ManegerInterface;

	@GetMapping("/Add_maneger")
	public String add() {

		return "Add_maneger";

	}

	@PostMapping("/add_maneger")
	public String addManeger(@ModelAttribute ManegerDTO manegerDTO, Model model, HttpSession session) {

		System.out.println("session email ... " + session.getAttribute("userEmail"));
		String email = (String) session.getAttribute("userEmail");
		manegerDTO.setUser(email);

		ManegerRepDTO data = ManegerInterface.addManeger(manegerDTO);

		model.addAttribute("maneger", data);

		return "adding successfully";
	}

	@GetMapping("/ViewManeger")
	public String getall(Model model) {
		List<GetAllManegerDTO> managers = ManegerInterface.getAll();
		model.addAttribute("managers", managers);
		return "viewManeger";
	}



	@GetMapping("/update_maneger")
	public String updateManeger(@RequestParam int id, Model model) {
		UpdateManagerDTO data = ManegerInterface.updateManeger(id);
			if(data!=null) {
				System.out.println("Fetched data for update:");
				
				 model.addAttribute("updateData", data);

				return "Manegerupdate";
			}
			return "viewManeger";
		
	}
	@PostMapping("/update_maneger")
	public GetAllManegerDTO update(@ModelAttribute GetAllManegerDTO getAllManegerDTO, Model model) {
	
		GetAllManegerDTO data = ManegerInterface.update(getAllManegerDTO);
		
		return data;
	}

}

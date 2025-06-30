package com.rt.serviceInterface;

import java.util.List;

import com.rt.DTO.GetAllManegerDTO;
import com.rt.DTO.ManegerDTO;
import com.rt.DTO.ManegerRepDTO;
import com.rt.DTO.UpdateManagerDTO;

public interface ManegerInterface {

	ManegerRepDTO addManeger(ManegerDTO manegerDTO);

	List<GetAllManegerDTO> getAll();

	UpdateManagerDTO updateManeger(int id);

	GetAllManegerDTO update(GetAllManegerDTO getAllManegerDTO);



}

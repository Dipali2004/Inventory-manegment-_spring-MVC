package com.rt.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SupplierRespDTO {

	private int supplierId;
	private String name;
	private String ContactInfo;
	private String address;
//	  @JsonIgnore
//	private List<ProductDTO> products;

	private String User;

}

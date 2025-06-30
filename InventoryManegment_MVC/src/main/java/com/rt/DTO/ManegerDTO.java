package com.rt.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ManegerDTO {


private String fullName;
private String email;
private String phone;
private String password;
private String role;
private String address;
private String User;

}
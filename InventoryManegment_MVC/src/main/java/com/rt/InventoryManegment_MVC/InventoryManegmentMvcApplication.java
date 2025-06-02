package com.rt.InventoryManegment_MVC;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages="com.rt")
public class InventoryManegmentMvcApplication {

	public static void main(String[] args) {
		SpringApplication.run(InventoryManegmentMvcApplication.class, args);
	}

}

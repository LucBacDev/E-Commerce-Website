package com.devpro.javaweb21LuuViet.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21LuuViet.dto.Categories;
import com.devpro.javaweb21LuuViet.dto.Product_images;

@Service
public class Product_imagesService extends BaseService<Product_images>{
	@Override
	protected Class<Product_images> clazz(){
		return Product_images.class;
	}
}

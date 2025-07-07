package com.devpro.javaweb21LuuViet.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21LuuViet.dto.Categories;
import com.devpro.javaweb21LuuViet.model.Contact;
@Service
public class CategoriesServices extends BaseService<Categories>{
	@Override
	protected Class<Categories> clazz(){
		return Categories.class;
	}
	
}

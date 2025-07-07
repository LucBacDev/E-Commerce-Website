package com.devpro.javaweb21LuuViet.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21LuuViet.model.Contact;
/**
 * Moi Entity se can 1 service
 * de thuc hien them sua xoa,search Entity trong database
 * @author Admin
 *
 */
@Service
public class ContactService extends BaseService<Contact>{
	@Override
	protected Class<Contact> clazz(){
		return Contact.class;
	}
}

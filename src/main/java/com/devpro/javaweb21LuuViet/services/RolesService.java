/**
 * 
 */
package com.devpro.javaweb21LuuViet.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21LuuViet.dto.Roles;

/**
 * @author Admin
 *
 */
@Service
public class RolesService extends BaseService<Roles> {

	@Override
	protected Class<Roles> clazz() {
		// TODO Auto-generated method stub
		return Roles.class;
	}

}

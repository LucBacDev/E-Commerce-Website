package com.devpro.javaweb21LuuViet.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.javaweb21LuuViet.dto.Product;
import com.devpro.javaweb21LuuViet.dto.ProductSearchModel;
import com.devpro.javaweb21LuuViet.dto.UserSearchModel;
import com.devpro.javaweb21LuuViet.dto.Users;

@Service
public class UserService extends BaseService<Users> {
	
	@Override
	protected Class<Users> clazz() {
		return Users.class;
	}

	public Users loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "' and status = 1";
		return this.getEntityByNativeSQL(sql);
	}
	public PagerData<Users> search(UserSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_users inner join tbl_users_roles on tbl_users.id=tbl_users_roles.user_id WHERE status=1";

		if (searchModel != null) {
			
			// tìm kiếm theo category
			if(searchModel.getRoleId() != null && searchModel.getRoleId() > 0) {
				sql += " and role_id = " + searchModel.getRoleId();
			}
		
			// tìm theo seo
//					if (!StringUtils.isEmpty(searchModel.seo)) {
//						sql += " and p.seo = '" + searchModel.seo + "'";
//					}

			// tìm kiếm sản phẩm hot
//					if (searchModel.isHot != null) {
//						sql += " and p.is_hot = '" + searchModel.seo + "'";
//					}
			
			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and  nameacc like '%" + searchModel.getKeyword() + "%'" ;
				
			}
		}
		
		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";
		
		return getEntitiesByNativeSQL(sql,searchModel.getPage());
	}
}

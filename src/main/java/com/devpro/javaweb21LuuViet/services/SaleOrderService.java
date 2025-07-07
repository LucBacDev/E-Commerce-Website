package com.devpro.javaweb21LuuViet.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.javaweb21LuuViet.dto.SaleOrder;
import com.devpro.javaweb21LuuViet.dto.SaleOrderSearchModel;
import com.devpro.javaweb21LuuViet.dto.UserSearchModel;
import com.devpro.javaweb21LuuViet.dto.Users;

@Service
public class SaleOrderService extends BaseService<SaleOrder>{
	@Override
	protected Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}

	public List<SaleOrder> searchBuyUserId(Integer id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM tbl_saleorder p WHERE p.user_id =" + id;
		
		return getEntitiesByNativeSQL(sql);
	}
	
	public PagerData<SaleOrder> search(SaleOrderSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder WHERE status=1";

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

package com.devpro.javaweb21LuuViet.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21LuuViet.dto.SaleOrder;
import com.devpro.javaweb21LuuViet.dto.SaleOrderProducts;
import com.devpro.javaweb21LuuViet.model.BaseEntity;

@Service
public class SaleOrderProductsService extends BaseService<SaleOrderProducts>{

	@Override
	protected Class<SaleOrderProducts> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProducts.class;
	}
	public List<SaleOrderProducts> searchBuySaleOrder(Integer id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM tbl_saleorder_products p WHERE p.saleorder_id =" + id;
		
		return getEntitiesByNativeSQL(sql);
	}
}

package com.devpro.javaweb21LuuViet.services;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.service.spi.InjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb21LuuViet.dto.Product;
import com.devpro.javaweb21LuuViet.dto.ProductSearchModel;
import com.devpro.javaweb21LuuViet.dto.Product_images;

@Service
public class ProductServices extends BaseService<Product> {
	@Autowired
	Product_imagesService productimagesSevice;
	@Override
	protected Class<Product> clazz() {
		// TODO Auto-generated method stub
		return Product.class;
	}
	
	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * @param images
	 * @return
	 */
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * @param image
	 * @return
	 */
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
	
	private String getUniqueUploadFileName(String fileName) {
		String[] splitFileName = fileName.split("\\.");
		return splitFileName[0] + System.currentTimeMillis() + "." + splitFileName[1];
	}
	
	@Transactional
	public Product add(Product p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) { // có đẩy avatar lên.
			
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			
			// tạo đường dẫn tới folder chứa avatar
			String pathToAvatar = "C:/upload/product/avatar/" + fileName;

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToAvatar));

			p.setAnh_san_pham("product/avatar/" + fileName);
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(productPictures)) { // có đẩy pictures lên.

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());
				
				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File("C:/upload/product/pictures/" + fileName));

				// tạo mới 1 bản ghi product_images
				Product_images pi = new Product_images();
				pi.setPath("product/pictures/" + fileName);
				pi.setTitle(fileName);
				
				p.addProduct_images(pi);
			}
		}

		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
//		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		//set ten khong dau
		p.setTen_khong_dau(chuanHoaTen(p.getTen_san_pham()));
		// lưu vào database
		return super.saveOrUpdate(p);
		
	}
	@Transactional
	public Product update(Product p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Product productInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File("C:/upload/" + productInDb.getAnh_san_pham()).delete();

			// update avatar mới
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			productAvatar.transferTo(new File("C:/upload/product/avatar/" + fileName));
			p.setAnh_san_pham("product/avatar/" + fileName);
		} 
		else {
			// sử dụng lại avartar cũ
			p.setAnh_san_pham(productInDb.getAnh_san_pham());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getDanhSachAnh() != null && productInDb.getDanhSachAnh().size() > 0) {
				for (Product_images opi : productInDb.getDanhSachAnh()) {
					// xóa avatar trong folder lên
					new File("C:/upload/" + opi.getPath()).delete();

					// xóa dữ liệu trong database
					productimagesSevice.delete(opi);
				}
			}

			// update pictures mới
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());
				
				pic.transferTo(new File("C:/upload/product/pictures/" + fileName));
				
				Product_images pi = new Product_images();
				pi.setPath("product/pictures/" + fileName);
				pi.setTitle(fileName);
				
				p.addProduct_images(pi);
			}
		}

		//tạo seo
//		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
	}
	public PagerData<Product> search(ProductSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE p.status=1";

		if (searchModel != null) {
			
			// tìm kiếm theo category
			if(searchModel.getCategoryId() != null && searchModel.getCategoryId() > 0) {
				sql += " and category_id = " + searchModel.getCategoryId();
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
				sql += " and  (p.ten_san_pham like '%" + searchModel.getKeyword() + "%'" + 
						     " or p.thong_tin_them like '% " + searchModel.getKeyword() + "%')";
				
			}
		}

		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";
		
		return getEntitiesByNativeSQL(sql,searchModel.getPage());
	}
	public void deleteProduct(int ProductID) {
		Product productGetted =getById(ProductID);
		productGetted.setStatus(Boolean.FALSE);
		System.out.println(productGetted.getStatus());
	}
	public List<Product> searchByKeyWord(ProductSearchModel searchModel) {
		// khởi tạo câu lệnh
		String a=searchModel.getKeyword();
		String b;
		a =a.replace(a.substring(0, 1),a.substring(0, 1).toUpperCase());
		b=a.replace(a.substring(0, 1),a.substring(0, 1).toLowerCase());
		String sql = "SELECT * FROM tbl_products p WHERE p.status=1";

		if (searchModel != null) {
			
//			// tìm kiếm theo category
//			if(searchModel.getCategoryId() != null && searchModel.getCategoryId() > 0) {
//				sql += " and category_id = " + searchModel.getCategoryId();
//			}
		
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
				sql += " and  (p.ten_san_pham like '% " + b + " %'" + 
						     " or p.ten_khong_dau like  '%" + searchModel.getKeyword() + "%'"+" or p.ten_san_pham like  '%" + a +" %')" ;
				
			}
		}
		
		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";
		
		return getEntitiesByNativeSQL(sql);
	}
	public String chuanHoaTen(String tenCoDau) {
		String tenKhongDau=tenCoDau.toLowerCase();
		tenKhongDau=tenKhongDau.replace("à", "a");
		tenKhongDau=tenKhongDau.replace("á", "a");
		tenKhongDau=tenKhongDau.replace("ả", "a");
		tenKhongDau=tenKhongDau.replace("ạ", "a");
		tenKhongDau=tenKhongDau.replace("ã", "a");
//-----------
		tenKhongDau=tenKhongDau.replace("ă", "a");
		tenKhongDau=tenKhongDau.replace("ằ", "a");
		tenKhongDau=tenKhongDau.replace("ắ", "a");
		tenKhongDau=tenKhongDau.replace("ẳ", "a");
		tenKhongDau=tenKhongDau.replace("ặ", "a");
		tenKhongDau=tenKhongDau.replace("ẵ", "a");
//-----------
		tenKhongDau=tenKhongDau.replace("â", "a");
		tenKhongDau=tenKhongDau.replace("ầ", "a");
		tenKhongDau=tenKhongDau.replace("ấ", "a");
		tenKhongDau=tenKhongDau.replace("ẩ", "a");
		tenKhongDau=tenKhongDau.replace("ậ", "a");
		tenKhongDau=tenKhongDau.replace("ẫ", "a");
//-----------
		tenKhongDau=tenKhongDau.replace("è", "e");
		tenKhongDau=tenKhongDau.replace("é", "e");
		tenKhongDau=tenKhongDau.replace("ẻ", "e");
		tenKhongDau=tenKhongDau.replace("ẹ", "e");
		tenKhongDau=tenKhongDau.replace("ẽ", "e");
//-----------
		tenKhongDau=tenKhongDau.replace("ê", "e");
		tenKhongDau=tenKhongDau.replace("ề", "e");
		tenKhongDau=tenKhongDau.replace("ế", "e");
		tenKhongDau=tenKhongDau.replace("ể", "e");
		tenKhongDau=tenKhongDau.replace("ệ", "e");
		tenKhongDau=tenKhongDau.replace("ễ", "e");
//-----------
		tenKhongDau=tenKhongDau.replace("ô", "o");
		tenKhongDau=tenKhongDau.replace("ố", "o");
		tenKhongDau=tenKhongDau.replace("ồ", "o");
		tenKhongDau=tenKhongDau.replace("ổ", "o");
		tenKhongDau=tenKhongDau.replace("ộ", "o");
		tenKhongDau=tenKhongDau.replace("ỗ", "o");
//-----------
		tenKhongDau=tenKhongDau.replace("ó", "o");
		tenKhongDau=tenKhongDau.replace("ò", "o");
		tenKhongDau=tenKhongDau.replace("ỏ", "o");
		tenKhongDau=tenKhongDau.replace("ọ", "o");
		tenKhongDau=tenKhongDau.replace("õ", "o");
//-----------
		tenKhongDau=tenKhongDau.replace("ơ", "o");
		tenKhongDau=tenKhongDau.replace("ớ", "o");
		tenKhongDau=tenKhongDau.replace("ờ", "o");
		tenKhongDau=tenKhongDau.replace("ở", "o");
		tenKhongDau=tenKhongDau.replace("ợ", "o");
		tenKhongDau=tenKhongDau.replace("ỡ", "o");
//-----------
		
		tenKhongDau=tenKhongDau.replace("í", "i");
		tenKhongDau=tenKhongDau.replace("ì", "i");
		tenKhongDau=tenKhongDau.replace("ỉ", "i");
		tenKhongDau=tenKhongDau.replace("ị", "i");
		tenKhongDau=tenKhongDau.replace("ĩ", "i");
//-----------
		tenKhongDau=tenKhongDau.replace("ý", "y");
		tenKhongDau=tenKhongDau.replace("ỳ", "y");
		tenKhongDau=tenKhongDau.replace("ỷ", "y");
		tenKhongDau=tenKhongDau.replace("ỵ", "y");
		tenKhongDau=tenKhongDau.replace("ỹ", "y");
//-----------
		tenKhongDau=tenKhongDau.replace("ú", "u");
		tenKhongDau=tenKhongDau.replace("ù", "u");
		tenKhongDau=tenKhongDau.replace("ủ", "u");
		tenKhongDau=tenKhongDau.replace("ụ", "u");
		tenKhongDau=tenKhongDau.replace("ũ", "u");
//-----------
		tenKhongDau=tenKhongDau.replace("ư", "u");
		tenKhongDau=tenKhongDau.replace("ứ", "u");
		tenKhongDau=tenKhongDau.replace("ừ", "u");
		tenKhongDau=tenKhongDau.replace("ử", "u");
		tenKhongDau=tenKhongDau.replace("ự", "u");
		tenKhongDau=tenKhongDau.replace("ữ", "u");
//-----------
		tenKhongDau=tenKhongDau.replace("đ", "d");
		return tenKhongDau;
	}
public List<Product> hamSearchTrongDanhSach2(ProductSearchModel searchModel){
	String a=searchModel.getLoaiSanPham();
	String b;
	a =a.replace(a.substring(0, 1),a.substring(0, 1).toUpperCase());
	b=a.replace(a.substring(0, 1),a.substring(0, 1).toLowerCase());
	String sql = "SELECT * FROM tbl_products p WHERE p.status=1";
	if(searchModel != null) {
		//Tìm bằng tên-loại-thịt
		if (!StringUtils.isEmpty(searchModel.getLoaiSanPham())) {
			sql += " and  (p.ten_san_pham like '% " + b + " %'" + 
					     " or p.ten_khong_dau like  '%" + searchModel.getLoaiSanPham() + "%'"+" or p.ten_san_pham like  '%" + a +" %')" ;
			
		}
		if(!StringUtils.isEmpty(searchModel.getGiaCuaSanPham())) {
			if(searchModel.getGiaCuaSanPham().equals("1")) {
				sql += "and p.gia_ban < 100000";
			}
			if(searchModel.getGiaCuaSanPham().equals("2")) {
				sql += "and (p.gia_ban >= 100000 and p.gia_ban <=200000)";
			}
			if(searchModel.getGiaCuaSanPham().equals("3")){
				sql += "and p.gia_ban > 200000";
			}
		}
		
		
		
	}
	return getEntitiesByNativeSQL(sql);
}

}

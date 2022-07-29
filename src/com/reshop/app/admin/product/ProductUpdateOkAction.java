package com.reshop.app.admin.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.product.dao.FileDAO;
import com.reshop.app.admin.product.dao.FileDTO;
import com.reshop.app.admin.product.dao.ProductDAO;
import com.reshop.app.admin.product.dao.ProductDTO;

public class ProductUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ProductDAO pdao = new ProductDAO();
		FileDAO fdao= new FileDAO();
		String saveFolder = request.getServletContext().getRealPath("app/file");
		int size = 5 * 1024 * 1024;
		
		// form에서 enctype을 multipart/form-data 로 보냈다면 필요한 객체
		MultipartRequest multi = new MultipartRequest(request,saveFolder, size, "UTF-8",
				new DefaultFileRenamePolicy());

		boolean fcheck1 = false;
		boolean fcheck2 = false;

		// 파일을 올렸을 때 실제 서버에 저장되어 있는 파일의 이름
		String filename1 = multi.getFilesystemName("file1");
		if (filename1 == null) {
			// file1 태그에 아무 파일도 업로드 하지 않은경우
			fcheck1 = true;
		}
		// 파일을 올릴 때 사용자가 올렸던 이름(다운로드시에는 이 이름으로 다운로드 되게 해야함)
		String orgname1 = multi.getOriginalFileName("file1");

		String filename2 = multi.getFilesystemName("file2");
		if (filename2 == null) {
			// file2 태그에 아무 파일도 업로드 하지 않은경우
			fcheck2 = true;
		}
		String orgname2 = multi.getOriginalFileName("file2");

		int price = Integer.parseInt(multi.getParameter("price"));
		String prodname = multi.getParameter("prodname");
		String prodstate = multi.getParameter("prodstate");
		String prodsize = multi.getParameter("prodsize");
		String prodexplain = multi.getParameter("prodexplain");
		String classify = multi.getParameter("classify");
		String classify_prod = multi.getParameter("classify_prod");
		String brand = multi.getParameter("brand");
		String sug_age = multi.getParameter("sug_age");
		String prod_color = multi.getParameter("prod_color");
		int prodcnt = Integer.parseInt(multi.getParameter("prodcnt"));

		ProductDTO product = new ProductDTO();
		product.setPrice(price);
		product.setProdname(prodname);
		product.setProdstate(prodstate);
		product.setProdsize(prodsize);
		product.setProdexplain(prodexplain);
		product.setClassify(classify);
		product.setClassify_prod(classify_prod);
		product.setBrand(brand);
		product.setSug_age(sug_age);
		product.setProd_color(prod_color);
		product.setProdcnt(prodcnt);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);

		if (pdao.insertProduct(product)) {
			if (!fcheck1) {
				FileDTO file = new FileDTO();
				file.setSystemname(filename1);
				file.setOrgname(orgname1);
				file.setProdnum(pdao.selectProdnum(product));
				// DB에다가 파일 정보 추가
				// 파일 정보를 디비에 추가 시도(실패했다면 fcheck1이 false로 남아있음 / 성공이라면 true로 바뀜)
				fcheck1 = fdao.insertFile(file);
			}
			if (!fcheck2) {
				FileDTO file = new FileDTO();
				file.setSystemname(filename2);
				file.setOrgname(orgname2);
				file.setProdnum(pdao.selectProdnum(product));
				// DB에다가 파일 정보 추가
				fcheck2 = fdao.insertFile(file);
			}
			
			

			// fcheck1과 fcheck2가 둘다 true라는 뜻은 아무 파일도 안올렸거나, 파일 업로드를 성공한 경우
			if (fcheck1 && fcheck2) {
				forward.setPath(request.getContextPath() + "/admin/ProductView.pd?prodnum=" + pdao.selectProdnum(product));
			} else {
				forward.setPath(request.getContextPath() + "/admin/ProductList.pd?flag=false");
				pdao.deleteProduct(pdao.selectProdnum(product));
			}
		} else {
			forward.setPath(request.getContextPath() + "/admin/ProductList.pd?flag=false");
		}
		return forward;

		/*
		 * if (pdao.insertProduct(product)) { forward.setPath(request.getContextPath() +
		 * "/admin/ProductView.pd?prodnum=" + prodnum); } else {
		 * forward.setPath(request.getContextPath() + "/admin/ProductList.pd"); }
		 * 
		 * return forward;
		 */

	}
}

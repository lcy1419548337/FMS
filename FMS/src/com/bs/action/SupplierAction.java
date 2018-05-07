package com.bs.action;

import com.bs.entity.PageBean;
import com.bs.entity.Supplier;
import com.bs.service.SupplierService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SupplierAction extends ActionSupport implements ModelDriven<Supplier> {
	SupplierService supplierService;
	Supplier supplier = new Supplier();
	String refresh;
	private Integer page;
	
	public String getRefresh() {
		return refresh;
	}

	public void setRefresh(String refresh) {
		this.refresh = refresh;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Supplier getModel() {
		// TODO Auto-generated method stub
		return supplier;
	}
	
	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public SupplierService getSupplierService() {
		return supplierService;
	}

	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}

	public String toAddSupplier() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("准备跳转到addsupplier界面");
		return "toAddSupplier";
	}
	/**
	 * 增加供应商
	 */
	public String addSupplier() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("准备增加供应商");
		System.out.println("测试是否接收到了供应商信息：supplierId=" + supplier.getSupplierId());
		supplierService.addSupplier(supplier);
		//return "addSupplierSuccess";
		return null;
	}

	public String toFindSupplier() throws Exception {
		// TODO Auto-generated method stub
		return "toFindSupplier";
	}
	/**
	 * 条件查询供应商
	 */
	public String findSupplier() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("supplierId = " + supplier.getSupplierId()
				+ ";supplierName = " + supplier.getSupplierName()
				);
		if (page == null) {
			page = 1;
		}
		System.out.println("refresh? " + refresh);
		if (refresh!=null &&refresh.equals("yes")) {
			page = 1;
		}
		System.out.println("值为空？ ：" + supplier.getSupplierId() == null && supplier.getSupplierName() == null && supplier.getSupplierName().length() > 0);
		System.out.println("page = " + page);
		PageBean<Supplier> pageBean = new PageBean<Supplier>();
		if (supplier.getSupplierId() == null && (supplier.getSupplierName() == null || supplier.getSupplierName().length() <= 0)) {
			pageBean = supplierService.findAll(page);
		}else {
			pageBean = supplierService.find(supplier,page);
		}
		ActionContext.getContext().getValueStack().set("help", supplier);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "ViewSupplier";
	}
	/**
	 * 查询全部供应商
	 */

	public String findAllByPage() throws Exception {
		// TODO Auto-generated method stub
		PageBean<Supplier> pageBean = supplierService.findAll(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "toFindSupplier";
	}


	public String toModifySupplier() throws Exception {
		Supplier findSupplier = supplierService.findSupplierById(supplier.getSupplierId());
		ActionContext.getContext().getValueStack().set("supplier", findSupplier);
		return "toModifySupplier";
	}


	public String modifySupplier() throws Exception {
		System.out.println("supplierId = " + supplier.getSupplierId()
				+";supplierName = " + supplier.getSupplierName()
				+";supplierLocation = " + supplier.getSupplierLocation());
		supplierService.modifySupplierById(supplier);
		return "toFindSupplier";
	}


	public String toDeleteSupplier() throws Exception {
		System.out.println("supplierId = " + supplier.getSupplierId());
		supplierService.deleteById(supplier.getSupplierId());
		return "toFindSupplier";
	}
}

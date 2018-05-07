package com.bs.serviceImpl;
import java.util.List;

import com.bs.constant.Constant;
import com.bs.dao.SupplierDao;
import com.bs.entity.Feed;
import com.bs.entity.PageBean;
import com.bs.entity.Supplier;
import com.bs.service.SupplierService;

public class SupplierServiceImpl implements SupplierService {
	SupplierDao supplierDao;

	public SupplierDao getSupplierDao() {
		return supplierDao;
	}

	public void setSupplierDao(SupplierDao supplierDao) {
		this.supplierDao = supplierDao;
	}
	

	@Override
	public void addSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		supplierDao.addSupplier(supplier);
	}

	@Override
	public PageBean<Supplier> findAll(Integer page) {
		// TODO Auto-generated method stub
		PageBean<Supplier> pageBean = new PageBean<Supplier>();
		pageBean.setLimit(com.bs.constant.Constant.PAGE_LIMIT);
		Integer totalcount = supplierDao.findAllCount();
		pageBean.setTotalCount(totalcount);
		System.out.println("供应商总数：" + totalcount);
		int totalPage = (int)Math.ceil((double)totalcount/(double)Constant.PAGE_LIMIT);
		System.out.println("总页数：" + totalPage);
		pageBean.setTotalPage(totalPage);
		pageBean.setPage(page);
		Integer start = (page - 1)*pageBean.getLimit() + 1 ;
		System.out.println("查询起点：" + start);
		List<Supplier> list = supplierDao.findAll(start);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public PageBean<Supplier> find(Supplier supplier ,Integer page) {
		// TODO Auto-generated method stub
		PageBean<Supplier> pageBean = new PageBean<Supplier>();
		pageBean.setLimit(com.bs.constant.Constant.PAGE_LIMIT);
		Integer totalcount = supplierDao.findCount(supplier);
		pageBean.setTotalCount(totalcount);
		System.out.println("供应商总数：" + totalcount);
		int totalPage = (int)Math.ceil((double)totalcount/(double)Constant.PAGE_LIMIT);
		System.out.println("总页数：" + totalPage);
		pageBean.setTotalPage(totalPage);
		pageBean.setPage(page);
		System.out.println("第" + page + "页");
		Integer start = (page - 1)*pageBean.getLimit() + 1 ;
		System.out.println("查询起点：" + start);
		List<Supplier> list = supplierDao.find(supplier , start);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public List<Supplier> findSupplierForFeedAntion() {
		// TODO Auto-generated method stub
		
		return supplierDao.findSupplierForFeedAntion();
	}

	@Override
	public void modifySupplierById(Supplier supplier) {
		supplierDao.modifySupplierById(supplier);
	}

	@Override
	public Supplier findSupplierById(Integer id) {
		return supplierDao.findSupplierById(id);
	}

	@Override
	public void deleteById(Integer supplierId) {
		Supplier supplier = supplierDao.findSupplierById(supplierId);
		supplierDao.deleteSupplier(supplier);
	}

}

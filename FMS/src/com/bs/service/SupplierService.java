package com.bs.service;

import java.util.List;

import com.bs.entity.PageBean;
import com.bs.entity.Supplier;

public interface SupplierService {

	void addSupplier(Supplier supplier);

	PageBean<Supplier> findAll(Integer page);

	PageBean<Supplier> find(Supplier supplier , Integer page);

	List<Supplier> findSupplierForFeedAntion();

    void modifySupplierById(Supplier supplier);

	Supplier findSupplierById(Integer id);

    void deleteById(Integer supplierId);
}

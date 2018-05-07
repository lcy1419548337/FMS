package com.bs.dao;

import java.util.List;

import com.bs.entity.Supplier;

public interface SupplierDao {

	 void addSupplier(Supplier supplier);

	Integer findCount(Supplier supplier);

	List<Supplier> find(Supplier supplier, Integer start);

	Integer findAllCount();

	List<Supplier> findAll(Integer start);

	List<Supplier> findSupplierForFeedAntion();

    void modifySupplierById(Supplier supplier);

	Supplier findSupplierById(Integer id);

    void deleteSupplier(Supplier supplier);
}

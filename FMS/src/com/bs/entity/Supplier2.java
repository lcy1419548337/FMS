package com.bs.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Supplier entity. @author MyEclipse Persistence Tools
 */

public class Supplier2 implements java.io.Serializable {

	// Fields

	private Integer supplierId;
	private String supplierName;
	private String supplierLocation;
	private Set feeds = new HashSet(0);

	// Constructors

	/** default constructor */
	public Supplier2() {
	}

	/** full constructor */
	public Supplier2(String supplierName, String supplierLocation, Set feeds) {
		this.supplierName = supplierName;
		this.supplierLocation = supplierLocation;
		this.feeds = feeds;
	}

	// Property accessors

	public Integer getSupplierId() {
		return this.supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplierName() {
		return this.supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSupplierLocation() {
		return this.supplierLocation;
	}

	public void setSupplierLocation(String supplierLocation) {
		this.supplierLocation = supplierLocation;
	}

	public Set getFeeds() {
		return this.feeds;
	}

	public void setFeeds(Set feeds) {
		this.feeds = feeds;
	}

}
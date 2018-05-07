package com.bs.entity;

/**
 * FeedInformation entity. @author MyEclipse Persistence Tools
 */

public class FeedInformation implements java.io.Serializable {

	// Fields

	private Integer number;
	private Feed feed;
	private Integer categoryId;
	private String supplier;
	private Double stock;
	private String remark;
	private Integer formulaId;

	// Constructors

	/** default constructor */
	public FeedInformation() {
	}

	/** full constructor */
	public FeedInformation(Feed feed, Integer categoryId, String supplier, Double stock, String remark,
			Integer formulaId) {
		this.feed = feed;
		this.categoryId = categoryId;
		this.supplier = supplier;
		this.stock = stock;
		this.remark = remark;
		this.formulaId = formulaId;
	}

	// Property accessors

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Feed getFeed() {
		return this.feed;
	}

	public void setFeed(Feed feed) {
		this.feed = feed;
	}

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getSupplier() {
		return this.supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public Double getStock() {
		return this.stock;
	}

	public void setStock(Double stock) {
		this.stock = stock;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getFormulaId() {
		return this.formulaId;
	}

	public void setFormulaId(Integer formulaId) {
		this.formulaId = formulaId;
	}

}
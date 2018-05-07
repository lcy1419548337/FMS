package com.bs.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * FeedCategory entity. @author MyEclipse Persistence Tools
 */

public class FeedCategory implements java.io.Serializable {

	// Fields

	private Integer categoryId;
	private String categoryName;
	private String remark;
	private Set feedInformations = new HashSet(0);

	// Constructors

	/** default constructor */
	public FeedCategory() {
	}

	/** full constructor */
	public FeedCategory(String categoryName, String remark, Set feedInformations) {
		this.categoryName = categoryName;
		this.remark = remark;
		this.feedInformations = feedInformations;
	}

	// Property accessors

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Set getFeedInformations() {
		return this.feedInformations;
	}

	public void setFeedInformations(Set feedInformations) {
		this.feedInformations = feedInformations;
	}

}
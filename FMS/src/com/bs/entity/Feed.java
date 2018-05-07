package com.bs.entity;

import java.util.HashSet;
import java.util.Set;

import javassist.expr.NewArray;

/**
 * Feed entity. @author MyEclipse Persistence Tools
 */

public class Feed implements java.io.Serializable {

	// Fields

	private Integer feedId;
	private Supplier supplier;
	private String feedName;
	private Integer feedCategory;
	private String feedIntroduction;
	private String remarks;
	private Set formulas = new HashSet(0);
	private Set feedInformations = new HashSet(0);
	private Set animalFeedInformations = new HashSet();
	private Set supplierFeed = new HashSet();
	// Constructors

	/** default constructor */
	public Feed() {
	}

	/** full constructor */
	public Feed(Supplier supplier, String feedName, Integer feedCategory, String feedIntroduction, String remarks,
			Set formulas, Set feedInformations ,Set animalFeedInformations ,Set supplierFeed) {
		this.supplier = supplier;
		this.feedName = feedName;
		this.feedCategory = feedCategory;
		this.feedIntroduction = feedIntroduction;
		this.remarks = remarks;
		this.formulas = formulas;
		this.feedInformations = feedInformations;
		this.animalFeedInformations = animalFeedInformations;
		this.supplierFeed = supplierFeed;
	}

	// Property accessors

	public Integer getFeedId() {
		return this.feedId;
	}

	public Set getSupplierFeed() {
		return supplierFeed;
	}

	public void setSupplierFeed(Set supplierFeed) {
		this.supplierFeed = supplierFeed;
	}

	public Set getAnimalFeedInformations() {
		return animalFeedInformations;
	}

	public void setAnimalFeedInformations(Set animalFeedInformations) {
		this.animalFeedInformations = animalFeedInformations;
	}

	public void setFeedId(Integer feedId) {
		this.feedId = feedId;
	}

	public Supplier getSupplier() {
		return this.supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public String getFeedName() {
		return this.feedName;
	}

	public void setFeedName(String feedName) {
		this.feedName = feedName;
	}

	public Integer getFeedCategory() {
		return this.feedCategory;
	}

	public void setFeedCategory(Integer feedCategory) {
		this.feedCategory = feedCategory;
	}

	public String getFeedIntroduction() {
		return this.feedIntroduction;
	}

	public void setFeedIntroduction(String feedIntroduction) {
		this.feedIntroduction = feedIntroduction;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Set getFormulas() {
		return this.formulas;
	}

	public void setFormulas(Set formulas) {
		this.formulas = formulas;
	}

	public Set getFeedInformations() {
		return this.feedInformations;
	}

	public void setFeedInformations(Set feedInformations) {
		this.feedInformations = feedInformations;
	}

}
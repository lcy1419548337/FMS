package com.bs.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * AnimalCategory entity. @author MyEclipse Persistence Tools
 */

public class AnimalCategory implements java.io.Serializable {

	// Fields

	private Integer categoryId;
	private String categoryName;
	private Set animals = new HashSet(0);
	// Constructors

	/** default constructor */
	public AnimalCategory() {
	}

	/** full constructor */
	public AnimalCategory(String categoryName) {
		this.categoryName = categoryName;
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

	public Set getAnimals() {
		return animals;
	}

	public void setAnimals(Set animals) {
		this.animals = animals;
	}
}
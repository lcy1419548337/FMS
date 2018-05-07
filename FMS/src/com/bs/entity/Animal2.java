package com.bs.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Animal entity. @author MyEclipse Persistence Tools
 */

public class Animal2 implements java.io.Serializable {

	// Fields

	private Integer animalId;
	private String animalName;
	private Integer animalCategory;
	private Date animalRegisterDate;
	private Integer animalBatch;
	private Set animalInformations = new HashSet(0);

	// Constructors

	/** default constructor */
	public Animal2() {
	}

	/** full constructor */
	public Animal2(String animalName, Integer animalCategory, Date animalRegisterDate, Integer animalBatch,
			Set animalInformations) {
		this.animalName = animalName;
		this.animalCategory = animalCategory;
		this.animalRegisterDate = animalRegisterDate;
		this.animalBatch = animalBatch;
		this.animalInformations = animalInformations;
	}

	// Property accessors

	public Integer getAnimalId() {
		return this.animalId;
	}

	public void setAnimalId(Integer animalId) {
		this.animalId = animalId;
	}

	public String getAnimalName() {
		return this.animalName;
	}

	public void setAnimalName(String animalName) {
		this.animalName = animalName;
	}

	public Integer getAnimalCategory() {
		return this.animalCategory;
	}

	public void setAnimalCategory(Integer animalCategory) {
		this.animalCategory = animalCategory;
	}

	public Date getAnimalRegisterDate() {
		return this.animalRegisterDate;
	}

	public void setAnimalRegisterDate(Date animalRegisterDate) {
		this.animalRegisterDate = animalRegisterDate;
	}

	public Integer getAnimalBatch() {
		return this.animalBatch;
	}

	public void setAnimalBatch(Integer animalBatch) {
		this.animalBatch = animalBatch;
	}

	public Set getAnimalInformations() {
		return this.animalInformations;
	}

	public void setAnimalInformations(Set animalInformations) {
		this.animalInformations = animalInformations;
	}

}
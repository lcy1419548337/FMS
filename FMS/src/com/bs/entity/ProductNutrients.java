package com.bs.entity;

/**
 * ProductNutrients entity. @author MyEclipse Persistence Tools
 */

public class ProductNutrients implements java.io.Serializable {

	// Fields

	private ProductNutrientsId id;
	private ProductInformation productInformation;

	// Constructors

	/** default constructor */
	public ProductNutrients() {
	}

	/** minimal constructor */
	public ProductNutrients(ProductNutrientsId id) {
		this.id = id;
	}

	/** full constructor */
	public ProductNutrients(ProductNutrientsId id, ProductInformation productInformation) {
		this.id = id;
		this.productInformation = productInformation;
	}

	// Property accessors

	public ProductNutrientsId getId() {
		return this.id;
	}

	public void setId(ProductNutrientsId id) {
		this.id = id;
	}

	public ProductInformation getProductInformation() {
		return this.productInformation;
	}

	public void setProductInformation(ProductInformation productInformation) {
		this.productInformation = productInformation;
	}

}
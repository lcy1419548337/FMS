package com.bs.entity;

/**
 * ProductNutrientsId entity. @author MyEclipse Persistence Tools
 */

public class ProductNutrientsId implements java.io.Serializable {

	// Fields

	private ProductInformation productInformation;
	private Double energy;
	private Double protein;
	private Double carbohydrate;
	private Double fat;
	private Double calcium;
	private Double sodium;

	// Constructors

	/** default constructor */
	public ProductNutrientsId() {
	}

	/** full constructor */
	public ProductNutrientsId(ProductInformation productInformation, Double energy, Double protein, Double carbohydrate,
			Double fat, Double calcium, Double sodium) {
		this.productInformation = productInformation;
		this.energy = energy;
		this.protein = protein;
		this.carbohydrate = carbohydrate;
		this.fat = fat;
		this.calcium = calcium;
		this.sodium = sodium;
	}

	// Property accessors

	public ProductInformation getProductInformation() {
		return this.productInformation;
	}

	public void setProductInformation(ProductInformation productInformation) {
		this.productInformation = productInformation;
	}

	public Double getEnergy() {
		return this.energy;
	}

	public void setEnergy(Double energy) {
		this.energy = energy;
	}

	public Double getProtein() {
		return this.protein;
	}

	public void setProtein(Double protein) {
		this.protein = protein;
	}

	public Double getCarbohydrate() {
		return this.carbohydrate;
	}

	public void setCarbohydrate(Double carbohydrate) {
		this.carbohydrate = carbohydrate;
	}

	public Double getFat() {
		return this.fat;
	}

	public void setFat(Double fat) {
		this.fat = fat;
	}

	public Double getCalcium() {
		return this.calcium;
	}

	public void setCalcium(Double calcium) {
		this.calcium = calcium;
	}

	public Double getSodium() {
		return this.sodium;
	}

	public void setSodium(Double sodium) {
		this.sodium = sodium;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ProductNutrientsId))
			return false;
		ProductNutrientsId castOther = (ProductNutrientsId) other;

		return ((this.getProductInformation() == castOther.getProductInformation())
				|| (this.getProductInformation() != null && castOther.getProductInformation() != null
						&& this.getProductInformation().equals(castOther.getProductInformation())))
				&& ((this.getEnergy() == castOther.getEnergy()) || (this.getEnergy() != null
						&& castOther.getEnergy() != null && this.getEnergy().equals(castOther.getEnergy())))
				&& ((this.getProtein() == castOther.getProtein()) || (this.getProtein() != null
						&& castOther.getProtein() != null && this.getProtein().equals(castOther.getProtein())))
				&& ((this.getCarbohydrate() == castOther.getCarbohydrate())
						|| (this.getCarbohydrate() != null && castOther.getCarbohydrate() != null
								&& this.getCarbohydrate().equals(castOther.getCarbohydrate())))
				&& ((this.getFat() == castOther.getFat()) || (this.getFat() != null && castOther.getFat() != null
						&& this.getFat().equals(castOther.getFat())))
				&& ((this.getCalcium() == castOther.getCalcium()) || (this.getCalcium() != null
						&& castOther.getCalcium() != null && this.getCalcium().equals(castOther.getCalcium())))
				&& ((this.getSodium() == castOther.getSodium()) || (this.getSodium() != null
						&& castOther.getSodium() != null && this.getSodium().equals(castOther.getSodium())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getProductInformation() == null ? 0 : this.getProductInformation().hashCode());
		result = 37 * result + (getEnergy() == null ? 0 : this.getEnergy().hashCode());
		result = 37 * result + (getProtein() == null ? 0 : this.getProtein().hashCode());
		result = 37 * result + (getCarbohydrate() == null ? 0 : this.getCarbohydrate().hashCode());
		result = 37 * result + (getFat() == null ? 0 : this.getFat().hashCode());
		result = 37 * result + (getCalcium() == null ? 0 : this.getCalcium().hashCode());
		result = 37 * result + (getSodium() == null ? 0 : this.getSodium().hashCode());
		return result;
	}

}
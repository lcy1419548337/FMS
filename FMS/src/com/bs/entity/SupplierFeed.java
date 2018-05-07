package com.bs.entity;

/**
 * SupplierFeed entity. @author MyEclipse Persistence Tools
 */

public class SupplierFeed implements java.io.Serializable {

	// Fields

	private Integer number;
	private Feed feed;
	private Supplier supplier;
	private String feedIngredient;
	private Integer fitAnimalOne;
	private Integer fitAnimalTwo;
	private Integer fitAnimalThree;
	private Integer fitAnimalFour;
	private Integer fitAnimalFive;
	private Integer fitAnyOne;

	// Constructors

	/** default constructor */
	public SupplierFeed() {
	}

	/** full constructor */
	public SupplierFeed(Feed feed, Supplier supplier, String feedIngredient, Integer fitAnimalOne,
			Integer fitAnimalTwo, Integer fitAnimalThree, Integer fitAnimalFour, Integer fitAnimalFive,
			Integer fitAnyOne) {
		this.feed = feed;
		this.supplier = supplier;
		this.feedIngredient = feedIngredient;
		this.fitAnimalOne = fitAnimalOne;
		this.fitAnimalTwo = fitAnimalTwo;
		this.fitAnimalThree = fitAnimalThree;
		this.fitAnimalFour = fitAnimalFour;
		this.fitAnimalFive = fitAnimalFive;
		this.fitAnyOne = fitAnyOne;
	}

	// Property accessors

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}



	public Feed getFeed() {
		return feed;
	}

	public void setFeed(Feed feed) {
		this.feed = feed;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public String getFeedIngredient() {
		return this.feedIngredient;
	}

	public void setFeedIngredient(String feedIngredient) {
		this.feedIngredient = feedIngredient;
	}

	public Integer getFitAnimalOne() {
		return this.fitAnimalOne;
	}

	public void setFitAnimalOne(Integer fitAnimalOne) {
		this.fitAnimalOne = fitAnimalOne;
	}

	public Integer getFitAnimalTwo() {
		return this.fitAnimalTwo;
	}

	public void setFitAnimalTwo(Integer fitAnimalTwo) {
		this.fitAnimalTwo = fitAnimalTwo;
	}

	public Integer getFitAnimalThree() {
		return this.fitAnimalThree;
	}

	public void setFitAnimalThree(Integer fitAnimalThree) {
		this.fitAnimalThree = fitAnimalThree;
	}

	public Integer getFitAnimalFour() {
		return this.fitAnimalFour;
	}

	public void setFitAnimalFour(Integer fitAnimalFour) {
		this.fitAnimalFour = fitAnimalFour;
	}

	public Integer getFitAnimalFive() {
		return this.fitAnimalFive;
	}

	public void setFitAnimalFive(Integer fitAnimalFive) {
		this.fitAnimalFive = fitAnimalFive;
	}

	public Integer getFitAnyOne() {
		return this.fitAnyOne;
	}

	public void setFitAnyOne(Integer fitAnyOne) {
		this.fitAnyOne = fitAnyOne;
	}

}
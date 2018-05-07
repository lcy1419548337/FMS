package com.bs.entity;

import java.util.Date;

/**
 * AnimalFeedInformation entity. @author MyEclipse Persistence Tools
 */

public class AnimalFeedInformation2 implements java.io.Serializable {

	// Fields

	private Integer number;
	private Integer animalId;
	private Integer feedId;
	private Double feedAmount;
	private Date feedUseTime;

	// Constructors

	/** default constructor */
	public AnimalFeedInformation2() {
	}

	/** minimal constructor */
	public AnimalFeedInformation2(Integer animalId) {
		this.animalId = animalId;
	}

	/** full constructor */
	public AnimalFeedInformation2(Integer animalId, Integer feedId, Double feedAmount, Date feedUseTime) {
		this.animalId = animalId;
		this.feedId = feedId;
		this.feedAmount = feedAmount;
		this.feedUseTime = feedUseTime;
	}

	// Property accessors

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getAnimalId() {
		return this.animalId;
	}

	public void setAnimalId(Integer animalId) {
		this.animalId = animalId;
	}

	public Integer getFeedId() {
		return this.feedId;
	}

	public void setFeedId(Integer feedId) {
		this.feedId = feedId;
	}

	public Double getFeedAmount() {
		return this.feedAmount;
	}

	public void setFeedAmount(Double feedAmount) {
		this.feedAmount = feedAmount;
	}

	public Date getFeedUseTime() {
		return this.feedUseTime;
	}

	public void setFeedUseTime(Date feedUseTime) {
		this.feedUseTime = feedUseTime;
	}

}
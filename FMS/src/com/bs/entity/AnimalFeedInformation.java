package com.bs.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * AnimalFeedInformation entity. @author MyEclipse Persistence Tools
 */

public class AnimalFeedInformation implements java.io.Serializable {

	// Fields

	private Integer number;
	private Animal animal;
	private Feed feed;
	private Double feedAmount;
	private Timestamp feedUseTime;

	// Constructors

	/** default constructor */
	public AnimalFeedInformation() {
	}

	/** full constructor */
	public AnimalFeedInformation(Animal animal, Feed feed, Double feedAmount, Timestamp feedUseTime) {
		this.animal = animal;
		this.feed = feed;
		this.feedAmount = feedAmount;
		this.feedUseTime = feedUseTime;
	}


	public Animal getAnimal() {
		return animal;
	}

	public void setAnimal(Animal animal) {
		this.animal = animal;
	}

	public Feed getFeed() {
		return feed;
	}

	public void setFeed(Feed feed) {
		this.feed = feed;
	}

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}


	public Double getFeedAmount() {
		return this.feedAmount;
	}

	public void setFeedAmount(Double feedAmount) {
		this.feedAmount = feedAmount;
	}

	public Timestamp getFeedUseTime() {
		return this.feedUseTime;
	}

	public void setFeedUseTime(Timestamp feedUseTime) {
		this.feedUseTime = feedUseTime;
	}

}
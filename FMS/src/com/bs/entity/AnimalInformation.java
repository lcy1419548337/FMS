package com.bs.entity;

import java.sql.Timestamp;

/**
 * AnimalInformation entity. @author MyEclipse Persistence Tools
 */

public class AnimalInformation implements java.io.Serializable {

	// Fields

	private Integer number;
	private Animal animal;
	private Integer age;
	private Integer health;
	private Float currentYield;
	private Float currentWeight;
	private Timestamp recorderTime;
	private String sex;
	// Constructors

	/** default constructor */
	public AnimalInformation() {
	}

	/** minimal constructor */
	public AnimalInformation(Animal animal) {
		this.animal = animal;
	}

	/** full constructor */
	public AnimalInformation(Animal animal, Integer age, Integer health, Float currentYield, Float currentWeight,
			Timestamp recorderTime,String sex) {
		this.animal = animal;
		this.age = age;
		this.health = health;
		this.currentYield = currentYield;
		this.currentWeight = currentWeight;
		this.recorderTime = recorderTime;
		this.sex = sex;
	}

	// Property accessors

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Animal getAnimal() {
		return this.animal;
	}

	public void setAnimal(Animal animal) {
		this.animal = animal;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getHealth() {
		return this.health;
	}

	public void setHealth(Integer health) {
		this.health = health;
	}

	public Float getCurrentYield() {
		return this.currentYield;
	}

	public void setCurrentYield(Float currentYield) {
		this.currentYield = currentYield;
	}

	public Float getCurrentWeight() {
		return this.currentWeight;
	}

	public void setCurrentWeight(Float currentWeight) {
		this.currentWeight = currentWeight;
	}

	public Timestamp getRecorderTime() {
		return this.recorderTime;
	}

	public void setRecorderTime(Timestamp recorderTime) {
		this.recorderTime = recorderTime;
	}

}
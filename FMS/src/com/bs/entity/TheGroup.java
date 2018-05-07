package com.bs.entity;

import java.sql.Timestamp;

/**
 * Group entity. @author MyEclipse Persistence Tools
 */

public class TheGroup implements java.io.Serializable {

	// Fields

	private Integer number;
	private GroupInformation groupInformation;
	private Animal animal;
	private Timestamp time;

	// Constructors

	/** default constructor */
	public TheGroup() {
	}

	/** full constructor */
	public TheGroup(GroupInformation groupInformation, Animal animal, Timestamp time) {
		this.groupInformation = groupInformation;
		this.animal = animal;
		this.time = time;
	}

	// Property accessors

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public GroupInformation getGroupInformation() {
		return groupInformation;
	}

	public void setGroupInformation(GroupInformation groupInformation) {
		this.groupInformation = groupInformation;
	}

	public Animal getAnimal() {
		return animal;
	}

	public void setAnimal(Animal animal) {
		this.animal = animal;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

}
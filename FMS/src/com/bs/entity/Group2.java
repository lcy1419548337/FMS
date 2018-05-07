package com.bs.entity;

import java.sql.Timestamp;

public class Group2 implements java.io.Serializable{
	private Integer number;
	private Integer groupId;
	private Timestamp time;
	private Animal animal;
	
	public Group2() {
	}

	/** minimal constructor */
	public Group2(Animal animal) {
		this.animal = animal;
	}
	
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public Animal getAnimal() {
		return animal;
	}
	public void setAnimal(Animal animal) {
		this.animal = animal;
	}
	
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Group2(Integer groupId, Timestamp time, Animal animal,Integer number) {
		super();
		this.groupId = groupId;
		this.time = time;
		this.animal = animal;
		this.number = number;
	}
	
}

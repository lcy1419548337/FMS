package com.bs.entity;

import java.sql.Timestamp;

/**
 * HistoryBasicId entity. @author MyEclipse Persistence Tools
 */

public class HistoryBasicId implements java.io.Serializable {

	// Fields

	private Integer animalId;
	private Timestamp recorderTime;
	private Integer weight;
	private Integer yield;

	// Constructors

	/** default constructor */
	public HistoryBasicId() {
	}

	/** full constructor */
	public HistoryBasicId(Integer animalId, Timestamp recorderTime, Integer weight, Integer yield) {
		this.animalId = animalId;
		this.recorderTime = recorderTime;
		this.weight = weight;
		this.yield = yield;
	}

	// Property accessors

	public Integer getAnimalId() {
		return this.animalId;
	}

	public void setAnimalId(Integer animalId) {
		this.animalId = animalId;
	}

	public Timestamp getRecorderTime() {
		return this.recorderTime;
	}

	public void setRecorderTime(Timestamp recorderTime) {
		this.recorderTime = recorderTime;
	}

	public Integer getWeight() {
		return this.weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Integer getYield() {
		return this.yield;
	}

	public void setYield(Integer yield) {
		this.yield = yield;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof HistoryBasicId))
			return false;
		HistoryBasicId castOther = (HistoryBasicId) other;

		return ((this.getAnimalId() == castOther.getAnimalId()) || (this.getAnimalId() != null
				&& castOther.getAnimalId() != null && this.getAnimalId().equals(castOther.getAnimalId())))
				&& ((this.getRecorderTime() == castOther.getRecorderTime())
						|| (this.getRecorderTime() != null && castOther.getRecorderTime() != null
								&& this.getRecorderTime().equals(castOther.getRecorderTime())))
				&& ((this.getWeight() == castOther.getWeight()) || (this.getWeight() != null
						&& castOther.getWeight() != null && this.getWeight().equals(castOther.getWeight())))
				&& ((this.getYield() == castOther.getYield()) || (this.getYield() != null
						&& castOther.getYield() != null && this.getYield().equals(castOther.getYield())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getAnimalId() == null ? 0 : this.getAnimalId().hashCode());
		result = 37 * result + (getRecorderTime() == null ? 0 : this.getRecorderTime().hashCode());
		result = 37 * result + (getWeight() == null ? 0 : this.getWeight().hashCode());
		result = 37 * result + (getYield() == null ? 0 : this.getYield().hashCode());
		return result;
	}

}
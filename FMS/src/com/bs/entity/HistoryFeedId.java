package com.bs.entity;

import java.sql.Timestamp;

/**
 * HistoryFeedId entity. @author MyEclipse Persistence Tools
 */

public class HistoryFeedId implements java.io.Serializable {

	// Fields

	private Integer animalId;
	private Integer feedId;
	private Integer feedAccount;
	private Timestamp feedUseTime;

	// Constructors

	/** default constructor */
	public HistoryFeedId() {
	}

	/** full constructor */
	public HistoryFeedId(Integer animalId, Integer feedId, Integer feedAccount, Timestamp feedUseTime) {
		this.animalId = animalId;
		this.feedId = feedId;
		this.feedAccount = feedAccount;
		this.feedUseTime = feedUseTime;
	}

	// Property accessors

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

	public Integer getFeedAccount() {
		return this.feedAccount;
	}

	public void setFeedAccount(Integer feedAccount) {
		this.feedAccount = feedAccount;
	}

	public Timestamp getFeedUseTime() {
		return this.feedUseTime;
	}

	public void setFeedUseTime(Timestamp feedUseTime) {
		this.feedUseTime = feedUseTime;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof HistoryFeedId))
			return false;
		HistoryFeedId castOther = (HistoryFeedId) other;

		return ((this.getAnimalId() == castOther.getAnimalId()) || (this.getAnimalId() != null
				&& castOther.getAnimalId() != null && this.getAnimalId().equals(castOther.getAnimalId())))
				&& ((this.getFeedId() == castOther.getFeedId()) || (this.getFeedId() != null
						&& castOther.getFeedId() != null && this.getFeedId().equals(castOther.getFeedId())))
				&& ((this.getFeedAccount() == castOther.getFeedAccount())
						|| (this.getFeedAccount() != null && castOther.getFeedAccount() != null
								&& this.getFeedAccount().equals(castOther.getFeedAccount())))
				&& ((this.getFeedUseTime() == castOther.getFeedUseTime())
						|| (this.getFeedUseTime() != null && castOther.getFeedUseTime() != null
								&& this.getFeedUseTime().equals(castOther.getFeedUseTime())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getAnimalId() == null ? 0 : this.getAnimalId().hashCode());
		result = 37 * result + (getFeedId() == null ? 0 : this.getFeedId().hashCode());
		result = 37 * result + (getFeedAccount() == null ? 0 : this.getFeedAccount().hashCode());
		result = 37 * result + (getFeedUseTime() == null ? 0 : this.getFeedUseTime().hashCode());
		return result;
	}

}
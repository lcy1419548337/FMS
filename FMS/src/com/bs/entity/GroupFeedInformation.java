package com.bs.entity;

import java.sql.Timestamp;

/**
 * GroupFeedInformation entity. @author MyEclipse Persistence Tools
 */

public class GroupFeedInformation implements java.io.Serializable {

	// Fields

	private Integer number;
	private GroupInformation groupInformation;
	private Integer feedId;
	private Double amount;
	private Timestamp feedUseTime;

	// Constructors

	/** default constructor */
	public GroupFeedInformation() {
	}

	/** full constructor */
	public GroupFeedInformation(GroupInformation groupInformation, Integer feedId, Double amount,
			Timestamp feedUseTime) {
		this.groupInformation = groupInformation;
		this.feedId = feedId;
		this.amount = amount;
		this.feedUseTime = feedUseTime;
	}

	// Property accessors

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public GroupInformation getGroupInformation() {
		return this.groupInformation;
	}

	public void setGroupInformation(GroupInformation groupInformation) {
		this.groupInformation = groupInformation;
	}

	public Integer getFeedId() {
		return this.feedId;
	}

	public void setFeedId(Integer feedId) {
		this.feedId = feedId;
	}

	public Double getAmount() {
		return this.amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Timestamp getFeedUseTime() {
		return this.feedUseTime;
	}

	public void setFeedUseTime(Timestamp feedUseTime) {
		this.feedUseTime = feedUseTime;
	}

}
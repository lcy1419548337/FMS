package com.bs.entity;

/**
 * HistoryFeed entity. @author MyEclipse Persistence Tools
 */

public class HistoryFeed implements java.io.Serializable {

	// Fields

	private HistoryFeedId id;

	// Constructors

	/** default constructor */
	public HistoryFeed() {
	}

	/** full constructor */
	public HistoryFeed(HistoryFeedId id) {
		this.id = id;
	}

	// Property accessors

	public HistoryFeedId getId() {
		return this.id;
	}

	public void setId(HistoryFeedId id) {
		this.id = id;
	}

}
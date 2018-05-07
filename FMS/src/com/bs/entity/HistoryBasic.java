package com.bs.entity;

/**
 * HistoryBasic entity. @author MyEclipse Persistence Tools
 */

public class HistoryBasic implements java.io.Serializable {

	// Fields

	private HistoryBasicId id;

	// Constructors

	/** default constructor */
	public HistoryBasic() {
	}

	/** full constructor */
	public HistoryBasic(HistoryBasicId id) {
		this.id = id;
	}

	// Property accessors

	public HistoryBasicId getId() {
		return this.id;
	}

	public void setId(HistoryBasicId id) {
		this.id = id;
	}

}
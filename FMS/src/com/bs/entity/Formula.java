package com.bs.entity;

/**
 * Formula entity. @author MyEclipse Persistence Tools
 */

public class Formula implements java.io.Serializable {

	// Fields

	private Integer number;
	private Feed feed;
	private String component;
	private Double content;
	private Integer formulaId;

	// Constructors

	/** default constructor */
	public Formula() {
	}

	/** minimal constructor */
	public Formula(Feed feed, Integer formulaId) {
		this.feed = feed;
		this.formulaId = formulaId;
	}

	/** full constructor */
	public Formula(Feed feed, String component, Double content, Integer formulaId) {
		this.feed = feed;
		this.component = component;
		this.content = content;
		this.formulaId = formulaId;
	}

	// Property accessors

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Feed getFeed() {
		return this.feed;
	}

	public void setFeed(Feed feed) {
		this.feed = feed;
	}

	public String getComponent() {
		return this.component;
	}

	public void setComponent(String component) {
		this.component = component;
	}

	public Double getContent() {
		return this.content;
	}

	public void setContent(Double content) {
		this.content = content;
	}

	public Integer getFormulaId() {
		return this.formulaId;
	}

	public void setFormulaId(Integer formulaId) {
		this.formulaId = formulaId;
	}

}
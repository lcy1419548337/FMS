package com.bs.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * ProductInformation entity. @author MyEclipse Persistence Tools
 */

public class ProductInformation implements java.io.Serializable {

	// Fields

	private Integer productId;
	private ProducerInformation producerInformation;
	private String productName;
	private String productStandardNumber;
	private String productionState;
	private Timestamp productionDate;
	private String expirationDate;
	private String storageCondition;
	private Set productNutrientses = new HashSet(0);

	// Constructors

	/** default constructor */
	public ProductInformation() {
	}

	/** full constructor */
	public ProductInformation(ProducerInformation producerInformation, String productName, String productStandardNumber,
			String productionState, Timestamp productionDate, String expirationDate, String storageCondition,
			Set productNutrientses) {
		this.producerInformation = producerInformation;
		this.productName = productName;
		this.productStandardNumber = productStandardNumber;
		this.productionState = productionState;
		this.productionDate = productionDate;
		this.expirationDate = expirationDate;
		this.storageCondition = storageCondition;
		this.productNutrientses = productNutrientses;
	}

	// Property accessors

	public Integer getProductId() {
		return this.productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public ProducerInformation getProducerInformation() {
		return this.producerInformation;
	}

	public void setProducerInformation(ProducerInformation producerInformation) {
		this.producerInformation = producerInformation;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductStandardNumber() {
		return this.productStandardNumber;
	}

	public void setProductStandardNumber(String productStandardNumber) {
		this.productStandardNumber = productStandardNumber;
	}

	public String getProductionState() {
		return this.productionState;
	}

	public void setProductionState(String productionState) {
		this.productionState = productionState;
	}

	public Timestamp getProductionDate() {
		return this.productionDate;
	}

	public void setProductionDate(Timestamp productionDate) {
		this.productionDate = productionDate;
	}

	public String getExpirationDate() {
		return this.expirationDate;
	}

	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}

	public String getStorageCondition() {
		return this.storageCondition;
	}

	public void setStorageCondition(String storageCondition) {
		this.storageCondition = storageCondition;
	}

	public Set getProductNutrientses() {
		return this.productNutrientses;
	}

	public void setProductNutrientses(Set productNutrientses) {
		this.productNutrientses = productNutrientses;
	}

}
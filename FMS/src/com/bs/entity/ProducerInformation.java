package com.bs.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * ProducerInformation entity. @author MyEclipse Persistence Tools
 */

public class ProducerInformation implements java.io.Serializable {

	// Fields

	private Integer producerId;
	private String producerName;
	private String producerAddress;
	private Set productInformations = new HashSet(0);

	// Constructors

	/** default constructor */
	public ProducerInformation() {
	}

	/** full constructor */
	public ProducerInformation(String producerName, String producerAddress, Set productInformations) {
		this.producerName = producerName;
		this.producerAddress = producerAddress;
		this.productInformations = productInformations;
	}

	// Property accessors

	public Integer getProducerId() {
		return this.producerId;
	}

	public void setProducerId(Integer producerId) {
		this.producerId = producerId;
	}

	public String getProducerName() {
		return this.producerName;
	}

	public void setProducerName(String producerName) {
		this.producerName = producerName;
	}

	public String getProducerAddress() {
		return this.producerAddress;
	}

	public void setProducerAddress(String producerAddress) {
		this.producerAddress = producerAddress;
	}

	public Set getProductInformations() {
		return this.productInformations;
	}

	public void setProductInformations(Set productInformations) {
		this.productInformations = productInformations;
	}

}
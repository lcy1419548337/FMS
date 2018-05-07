package com.bs.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * GroupInformation entity. @author MyEclipse Persistence Tools
 */

public class GroupInformation implements java.io.Serializable {

	// Fields

	private Integer groupId;
	private String groupName;
	private Set groupFeedInformations = new HashSet(0);
	private Set theGroups = new HashSet(0);
	// Constructors

	/** default constructor */
	public GroupInformation() {
	}

	/** full constructor */
	public GroupInformation(String groupName, Set groupFeedInformations , Set theGroups) {
		this.groupName = groupName;
		this.groupFeedInformations = groupFeedInformations;
		this.theGroups = theGroups;
	}

	// Property accessors

	public Integer getGroupId() {
		return this.groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return this.groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Set getGroupFeedInformations() {
		return this.groupFeedInformations;
	}

	public void setGroupFeedInformations(Set groupFeedInformations) {
		this.groupFeedInformations = groupFeedInformations;
	}

	public Set getTheGroups() {
		return theGroups;
	}

	public void setTheGroups(Set theGroups) {
		this.theGroups = theGroups;
	}

}
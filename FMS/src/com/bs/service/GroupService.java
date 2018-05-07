package com.bs.service;

import java.sql.Timestamp;
import java.util.List;

import com.bs.entity.*;

public interface GroupService {

	void addToGroup(TheGroup group, Integer animalId);

	PageBean<TheGroup> findGroup(Integer animalId, Integer groupId, Integer page);

	List<TheGroup> findGroupForChoose();

	PageBean<GroupInformation> findAllGroup(Integer page);

	void groupUseFeed(Integer groupId, Integer feedId, Timestamp str2TimeStamp, String amount);

    GroupInformation findById(Integer groupId);


	PageBean<HistoryGroupFeed> showGroupFeed(String startDate, String endDate, Integer page, Integer groupId, Integer feedId);

    List<Timestamp> findDate(String startDate, String endDate,Integer groupId);

	List<Long> makeWeightChar(Integer groupId, Timestamp timestamp, Timestamp timestamp1);

	List<Long> makeYieldChar(Integer groupId, Timestamp timestamp, Timestamp timestamp1);

	void modifyGroup(Integer animalId, Integer groupId, String theTime);

	void deleteOneAnimal(Integer animalId);

	void deleteOneGroup(Integer groupId);

    List<FeedFormula> findFeedFormula();
}

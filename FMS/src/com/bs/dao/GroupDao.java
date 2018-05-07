package com.bs.dao;

import java.sql.Timestamp;
import java.util.List;

import com.bs.entity.*;

public interface GroupDao {

	Animal findAnimalById(Integer animalId);

	void addToGroup(TheGroup group);

	int findCount(Integer animalId, Integer groupId);

	List<TheGroup> find(Integer animalId, Integer groupId, int start);

	List<TheGroup> findGroupForChoose();

	int findGroupCount();

	List<GroupInformation> findGroup(int start);

	void groupUseFeed(GroupFeedInformation groupFeedInformation);

	GroupInformation findGroupById(Integer groupId);

    int showGroupCount(String startDate, String endDate, Integer groupId, Integer feedId);

	List<HistoryGroupFeed> showGroup(String startDate, String endDate, Integer groupId, int start ,Integer feedId);

    List<Timestamp> findDate(Timestamp timestamp, Timestamp timestamp1,Integer animalId);

	List<Integer> findAnAnimal(Integer groupId);

	List<Integer> findDateForRow(Integer integer, Timestamp startDate, Timestamp endDate);

    List<Integer> findYieldDateForRow(Integer integer, Timestamp startDate, Timestamp endDate);

	void modifyGroup(Integer animalId, Integer groupId, Timestamp timestamp);

	void deleteOneAnimal(Integer animalId);

	void deleteOneGroup(Integer groupId);

    List<FeedFormula> findFeedFormula();
}

package com.bs.serviceImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


import com.bs.constant.Constant;
import com.bs.dao.GroupDao;
import com.bs.entity.*;
import com.bs.help.String2timeStamp;
import com.bs.service.GroupService;

public class GroupServiceImpl implements GroupService {
	GroupDao groupDao;

	public GroupDao getGroupDao() {
		return groupDao;
	}

	public void setGroupDao(GroupDao groupDao) {
		this.groupDao = groupDao;
	}

	@Override
	public void addToGroup(TheGroup group, Integer animalId) {
		// TODO Auto-generated method stub
		Animal animal = groupDao.findAnimalById(animalId);
		group.setAnimal(animal);
		groupDao.addToGroup(group);
	}

	@Override
	public PageBean<TheGroup> findGroup(Integer animalId, Integer groupId, Integer page) {
		// TODO Auto-generated method stub
		PageBean<TheGroup> pageBean = new PageBean<TheGroup>();
		pageBean.setLimit(Constant.PAGE_LIMIT);
		pageBean.setPage(page);
		int totalCount = groupDao.findCount(animalId , groupId);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int)Math.ceil((double)totalCount/(double)Constant.PAGE_LIMIT);
		pageBean.setTotalPage(totalPage);
		int start = (page-1)*Constant.PAGE_LIMIT + 1;
		List<TheGroup> list = groupDao.find(animalId,groupId,start);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public List<TheGroup> findGroupForChoose() {
		// TODO Auto-generated method stub
		
		return groupDao.findGroupForChoose();
	}

	@Override
	public PageBean<GroupInformation> findAllGroup(Integer page) {
		// TODO Auto-generated method stub
		PageBean<GroupInformation> pageBean = new PageBean<GroupInformation>();
		pageBean.setLimit(com.bs.constant.Constant.PAGE_LIMIT);
		pageBean.setPage(page);
		int totalCount = groupDao.findGroupCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int)Math.ceil((double)totalCount/(double)com.bs.constant.Constant.PAGE_LIMIT);
		pageBean.setTotalPage(totalPage);
		int start = (page - 1) * com.bs.constant.Constant.PAGE_LIMIT - 1;
		List<GroupInformation> list = groupDao.findGroup(start);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void groupUseFeed(Integer groupId, Integer feedId, Timestamp str2TimeStamp, String amount) {
		// TODO Auto-generated method stub
		GroupFeedInformation groupFeedInformation = new GroupFeedInformation();
		GroupInformation groupInformation = new GroupInformation();
		groupInformation = groupDao.findGroupById(feedId);
		groupFeedInformation.setAmount(Double.valueOf(amount));
		groupFeedInformation.setFeedId(feedId);
		groupFeedInformation.setFeedUseTime(str2TimeStamp);
		groupFeedInformation.setGroupInformation(groupInformation);
		groupDao.groupUseFeed(groupFeedInformation);
	}

	@Override
	public GroupInformation findById(Integer groupId) {

		return groupDao.findGroupById(groupId);
	}

	@Override
	public PageBean<HistoryGroupFeed> showGroupFeed(String startDate, String endDate, Integer page, Integer groupId ,Integer feedId) {
		PageBean<HistoryGroupFeed> pageBean = new PageBean<>();
		int totalCount = 0;
		int totalPage = 0;
		int start = 0;
		pageBean.setLimit(Constant.PAGE_LIMIT);
		pageBean.setPage(page);
		totalCount = groupDao.showGroupCount(startDate,endDate,groupId,feedId);
		System.out.println("totalCount = " + totalCount);
		pageBean.setTotalCount(totalCount);
		totalPage = (int)Math.ceil((double)totalCount/(double)Constant.PAGE_LIMIT);
		pageBean.setTotalPage(totalPage);
		System.out.println("totalPage = " + pageBean.getTotalPage());
		start = (page - 1)*Constant.PAGE_LIMIT + 1;
		List<HistoryGroupFeed> list = groupDao.showGroup(startDate,endDate,groupId,start,feedId);
		//System.out.println("list = " + list.size());
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public List<Timestamp> findDate(String startDate, String endDate, Integer groupId) {
		List<Integer> animalList = groupDao.findAnAnimal(groupId);
		System.out.println("Long animalId = " + animalList.get(0));
		//System.out.println("Integer animalId = " + Integer.parseInt(animalList.get(0).toString()));
		List<Timestamp> list = groupDao.findDate(String2timeStamp.str2TimeStamp(startDate),String2timeStamp.str2TimeStamp(endDate),animalList.get(0));
		return list;
	}

	@Override
	public List<Long> makeWeightChar(Integer groupId, Timestamp startDate, Timestamp endDate) {
		List<Integer> animalList = groupDao.findAnAnimal(groupId);
		List<Timestamp> list = groupDao.findDate(startDate,endDate,animalList.get(0));
		List<Long> result = new ArrayList<>(list.size());
		int realAnimalCount = 0;

		int array[][] = new int[animalList.size()][list.size()];
			for (int i = 0;i<animalList.size();i++) {
				//List<Integer> animalWeightList = groupDao.findGroupWeight(animalId,startDate,endDate);
				System.out.println("list:" + animalList.get(i));
				List<Integer> dateList = groupDao.findDateForRow(animalList.get(i),startDate,endDate);
				if (dateList != null && dateList.size() > 0){
					realAnimalCount ++;
					for (int j = 0; j < dateList.size() ; j++){
						array[i][j] = dateList.get(j);
						//averageWeight += dateList.get(j);
					}
				}
			}
			for (int i = 0 ; i < list.size() ; i++){
				int averageWeight = 0;
				for (int j = 0 ; j < animalList.size() ; j++){
					averageWeight += array[j][i];
				}
				result.add(i,((long)averageWeight/(long)realAnimalCount));
				System.out.println("result = " + result.get(i));
			}
		for (int i = 0 ; i<animalList.size();i++){
				for (int j = 0 ; j < list.size() ; j++){
					System.out.print(array[i][j]);
				}
			System.out.println(" ");
		}

		return result;
	}

	@Override
	public List<Long> makeYieldChar(Integer groupId, Timestamp startDate, Timestamp endDate) {
		List<Integer> animalList = groupDao.findAnAnimal(groupId);
		List<Timestamp> list = groupDao.findDate(startDate,endDate,animalList.get(0));
		List<Long> result = new ArrayList<>(list.size());
		int realAnimalCount = 0;

		int array[][] = new int[animalList.size()][list.size()];
		for (int i = 0;i<animalList.size();i++) {
			//List<Integer> animalWeightList = groupDao.findGroupWeight(animalId,startDate,endDate);
			System.out.println("list:" + animalList.get(i));
			List<Integer> dateList = groupDao.findYieldDateForRow(animalList.get(i),startDate,endDate);
			if (dateList != null && dateList.size() > 0){
				realAnimalCount ++;
				for (int j = 0; j < dateList.size() ; j++){
					array[i][j] = dateList.get(j);
					//averageWeight += dateList.get(j);
				}
			}
		}
		for (int i = 0 ; i < list.size() ; i++){
			int averageWeight = 0;
			for (int j = 0 ; j < animalList.size() ; j++){
				averageWeight += array[j][i];
			}
			result.add(i,((long)averageWeight/(long)realAnimalCount));
			System.out.println("result = " + result.get(i));
		}
		for (int i = 0 ; i<animalList.size();i++){
			for (int j = 0 ; j < list.size() ; j++){
				System.out.print(array[i][j]);
			}
			System.out.println(" ");
		}

		return result;
	}

	@Override
	public void modifyGroup(Integer animalId, Integer groupId, String theTime) {
		groupDao.modifyGroup(animalId,groupId,String2timeStamp.str2TimeStamp(theTime));
	}

	@Override
	public void deleteOneAnimal(Integer animalId) {
		groupDao.deleteOneAnimal(animalId);
	}

	@Override
	public void deleteOneGroup(Integer groupId) {
		groupDao.deleteOneGroup(groupId);
	}

	@Override
	public List<FeedFormula> findFeedFormula() {
		return groupDao.findFeedFormula();
	}


}

package com.bs.daoImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.bs.constant.Constant;
import com.bs.entity.*;
import com.bs.help.String2timeStamp;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.bs.dao.GroupDao;

public class GroupDaoImpl implements GroupDao{
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Animal findAnimalById(Integer animalId) {
		// TODO Auto-generated method stub
		System.out.println("正在执行findAnimalById");
		Session session = sessionFactory.getCurrentSession();
		Animal animal = (Animal)session.get(Animal.class, animalId);
		return animal;
	}

	@Override
	public void addToGroup(TheGroup group) {
		// TODO Auto-generated method stub
		System.out.println("正在执行addToGroup");
		Session session = sessionFactory.getCurrentSession();
		GroupInformation groupInformation = (GroupInformation) session.get(GroupInformation.class,group.getGroupInformation().getGroupId());
		group.setGroupInformation(null);
		group.setGroupInformation(groupInformation);
		session.clear();
		session.save(group);
	}

	@Override
	public int findCount(Integer animalId, Integer groupId) {
		// TODO Auto-generated method stub
		StringBuffer basic = new StringBuffer();
		basic.append("select count(*) from TheGroup g");
		System.out.println((animalId != null) + ";" + (groupId != null));
		if (animalId != null || groupId != null) {
			basic.append(" where");
			if (animalId != null) {
				basic.append(" (g.animal.animalId like '%" + animalId + "') or (g.animal.animalId like '" + animalId +"%') or (g.animal.animalId like '%" + animalId + "%')");
				if (groupId != null) {
					basic.append(" and");
				}
			}
			if (groupId != null) {
				basic.append(" (g.groupInformation.groupId like '%" + groupId + "') or (g.groupInformation.groupId like '" + groupId +"%') or (g.groupInformation.groupId like '%" + groupId + "%')");
			}
		}
		System.out.println("hql = " + basic.toString());
		Query query = sessionFactory.getCurrentSession().createQuery(basic.toString());
		List<Long> list =query.list();
		System.out.println("list.size() = " + list.size());
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}else {
			return 0;
		}
		
	}

	@Override
	public List<TheGroup> find(Integer animalId, Integer groupId, int start) {
		// TODO Auto-generated method stub
		System.out.println("开始查找：" +groupId + start + animalId);
		StringBuffer basic = new StringBuffer();
		basic.append("from TheGroup g");
		if (animalId != null || groupId != null) {
			basic.append(" where");
			if (animalId != null) {
				basic.append(" (g.animal.animalId like '%" + animalId + "' or g.animal.animalId like '" + animalId +"%' or g.animal.animalId like '%" + animalId + "%')");
				if (groupId != null) {
					basic.append(" and");
				}
			}
			if (groupId != null) {
				basic.append(" (g.groupInformation.groupId like '%" + groupId + "' or g.groupInformation.groupId like '" + groupId +"%' or g.groupInformation.groupId like '%" + groupId + "%')");
			}
		}
		System.out.println("hql = " + basic);
		Query query = sessionFactory.getCurrentSession().createQuery(basic.toString());
		query.setFirstResult(start - 1);
		query.setMaxResults(Constant.PAGE_LIMIT);
		List<TheGroup> list = query.list();
		if (list != null && list.size() > 0) {
			System.out.println("list.size() = " + list.size());
			return list;
		}else {
			return null;
		}
	}

	
	public List<TheGroup> findGroupForChoose() {
		// TODO Auto-generated method stub
		String hql = "select distinct groupInformation.groupId from TheGroup g order by g.groupInformation.groupId asc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<TheGroup> list = query.list();
		
		return list;
	}

	@Override
	public int findGroupCount() {
		// TODO Auto-generated method stub
		String hql = "select count(*) from GroupInformation gi ";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Long> list = query.list();
		//Integer integer = new Integer(String.valueOf(bigInteger));
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		else {
		return 0;
		}
	}

	@Override
	public List<GroupInformation> findGroup(int start) {
		// TODO Auto-generated method stub
		String hql = "from GroupInformation gi order by gi.groupId asc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setMaxResults(com.bs.constant.Constant.PAGE_LIMIT);
		query.setFirstResult(start + 1);
		List<GroupInformation> list = query.list();
		if (list != null && list.size() > 0) {
			System.out.println("list长度 = " + list.size());
			return list;
		}else {
		return null;
		}
	}

	@Override
	public void groupUseFeed(GroupFeedInformation groupFeedInformation) {
		// TODO Auto-generated method stub
/*		String hql = "insert into GroupFeedInformation(GroupFeedInformation.groupInformation.groupId,feedId,amount,feedUseTime) values(?,?,?,?)";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, groupId);
		query.setInteger(1, feedId);
		query.setTimestamp(3, str2TimeStamp);
		query.setDouble(3, Double.valueOf(amount));
		query.executeUpdate();*/
		Session session = sessionFactory.getCurrentSession();
		session.save(groupFeedInformation);
	}

	@Override
	public GroupInformation findGroupById(Integer groupId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		GroupInformation groupInformation = (GroupInformation)session.get(GroupInformation.class, groupId);
		if (groupInformation != null){
		return groupInformation;}
		else {
			return null;
		}
	}

	@Override
	public int showGroupCount(String startDate, String endDate, Integer groupId ,Integer feedId) {
		/*List<Long> list = new ArrayList<>();
		if ((startDate != null  && startDate.length() > 0)
				&& (endDate != null && endDate.length() > 0)
				&& (groupId != null)){
			String hql = "select count(*) from HistoryGroupFeed h where h.groupId = ? and (h.feedUseTime between ? and ?)";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setInteger(0,groupId);
			query.setTimestamp(1,String2timeStamp.str2TimeStamp(startDate));
			query.setTimestamp(2,String2timeStamp.str2TimeStamp(endDate));
			list = query.list();
		}
		else if ((startDate != null && startDate.length() > 0)
				&& (endDate != null && endDate.length() > 0)
				&& (groupId == null)){
			String hql = "select count(*) from HistoryGroupFeed h where h.feedUseTime between ? and ?";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setTimestamp(0,String2timeStamp.str2TimeStamp(startDate));
			query.setTimestamp(1,String2timeStamp.str2TimeStamp(endDate));
			list = query.list();
		}
		else if ((startDate == null || startDate.length() == 0)
				&& (endDate == null || endDate.length() == 0)
				&& (groupId != null)){
			String hql = "select count(*) from HistoryGroupFeed h where h.groupId = ?";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setInteger(0,groupId);
			list = query.list();
		}
		else if ((startDate == null || startDate.length() == 0)
				&& (endDate == null || endDate.length() == 0)
				&& (groupId == null)){
			String hql = "select count(*) from HistoryGroupFeed h";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			list = query.list();
		}
		if (list != null && list.size() > 0){
			System.out.println("list.size() = " + list.get(0).intValue());
			return list.get(0).intValue();
		}else {
			return  0;
		}*/
		StringBuffer hql = new StringBuffer();
		hql.append("select count(*) from HistoryGroupFeed h ");
		if ((startDate != null && startDate.length() > 0)
				||(endDate != null && endDate.length() > 0)
				||(groupId != null)
				||(feedId != null)){
			hql.append("where ");
		}
		if ((startDate != null && startDate.length() > 0)
				&&(endDate != null && endDate.length() > 0)){
			hql.append("(h.feedUseTime between '" + String2timeStamp.str2TimeStamp(startDate) +"' and '" + String2timeStamp.str2TimeStamp(endDate) + "' ) ");
			if ((groupId != null)
					||(feedId != null)){
				hql.append("and ");
			}
		}
		if (groupId != null){
			hql.append("(h.groupId = " + groupId +") ");
			if (feedId != null){
				hql.append("and ");
			}
		}
		if (feedId != null){
			hql.append("(h.feedId = " + feedId + ") ");
		}
		System.out.println("hql = " + hql);
		Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
		query.setMaxResults(Constant.PAGE_LIMIT);
		List<Long> list = query.list();
		if (list != null && list.size() > 0){
			return  list.get(0).intValue();
		}else {
			return 0;
		}
	}

	@Override
	public List<HistoryGroupFeed> showGroup(String startDate, String endDate, Integer groupId, int start , Integer feedId) {
		/*List<HistoryGroupFeed> list = new ArrayList<>();
		if ((startDate != null && startDate.length() > 0)
				&& (endDate != null && endDate.length() > 0)
				&& (groupId != null)){
			String hql = "from HistoryGroupFeed h where h.groupId = ? and (h.feedUseTime between ? and ?)";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setInteger(0,groupId);
			query.setTimestamp(1,String2timeStamp.str2TimeStamp(startDate));
			query.setTimestamp(2,String2timeStamp.str2TimeStamp(endDate));
			query.setMaxResults(Constant.PAGE_LIMIT);
			query.setFirstResult(start-1);
			list = query.list();
		}
		else if ((startDate != null && startDate.length() > 0)
				&& (endDate != null && endDate.length() > 0)
				&& (groupId == null)){
			String hql = "from HistoryGroupFeed h where h.feedUseTime between ? and ?";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setTimestamp(0,String2timeStamp.str2TimeStamp(startDate));
			query.setTimestamp(1,String2timeStamp.str2TimeStamp(endDate));
			query.setMaxResults(Constant.PAGE_LIMIT);
			query.setFirstResult(start-1);
			list = query.list();
		}
		else if ((startDate == null || startDate.length() == 0)
				&& (endDate == null || endDate.length() == 0)
				&& (groupId != null)){
			String hql = "from HistoryGroupFeed h where h.groupId = ?";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setInteger(0,groupId);
			query.setMaxResults(Constant.PAGE_LIMIT);
			query.setFirstResult(start-1);
			list = query.list();
		}
		else if ((startDate == null || startDate.length() == 0)
				&& (endDate == null || endDate.length() == 0)
				&& (groupId == null)){
			String hql = "from HistoryGroupFeed h";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setMaxResults(Constant.PAGE_LIMIT);
			query.setFirstResult(start-1);
			list = query.list();
		}
		if (list != null && list.size() > 0){
			System.out.println("list.size() = " + list.size());
			return  list;
		}else {
			return null;
		}
	}*/
		StringBuffer hql = new StringBuffer();
		hql.append("from HistoryGroupFeed h ");
		if ((startDate != null && startDate.length() > 0)
				|| (endDate != null && endDate.length() > 0)
				|| (groupId != null)
				|| (feedId != null)) {
			hql.append("where ");
		}
		if ((startDate != null && startDate.length() > 0)
				&& (endDate != null && endDate.length() > 0)) {
			hql.append("(h.feedUseTime between '" + String2timeStamp.str2TimeStamp(startDate) + "' and '" + String2timeStamp.str2TimeStamp(endDate) + "' ) ");
			if ((groupId != null)
					|| (feedId != null)) {
				hql.append("and ");
			}
		}
		if (groupId != null) {
			hql.append("(h.groupId = " + groupId + ") ");
			if (feedId != null) {
				hql.append("and ");
			}
		}
		if (feedId != null) {
			hql.append("(h.feedId = " + feedId + ") ");
		}
		hql.append("order by h.feedUseTime asc");
		System.out.println("hql = " + hql);
		Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
		query.setFirstResult(start - 1);
		query.setMaxResults(Constant.PAGE_LIMIT);
		List<HistoryGroupFeed> list = query.list();
		if (list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@Override
	public List<Timestamp> findDate(Timestamp timestamp, Timestamp timestamp1,Integer animalId) {
		String hql = "select hb.id.recorderTime from HistoryBasic hb where hb.id.animalId = ? and (" +
				"hb.id.recorderTime between ? and ? )order by hb.id.recorderTime asc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0,animalId);
		query.setTimestamp(1,timestamp);
		query.setTimestamp(2,timestamp1);
		System.out.println("animalId = " + animalId + ";start = " + timestamp + ";end = " + timestamp1);
		List<Timestamp> list = query.list();
		if (list != null && list.size() > 0) {
			System.out.println("list.size = " + list.size());
			return list;
		}else {
			System.out.println("list.size = 0");
			return  null;
		}
	}

	@Override
	public List<Integer> findAnAnimal(Integer groupId) {
		String hql = "select distinct tg.animal.animalId from TheGroup tg where tg.groupInformation.groupId = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0,groupId);
		List<Integer> list = query.list();
		if (list != null && list.size() > 0){
			System.out.println("list.size = " + list.size());
			return  list;
		}else {
			System.out.println("list.size = 0");
			return null;
		}
	}

	@Override
	public List<Integer> findDateForRow(Integer animalId, Timestamp startDate, Timestamp endDate) {
		String hql = "from HistoryBasic hb where hb.id.animalId = ? and (" +
				"hb.id.recorderTime between ? and ? )order by hb.id.recorderTime asc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0,animalId);
		query.setTimestamp(1,startDate);
		query.setTimestamp(2,endDate);
		System.out.println("animalId = " + animalId + ";start = " + startDate + ";end = " + endDate);
		List<HistoryBasic> list = query.list();
		List<Integer> result = new ArrayList<>();
		if (list != null && list.size() > 0) {
			System.out.println("list.size = " + list.size());
			for (int i = 0;i<list.size();i++){
				System.out.println("result[" + i + "] = " + list.get(i).getId().getWeight());
				result.add(i,list.get(i).getId().getWeight());
			}
			return result;
		}else {
			System.out.println("list.size = 0");
			return  null;
		}
	}

	@Override
	public List<Integer> findYieldDateForRow(Integer animalId, Timestamp startDate, Timestamp endDate) {
		String hql = "from HistoryBasic hb where hb.id.animalId = ? and (" +
				"hb.id.recorderTime between ? and ? )order by hb.id.recorderTime asc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0,animalId);
		query.setTimestamp(1,startDate);
		query.setTimestamp(2,endDate);
		System.out.println("animalId = " + animalId + ";start = " + startDate + ";end = " + endDate);
		List<HistoryBasic> list = query.list();
		List<Integer> result = new ArrayList<>();
		if (list != null && list.size() > 0) {
			System.out.println("list.size = " + list.size());
			for (int i = 0;i<list.size();i++){
				System.out.println("result[" + i + "] = " + list.get(i).getId().getYield());
				result.add(i,list.get(i).getId().getYield());
			}
			return result;
		}else {
			System.out.println("list.size = 0");
			return  null;
		}
	}

	@Override
	public void modifyGroup(Integer animalId, Integer groupId, Timestamp timestamp) {
		String hql = "from TheGroup tg where tg.animal.animalId = ?";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setInteger(0,animalId);
		List<TheGroup> list = query.list();
		TheGroup theGroup = list.get(0);
		theGroup.setTime(timestamp);
		GroupInformation groupInformation = (GroupInformation) session.get(GroupInformation.class,groupId);
		theGroup.setGroupInformation(groupInformation);
		session.save(theGroup);
	}

	@Override
	public void deleteOneAnimal(Integer animalId) {
		System.out.println("正在从集群中移除动物");
		String hql = "delete from TheGroup tg where tg.animal.animalId = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0,animalId);
		query.executeUpdate();
	}

	@Override
	public void deleteOneGroup(Integer groupId) {
		System.out.println("正在移除集群");
		String hql = "delete from GroupInformation gi where gi.groupId = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0,groupId);
		query.executeUpdate();
	}

	@Override
	public List<FeedFormula> findFeedFormula() {
		String hql = "from FeedFormula";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
}

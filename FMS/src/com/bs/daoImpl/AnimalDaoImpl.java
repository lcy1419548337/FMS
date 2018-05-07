package com.bs.daoImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


import com.bs.entity.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.bs.constant.Constant;
import com.bs.dao.AnimalDao;
import com.bs.help.AnimalFindHelp;

public class AnimalDaoImpl implements AnimalDao {
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addAnimal(Animal animal,Integer category) {
		// TODO Auto-generated method stub
		System.out.println("addAnimal正在运行");
		System.out.println("animal.getAnimalId()="+animal.getAnimalId());
		Session session =sessionFactory.getCurrentSession();
		AnimalCategory animalCategory = (AnimalCategory)session.get(AnimalCategory.class,category);
		animal.setAnimalCategory(animalCategory);
		session.save(animal);
	}

	@Override
	public List<Animal> findByPage(int start, int end) {
		// TODO Auto-generated method stub
		String hqlString = "from Animal";
		Query query = sessionFactory.getCurrentSession().createQuery(hqlString);
		System.out.println((start-1) + "/" + com.bs.constant.Constant.PAGE_LIMIT);
		query.setFirstResult(start-1);
		query.setMaxResults(com.bs.constant.Constant.PAGE_LIMIT);
		List<Animal> list = query.list();
		System.out.println("query.getQueryString() = " + query.getQueryString());
		for (Animal animal : list) {
			System.out.println("查询到的动物id：" + animal.getAnimalId());
		}
		System.out.println("查询到的动物数量：" + list.size());
		if (list.size()>0 && list!= null) {
			return list;
		}
		else {
			return null;
		}
	}

	@Override
	public int findCount() {
		// TODO Auto-generated method stub
		String hqlString = "select count(*) from Animal";
		Query query = sessionFactory.getCurrentSession().createQuery(hqlString);
		List<Long> list = query.list();
		if (list.size()>0 && list!= null) {
			return list.get(0).intValue();
		}
		else {
			return 0;
		}
	}

	@Override
	public int findCountCategory() {
		// TODO Auto-generated method stub
		String hqlString = "select count(*) from AnimalCategory";
		Query query = sessionFactory.getCurrentSession().createQuery(hqlString);
		List<Long> list = query.list();
		if (list.size()>0 && list!= null) {
			return list.get(0).intValue();
		}
		else {
			return 0;
		}
	}

	@Override
	public List<AnimalCategory> finCategoryByPage(int start) {
		// TODO Auto-generated method stub
		String hqlString = "from AnimalCategory";
		Query query = sessionFactory.getCurrentSession().createQuery(hqlString);
		query.setFirstResult(start - 1);
		query.setMaxResults(Constant.PAGE_LIMIT);
		List<AnimalCategory> list = query.list();
		for (AnimalCategory animalCategory : list) {
			System.out.println("分类名称 ：" + animalCategory.getCategoryName());
		}
		if (list.size()>0 && list!= null) {
			return list;
		}
		else {
			return null;
		}
	}

	@Override
	public Animal findById(Integer animalId) {
		// TODO Auto-generated method stub
		if (animalId != null) {
			String hqlString = "from Animal where animalId = ?";
			Query query = sessionFactory.getCurrentSession().createQuery(hqlString);
			query.setInteger(0, animalId);
			List<Animal> list = query.list();
			if (list != null && list.size() > 0) {
				System.out.println("动物存在，id为：" + list.get(0).getAnimalId());
				return list.get(0);
			} else {
				return null;
			}
		}
		else {
			return  null;
		}
	}

	@Override
	public void addAnimalInformation(AnimalInformation animalInformation,AnimalCategory animalCategory) {
		// TODO Auto-generated method stub
		System.out.println(animalInformation.getAnimal().getAnimalId());
		Session session = sessionFactory.getCurrentSession();
		String hqlString = "select number from AnimalInformation where animalId = ?";
		Query query = session.createQuery(hqlString);
		System.out.println("即将查询的动物id为：" + animalInformation.getAnimal().getAnimalId());
		query.setInteger(0, animalInformation.getAnimal().getAnimalId());
		List<Integer> list = query.list();
		
		if (list != null && list.size() > 0) {
			Integer number = list.get(0);
			System.out.println("动物number为 : " + number);
			AnimalInformation saveAnimalInformation = (AnimalInformation)session.get(AnimalInformation.class, number);
				saveAnimalInformation.setCurrentWeight(animalInformation.getCurrentWeight());
				saveAnimalInformation.setCurrentYield(animalInformation.getCurrentYield());
				saveAnimalInformation.setHealth(animalInformation.getHealth());
				saveAnimalInformation.setRecorderTime(animalInformation.getRecorderTime());
				saveAnimalInformation.setSex(animalInformation.getSex());
			
			Animal oldAnimal = (Animal)session.get(Animal.class, animalInformation.getAnimal().getAnimalId());
/*			Animal newAnimal =animalInformation.getAnimal();
			oldAnimal.getAnimalInformations().remove(animalInformation);
			newAnimal.getAnimalInformations().add(animalInformation);
			saveAnimalInformation.setAnimal(newAnimal);*/
			if (animalInformation.getAnimal().getAnimalName() != null&&animalInformation.getAnimal().getAnimalName().length()>0) {
				System.out.println("更新animla数据" + animalCategory);
				oldAnimal.setAnimalCategory(animalCategory);
				oldAnimal.setAnimalName(animalInformation.getAnimal().getAnimalName());
				oldAnimal.setAnimalBatch(animalInformation.getAnimal().getAnimalBatch());
				oldAnimal.setAnimalRegisterDate(animalInformation.getAnimal().getAnimalRegisterDate());
			}
			session.saveOrUpdate(oldAnimal);
			session.save(saveAnimalInformation);
		}else {
			System.out.println("动物不存在的时候执行的方法 ");
			Animal animal = animalInformation.getAnimal();
			System.out.println("animalId" + animal.getAnimalId());
			animal.getAnimalInformations().add(animalInformation);
			animal.setAnimalCategory(animalCategory);
			session.saveOrUpdate(animal);
		}
		
		//session.delete(animalInformation);
	}

	@Override
	public List<AnimalCategory> findCategory() {
		// TODO Auto-generated method stub
		String hqlString = "from AnimalCategory";
		Query query = sessionFactory.getCurrentSession().createQuery(hqlString);
		List<AnimalCategory> list = query.list();
		if (list != null &&list.size() > 0) {
			System.out.println("查询到的动物分类数量为：" + list.size());
			return list;
		}else {
			return null;
		}
	}

	@Override
	public int findCountByInformation(AnimalFindHelp animalFindHelp) {
		// TODO Auto-generated method stub
		StringBuffer basicString = new StringBuffer();
		basicString.append("select count(*) from Animal A ,AnimalInformation An where A.animalId = An.animal.animalId ");
		if (animalFindHelp.getAnimalId() != null) {
			basicString.append(" and A.animalId = '"+ animalFindHelp.getAnimalId() + "'");
		}
		if (animalFindHelp.getAnimalName() != null && animalFindHelp.getAnimalName().length() > 0) {
			basicString.append(" and A.animalName = '" + animalFindHelp.getAnimalName() + "'");
		}
		if (animalFindHelp.getAnimalCategory() != null) {
			basicString.append(" and A.animalCategory = '" + animalFindHelp.getAnimalCategory() + "'");
		}
		if (animalFindHelp.getAnimalBatch() != null) {
			basicString.append(" and A.animalBatch = '" + animalFindHelp.getAnimalBatch() + "'");
		}
		if (animalFindHelp.getHealth() != null) {
			basicString.append(" and An.health = '" + animalFindHelp.getHealth() + "'");
		}
		System.out.println("basicString = " + basicString);
		Query query = sessionFactory.getCurrentSession().createQuery(basicString.toString());
		List<Long> list = query.list();
		if (list != null && list.size() > 0) {
			System.out.println("查询到的结果为：" + list.get(0));
			return list.get(0).intValue();
		}else{
		return 0;
		}
	}

	@Override
	public List findAllFeedByPage(int start, AnimalFindHelp animalFindHelp) {
		// TODO Auto-generated method stub
		StringBuffer basic = new StringBuffer();
		basic.append("from Animal A , AnimalInformation An where A.animalId = An.animal.animalId order by A.animalId asc");
		if (animalFindHelp.getAnimalId() != null) {
			basic.append(" and A.animalId = '"+ animalFindHelp.getAnimalId() + "'");
		}
		if (animalFindHelp.getAnimalName() != null && animalFindHelp.getAnimalName().length() > 0) {
			basic.append(" and A.animalName = '" + animalFindHelp.getAnimalName() + "'");
		}
		if (animalFindHelp.getAnimalCategory() != null) {
			basic.append(" and A.animalCategory = '" + animalFindHelp.getAnimalCategory() + "'");
		}
		if (animalFindHelp.getAnimalBatch() != null) {
			basic.append(" and A.animalBatch = '" + animalFindHelp.getAnimalBatch() + "'");
		}
		if (animalFindHelp.getHealth() != null) {
			basic.append(" and An.health = '" + animalFindHelp.getHealth() + "'");
		}
		System.out.println("basicString = " + basic);
		Query query = sessionFactory.getCurrentSession().createQuery(basic.toString());
		query.setFirstResult(start -1);
		query.setMaxResults(com.bs.constant.Constant.PAGE_LIMIT);
		List<?> list = query.list();
		if (list != null && list.size() > 0) {
			System.out.println("查询到结果，返回animalServiceImpl : " + list.size());
			return list;
		}else {
			return null;
		}
	}

	@Override
	public void deleteOne(Integer animalId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "delete from Animal a where a.animalId =  ?";
		Query query =session.createQuery(hql);
		query.setInteger(0,animalId);
		query.executeUpdate();
/*		Animal animal = (Animal)session.get(Animal.class, animalId);
		session.delete(animal);*/
	}

	@Override
	public List<Long> makeWeightChar(Integer animalId, Timestamp startTime, Timestamp endTime) {

		String timeStart = startTime.toString();
		String timeEnd = endTime.toString();
		System.out.println("start = " + timeStart + ";end = " + timeEnd);
		String hql = "from HistoryBasic h where h.id.animalId = ? " +
				"and(h.id.recorderTime between ? and ?) order by h.id.recorderTime asc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0,animalId);
		query.setTimestamp(1,startTime);
		query.setTimestamp(2,endTime);
		List<HistoryBasic> list = query.list();
		List<Long> longList = new ArrayList<Long>(list.size());
		for (int i = 0;i < list.size();i ++){
			//System.out.println("list.get(i) = " + list.get(i));
			longList.add(list.get(i).getId().getWeight().longValue());
			//System.out.println("longList.get(i) = " + longList.get(i));
		}
		return longList;
	}

	@Override
	public List<Long> makeYieldChar(Integer animalId, Timestamp startTime, Timestamp endTime) {
		String hql = "from HistoryBasic h where h.id.animalId = ? " +
				"and(h.id.recorderTime between ? and ?) order by h.id.recorderTime asc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0,animalId);
		query.setTimestamp(1,startTime);
		query.setTimestamp(2,endTime);

		List<HistoryBasic> list = query.list();
		List<Long> longList = new ArrayList<Long>(list.size());
		for (int i = 0;i < list.size();i ++){
			//System.out.println("list.get(i) = " + list.get(i));
			longList.add(list.get(i).getId().getYield().longValue());
			//System.out.println("longList.get(i) = " + longList.get(i));
		}
		return longList;
	}

    @Override
    public List<Timestamp> findDate(Timestamp startDate, Timestamp endDate,Integer animalId) {
        String hql = "select h.id.recorderTime from HistoryBasic h where h.id.animalId = ? and (" +
                "h.id.recorderTime between ? and ? ) order by h.id.recorderTime asc";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger(0,animalId);
        query.setTimestamp(1,startDate);
        query.setTimestamp(2,endDate);
        System.out.println("start = " + startDate + ";end = " + endDate);
        List<Timestamp> list = query.list();
        if (list != null && list.size() > 0) {
            return list;
        }else {
            return  null;
        }
    }

	@Override
	public void deleteAnimalInformationByAnimalId(Integer animalId) {
		Session session =sessionFactory.getCurrentSession();
		String hql = "delete from AnimalInformation ai where ai.animal.animalId =  ?";
		Query query =session.createQuery(hql);
		query.setInteger(0,animalId);
		query.executeUpdate();
/*		String hql1 = "from AnimalInformation ai where ai.animal.animalId = ?";

		Query query1 = session.createQuery(hql1);
		query1.setInteger(0,animalId);
		List<AnimalInformation> list = query1.list();
		for (AnimalInformation ai:list) {
			ai.setAnimal(null);
			session.update(ai);
			System.out.println("正在删除AnimalInformation");
			session.delete(ai);
			System.out.println("删除成功");
		}*/

	}

	@Override
	public void deleteAnimalFeedInformationByAnimalId(Integer animalId) {
		Session session =sessionFactory.getCurrentSession();
		String hql = "delete from AnimalFeedInformation afi where afi.animal.animalId =  ?";
		Query query =session.createQuery(hql);
		query.setInteger(0,animalId);
		query.executeUpdate();
		/*String hql2 = "from AnimalFeedInformation afi where afi.animal.animalId = ?";
		Query query2 = session.createQuery(hql2);
		query2.setInteger(0,animalId);
		List<AnimalFeedInformation> list2 = query2.list();
		Animal animal =(Animal) session.get(Animal.class,animalId);
		animal.getAnimalFeedInformations().remove(animal);
		for (AnimalFeedInformation afi:list2) {
			afi.setAnimal(null);
			afi.setFeed(null);
			System.out.println("正在删除AnimalFeedInformation");
			session.delete(afi);
			System.out.println("删除成功");
		}*/

	}

	@Override
	public void deleteGroupByAnimalId(Integer animalId) {
		Session session =sessionFactory.getCurrentSession();
		String hql = "delete from TheGroup tg where tg.animal.animalId =  ?";
		Query query =session.createQuery(hql);
		query.setInteger(0,animalId);
		query.executeUpdate();
		/*String hql3 = "from TheGroup tg where tg.animal.animalId = ?";
		Query query3 = session.createQuery(hql3);
		query3.setInteger(0,animalId);
		List<TheGroup> list3 = query3.list();
		for (TheGroup tg:list3) {
			tg.setGroupInformation(null);
			tg.setAnimal(null);
			session.save(tg);
			System.out.println("正在删除TheGroup");
			session.delete(tg);
			System.out.println("删除成功");
		}*/
	}

	@Override
	public AnimalCategory findCategoryById(Integer category) {
		Session session = sessionFactory.getCurrentSession();
		return (AnimalCategory) session.get(AnimalCategory.class,category);
	}

	@Override
	public AnimalInformation findAnimalInformation(Integer animlaId) {
		String hql = "from AnimalInformation ai where ai.animal.animalId = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0,animlaId);
		List<AnimalInformation> list = query.list();
		if (list != null && list.size() > 0) {
			return list.get(0);
		}else {
			return null;
		}
	}
}

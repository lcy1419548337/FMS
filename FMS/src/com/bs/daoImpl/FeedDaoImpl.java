package com.bs.daoImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.GeneratedValue;

import com.bs.constant.Constant;
import com.bs.entity.*;
import com.bs.help.String2timeStamp;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.web.context.request.SessionScope;

import com.bs.help.FeedHelp;

public class FeedDaoImpl implements com.bs.dao.FeedDao {
    SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<FeedCategory> findFeedCategory() {
        // TODO Auto-generated method stub
        System.out.println("开始查询饲料分类");
        Session session =sessionFactory.getCurrentSession();
        String hql = "from FeedCategory";
        Query query =session.createQuery(hql);
        List<FeedCategory> categories = query.list();
        if (categories != null && categories.size() > 0) {
            System.out.println("查询到饲料分类结果");
            return categories;
        }else {
            System.out.println("未查询到饲料分类");
            return null;
        }
    }

    @Override
    public void saveFeed(Feed feed) {
        // TODO Auto-generated method stub
        Session session = sessionFactory.getCurrentSession();
        session.save(feed);
    }

    @Override
    public void useFeed(AnimalFeedInformation animalFeedInformation) {
        // TODO Auto-generated method stub
        System.out.println("正在写入投放记录"+this.getClass().getName());
        Session session =sessionFactory.getCurrentSession();
        session.save(animalFeedInformation);
    }

	/*@Override
	public List findFeedByPage(Integer page) {
		*//**
     *
     private Integer feedId;
     private String feedName;
     private Integer feedCategory;
     private String feedIntroduction;
     private String remarks;
     private String supplier;
     private String stock;
     private String fomulaId;
     *//*
		// TODO Auto-generated method stub
		String hqlString = "from Feed f,FeedInformation fi where f.feedId=fi.feedId and fi.supplier=? and f.feedName=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hqlString);
		query.setString(0, "%");
		query.setString(1, "%");
		List list = query.list();
		System.out.println(list.size());
		System.out.println();
		for (test test : list) {
			System.out.println(test.getFeed().getFeedId());
			System.out.println(test.getFeed().getFeedName());
			System.out.println(test.getFeed().getFeedIntroduction());
		}
		Feed feed = new Feed();
		FeedInformation feedInformation = new FeedInformation();
		for (int i = 0; i < list.size(); i++) {
			Object[] object = (Object[]) list.get(i);
			Feed testFeed = (Feed) object[0];
			FeedInformation testFeedInformation = (FeedInformation) object[1];
			System.out.println(testFeed.getFeedId() + testFeed.getFeedIntroduction());

		}
		return list;
	}*/

    @Override
    public int findCountFeed() {
        // TODO Auto-generated method stub
        String hqlString = "select count(*) from Feed f , FeedInformation fi where f.feedId = fi.feed.feedId";
        Query query = sessionFactory.getCurrentSession().createQuery(hqlString);
        List<Long> list = query.list();
        System.out.println("查询全部饲料结果的数量 = " + list.get(0));
        if (list.size() >0 && list != null) {
            return list.get(0).intValue();
        } else {
            return 0;
        }
    }

    @Override
    public List findAllFeedByPage(Integer start,FeedHelp feedHelp) {
        // TODO Auto-generated method stub
        StringBuffer hqlString = new StringBuffer();
        String basicString = "from Feed f,FeedInformation fi,Supplier s where f.feedId = fi.feed.feedId and f.supplier.supplierId=s.supplierId";
        if (feedHelp != null) {
            hqlString.append(basicString);
            System.out.println(feedHelp.getFeedName()
                    +feedHelp.getSupplier()
                    +feedHelp.getCategory()
                    +feedHelp.getFeedId()
            );
            if (feedHelp.getFeedId() != null) {
                System.out.println("feedHelp.getFeedId() = '" + feedHelp.getFeedId()+ "'");
                hqlString.append(" and f.feedId = '" + feedHelp.getFeedId() + "'");
            }
            if (feedHelp.getFeedName() != null) {
                System.out.println("feedHelp.getFeedName() = " + feedHelp.getFeedName());
                hqlString.append(" and f.feedName = '"+ feedHelp.getFeedName()+ "'");
            }
            if (feedHelp.getSupplier() != null) {
                System.out.println("feedHelp.getSupplier() = '" + feedHelp.getSupplier()+ "'");
                hqlString.append(" and fi.supplier = '" + feedHelp.getSupplier()+ "'");
            }
            if (feedHelp.getCategory() != null) {
                System.out.println("feedHelp.getCategory() = '" + feedHelp.getCategory()+ "'");
                hqlString.append(" and fi.categoryId = '" + feedHelp.getCategory()+ "'");
            }
        }else {
            hqlString.append(basicString);
        }

        System.out.println("hqlString= " + hqlString.toString());
        Query query = sessionFactory.getCurrentSession().createQuery(hqlString.toString());
        System.out.println((start-1) + "/" + com.bs.constant.Constant.PAGE_LIMIT);
        query.setFirstResult(start-1);
        query.setMaxResults(com.bs.constant.Constant.PAGE_LIMIT);
        List<?> list = query.list();
        System.out.println("query.getQueryString() = " + query.getQueryString());
        System.out.println("查询到的饲料数量：" + list.size());
        if (list != null && list.size()>0 ) {
            return list;
        }
        else {
            System.out.println("返回值为：null");
            return null;
        }
    }

    @Override
    public int findCountFeedByInformation(FeedHelp feedHelp) {
        // TODO Auto-generated method stub
        StringBuffer hqlString = new StringBuffer();
        //String basicString = "select count(*) from Feed f,FeedInformation fi where f.feedId = fi.feedId";
        String basicString = "select count(*) from Feed f,FeedInformation fi,Supplier s where f.feedId = fi.feed.feedId and f.supplier.supplierId=s.supplierId";
        hqlString.append(basicString);
        System.out.println(feedHelp.getFeedName()
                +feedHelp.getSupplier()
                +feedHelp.getCategory()
                +feedHelp.getFeedId()
        );
        if (feedHelp.getFeedId() != null) {
            System.out.println("feedHelp.getFeedId() = '" + feedHelp.getFeedId()+ "'");
            hqlString.append(" and f.feedId = '" + feedHelp.getFeedId() + "'");
        }
        if (feedHelp.getFeedName() != null) {
            System.out.println("feedHelp.getFeedName() = " + feedHelp.getFeedName());
            hqlString.append(" and f.feedName = '"+ feedHelp.getFeedName()+ "'");
        }
        if (feedHelp.getSupplier() != null) {
            System.out.println("feedHelp.getSupplier() = '" + feedHelp.getSupplier()+ "'");
            hqlString.append(" and fi.supplier = '" + feedHelp.getSupplier()+ "'");
        }
        if (feedHelp.getCategory() != null) {
            System.out.println("feedHelp.getCategory() = '" + feedHelp.getCategory()+ "'");
            hqlString.append(" and fi.categoryId = '" + feedHelp.getCategory()+ "'");
            System.out.println("hqlString = " + hqlString);
        }

        Query query = sessionFactory.getCurrentSession().createQuery(hqlString.toString());
        List<Long> list = query.list();
        if (list != null &&  list.size() > 0) {
            System.out.println("查到的饲料数量为：" + list.get(0).intValue());
            return list.get(0).intValue();
        }
        else {
            return 0;
        }
    }

    @GeneratedValue
    public void testHibernates() {
        /**
         * 级联删除：饲料，配方，饲料信息，供应商
         */

        // TODO Auto-generated method stub
		/*System.out.println("testHibernates");
		Feed feed = new Feed();
		Supplier supplier = new Supplier();
		FeedInformation feedInformation = new FeedInformation();
		feedInformation.setSupplier("supplier");
		Formula formula = new Formula();
		formula.setContent(101.0);
		supplier.setSupplierName("supplier");
		supplier.setSupplierId(26);
		feed.setFeedName("feedName");
		feed.setFeedId(500);
		feed.setSupplier(supplier);
		feed.getFormulas().add(formula);
		feed.getFeedInformations().add(feedInformation);
		Session session = sessionFactory.getCurrentSession();
		//session.saveOrUpdate(feed);
		supplier.getFeeds().remove(feed);
		session.delete(feed);*/
        /**
         * 更新饲料，关联（supplier）
         */
		/*Session session = sessionFactory.getCurrentSession();
		Feed feed = (Feed) session.get(Feed.class, 499);
		Supplier supplier1 = (Supplier)session.get(Supplier.class, 26);
		Supplier supplier2 = (Supplier)session.get(Supplier.class, 52);
		supplier1.getFeeds().remove(feed);
		supplier2.getFeeds().add(feed);
		feed.setSupplier(supplier2);
		session.update(feed);*/
        /**
         * 更新配方
         */
/*		Session session = sessionFactory.getCurrentSession();
		Formula formula = (Formula)session.get(Formula.class, 12);
		Feed oleFeed = (Feed)session.get(Feed.class,145213);
		Feed newFeed = (Feed)session.get(Feed.class, 499);
		oleFeed.getFormulas().remove(formula);
		newFeed.getFormulas().add(formula);
		formula.setFeed(newFeed);
		session.saveOrUpdate(formula);*/
        /**
         * 更新feedInformation
         */
		/*Session session = sessionFactory.getCurrentSession();
		FeedInformation feedInformation = (FeedInformation)session.get(FeedInformation.class, 20);
		Feed oldFeed = (Feed)session.get(Feed.class, 499);
		Feed newFeed = (Feed)session.get(Feed.class, 145213);
		oldFeed.getFeedInformations().remove(feedInformation);
		newFeed.getFeedInformations().add(feedInformation);
		feedInformation.setFeed(newFeed);
		session.saveOrUpdate(feedInformation);*/
        /**
         * 只更新feedinformation
         */
		/*Session session = sessionFactory.getCurrentSession();
		FeedInformation feedInformation = (FeedInformation)session.get(FeedInformation.class, 20);
		feedInformation.setStock(700.0);
		session.update(feedInformation);*/
        /**
         * 测试supplierFeed
         */
        Session session = sessionFactory.getCurrentSession();
        SupplierFeed supplierFeed = new SupplierFeed();
        Feed feed = (Feed)session.get(Feed.class, 1);
        Supplier supplier = (Supplier)session.get(Supplier.class, 3);
        supplierFeed.setFeed(feed);
        supplierFeed.setSupplier(supplier);
        supplierFeed.setFeedIngredient("2");
        session.saveOrUpdate(supplierFeed);
    }

    @Override
    public void testAnimalFeedInformation() {
        // TODO Auto-generated method stub
        System.out.println("正在测试AnimalFeedInformation");
        Session session =sessionFactory.getCurrentSession();
        AnimalFeedInformation animalFeedInformation = new AnimalFeedInformation();
        Animal animal = (Animal)session.get(Animal.class, 2);
        Feed feed = (Feed)session.get(Feed.class, 2);
        animalFeedInformation.setFeedAmount(32.0);
        //animal.getAnimalFeedInformations().add(animalFeedInformation);
        animalFeedInformation.setFeed(feed);
        animalFeedInformation.setAnimal(animal);
        session.saveOrUpdate(animalFeedInformation);
    }

    @Override
    public void addFeedInformation(Feed feed , Integer stock,String changeOrSave) {
        // TODO Auto-generated method stub
        String hqlString = "select number from FeedInformation where feedId = ?";
        System.out.println("准备添加饲料详细信息");
        Session session = sessionFactory.getCurrentSession();
        Supplier supplier = (Supplier)session.get(Supplier.class, feed.getSupplier().getSupplierId());
        FeedInformation feedInformation = new FeedInformation();
        Query query = session.createQuery(hqlString);
        query.setInteger(0, feed.getFeedId());
        List<Integer> list =  query.list();
        if (list!=null && list.size()>0) {
            Integer num = list.get(0);
            feedInformation.setNumber(num);
        }
        feedInformation.setCategoryId(feed.getFeedCategory());
        feedInformation.setRemark(feed.getRemarks());
        feedInformation.setStock(stock.doubleValue());
        feedInformation.setSupplier(supplier.getSupplierName());

        feed.setSupplier(supplier);
        feed.getFeedInformations().add(feedInformation);
        System.out.println(feed.getRemarks().length());
        System.out.println("changeOrSave = " + changeOrSave.equals("change"));
        if (changeOrSave.equals("change")) {
            System.out.println("准备执行更改操作");
			/*String hqlString = "delete from FeedInformation where feedId = ?";
			Query query = session.createQuery(hqlString);
			System.out.println("成功创建hql");
			query.setInteger(0, feed.getFeedId());
			query.executeUpdate();*/
            session.update(feed);
        }
        else {
            System.out.println("准备执行新增操作");
            session.save(feed);
        }


    }

    @Override
    public Feed findById(Integer feedId) {
        // TODO Auto-generated method stub
		/*String hqString = "from Feed where feedId = "+feedId;
		Query query = sessionFactory.getCurrentSession().createQuery(hqString);
		List<Feed> list = query.list();
		System.out.println("list = " + list);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		else {System.out.println("不存在");
			return null;
		}*/
        return (Feed)sessionFactory.getCurrentSession().get(Feed.class,feedId);
    }

    @Override
    public Animal findAnimalById(Integer animalId) {
        // TODO Auto-generated method stub
        Session session = sessionFactory.getCurrentSession();
        return (Animal)session.get(Animal.class, animalId);
    }

    @Override
    public List<Supplier> findSupplier() {
        // TODO Auto-generated method stub
        String hqlString = "from Supplier";
        Query query = sessionFactory.getCurrentSession().createQuery(hqlString);
        return query.list();
    }

    @Override
    public void deleteOneFeed(Feed feed) {
        // TODO Auto-generated method stub
        Session session = sessionFactory.getCurrentSession();
        session.delete(feed);
    }

    @Override
    public void addFI(Feed feed, Integer stock) {

        // TODO Auto-generated method stub
        String hqlString = "select number from FeedInformation fi where fi.feed.feedId = ?";
        Session session =sessionFactory.getCurrentSession();

        Query query = session.createQuery(hqlString);
        query.setInteger(0, feed.getFeedId());
        FeedInformation feedInformation = new FeedInformation();
        List<Integer> list = query.list();
        session.clear();
        if (list != null && list.size() > 0) {
            Integer num = (Integer) query.list().get(0);
            feedInformation = (FeedInformation) session.get(FeedInformation.class, num);
        }else {
            Supplier supplier = new Supplier();
            supplier = (Supplier) session.get(Supplier.class,feed.getSupplier().getSupplierId());
            feedInformation.setSupplier(supplier.getSupplierName());
            feedInformation.setRemark(feed.getRemarks());
            System.out.println("ssss = " + feedInformation.getSupplier());
            feedInformation.setCategoryId(feed.getFeedCategory());
            feedInformation.setFeed(feed);
            feed.setSupplier(supplier);
        }
        feedInformation.setStock(stock.doubleValue());
        feed.getFeedInformations().add(feedInformation);

        ///session.clear();
        session.saveOrUpdate(feed);
    }

    @Override
    public Integer findCountHistoryFeed(String startDate, String endDate, Integer animalId,Integer feedId) {
		/*List<Long> list = new ArrayList<>();
		if ((startDate != null && startDate.length() > 0)
				&& (endDate != null && endDate.length() > 0)
				&& (animalId != null)) {
			String hql = "select count(*) from HistoryFeed h where h.id.animalId = ? and (h.id.feedUseTime between ? and ?)";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setInteger(0, animalId);
			query.setTimestamp(1, String2timeStamp.str2TimeStamp(startDate));
			query.setTimestamp(2, String2timeStamp.str2TimeStamp(endDate));
			 list = query.list();
		}
		else if ((startDate != null && startDate.length() > 0)
				&& (endDate != null && endDate.length() > 0)
				&& (animalId == null)) {
			String hql = "select count(*) from HistoryFeed h where h.id.feedUseTime between ? and ?";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setTimestamp(0, String2timeStamp.str2TimeStamp(startDate));
			query.setTimestamp(1, String2timeStamp.str2TimeStamp(endDate));
			list = query.list();
		}
		else if ((startDate == null || startDate.length() <= 0)
				&& (endDate != null || endDate.length() <= 0)
				&& (animalId != null)){
			String hql = "select count(*) from HistoryFeed h where h.id.animalId = ?";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setInteger(0,animalId);
			list = query.list();
		}
		else if ((startDate == null || startDate.length() <= 0)
				&& (endDate != null || endDate.length() <= 0)
				&& (animalId == null)){
			String hql = "select count(*) from HistoryFeed";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			list = query.list();
		}
		if (list != null && list.size() > 0){
			System.out.println("count = " + list.get(0).intValue());
			return list.get(0).intValue();
		}else {
		return null;
		}*/
        StringBuffer hql = new StringBuffer();
        hql.append("select count(*) from HistoryFeed h ");
        if ((startDate != null && startDate.length() > 0)
                ||(endDate != null && endDate.length() > 0)
                ||(animalId != null)
                ||(feedId != null)){
            hql.append("where ");
        }
        if ((startDate != null && startDate.length() > 0)
                &&(endDate != null && endDate.length() > 0)){
            hql.append("(h.id.feedUseTime between '" + String2timeStamp.str2TimeStamp(startDate) +"' and '" + String2timeStamp.str2TimeStamp(endDate) + "' ) ");
            if ((animalId != null)
                    ||(feedId != null)){
                hql.append("and ");
            }
        }
        if (animalId != null){
            hql.append("(h.id.animalId = " + animalId +") ");
            if (feedId != null){
                hql.append("and ");
            }
        }
        if (feedId != null){
            hql.append("(h.id.feedId = " + feedId + ") ");
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
    public List<HistoryFeed> finHistoryFeed(String startDate, String endDate, Integer animalId, int start ,Integer feedId) {
/*		List<HistoryFeed> list = new ArrayList<>();

		if ((startDate != null && startDate.length() > 0)
				&& (endDate != null && endDate.length() > 0)
				&& (animalId != null)
				) {
			String hql = "from HistoryFeed h where h.id.animalId = ? and (h.id.feedUseTime between ? and ?)";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setInteger(0, animalId);
			query.setTimestamp(1, String2timeStamp.str2TimeStamp(startDate));
			query.setTimestamp(2, String2timeStamp.str2TimeStamp(endDate));
			query.setFirstResult(start - 1);
			query.setMaxResults(Constant.PAGE_LIMIT);
			list = query.list();
		}
		else if ((startDate != null && startDate.length() > 0)
				&& (endDate != null && endDate.length() > 0)
				&& (animalId == null)){
			String hql = "from HistoryFeed h where h.id.feedUseTime between ? and ? order by h.id.animalId asc";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setTimestamp(0, String2timeStamp.str2TimeStamp(startDate));
			query.setTimestamp(1, String2timeStamp.str2TimeStamp(endDate));
			query.setFirstResult(start - 1);
			query.setMaxResults(Constant.PAGE_LIMIT);
			list = query.list();
		}
		else if ((startDate == null || startDate.length() <= 0)
				&& (endDate != null || endDate.length() <= 0)
				&& (animalId != null)
				){
			String hql = "from HistoryFeed h where h.id.animalId = ? order by h.id.animalId asc";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setInteger(0, animalId);
			query.setFirstResult(start - 1);
			query.setMaxResults(Constant.PAGE_LIMIT);
			list = query.list();
		}
		else if ((startDate == null || startDate.length() <= 0)
				&& (endDate != null || endDate.length() <= 0)
				&& (animalId == null)){
			String hql = "from HistoryFeed h order by h.id.animalId asc";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setFirstResult(start - 1);
			query.setMaxResults(Constant.PAGE_LIMIT);
			list = query.list();
		}
		if (list != null && list.size() > 0){
			return  list;
		}else {
			return null;
		}*/
        StringBuffer hql = new StringBuffer();
        hql.append("from HistoryFeed h ");
        if ((startDate != null && startDate.length() > 0)
                ||(endDate != null && endDate.length() > 0)
                ||(animalId != null)
                ||(feedId != null)){
            hql.append("where ");
        }
        if ((startDate != null && startDate.length() > 0)
                &&(endDate != null && endDate.length() > 0)){
            hql.append("(h.id.feedUseTime between '" + String2timeStamp.str2TimeStamp(startDate) +"' and '" + String2timeStamp.str2TimeStamp(endDate) + "' ) ");
            if ((animalId != null)
                    ||(feedId != null)){
                hql.append("and ");
            }
        }
        if (animalId != null){
            hql.append("(h.id.animalId = " + animalId +") ");
            if (feedId != null){
                hql.append("and ");
            }
        }
        if (feedId != null){
            hql.append("(h.id.feedId = " + feedId + ") ");
        }
        hql.append("order by h.id.feedUseTime asc");
        System.out.println("hql = " + hql);
        Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
        query.setFirstResult(start -1);
        query.setMaxResults(Constant.PAGE_LIMIT);
        List<HistoryFeed> list = query.list();
        if (list != null && list.size() > 0){
            return  list;
        }else {
            return null;
        }
    }

    @Override
    public void modifyFeed(Feed oldFeed, Supplier oldSupplier, Feed feed, Supplier supplier, Integer supplierId,Integer stock) {
        System.out.println("更改饲料");
        Session session = sessionFactory.getCurrentSession();
        Supplier theNewSupplier = (Supplier)session.get(Supplier.class,supplierId);

        //oldFeed.getFeedInformations().remove(oldFeed);
        //oldFeed.getFeedInformations().add(feed);
        oldFeed.getSupplier().getFeeds().remove(oldFeed);
        theNewSupplier.getFeeds().add(feed);
        oldFeed.setSupplier(theNewSupplier);
        oldFeed.setRemarks(feed.getRemarks());
        oldFeed.setFeedIntroduction(feed.getFeedIntroduction());
        oldFeed.setFeedCategory(feed.getFeedCategory());
/*		oldFeed = (Feed)session.get(Feed.class,oldFeed.getFeedId());
		Supplier theNewSupplier = (Supplier)session.get(Supplier.class,supplierId);
		FeedInformation oldFeedInformation = (FeedInformation)session.get(FeedInformation.class,feed.getFeedId());
		oldFeed = feed;
		oldFeed.setSupplier(theNewSupplier);
		oldFeed.getFeedInformations().remove(oldFeedInformation);
		oldFeed.getFeedInformations().add(feed.getFeedInformations());*/
        oldFeed.getFeedInformations().remove(oldFeed);

        System.out.println(" oldFeed的feedInformation空？" + oldFeed.getFeedInformations().isEmpty());
        FeedInformation newFeedInformation = new FeedInformation();

        newFeedInformation.setFeed(oldFeed);
        newFeedInformation.setCategoryId(feed.getFeedCategory());
        newFeedInformation.setRemark(oldFeed.getRemarks());
        newFeedInformation.setStock(stock.doubleValue());
        newFeedInformation.setSupplier(theNewSupplier.getSupplierName());
        oldFeed.getFeedInformations().add(newFeedInformation);
        session.update(oldFeed);
    }

    @Override
    public void deleteOneFeedInformation(Integer feedId) {
        FeedInformation feedInformation = new FeedInformation();
        Session session = sessionFactory.getCurrentSession();
        String hql = "from FeedInformation fi where fi.feed.feedId = ?";
        Query query = session.createQuery(hql);
        query.setInteger(0,feedId);
        List<FeedInformation> list = query.list();
        feedInformation = list.get(0);
        feedInformation.getFeed().getFeedInformations().remove(feedInformation);
        feedInformation.setFeed(null);
        session.save(feedInformation);
        session.delete(feedInformation);
    }

    @Override
    public void addFeedFormula(FeedFormula feedFormula) {
        Session session = sessionFactory.getCurrentSession();
        session.save(feedFormula);
    }

    @Override
    public int findCountFormula(Integer feedId, String formulaName, String formula) {
        StringBuffer basic = new StringBuffer();
        Session session = sessionFactory.getCurrentSession();
        basic.append("select count(*) from FeedFormula ff");
        if ((feedId != null) || (formulaName != null && formulaName.length() > 0 ) || (formula != null) && (formula.length() > 0)){
            basic.append(" where");
            if (feedId != null){
                basic.append(" ((ff.feedId like '%" + feedId + "') " +
                        "or (ff.feedId like '" +feedId + "%') " +
                        "or (ff.feedId like '%" + feedId +"%'))");
                if ((formulaName != null && formulaName.length() > 0 ) || (formula != null) && (formula.length() > 0)){
                    basic.append(" and");
                }
            }
            if (formulaName != null && formulaName.length() > 0){
                basic.append(" ((ff.formulaName like '%" + formulaName + "') " +
                        "or (ff.formulaName like '" +formulaName + "%') " +
                        "or (ff.formulaName like '%" + formulaName +"%'))");
                if ((formula != null) && (formula.length() > 0)){
                    basic.append(" and");
                }
            }
            if (formula != null && formula.length() > 0){
                basic.append(" ((ff.formula like '%" + formula + "') " +
                        "or (ff.formula like '" +formula + "%') " +
                        "or (ff.formula like '%" + formula +"%'))");
            }
            System.out.println("hql = " + basic.toString());
            Query query = session.createQuery(basic.toString());
            List<Long> list = query.list();
            if (list != null && list.size() > 0){
                System.out.println("本页数量为 :" + list.get(0));
                return  list.get(0).intValue();
            }else {
                System.out.println("本页数量为 :" + 0);
                return 0;
            }

        }else {
            Query query2 = session.createQuery(basic.toString());
            List<Long> list = query2.list();
            if (list != null && list.size() > 0){
                System.out.println("本页数量为 :" + list.get(0));
                return  list.get(0).intValue();
            }else {
                System.out.println("本页数量为 :" + 0);
                return 0;
            }

        }
    }

    @Override
    public List<FeedFormula> findFormulaByPage(Integer feedId, String formulaName, String formula, Integer page, int start) {
        StringBuffer basic = new StringBuffer();
        Session session = sessionFactory.getCurrentSession();
        basic.append("from FeedFormula ff");
        if ((feedId != null) || (formulaName != null && formulaName.length() > 0 ) || (formula != null) && (formula.length() > 0)){
            basic.append(" where");
            if (feedId != null){
                basic.append(" ((ff.feedId like '%" + feedId + "') " +
                        "or (ff.feedId like '" +feedId + "%') " +
                        "or (ff.feedId like '%" + feedId +"%'))");
                if ((formulaName != null && formulaName.length() > 0 ) || (formula != null) && (formula.length() > 0)){
                    basic.append(" and");
                }
            }
            if (formulaName != null && formulaName.length() > 0){
                basic.append(" ((ff.formulaName like '%" + formulaName + "') " +
                        "or (ff.formulaName like '" +formulaName + "%') " +
                        "or (ff.formulaName like '%" + formulaName +"%'))");
                if ((formula != null) && (formula.length() > 0)){
                    basic.append(" and");
                }
            }
            if (formula != null && formula.length() > 0){
                basic.append(" ((ff.formula like '%" + formula + "') " +
                        "or (ff.formula like '" +formula + "%') " +
                        "or (ff.formula like '%" + formula +"%'))");
            }
            System.out.println("hql = " + basic.toString());
            Query query = session.createQuery(basic.toString());
            query.setFirstResult(start - 1);
            query.setMaxResults(Constant.PAGE_LIMIT);
            List<FeedFormula> list = query.list();
            if (list != null && list.size() > 0){
                System.out.println("本页数量为 :" + list.get(0));
                return  list;
            }else {
                System.out.println("本页数量为 :" + 0);
                return null;
            }

        }else {
            Query query2 = session.createQuery(basic.toString());
            query2.setFirstResult(start - 1);
            query2.setMaxResults(Constant.PAGE_LIMIT);
            List<FeedFormula> list = query2.list();
            if (list != null && list.size() > 0){
                System.out.println("本页数量为 :" + list.get(0));
                return  list;
            }else {
                System.out.println("本页数量为 :" + 0);
                return null;
            }

        }
    }

    @Override
    public void deleteoneFormula(Integer feedId) {
        String hql = "delete from FeedFormula ff where ff.feedId = ?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger(0,feedId);
        query.executeUpdate();
    }

    @Override
    public FeedFormula findFormulaById(Integer feedId) {
        Session session = sessionFactory.getCurrentSession();
        FeedFormula feedFormula = (FeedFormula)session.get(FeedFormula.class,feedId);
        return feedFormula;
    }

    @Override
    public void modifyFormule(FeedFormula oldFeedFormula) {
        Session session = sessionFactory.getCurrentSession();
        session.update(oldFeedFormula);

    }

    @Override
    public List<FeedFormula> findAllFormula() {
        String hql = "from FeedFormula";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<FeedFormula> list = query.list();
        return list;
    }

    @Override
    public void saveHistoryFeed(HistoryFeed historyFeed) {
        Session session = sessionFactory.getCurrentSession();
        session.save(historyFeed);
    }

    @Override
    public List<Material> findMaterial() {
        String hql = "from Material";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<Material> list = query.list();
        return list;
    }

    @Override
    public List<Double> feedStockWaring() {
        String hql = "select f.stock from FeedInformation f";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<Double> list = query.list();
        return list;
    }

    @Override
    public List<Integer> findAllAnimal() {
        String hql = "select a.animalId from Animal a";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<Integer> list = query.list();

        return list;
    }

    @Override
    public HistoryFeed findHistoryFeedByAnimalId(Integer animalId) {
        String hql = "from HistoryFeed h where h.id.animalId = ? order by h.id.feedUseTime desc";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger(0,animalId);
        query.setFirstResult(0);
        query.setMaxResults(1);
        List<HistoryFeed> list = query.list();
        //System.out.println("结果数量：" + list.size());
        if (list != null && list.size() > 0){
            return list.get(0);
        }
        return null;
    }

    public List<HistoryFeed> finHistoryFeedByStringBuffer(String startDate, String endDate, Integer animalId, int start,Integer feedId) {
        StringBuffer hql = new StringBuffer();
        hql.append("from HistoryFeed h ");
        if ((startDate != null && startDate.length() > 0)
                ||(endDate != null && endDate.length() > 0)
                ||(animalId != null)
                ||(feedId != null)){
            hql.append("where ");
        }
        if ((startDate != null && startDate.length() > 0)
                &&(endDate != null && endDate.length() > 0)){
            hql.append("(h.id.feedUseTime between " + startDate +" and " +endDate + " ) ");
            if ((animalId != null)
                    ||(feedId != null)){
                hql.append("and ");
            }
        }
        if (animalId != null){
            hql.append(" h.id.animalId = " + animalId +" ");
            if (feedId != null){
                hql.append("and ");
            }
        }
        if (feedId != null){
            hql.append(" h.id.feedId = " + feedId + " ");
        }
        hql.append("order by h.id.feedUseTime asc");
        //System.out.println("hql = " + hql);
        Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
        List<HistoryFeed> list = query.list();
        query.setFirstResult(start -1);
        query.setMaxResults(Constant.PAGE_LIMIT);
        if (list != null && list.size() > 0){
            return  list;
        }else {
            return null;
        }
    }

}

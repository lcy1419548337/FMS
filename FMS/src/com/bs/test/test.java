package com.bs.test;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.bs.entity.Feed;
import com.bs.entity.FeedInformation;
import com.bs.entity.Formula;
import com.bs.entity.Supplier;
import com.opensymphony.xwork2.ActionSupport;

public class test extends ActionSupport{
	SessionFactory sessionFactory;
	
public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public String testHibernates(){
		Feed feed = new Feed();
		Supplier supplier = new Supplier();
		FeedInformation feedInformation = new FeedInformation();
		feedInformation.setSupplier("supplier");
		Formula formula = new Formula();
		formula.setContent(100.0);
		supplier.setSupplierName("supplier");
		supplier.setSupplierId(25);
		feed.setFeedName("feedName");
		feed.setFeedId(499);
		feed.setSupplier(supplier);
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(feed);
		return null;
	}
}

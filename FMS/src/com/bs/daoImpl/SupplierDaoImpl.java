package com.bs.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.bs.dao.SupplierDao;
import com.bs.entity.Supplier;

public class SupplierDaoImpl implements SupplierDao {
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addSupplier(Supplier supplier) {
		Session session = sessionFactory.getCurrentSession();
		session.save(supplier);
		
	}

	@Override
	public Integer findCount(Supplier supplier) {
		// TODO Auto-generated method stub
		StringBuffer hql = new StringBuffer();
		hql.append("select count (*) from Supplier s where ");
		if (supplier.getSupplierId() != null) {
			hql.append(" (s.supplierId like '%" + supplier.getSupplierId() + "%' or s.supplierId like '" + supplier.getSupplierId() + "%'"
					+ " or s.supplierId like '%" + supplier.getSupplierId() + "' or s.supplierId = '" + supplier.getSupplierId() + "') "
					);
			if (supplier.getSupplierName() != null && supplier.getSupplierName().length() > 0) {
				hql.append("and ");
			}
		}
		if (supplier.getSupplierName() != null && supplier.getSupplierName().length() > 0) {
			hql.append("s.supplierName like '%" + supplier.getSupplierName() + "%' or s.supplierName like '" + supplier.getSupplierName() + "%'"
					+ " or s.supplierName like '%" + supplier.getSupplierName() + "' or s.supplierName = '" + supplier.getSupplierName() + "') "
					);
		}
		System.out.println("hql = " + hql);
		Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
		List<Long> list = query.list();
		if (list != null && list.size() > 0) {
			System.out.println("查询到到供应商总数量为： " + list.get(0));
			return list.get(0).intValue();
		}else {
			return null;	
		}
		
	}

	@Override
	public List<Supplier> find(Supplier supplier, Integer start) {
		// TODO Auto-generated method stub
		StringBuffer hql = new StringBuffer();
		hql.append("from Supplier s where ");
		if (supplier.getSupplierId() != null) {
			hql.append(" (s.supplierId like '%" + supplier.getSupplierId() + "%' or s.supplierId like '" + supplier.getSupplierId() + "%'"
					+ " or s.supplierId like '%" + supplier.getSupplierId() + "' or s.supplierId = '" + supplier.getSupplierId() + "') "
					);
			if (supplier.getSupplierName() != null && supplier.getSupplierName().length() > 0) {
				hql.append("and ");
			}
		}
		if (supplier.getSupplierName() != null && supplier.getSupplierName().length() > 0) {
			hql.append("s.supplierName like '%" + supplier.getSupplierName() + "%' or s.supplierName like '" + supplier.getSupplierName() + "%'"
					+ " or s.supplierName like '%" + supplier.getSupplierName() + "' or s.supplierName = '" + supplier.getSupplierName() + "') "
					);
		}
		System.out.println("hql = " + hql);
		Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
		query.setFirstResult(start - 1);
		query.setMaxResults(com.bs.constant.Constant.PAGE_LIMIT);
		List<Supplier> list = query.list();
		if (list != null && list.size() > 0) {
			System.out.println("查询到的供应商数量为： " + list.size());
			return list;
		}else {
			return null;			
		}

	}

	@Override
	public Integer findAllCount() {
		// TODO Auto-generated method stub
		String hql = "select count(*) from Supplier";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<Long> list = query.list();
		if (list != null && list.size() > 0) {
			System.out.println("查询到的供应商总数");
			return list.get(0).intValue();
		}else {
			return null;			
		}

	}

	@Override
	public List<Supplier> findAll(Integer start) {
		// TODO Auto-generated method stub
		String hql = "from Supplier";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(start);
		query.setMaxResults(com.bs.constant.Constant.PAGE_LIMIT);
		List<Supplier> list = query.list();
		if (list != null && list.size() > 0) {
			System.out.println("本页供应商数量: " + list.size());
			return list;
		}else {
			return null;			
		}

	}

	@Override
	public List<Supplier> findSupplierForFeedAntion() {
		// TODO Auto-generated method stub
		String hqlString = "from Supplier";
		Query query = sessionFactory.getCurrentSession().createQuery(hqlString);
		return query.list();
	}

	@Override
	public void modifySupplierById(Supplier supplier) {
		Session session = sessionFactory.getCurrentSession();
		session.update(supplier);
	}

	@Override
	public Supplier findSupplierById(Integer id) {
		return (Supplier)sessionFactory.getCurrentSession().get(Supplier.class,id);
	}

	@Override
	public void deleteSupplier(Supplier supplier) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(supplier);
	}
}

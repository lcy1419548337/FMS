package com.bs.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.hql.internal.ast.HqlASTFactory;

import com.bs.dao.AdminDao;
import com.bs.entity.Admin;

public class AdminDaoImpl implements AdminDao {
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Integer findCountAdmin(Admin admin) {
		// TODO Auto-generated method stub
		StringBuffer basic = new StringBuffer();
		
		basic.append("select count(*) from Admin a");
		if (admin != null) {
			String adminname = admin.getAdminname();
			String email = admin.getEmail();
			String phone = admin.getPhone();
			if ((adminname!= null && adminname.length()>0) || (email!= null && email.length()>0) || (phone!= null && phone.length()>0)) {
				basic.append(" where");
			}
			if (adminname!= null && adminname.length()>0) {
				basic.append(" (a.adminname like '%" + adminname + "%' or a.adminname like '" + adminname + "%'"
						+ " or a.adminname like '%" + adminname + "' or a.adminname = '" + adminname + "')");
				System.out.println("email != null && email.length() > 0");
				if (email != null && email.length() > 0) {
					basic.append(" and");
				}
			}
			if (email!= null && email.length()>0) {
				basic.append(" (a.email like '%" + email + "%' or a.email like '" + email + "%'"
						+ " or a.email like '%" + email + "' or a.email = '" + email + "')");
				if (phone != null && phone.length() > 0) {
					basic.append(" and");
				}
			}
			if (phone!= null && phone.length()>0) {
				basic.append(" (a.phone like '%" + phone + "%' or a.phone like '" + phone + "%'"
						+ " or a.phone like '%" + phone + "' or a.phone = '" + phone + "')");
			}
			System.out.println("hql = " + basic.toString());
			Query query = sessionFactory.getCurrentSession().createQuery(basic.toString());
			List<Long> list = query.list();
			System.out.println("count = " + list.get(0));
			if (list != null && list.size() > 0) {
				return list.get(0).intValue();
			}else {
				return null;
			}
		}else{
		return null;
		}
		
	}

	@Override
	public List<Admin> findAdmin(Admin admin, int start) {
		// TODO Auto-generated method stub
StringBuffer basic = new StringBuffer();
		
		basic.append(" from Admin a");
		if (admin != null) {
			
			String adminname = admin.getAdminname();
			String email = admin.getEmail();
			String phone = admin.getPhone();
			if ((adminname!= null && adminname.length()>0) || (email!= null && email.length()>0) || (phone!= null && phone.length()>0)) {
				basic.append(" where");
			}
			if (adminname!= null && adminname.length()>0) {
				basic.append(" (a.adminname like '%" + adminname + "%' or a.adminname like '" + adminname + "%'"
						+ " or a.adminname like '%" + adminname + "' or a.adminname = '" + adminname + "')");
				if (email != null && email.length() > 0) {
					basic.append(" and");
				}
			}
			if (email!= null && email.length()>0) {
				basic.append(" (a.email like '%" + email + "%' or a.email like '" + email + "%'"
						+ " or a.email like '%" + email + "' or a.email = '" + email + "')");
				if (phone != null && phone.length() > 0) {
					basic.append(" and");
				}
			}
			if (phone!= null && phone.length()>0) {
				basic.append(" (a.phone like '%" + phone + "%' or a.phone like '" + phone + "%'"
						+ " or a.phone like '%" + phone + "' or a.phone = '" + phone + "')");
			}
			System.out.println("hql = " + basic.toString());
			Query query = sessionFactory.getCurrentSession().createQuery(basic.toString());
			query.setFirstResult(start - 1);
			query.setMaxResults(com.bs.constant.Constant.PAGE_LIMIT);
			List<Admin> list = query.list();
			System.out.println("count = " + list.size());
			if (list != null && list.size() > 0) {
				return list;
			}else {
				return null;
			}
		}else{
		return null;
		}
	}

	@Override
	public void addUser(Admin admin) {
		Session session = sessionFactory.getCurrentSession();
		session.save(admin);
	}

}

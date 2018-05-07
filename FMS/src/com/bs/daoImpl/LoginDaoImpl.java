package com.bs.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.bs.dao.LoginDao;
import com.bs.entity.Admin;
import com.bs.entity.User;
public class LoginDaoImpl implements LoginDao {
	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Admin findByUsername(String adminName) {
		Session session = sessionFactory.getCurrentSession();
		Admin admin = (Admin)session.get(Admin.class, adminName);
		if (admin != null) {
			return admin;
		}else {
			return null;
		}
		
		// TODO Auto-generated method stub
		/*System.out.println("LoginDaoImpl类的findByUsername方法 正在工作中");
		String hql = "from User where username = ?";
		System.out.println("hql创建完毕");
		Query query = sessionFactory.getCurrentSession().createQuery(hql).setString(0, username);
		System.out.println("query创建完毕");
		List<User> result = query.list();
		
		if (result.size() > 0 && result != null) {
			System.out.println("查询到结果："+result.get(0));
			return (User) result.get(0);
		}else {
			System.out.println("没有结果");
		return null;
		}*/
	}

	@Override
	public void regist(Admin admin) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(admin);
	}

	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Admin rs = (Admin)session.get(Admin.class, admin.getAdminname());
		return rs;

		
	}

	@Override
	public void addUserInformation(Admin oldAdmin) {
		Session session = sessionFactory.getCurrentSession();
		session.update(oldAdmin);
	}

	@Override
	public String findOldPassword(String adminName) {
		Session session = sessionFactory.getCurrentSession();
		Admin admin = (Admin) session.get(Admin.class,adminName);
		return admin.getPassword();
	}


}

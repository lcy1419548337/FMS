package com.bs.serviceImpl;

import com.bs.constant.Constant;
import com.bs.dao.LoginDao;
import com.bs.entity.Admin;
import com.bs.entity.User;
import com.bs.service.LoginService;

public class LoginServiceImpl implements LoginService {
	private LoginDao loginDao;

	public LoginDao getLoginDao() {
		return loginDao;
	}


	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}


	public User UserLogin(String username) {
		// TODO Auto-generated method stub
		
		return null;
	}


	@Override
	public Admin findById(String adminname) {
		// TODO Auto-generated method stub
		
		return loginDao.findByUsername(adminname);
	}


	@Override
	public void regist(Admin admin) {
		// TODO Auto-generated method stub
		loginDao.regist(admin);
	}


	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		Admin rs = loginDao.login(admin);
		System.out.println(rs.getPassword()+"equals"+admin.getPassword()+"="+rs.getPassword().equals(admin.getPassword()));
		if (rs.getPassword().equals(admin.getPassword())) {
			return rs;
		}else {
			return null;
		}
		
	}

	@Override
	public void addUserInformation(Admin admin) {
		Admin oldAdmin = loginDao.findByUsername(admin.getAdminname());
		oldAdmin.setPassword(admin.getPassword());
		oldAdmin.setEmail(admin.getEmail());
		oldAdmin.setPhone(admin.getPhone());
		oldAdmin.setConfirm(Constant.CONFIRM_YES);
		loginDao.addUserInformation(oldAdmin);
	}

	@Override
	public String findOldPassword(String adminName) {

		return loginDao.findOldPassword(adminName);
	}

}

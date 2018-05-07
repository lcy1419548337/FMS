package com.bs.serviceImpl;

import java.util.List;

import com.bs.constant.Constant;
import com.bs.dao.AdminDao;
import com.bs.entity.Admin;
import com.bs.entity.PageBean;
import com.bs.service.AdminService;

public class AdminServiceImpl implements AdminService {
private AdminDao adminDao;

public AdminDao getAdminDao() {
	return adminDao;
}

public void setAdminDao(AdminDao adminDao) {
	this.adminDao = adminDao;
}

@Override
public PageBean<Admin> findAdmin(Admin admin , Integer page) {
	// TODO Auto-generated method stub
	PageBean<Admin> pageBean = new PageBean<Admin>();
	pageBean.setLimit(com.bs.constant.Constant.PAGE_LIMIT);
	pageBean.setPage(page);
	Integer totalCount = adminDao.findCountAdmin(admin);
	if (totalCount == 0) {
		return null;
	}
	pageBean.setTotalCount(totalCount);
	int totalPage = (int)Math.ceil((double)totalCount/(double)Constant.PAGE_LIMIT);
	pageBean.setTotalPage(totalPage);
	int start = (page - 1)*10 +1;
	List<Admin> list = adminDao.findAdmin(admin,start);
	pageBean.setList(list);
	return pageBean;
}

	@Override
	public void addUser(Admin admin, String theLevel) {
		admin.setPassword(Constant.DEFAULT_PASSWORD);
		if (theLevel.equalsIgnoreCase("超级管理员")){
			admin.setLevel(Constant.ROOT_LEVLE);
		}else if (theLevel.equalsIgnoreCase("普通管理员")){
			admin.setLevel(Constant.USER_LEVEL);
		}else if (theLevel.equalsIgnoreCase("访客")){
			admin.setLevel(Constant.VISITOR_LEVEL);
		}
		admin.setConfirm(Constant.CONFIRM_NO);
		adminDao.addUser(admin);
	}

}

package com.bs.action;

import com.bs.constant.Constant;
import com.bs.entity.Admin;
import com.bs.entity.PageBean;
import com.bs.service.AdminService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import java.util.ArrayList;
import java.util.List;

public class AdminAction extends ActionSupport implements ModelDriven<Admin> {
	private AdminService adminService;
	Admin admin = new Admin();
	private Integer page;
	private String theLevel;
	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public String getTheLevel() {
		return theLevel;
	}

	public void setTheLevel(String theLevel) {
		this.theLevel = theLevel;
	}

	public Admin getModel() {
		// TODO Auto-generated method stub
		return admin;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	public String toFindAdmin() throws Exception {
		// TODO Auto-generated method stub
		return "toFindAdmin";
	}
	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String findAllAdmin() throws Exception {
		// TODO Auto-generated method stub
		if (page == null) {
			page = 1;
		}
		System.out.println("page=" + page + "username=" + admin.getAdminname() + "email" + admin.getEmail() + "phone" + admin.getPhone());
		PageBean<Admin> pageBean = adminService.findAdmin(admin,page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		ActionContext.getContext().getValueStack().set("admin", admin);
		ActionContext.getContext().getValueStack().set("page", page);
		return "toFindAdmin";
	}

	public String toAddUser() throws Exception {
		List<String> list = new ArrayList<>();
		list.add(0,"超级管理员");
		list.add(0,"普通管理员");
		list.add(0,"访客");
		ActionContext.getContext().getValueStack().set("level",list);
		return "toAddUser";
	}

	public String addUser() throws Exception {
		System.out.println("adminName = " + admin.getAdminname() + ";theLevel = " + theLevel);
		try {
			adminService.addUser(admin,theLevel);
			this.clearMessages();
			this.addActionMessage("添加成功");

		} catch (Exception e) {
			e.printStackTrace();
			this.clearMessages();
			this.addActionMessage("添加失败");
		}
		List<String> list = new ArrayList<>();
		list.add(0,"超级管理员");
		list.add(0,"普通管理员");
		list.add(0,"访客");
		ActionContext.getContext().getValueStack().set("level",list);

		return "toAddUser";
	}
}

package com.bs.dao;

import com.bs.entity.Admin;
import com.bs.entity.User;

public interface LoginDao {
	public Admin findByUsername(String adminName);

	public void regist(Admin admin);

	public Admin login(Admin admin);

    void addUserInformation(Admin oldAdmin);

    public String findOldPassword(String adminName);
}

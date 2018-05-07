package com.bs.service;

import com.bs.entity.Admin;
import com.bs.entity.User;

public interface LoginService {
	public User UserLogin(String username);

	public Admin findById(String adminname);

	public void regist(Admin admin);

	public Admin login(Admin admin);

    void addUserInformation(Admin admin);
    public  String findOldPassword(String adminName);
}

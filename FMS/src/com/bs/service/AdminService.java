package com.bs.service;

import com.bs.entity.Admin;
import com.bs.entity.PageBean;

public interface AdminService {

	PageBean<Admin> findAdmin(Admin admin , Integer page);

    void addUser(Admin admin, String theLevel);
}

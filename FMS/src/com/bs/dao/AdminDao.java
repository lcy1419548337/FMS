package com.bs.dao;

import java.util.List;

import com.bs.entity.Admin;

public interface AdminDao {

	Integer findCountAdmin(Admin admin);

	List<Admin> findAdmin(Admin admin, int start);

    void addUser(Admin admin);
}

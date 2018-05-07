package com.bs.action;

import org.apache.struts2.ServletActionContext;

import com.bs.entity.Animal;
import com.opensymphony.xwork2.ActionSupport;

import javassist.expr.NewArray;

public class test extends ActionSupport{
	Animal animal = new Animal();
public String hello() throws Exception {
	// TODO Auto-generated method stub
	animal.setAnimalId(111);
	System.out.println("animal.animalId="+animal.getAnimalId());
	//ServletActionContext.getRequest().getSession().setAttribute("animal", animal);
	System.out.println("hello!");
	return "hello";
}
}

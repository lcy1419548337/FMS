package com.bs.service;

import java.sql.Timestamp;
import java.util.List;

import com.bs.entity.Animal;
import com.bs.entity.AnimalCategory;
import com.bs.entity.AnimalInformation;
import com.bs.entity.PageBean;
import com.bs.help.AnimalFindHelp;
import com.bs.help.AnimalHelp;

public interface AnimalService {

	public void addAnimal(Animal animal,Integer category);

	public PageBean<Animal> findByPage(PageBean<Animal> pageBean);

	public PageBean<AnimalCategory> findCategoryByPage(Integer page);

	public Animal findById(Integer animalId);

	public void addAnimalInformation(AnimalInformation animalInformation,Integer category);

	public List<AnimalCategory> findCategory();

	public PageBean<AnimalHelp> findAnimal(Integer page, AnimalFindHelp animalFindHelp);

	public void deleteOne(Integer animalId);

    List<Long> makeWeightChar(Integer animalId, Timestamp startTime, Timestamp endTime);

	List<Long> makeYieldChar(Integer animalId, Timestamp startTime, Timestamp endTime);

    List<Timestamp> findDate(String startDate, String endDate,Integer animalId);

    AnimalInformation findAnimalInformation(Integer animalId);
}

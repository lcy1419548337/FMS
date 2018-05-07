package com.bs.dao;

import java.sql.Timestamp;
import java.util.List;

import com.bs.entity.Animal;
import com.bs.entity.AnimalCategory;
import com.bs.entity.AnimalInformation;
import com.bs.help.AnimalFindHelp;

public interface AnimalDao {

	public void addAnimal(Animal animal,Integer category);

	public List<Animal> findByPage(int start, int end);

	public int findCount();

	public int findCountCategory();

	public List<AnimalCategory> finCategoryByPage(int start);

	public Animal findById(Integer animalId);

	public void addAnimalInformation(AnimalInformation animalInformation,AnimalCategory animalCategory);

	public List<AnimalCategory> findCategory();

	public int findCountByInformation(AnimalFindHelp animalFindHelp);

	public List findAllFeedByPage(int start, AnimalFindHelp animalFindHelp);

	public void deleteOne(Integer animalId);

    List<Long> makeWeightChar(Integer animalId, Timestamp startTime, Timestamp endTime);

	List<Long> makeYieldChar(Integer animalId, Timestamp startTime, Timestamp endTime);

    List<Timestamp> findDate(Timestamp timestamp, Timestamp timestamp1,Integer animalId);

    void deleteAnimalInformationByAnimalId(Integer animalId);

	void deleteAnimalFeedInformationByAnimalId(Integer animalId);

	void deleteGroupByAnimalId(Integer animalId);

	AnimalCategory findCategoryById(Integer category);

    AnimalInformation findAnimalInformation(Integer animlaId);
}

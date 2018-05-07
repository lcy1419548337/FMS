package com.bs.serviceImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.bs.constant.Constant;
import com.bs.dao.AnimalDao;
import com.bs.entity.Animal;
import com.bs.entity.AnimalCategory;
import com.bs.entity.AnimalInformation;
import com.bs.entity.PageBean;
import com.bs.help.AnimalFindHelp;
import com.bs.help.AnimalHelp;
import com.bs.help.String2timeStamp;
import com.bs.service.AnimalService;

public class AnimalServiceImpl implements AnimalService {
	AnimalDao animaldao;
	

	public AnimalDao getAnimaldao() {
		return animaldao;
	}


	public void setAnimaldao(AnimalDao animaldao) {
		this.animaldao = animaldao;
	}


	@Override
	public void addAnimal(Animal animal,Integer catogory) {
		// TODO Auto-generated method stub
		animaldao.addAnimal(animal,catogory);
	}


	@Override
	public PageBean<Animal> findByPage(PageBean<Animal> pageBean) {
		// TODO Auto-generated method stub
		pageBean.getTotalCount();
		pageBean.getTotalPage();
		int totalCount = 0;
		int totalPage = 0;
		totalCount = animaldao.findCount();
		pageBean.setTotalCount(totalCount);
		System.out.println("totalCount = " + totalCount);
		totalPage = (int) Math.ceil((double)totalCount/(double)pageBean.getLimit());
		System.out.println("totalPage = " + totalPage);
		pageBean.setTotalPage(totalPage);
		int start = pageBean.getLimit()*(pageBean.getPage() - 1) + 1;
		int end = pageBean.getPage() * pageBean.getLimit();
		System.out.println("start / end = " + start + "/" + end);
		List<Animal> list = animaldao.findByPage(start , end);
		pageBean.setList(list);
		return pageBean;
	}


	@Override
	public PageBean<AnimalCategory> findCategoryByPage(Integer page) {
		// TODO Auto-generated method stub
		PageBean<AnimalCategory> pageBean = new PageBean<AnimalCategory>();
		pageBean.setPage(page);
		pageBean.setLimit(com.bs.constant.Constant.PAGE_LIMIT);
		int totalCount = animaldao.findCountCategory();
		System.out.println("totalCount = " + totalCount);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int)Math.ceil((double)totalCount/(double)Constant.PAGE_LIMIT);
		System.out.println("totalPage = " + totalPage);
		pageBean.setTotalPage(totalPage);
		int start = pageBean.getLimit()*(pageBean.getPage() - 1) + 1;
		System.out.println("start = " + start);
		List<AnimalCategory> list = animaldao.finCategoryByPage(start);
		pageBean.setList(list);
		return pageBean;
	}


	@Override
	public Animal findById(Integer animalId) {
		// TODO Auto-generated method stub
		return animaldao.findById(animalId);
	}


	@Override
	public void addAnimalInformation(AnimalInformation animalInformation,Integer category) {
		// TODO Auto-generated method stub
		AnimalCategory animalCategory = animaldao.findCategoryById(category);
		animaldao.addAnimalInformation(animalInformation,animalCategory);
	}


	@Override
	public List<AnimalCategory> findCategory() {
		// TODO Auto-generated method stub
		List<AnimalCategory> list = animaldao.findCategory();
		return list;
	}


	@Override
	public PageBean<AnimalHelp> findAnimal(Integer page, AnimalFindHelp AnimalFindHelp) {
		// TODO Auto-generated method stub
		PageBean<AnimalHelp> pageBean = new PageBean<AnimalHelp>();
		
		System.out.println("pageBean : " + pageBean + ";" + page);
		pageBean.setPage(page);
		pageBean.setLimit(com.bs.constant.Constant.PAGE_LIMIT);
		//int totalCount = animalDao.findCountFeed();
		int totalCount = 0;
		totalCount = animaldao.findCountByInformation(AnimalFindHelp);
		System.out.println("totalCount = " + totalCount);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int)Math.ceil((double)totalCount/(double)Constant.PAGE_LIMIT);
		System.out.println("totalPage = " + totalPage);
		pageBean.setTotalPage(totalPage);
		int start = pageBean.getLimit()*(pageBean.getPage() - 1) + 1;
		System.out.println("start = " + start);
		List<?> primarylist = animaldao.findAllFeedByPage(start,AnimalFindHelp);
		System.out.println("primarylist == null : " + primarylist == null);
		if (primarylist != null && primarylist.size() > 0) {
			System.out.println("查到的list的长度" + primarylist.size());
			System.out.println(primarylist.get(0));
			Animal findAnimal = new Animal();
			AnimalInformation findAnimalInformation = new AnimalInformation();
			
			List<AnimalHelp> animalFindHelps = new ArrayList<AnimalHelp>();
			System.out.println("animalFindHelps 长度 =" + animalFindHelps.size());
			for (int i = 0; i < primarylist.size(); i++) {
				AnimalHelp animalHelp = new AnimalHelp();
				AnimalFindHelp feedlisAnimalFindHelp = new AnimalFindHelp();
				System.out.println("i = " + i);
				Object[] object = (Object[]) primarylist.get(i);
				System.out.println("获取到object，长度为：" + object.length);
				findAnimal = (Animal) object[0];
				System.out.println("成功获取到findAnimal对象：" + findAnimal.getAnimalId() );
				findAnimalInformation = (AnimalInformation) object[1];
				System.out.println("成功获取到findAnimalInformation对象：" + findAnimalInformation.getAnimal().getAnimalId());
				animalHelp.setAnimal(findAnimal);
				System.out.println("animalHelp中成功添加了findAnimal对象：" + animalHelp.getAnimal().getAnimalId());
				animalHelp.setAnimalInformation(findAnimalInformation);
				System.out.println("animalHelp中成功添加了findAnimalInformation对象：" + animalHelp.getAnimalInformation().getNumber());
				animalFindHelps.add(animalHelp);
				System.out.println("animalFindHelps成功添加了feedlistAnimalFindHelp对象："+animalFindHelps.size());
				System.out.println("animalFindHelps:"
						+ animalFindHelps.get(i)
						);
			}
			pageBean.setList(animalFindHelps);
			return pageBean;
		}
else {
	return null;
}
}


	@Override
	public void deleteOne(Integer animalId) {
		// TODO Auto-generated method stub
		animaldao.deleteAnimalInformationByAnimalId(animalId);
		animaldao.deleteAnimalFeedInformationByAnimalId(animalId);
		animaldao.deleteGroupByAnimalId(animalId);
		animaldao.deleteOne(animalId);
	}

	@Override
	public List<Long> makeWeightChar(Integer animalId, Timestamp startTime, Timestamp endTime) {
		List<Long> list = animaldao.makeWeightChar(animalId,startTime,endTime);

		return list;
	}

	@Override
	public List<Long> makeYieldChar(Integer animalId, Timestamp startTime, Timestamp endTime) {
		List<Long> list = animaldao.makeYieldChar(animalId,startTime,endTime);
		return list;
	}

    @Override
    public List<Timestamp> findDate(String startDate, String endDate,Integer animalId) {
	    List<Timestamp> list = animaldao.findDate(String2timeStamp.str2TimeStamp(startDate),String2timeStamp.str2TimeStamp(endDate),animalId);
		System.out.println("时间轴如下");
		for (Timestamp t:list
			 ) {
			System.out.println(t);
		}
        return list;
    }

	@Override
	public AnimalInformation findAnimalInformation(Integer animlaId) {
		return animaldao.findAnimalInformation(animlaId);
	}

}

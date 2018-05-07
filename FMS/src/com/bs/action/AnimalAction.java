package com.bs.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.bs.entity.*;
import com.bs.help.*;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import com.bs.service.AnimalService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import javassist.expr.NewArray;

public class AnimalAction extends ActionSupport implements ModelDriven<Animal>{
	AnimalService animalService;
	private Animal animal = new Animal();
	private String registerDate;
	private PageBean<Animal> pageBean = new PageBean<Animal>();
	private float currentYield;
	private float currentWeight;
	private Integer health;
	private String recorderTime;
	private Integer page;
	private String animalHadOrNot;
	private String toChange;
	private String addFeed;
	private String startDate;
	private String endDate;
	private Integer chart;
	private Integer category;
	private String sex;

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getHealth() {
		return health;
	}

	public void setHealth(Integer health) {
		this.health = health;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Integer getChart() {
		return chart;
	}

	public void setChart(Integer chart) {
		this.chart = chart;
	}
	public String getAddFeed() {
		return addFeed;
	}



	public void setAddFeed(String addFeed) {
		this.addFeed = addFeed;
	}



	/**
	 * 			<label for=""animalId"">动物编号</label>
				<input type="text" name="animalId">
			<label for="animalName">动物名称</label>
				<input type="text" name="animalName">
				<label for="animalBatch">动物批次</label>
				<input type="text" name="animalBatch">
				<div>
				<label for="health">动物健康状况</label>
				<input type="text" name="health">
	 * @return
	 */
	
	
	public float getCurrentYield() {
		return currentYield;
	}



	public String getToChange() {
		return toChange;
	}



	public void setToChange(String toChange) {
		this.toChange = toChange;
	}

	public String getRecorderTime() {
		return recorderTime;
	}

	public void setRecorderTime(String recorderTime) {
		this.recorderTime = recorderTime;
	}

	public String getAnimalHadOrNot() {
		return animalHadOrNot;
	}



	public void setAnimalHadOrNot(String animalHadOrNot) {
		this.animalHadOrNot = animalHadOrNot;
	}



	public void setCurrentYield(float currentYield) {
		this.currentYield = currentYield;
	}



	public float getCurrentWeight() {
		return currentWeight;
	}



	public void setCurrentWeight(float currentWeight) {
		this.currentWeight = currentWeight;
	}








	public Integer getPage() {
		return page;
	}



	public void setPage(Integer page) {
		this.page = page;
	}



	public PageBean<Animal> getPageBean() {
		return pageBean;
	}



	public void setPageBean(PageBean<Animal> pageBean) {
		this.pageBean = pageBean;
	}



	public AnimalService getAnimalService() {
		return animalService;
	}



	public void setAnimalService(AnimalService animalService) {
		this.animalService = animalService;
	}



	public Animal getAnimal() {
		return animal;
	}


	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public void setAnimal(Animal animal) {
		this.animal = animal;
	}


	@Override
	public Animal getModel() {
		// TODO Auto-generated method stub
		return animal;
	}
	
	
	public String toAddAnimal() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("-----准备转到addAnimal界面-----");
		return "toAddAnimal";
	}
	/**
	 * 添加动物的action
	 */
	public String addAnimal() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("addAnimal()正在工作中");
		System.out.println("registerDate:" + registerDate);
		animal.setAnimalRegisterDate(String2timeStamp.str2TimeStamp(registerDate));
		System.out.println(animal.getAnimalId() + animal.getAnimalName() + animal.getAnimalRegisterDate() + animal.getAnimalBatch());
		//启动service，存储animal
		System.out.println("category = " + category);
		try {
			animalService.addAnimal(animal,category);
		} catch (Exception e) {
			e.printStackTrace();
		}


		return "addAnimalSuccessed";
	}
	/**
	 * 分页查询动物信息
	 * @return
	 * @throws Exception
	 */
	public String findByPage() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("准备查询所有动物信息");
		
		System.out.println("integer page = " + page);
		pageBean.setPage(page);
		pageBean.setLimit(com.bs.constant.Constant.PAGE_LIMIT);
		System.out.println("page = " + pageBean.getPage());
		System.out.println("pageLimit = " + pageBean.getLimit());
		try {
			pageBean = animalService.findByPage(pageBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		System.out.println("检测pagebean中list的大小：" + pageBean.getList().size());
		return "findByPage";
	}
	/**
	 * 分页查询动物分类
	 */
	public String findCategoryByPage() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("准备分页查询动物分类，页数为：" + page);
		PageBean<AnimalCategory> pageBean = null;
		try {
			pageBean = animalService.findCategoryByPage(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findCategoryByPage";
	}
	/**
	 * 跳转到toAddAnimalInformation.jsp
	 * @return
	 * @throws Exception
	 */
	public String toAddAnimalInformation() throws Exception {
		// TODO Auto-generated method stub
		return "toAddAnimalInformation";
	}
	/**
	 * 异步校验animal是否存在
	 * 
	 */
	public String findById() throws Exception {
		// TODO Auto-generated method stub
		//调用service
		Animal findaAnimal = null;
		try {
			findaAnimal = animalService.findById(animal.getAnimalId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		//获得response对象
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
	
		if (findaAnimal != null) {
			response.getWriter().println("动物存在:<br/>编号="+findaAnimal.getAnimalId()+"<br/>名称="+findaAnimal.getAnimalName()+"<br/>批次="+findaAnimal.getAnimalBatch()+"<br/>注册日期="+findaAnimal.getAnimalRegisterDate());
			/*ActionContext.getContext().getValueStack().set("result", animal);*/
		}
		else {
			response.getWriter().print("动物不存在");
		}
		return NONE;
	}
	
	public String addAnimalInformation() throws Exception {
		// TODO Auto-generated method stub
		/**
		 * 	
	private float currentYield;
	private float currentWeight;
	private Integer health;
	private String recorderTime;
		 */
		System.out.println(currentYield + ";" + currentWeight + ";" + health + ";" + recorderTime + ";" + animalHadOrNot + ";分类=" + category + ";性别" + sex + ";注册日期:" + registerDate);
		AnimalInformation animalInformation = new AnimalInformation();
		try {
			if (animalHadOrNot.equals("yes")) {
				System.out.println("animalHadOrNot = yes");
				animal = animalService.findById(animal.getAnimalId());
				System.out.println(animal.getAnimalId() + animal.getAnimalName() + animal.getAnimalBatch() + animal.getAnimalRegisterDate());
				animalInformation.setCurrentYield(currentYield);
				animalInformation.setCurrentWeight(currentWeight);
				animalInformation.setAnimal(animal);
				animalInformation.setHealth(health);
				animalInformation.setSex(sex);
				animalInformation.setRecorderTime(String2timeStamp.str2TimeStamp(recorderTime));
				System.out.println("animal.getAnimalId():" + animal.getAnimalId());
				animalService.addAnimalInformation(animalInformation,animal.getAnimalCategory().getCategoryId());
			}else {
				System.out.println("no");
				System.out.println(animal.getAnimalId() + animal.getAnimalName() + animal.getAnimalBatch() +sex);
				animal.setAnimalRegisterDate(String2timeStamp.str2TimeStamp(registerDate));
				animalInformation.setCurrentYield(currentYield);
				animalInformation.setCurrentWeight(currentWeight);
				animalInformation.setAnimal(animal);
				animalInformation.setHealth(health);
				animalInformation.setSex(sex);
				animalInformation.setRecorderTime(String2timeStamp.str2TimeStamp(recorderTime));
				animalService.addAnimalInformation(animalInformation,category);
			}
			/*System.out.println(animal.getAnimalId() + animal.getAnimalName() + animal.getAnimalBatch());
			animalInformation.setCurrentYield(currentYield);
			animalInformation.setCurrentWeight(currentWeight);
			animalInformation.setAnimal(animal);
			animalInformation.setHealth(health);
			animalInformation.setRecorderTime(String2timeStamp.str2TimeStamp(recorderTime));*/

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	/**
	 * 查询动物信息
	 */
	
	public String toFindAnimal() throws Exception {
		// TODO Auto-generated method stub
		List<AnimalCategory> list = null;
		try {
			list = animalService.findCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionContext.getContext().getValueStack().set("animalCategory", list);
		return "toFindAnimal";
	}
	
	/**
	 * 条件查询动物信息
	 * 
	 */
	
	public String findAnimalInformation() throws Exception {
		// TODO Auto-generated method stub
		/**
		 * 			<label for=""animalId"">动物编号</label>
					<input type="text" name="animalId">
				<label for="animalName">动物名称</label>
					<input type="text" name="animalName">
					<label for="animalBatch">动物批次</label>
					<input type="text" name="animalBatch">
					<div>
					<label for="health">动物健康状况</label>
					<input type="text" name="health">
		 * @return
		 */
		System.out.println(page + ";" +animal.getAnimalId() + ";" + category + ";" + animal.getAnimalName() + ";" + animal.getAnimalBatch() + ";" + health);
		AnimalFindHelp animalFindHelp = new AnimalFindHelp();
		if (animal.getAnimalBatch() != null) {
			animalFindHelp.setAnimalBatch(animal.getAnimalBatch());
		}
		if (category != null) {
			animalFindHelp.setAnimalCategory(category);
		}
		if (animal.getAnimalId() != null) {
			animalFindHelp.setAnimalId(animal.getAnimalId());
		}
		if (animal.getAnimalName()!= null && animal.getAnimalName().length() > 0) {
			animalFindHelp.setAnimalName(animal.getAnimalName());
		}
		if(health != null){
			animalFindHelp.setHealth(health);
		}
		if (page == null) {
			page =1;
		}
		System.out.println("Batch = " + animalFindHelp.getAnimalBatch() + ";"
		+"name = " +animalFindHelp.getAnimalName() + ";"
		+"category" + animalFindHelp.getAnimalCategory() + ";"
		+"Id" + animalFindHelp.getAnimalId() + ";"
		+"health" + animalFindHelp.getHealth() + ";"
		+"page" + page
				);
		PageBean<AnimalHelp> rs = null;
		List<AnimalCategory> list = null;
		try {
			rs = animalService.findAnimal(page,animalFindHelp);
			list = animalService.findCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionContext.getContext().getValueStack().set("animalCategory", list);
		ActionContext.getContext().getValueStack().set("pageBean", rs);
		ActionContext.getContext().getValueStack().set("help", animalFindHelp);
		if (toChange!= null && toChange.length() > 0) {
			if (toChange.equals("yes")) {
				System.out.println("跳转到更改界面");
				ActionContext.getContext().getValueStack().set("rs", rs.getList().get(0));
				return "toChangePage";
			}
		}
		if (addFeed != null && addFeed.length() > 0) {
			return "useFeed";
		}
		//return "toFindAnimal";
		return "findAnimalForm";
	}
	
	public String deleteOne() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("将要删除的动物id ： " + animal.getAnimalId());
		try {
			animalService.deleteOne(animal.getAnimalId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * toMakeChart
	 * @return
	 * @throws Exception
	 */

	public String toMakeChart() throws Exception {
		return "toMakeChart";
	}



	public String chartAction() throws Exception {
		System.out.println("welcome:" + startDate + ";" + endDate + ";" +chart + ";animalId" + animal.getAnimalId());
		System.out.println("prepare json");
		JSONObject json = new JSONObject();
		HttpServletResponse response = ServletActionContext.getResponse();
		System.out.println("reponse");
		List<String> category = new ArrayList<String>();
		System.out.println("category");
		if(startDate!=null&&!"".equals(startDate)&&endDate!=null&&!"".equals(endDate)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
			System.out.println(sdf.parse(startDate));
			System.out.println(sdf.parse(endDate));
			Date dstart=sdf.parse(startDate);
			Date dend=sdf.parse(endDate);
			//List<Date> listDate=GetDateBetween.getDatesBetweenTwoDate(dstart, dend);
			List<Timestamp> listDate= null;
			try {
				listDate = animalService.findDate(startDate,endDate,animal.getAnimalId());
			} catch (Exception e) {
				e.printStackTrace();
			}
/*			for(Date d:listDate){
				System.out.println("111"+ d.toString());
			}*/
			for (Timestamp t:listDate
				 ) {
				System.out.println(t.toString());
			}
			for(int i=0;i<listDate.size();i++){
				category.add(listDate.get(i).toString());
			}
		}
		json.put("category", category);
		System.out.println("json1 = " + json);
		List<String> legend = Arrays.asList(animal.getAnimalId() + "体重", animal.getAnimalId() + "产量1", animal.getAnimalId() + "产量2");
	        /*2.2 List<String> legend=new ArrayList<String>();
	        legend.add("pc端");
	        legend.add("M端");
	        legend.add("总IP");*/
		json.put("legend", legend);
		System.out.println("json2 = " + json);
		//3.主要数据获取
		List<Series> series = new ArrayList<Series>();
		//---模拟开始：此处模拟数据库读取的三个Long类型集合
		List<Long> serisData1= null;
		List<Long> serisData2= null;
		List<Long> serisData3= null;
		try {
			serisData1 = animalService.makeWeightChar(animal.getAnimalId(),String2timeStamp.str2TimeStamp(startDate),String2timeStamp.str2TimeStamp(endDate));
			serisData2 = animalService.makeYieldChar(animal.getAnimalId(),String2timeStamp.str2TimeStamp(startDate),String2timeStamp.str2TimeStamp(endDate));
			serisData3 = serisData2;
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*for(int i=1;i<6;i++){
			serisData1.add((long)i);
		}
		for(int i=12;i<17;i++){
			serisData2.add((long)i);
		}
		for(int i=18;i<23;i++){
			serisData3.add((long)i);
		}*/
		//---模拟结束---
		if(chart==1){
			series.add(new Series(animal.getAnimalId() + "体重", "line", serisData1));
			series.add(new Series(animal.getAnimalId() + "产量1", "line", serisData2));
			series.add(new Series(animal.getAnimalId() + "产量2", "line", serisData3));
		}else if(chart==2){
			series.add(new Series(animal.getAnimalId() +"体重", "bar", serisData1));
			series.add(new Series(animal.getAnimalId() +"产量1", "bar", serisData2));
			series.add(new Series(animal.getAnimalId() +"产量2", "bar", serisData3));
		}
		json.put("series", series);
		//StringBuffer aBuffer = new StringBuffer();
		System.out.println("object转json");
		//aBuffer.append(JSONUtils.isObject(series));
		//System.out.println(aBuffer);
		System.out.println("json3 = " + json.toString());
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json.toString());
		return null;
	}


	public String checkAnimalInformation() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		try {
			AnimalInformation animalInformation = animalService.findAnimalInformation(animal.getAnimalId());
			if (animalInformation != null){
				System.out.print("动物信息存在");
				response.getWriter().print("动物信息存在");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}

package com.bs.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.bs.entity.*;
import com.bs.entity.test;
import org.apache.struts2.ServletActionContext;

import com.bs.help.FeedHelp;
import com.bs.help.FeedRedirect;
import com.bs.help.GetDateBetween;
import com.bs.help.Series;
import com.bs.help.String2timeStamp;
import com.bs.service.FeedService;
import com.bs.service.SupplierService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;

public class FeedAction extends ActionSupport implements ModelDriven<Feed>{
	private FeedService feedService;
	private SupplierService supplierService;
	private String Category;
	private String stock;
	private String findAllOrNot;
	AnimalFeedInformation animalFeedInformation = new AnimalFeedInformation();
	private Integer animalId;
	private String feedUseTime;
	private double feedAmount;
	private Integer page;
	Feed feed = new Feed();
	private String supplierId;
	private String suppliers;
	private String changeOrSave;
	private String haveOrNot;
	private String startDate;
	private String endDate;
	private Integer chart;
	private String formulaName;
	private String formula;
	private String makeDate;
	private String price;

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getFormulaName() {
		return formulaName;
	}

	public void setFormulaName(String formulaName) {
		this.formulaName = formulaName;
	}

	public String getFormula() {
		return formula;
	}

	public void setFormula(String formula) {
		this.formula = formula;
	}

	public String getMakeDate() {
		return makeDate;
	}

	public void setMakeDate(String makeDate) {
		this.makeDate = makeDate;
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

	public String getHaveOrNot() {
		return haveOrNot;
	}

	public void setHaveOrNot(String haveOrNot) {
		this.haveOrNot = haveOrNot;
	}

	public void setFeedAmount(double feedAmount) {
		this.feedAmount = feedAmount;
	}

	public String getChangeOrSave() {
		return changeOrSave;
	}

	public void setChangeOrSave(String changeOrSave) {
		this.changeOrSave = changeOrSave;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public SupplierService getSupplierService() {
		return supplierService;
	}

	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}

	public String getSuppliers() {
		return suppliers;
	}

	public void setSuppliers(String suppliers) {
		this.suppliers = suppliers;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}


	public String getFindAllOrNot() {
		return findAllOrNot;
	}

	public void setFindAllOrNot(String findAllOrNot) {
		this.findAllOrNot = findAllOrNot;
	}

	public Integer getAnimalId() {
		return animalId;
	}

	public void setAnimalId(Integer animalId) {
		this.animalId = animalId;
	}

	public String getFeedUseTime() {
		return feedUseTime;
	}

	public void setFeedUseTime(String feedUseTime) {
		this.feedUseTime = feedUseTime;
	}

	public double getFeedAmount() {
		return feedAmount;
	}

	public void setFeedAmount(Integer feedAmount) {
		this.feedAmount = feedAmount;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	@Override
	public Feed getModel() {
		// TODO Auto-generated method stub
		return feed;
	}

	public FeedService getFeedService() {
		return feedService;
	}

	public void setFeedService(FeedService feedService) {
		this.feedService = feedService;
	}

	public Feed getFeed() {
		return feed;
	}
	public void setFeed(Feed feed) {
		this.feed = feed;
	}
	public String toAddFeed() throws Exception {
		// TODO Auto-generated method stub
		List<FeedCategory> categories = feedService.findFeedCategory();
		if (categories != null && categories.size() >0) {
			System.out.println("feedAction接收到饲料分类结果");
		} else {
			System.out.println("feedAction未接收到"
					+ "饲料分类结果");
		}
		for (FeedCategory feedCategory : categories) {
			System.out.println(feedCategory.getCategoryName());
		}
		ActionContext.getContext().getValueStack().set("categories", categories);
		ActionContext.getContext().getValueStack().set("aaa", "aaa");
		return "toAddFeed";
	}
	/***
	 * 增加饲料的action
	 */
	public String addFeed() throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("addFeed方法正在执行");
		System.out.println("检测是否从前台收到feed：feedCategory=" + Category +";feedId=" + feed.getFeedId());
		Integer category = Integer.parseInt(Category);
		feed.setFeedCategory(category);
		feedService.saveFeed(feed);
		return null;
	}
	
	public String toUseFeed() throws Exception {
		// TODO Auto-generated method stub
		List<FeedFormula> list = feedService.findAllFormula();
		ActionContext.getContext().getSession().put("formula",list);
		return "toUseFeed";
	}
	

	
	public String toFindFeed() throws Exception {
		// TODO Auto-generated method stub
		List<FeedCategory> categories = feedService.findFeedCategory();
		if (categories != null && categories.size() >0) {
			System.out.println("feedAction接收到饲料分类结果");
		} else {
			System.out.println("feedAction未接收到饲料分类结果");
		}
		for (FeedCategory feedCategory : categories) {
			System.out.println(feedCategory.getCategoryName());
		}
		ActionContext.getContext().getValueStack().set("categories", categories);
		return "toFindFeed";
	}
	
	public String findFeedInformation() throws Exception {
		// TODO Auto-generated method stub
		/*System.out.println(feed.getFeedCategory() + supplier + feed.getFeedId() + feed.getFeedName());*/
		System.out.println("findFeedInformation is working");
		System.out.println("suppliers : " + suppliers);
		if (findAllOrNot != null &&findAllOrNot.length() > 0) {
			/**
			 * 查询全部饲料
			 * 
			 */
			if (page == null) {
				page = 1;
			}
			FeedHelp feedHelp = new FeedHelp();
			feedHelp.setFindAllOrNot(findAllOrNot);
			System.out.println("勾选了查询全部饲料");
			PageBean<test> pageBean = new PageBean<test>();
			pageBean = feedService.findAllFeed(page,null);
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			ActionContext.getContext().getValueStack().set("information", feedHelp);;
			return "findAllFeed";
		} else {
			/**
			 * 条件查找
			 */
			FeedHelp feedHelp = new FeedHelp();
			feedHelp.setFindAllOrNot(findAllOrNot);
			if (feed.getFeedCategory() != null) {
				feedHelp.setCategory(feed.getFeedCategory());
			}
			if (feed.getFeedId() != null) {
				feedHelp.setFeedId(feed.getFeedId());
			}
			if (feed.getFeedName() != null && feed.getFeedName().length() > 0) {
				feedHelp.setFeedName(feed.getFeedName());
			}
			if (suppliers != null && suppliers.length() > 0) {
				feedHelp.setSupplier(suppliers);
			}
			if (page == null) {
				page = 1;
			}
			System.out.println("Name:"+feedHelp.getFeedName()
					+"supplier:"+feedHelp.getSupplier()
					+"category:"+feedHelp.getCategory()
					+"id:"+feedHelp.getFeedId()
					);
			PageBean<test> pageBean = new PageBean<test>();
			try {
				pageBean = feedService.findAllFeed(page,feedHelp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				
			}
			/*List list = new ArrayList();
			System.out.println("查到的list的长度" + list.size());
			System.out.println(list.get(0));
			Feed findfeed = new Feed();
			FeedInformation findfeedInformation = new FeedInformation();
			
			List<test> tests = new ArrayList<test>();
			System.out.println("tests 长度 =" + tests.size());
			for (int i = 0; i < list.size(); i++) {
				test feedlisTest = new test();
				System.out.println("i = " + i);
				Object[] object = (Object[]) list.get(i);
				System.out.println("获取到object，长度为：" + object.length);
				findfeed = (Feed) object[0];
				System.out.println("成功获取到findfeed对象：" + findfeed.getFeedId() );
				findfeedInformation = (FeedInformation) object[1];
				System.out.println("成功获取到findfeedInformation对象：" + findfeedInformation.getFeedId());
				feedlisTest.setFeed(findfeed);
				System.out.println("feedlistTest中成功添加了findfeed对象：" + feedlisTest.getFeed().getFeedId());
				feedlisTest.setFeedInformation(findfeedInformation);
				System.out.println("feedlistTest中成功添加了getFeedInformation对象：" + feedlisTest.getFeedInformation().getFeedId());
				tests.add(feedlisTest);
				System.out.println("tests成功添加了feedlistTest对象："+tests.size());
				System.out.println("tests:"
						+ tests.get(i)
						);
			}
			for (test test : tests) {
				System.out.println(test.getFeed().getFeedId());
				System.out.println(test.getFeedInformation().getSupplier());
			}
			ActionContext.getContext().getValueStack().set("feedResult",tests);
			*/
			List<FeedCategory> categories = feedService.findFeedCategory();
			if (categories != null && categories.size() >0) {
				System.out.println("feedAction接收到饲料分类结果");
			} else {
				System.out.println("feedAction未接收到饲料分类结果");
			}
			for (FeedCategory feedCategory : categories) {
				System.out.println(feedCategory.getCategoryName());
			}
			ActionContext.getContext().getSession().put("feedHelp", feedHelp);
			ActionContext.getContext().getValueStack().set("categories", categories);
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			ActionContext.getContext().getValueStack().set("information", feedHelp);
			return "findAllFeed";
		}
		/*return "findFeedInformation";*/
	}
	
	public String testHibernates() throws Exception {
		// TODO Auto-generated method stub
		feedService.testHibernates();
		return null;
	}
	
	public String animalFeedInformation() throws Exception {
		// TODO Auto-generated method stub
		feedService.testAnimalFeedInformation();
		return null;
	}
	
	public String toAddFeedInformation() throws Exception {
		// TODO Auto-generated method stub
		List<FeedCategory> list = feedService.findFeedCategory();
		List<Supplier> result = supplierService.findSupplierForFeedAntion();
		
		
/*		ActionContext.getContext().getValueStack().set("categories", list);
		ActionContext.getContext().getValueStack().set("suppliers", result);*/
		ActionContext.getContext().getSession().put("suppliers", result);
		ActionContext.getContext().getSession().put("categories", list);
		return "toAddFeedInformation";
	}
	/**
	 * 添加饲料详细信息
	 */
	public String addFeedInformation() throws Exception {
		// TODO Auto-generated method stub
		System.out.println(
				"id:"+feed.getFeedId()
				+";name:"+feed.getFeedName()
				+";remarks:"+feed.getRemarks()
				+";category:"+feed.getFeedCategory()
				+";introduction:"+feed.getFeedIntroduction()
				+";supplierId:"+supplierId
				+";stock:"+stock
				+";changeOrSave="+changeOrSave);
		Double d = Double.valueOf(stock);
		System.out.println("haveOrNot:"+haveOrNot);
		if (changeOrSave.equals("yes")) {
			feedService.addFeedInformation(feed, supplierId, d.intValue(), changeOrSave,haveOrNot);
		}else {
			feedService.addFeedInformation(feed,supplierId,d.intValue(),changeOrSave,haveOrNot);
		}
		
		/*if (changeOrSave.equals("change")) {
			ActionContext.getContext().getValueStack().set("msg", "修改成功");
			System.out.println("返回");
			String path = ServletActionContext.getRequest().getRequestURI();
			System.out.println("path = " + path);
			ActionContext.getContext().getSession().put("refresh","yes");
			FeedHelp f = (FeedHelp) ActionContext.getContext().getSession().get("feedHelp");
			StringBuffer stringBuffer = new StringBuffer();
			stringBuffer.append("/FMS/feed_findFeedInformation?test=1");
			if (f != null) {
				System.out.println("feedHelp存在");
				if (f.getFeedId() != null) {
					stringBuffer.append("&feedId=" + f.getFeedId());
				}
				if (f.getFeedName() != null) {
					stringBuffer.append("&feedName=" + f.getFeedName());
				}
				if (f.getCategory() != null) {
					stringBuffer.append("&category=" + f.getCategory());
				}
				if (f.getSupplier() != null && f.getSupplier().length() > 0) {
					stringBuffer.append("&supplier=" + f.getSupplier());
				}
				if (f.getFindAllOrNot() != null && f.getFindAllOrNot().length() > 0) {
					stringBuffer.append("&findAllOrNot=" + f.getFindAllOrNot());
				}
			}
			System.out.println("url = " + stringBuffer.toString());
			
			ServletActionContext.getResponse().sendRedirect(FeedRedirect.redirectToFindFeed(f));
			
			return "back";
		}*/
		return "toAddFeedInformation";
	}
	/**
	 * 异步校验feed是否存在
	 * 
	 */
	public String findById() throws Exception {
		// TODO Auto-generated method stub
		//调用service
		System.out.println("feedId:" + feed.getFeedId());
		Feed theFeed = feedService.findById(feed.getFeedId());
		System.out.println("theFeed = " + theFeed);
		//获得response对象
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
	
		if (theFeed != null) {
			response.getWriter().println("饲料存在：<br/>饲料编号=" + theFeed.getFeedId() 
			+ "<br/>饲料名称=" + theFeed.getFeedName()
			+ "<br/>饲料分类=" + theFeed.getFeedCategory()
			+ "<br/>饲料简介=" + theFeed.getRemarks()
			+ "<br/>饲料备注=" + theFeed.getFeedIntroduction()
			+ "<br/>供应商编号=" + theFeed.getSupplier()
			);
		}
		else {
			response.getWriter().print("饲料不存在");
		}
		return NONE;
	}
	/**
	 * 使用饲料
	 * @return
	 * @throws Exception
	 */
	public String useFeed() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("useFeed is working!");
		System.out.println("animalId + feedUseTime + feedAmount + feedId:" + animalId + feedUseTime + feedAmount + feed.getFeedId());
		Timestamp ts = String2timeStamp.str2TimeStamp(feedUseTime);
		System.out.println("timeStap="+ ts);
		feedService.realUseFeed(animalId,feed.getFeedId(),ts,feedAmount);
		return "useFeedSuccess";
	}
	
	public String toModifyFeed() throws Exception {
		// TODO Auto-generated method stub
		List<FeedCategory> list = feedService.findFeedCategory();
		ActionContext.getContext().getSession().put("categories", list);
		List<Supplier> supplierList = feedService.findSupplier();
		ActionContext.getContext().getSession().put("suppliers", supplierList);
		FeedHelp feedHelp = new FeedHelp();
		feedHelp.setFindAllOrNot(findAllOrNot);
		if (feed.getFeedId() != null) {
			feedHelp.setFeedId(feed.getFeedId());
		}
		/*if (feed.getFeedCategory() != null) {
			feedHelp.setCategory(feed.getFeedCategory());
		}
		
		if (feed.getFeedName() != null && feed.getFeedName().length() > 0) {
			feedHelp.setFeedName(feed.getFeedName());
		}
		if (suppliers != null && suppliers.length() > 0) {
			feedHelp.setSupplier(suppliers);
		}*/
		if (page == null) {
			page = 1;
		}
		System.out.println("Name:"+feedHelp.getFeedName()
				+"supplier:"+feedHelp.getSupplier()
				+"category:"+feedHelp.getCategory()
				+"id:"+feedHelp.getFeedId()
				);
		PageBean<test> pageBean = new PageBean<test>();
		try {
			pageBean = feedService.findAllFeed(page,feedHelp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
		}
		ActionContext.getContext().getValueStack().set("rs", pageBean.getList().get(0));

		return "toModifyFeed";
	}
	
	public String deleteOne() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("将要删除的饲料id是：" + feed.getFeedId());
		feedService.deleteOne(feed.getFeedId());
		FeedHelp feedHelp = (FeedHelp) ActionContext.getContext().getSession().get("feedHelp");
		
		//ServletActionContext.getResponse().sendRedirect(FeedRedirect.redirectToFindFeed(feedHelp));
		return null;
	}

	public String count() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("welcome:" + startDate + ";" + endDate + ";" +chart);
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
	            List<Date> listDate=GetDateBetween.getDatesBetweenTwoDate(dstart, dend);
	            for(Date d:listDate){ 
	                System.out.println("111"+ d.toString()); 
	            }
	            for(int i=0;i<listDate.size();i++){  
	                category.add(sdf.format(listDate.get(i)));  
	            }
		}
		json.put("category", category);
		System.out.println("json1 = " + json);
		 List<String> legend = Arrays.asList("pc端", "M端", "总IP");  
	        /*2.2 List<String> legend=new ArrayList<String>(); 
	        legend.add("pc端"); 
	        legend.add("M端"); 
	        legend.add("总IP");*/  
	        json.put("legend", legend);
	          System.out.println("json2 = " + json);
	        //3.主要数据获取  
	        List<Series> series = new ArrayList<Series>();  
	        //---模拟开始：此处模拟数据库读取的三个Long类型集合  
	        List<Long> serisData1=new ArrayList<Long>();  
	        List<Long> serisData2=new ArrayList<Long>();  
	        List<Long> serisData3=new ArrayList<Long>();  
	        for(int i=1;i<6;i++){  
	            serisData1.add((long)i);  
	        }  
	        for(int i=12;i<17;i++){  
	            serisData2.add((long)i);  
	        }  
	        for(int i=18;i<23;i++){  
	            serisData3.add((long)i);  
	        }  
	        //---模拟结束---  
	        if(chart==1){  
	            series.add(new Series("pc端", "line", serisData1));  
	            series.add(new Series("M端", "line", serisData2));  
	            series.add(new Series("总IP", "line", serisData3));  
	        }else if(chart==2){  
	            series.add(new Series("pc端", "bar", serisData1));  
	            series.add(new Series("M端", "bar", serisData2));  
	            series.add(new Series("总IP", "bar", serisData3));  
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


	public String showFeed() throws Exception {
		if (page == null){
			page = 1;
		}
		System.out.println("startDate = " + startDate + ";endDate = " + endDate + ";animalId = " + animalId
				+ ";page = " + page + "feedId = " + feed.getFeedId());

		PageBean<HistoryFeed> pageBean = feedService.findFeedHistory(startDate,endDate,animalId,page,feed.getFeedId());
		ActionContext.getContext().getValueStack().set("pb" , pageBean);
		ActionContext.getContext().getValueStack().set("startDate" , startDate);
		ActionContext.getContext().getValueStack().set("endDate" , endDate);
		ActionContext.getContext().getValueStack().set("animalId" , animalId);
		for (HistoryFeed h:pageBean.getList()
			 ) {
			System.out.println(h.getId().getAnimalId());
		}
/*		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");*/
		return "showForm";
	}


	public String tofindOneAnimalFeed() throws Exception {
		return "tofindOneAnimalFeed";
	}

	/**
	 * 跳转到增加饲料配方界面
	 * @return
	 * @throws Exception
	 */
	public String toAddFeedFormula() throws Exception {
		List<Material> list = feedService.findMaterial();
		ActionContext.getContext().getValueStack().set("material",list);
		return "toAddFeedFormula";
	}

	public String addFeedFormula() throws Exception {
		float thePrice = Float.parseFloat(price);
		System.out.println("feedId = " + feed.getFeedId() +
				"formulaName = " + formulaName +
				"formula = " + formula +
				"makeDate = " + makeDate +
				"price = " + thePrice
		);
		FeedFormula feedFormula = new FeedFormula();
		feedFormula.setFeedId(feed.getFeedId());
		feedFormula.setFormula(formula);
		feedFormula.setFormulaName(formulaName);
		feedFormula.setMakeDate(String2timeStamp.str2TimeStamp(makeDate));
		feedFormula.setPrice(thePrice);
		try {
			feedService.addFeedFormula(feedFormula);
			this.addActionMessage("添加成功");
		} catch (Exception e) {
			this.addActionMessage("添加失败");
			e.printStackTrace();
		}
		return "toAddFeedFormula";
	}

	/**
	 * 跳转到配方查询页面
	 * @return
	 * @throws Exception
	 */
	public String toFindFeedFormula() throws Exception {
		return "toFindFeedFormula";
	}


	public String findFeedFormula() throws Exception {
		System.out.println("feedId = " + feed.getFeedId() +
				"formulaName = " + formulaName +
				"formula = " + formula+
				"page = " + page);
		if (page == null){
			page = 1;
		}
		PageBean<FeedFormula> pageBean = feedService.findFeedFormByPage(feed.getFeedId(),formulaName,formula,page);
		ActionContext.getContext().getValueStack().set("pageBean",pageBean);
		return "FindFeedFormula";
	}

	/**
	 * 删除一个配方
	 * @return
	 * @throws Exception
	 */
	public String deleteOneFormula() throws Exception {
		feedService.deleteOneFormula(feed.getFeedId());
		return null;
	}


	public String toModifyFormula() throws Exception {
		System.out.println("要更改的feedId是 : " + feed.getFeedId());
		FeedFormula feedFormula = feedService.findFormulaById(feed.getFeedId());
		ActionContext.getContext().getValueStack().set("formula",feedFormula);
		return "toModifyFormula";
	}


	public String modifyFeedFormula() throws Exception {
		System.out.println("feedId = " + feed.getFeedId() +
				"formulaName = " + formulaName +
				"formula = " + formula +
				"makeDate = " + makeDate);
		feedService.modifyFormula(feed.getFeedId(),formulaName,formula,makeDate);
		FeedFormula feedFormula = feedService.findFormulaById(feed.getFeedId());
		ActionContext.getContext().getValueStack().set("formula",feedFormula);
		this.addActionMessage("修改成功！");
		return "toModifyFormula";
	}


	public String feedWaring() throws Exception {
		//JSONObject json = new JSONObject();
		HttpServletResponse response = ServletActionContext.getResponse();
		int waringCount = feedService.feedStockWaring();
		//json.put("waringCount",waringCount);
		response.setContentType("text/html;charset=utf-8");
		//response.getWriter().write(json.toString());
		response.getWriter().write(String.valueOf(waringCount));
		return null;
	}
	public String needUseFeedWaring() throws Exception{

		HttpServletResponse response = ServletActionContext.getResponse();
		int waringCount = feedService.needUseFeedWaring();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(String.valueOf(waringCount));
		return null;
	}
}

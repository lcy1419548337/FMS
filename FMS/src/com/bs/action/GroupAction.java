package com.bs.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.bs.entity.*;
import com.bs.help.Series;
import com.bs.help.String2timeStamp;
import com.bs.service.GroupService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;

public class GroupAction extends ActionSupport implements ModelDriven<TheGroup> {
	TheGroup group = new TheGroup();
	GroupService groupService;
	private Integer animalId;
	String TheTime;
	private Integer groupId;
	private Integer page;
	private String feedUseTime;
	private Integer feedId;
	private String amount;
	private String startDate;
	private String endDate;
	private Integer chart;


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

	public Integer getChart() { return chart; }

	public void setChart(Integer chart) { this.chart = chart; }

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public Integer getFeedId() {
		return feedId;
	}

	public void setFeedId(Integer feedId) {
		this.feedId = feedId;
	}

	public String getFeedUseTime() {
		return feedUseTime;
	}

	public void setFeedUseTime(String feedUseTime) {
		this.feedUseTime = feedUseTime;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getTheTime() {
		return TheTime;
	}

	public void setTheTime(String theTime) {
		TheTime = theTime;
	}

	public GroupService getGroupService() {
		return groupService;
	}

	public Integer getAnimalId() {
		return animalId;
	}

	public void setAnimalId(Integer animalId) {
		this.animalId = animalId;
	}

	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}

	public TheGroup getGroup() {
		return group;
	}

	public void setGroup(TheGroup group) {
		this.group = group;
	}


	@Override
	public TheGroup getModel() {
		// TODO Auto-generated method stub
		return group;
	}
	
	public String toAddGroup() throws Exception {
		// TODO Auto-generated method stub
		return "toAddGroup";
	}
	
	public String addToGroup() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("添加动物到集群");
		System.out.println(TheTime + ";" + animalId + ";" + groupId);
		Timestamp ts = String2timeStamp.str2TimeStamp(TheTime);
		System.out.println("经过转换的时间为： " + ts);
		GroupInformation groupInformation = new GroupInformation();
		groupInformation.setGroupId(groupId);
		group.setGroupInformation(groupInformation);
		group.setTime(ts);

		groupService.addToGroup(group,animalId);
		return null;
	}
	
	public String toFindGroup() throws Exception {
		// TODO Auto-generated method stub
		List<TheGroup> list = groupService.findGroupForChoose();
		System.out.println("list.size = " + list.size());
		ActionContext.getContext().getSession().put("groups", list);
		return "toFindGroup";
	}
	
	public String findGroup() throws Exception {
		// TODO Auto-generated method stub
		if (page == null) {
			page = 1;
		}
		System.out.println(animalId + ";" + groupId + ";" + page);

		PageBean<TheGroup> list = groupService.findGroup(animalId,groupId,page);
		ActionContext.getContext().getValueStack().set("pageBean", list);
		return "GroupForm";
	}
	
	public String findAllGroup() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("按集群查看");
		if (page == null) {
			page = 1;
		}
		PageBean<GroupInformation> pageBean = groupService.findAllGroup(page);
		ActionContext.getContext().getValueStack().set("allGroup", pageBean);
		return "viewGroup";
	}
	
	public String findGroupInformation() throws Exception {
		// TODO Auto-generated method stub
		if (page == null) {
			page = 1;
		}
		PageBean<TheGroup> pageBean = groupService.findGroup(null, groupId, page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "toFindGroup";
	}
	
	public String findByGroupId() throws Exception {
		// TODO Auto-generated method stub
		if (page == null) {
			page = 1;
		}
		
		PageBean<TheGroup> pageBean = groupService.findGroup(null, groupId, page);
		if (pageBean.getList() != null && pageBean.getList().size() > 0 ) {
			int id = pageBean.getList().get(0).getGroupInformation().getGroupId();
			ActionContext.getContext().getValueStack().set("id", id);
		}
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "findByGroupId";
	}
	
	public String findGroupLockId() throws Exception {
		// TODO Auto-generated method stub
		if (page == null) {
			page = 1;
		}
		System.out.println(animalId + ";" + groupId + ";" + page);

		PageBean<TheGroup> list = groupService.findGroup(animalId,groupId,page);
		if (list.getList() != null && list.getList().size() > 0) {
			int id = list.getList().get(0).getGroupInformation().getGroupId();

			ActionContext.getContext().getValueStack().set("pageBean", list);
		}
		ActionContext.getContext().getValueStack().set("id", groupId);
		return "findByGroupId";
	}
	
	public String groupUseFeed() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("groupId = " + groupId + ";feedId = " + feedId + ";feedUseTime=" + feedUseTime + ";amount = " + amount);
		try {
			groupService.groupUseFeed(groupId,feedId,String2timeStamp.str2TimeStamp(feedUseTime),amount);
			this.addActionMessage("添加成功");
			//ActionContext.getContext().getValueStack().set("msg" , "添加成功");
		} catch (Exception e) {
			//ActionContext.getContext().getValueStack().set("msg" , "添加失败");
			this.addActionMessage("添加失败");
			e.printStackTrace();
		}
		return "toGroupUseFeed";
	}
	
	public String toGroupUseFeed() throws Exception {
		// TODO Auto-generated method stub
		List<FeedFormula> list = groupService.findFeedFormula();
		ActionContext.getContext().getSession().put("formula",list);
		return "toGroupUseFeed";
	}


	public String tofindOneGroupFeed() throws Exception {
		return "tofindOneGroupFeed";
	}


	public String findById() throws Exception {
		System.out.println("groupId = " + groupId);
		GroupInformation groupInformation = groupService.findById(groupId);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if (groupInformation != null){
			response.getWriter().println("集群存在"
					+ "<br/>集群编号 = " + groupInformation.getGroupId()
					+ "<br/>集群名称 = " + groupInformation.getGroupName());
		}else{
			response.getWriter().println("集群不存在");
		}
		return NONE;
	}

	public String showGroupFeed() throws Exception {
		if (page == null){ page = 1; }
		System.out.println("page = " + page
				+ ";startDate = " + startDate
				+ ";endDate = " + endDate
				+";groupId = " + groupId
				+";feedId = " +feedId);
		PageBean<HistoryGroupFeed> pageBean = groupService.showGroupFeed(startDate,endDate,page,groupId,feedId);
		for (HistoryGroupFeed h:pageBean.getList()) {
			System.out.println(h.getFeedUseTime());
		}
		System.out.println(pageBean.getTotalPage());
		ActionContext.getContext().getValueStack().set("pb",pageBean);

		return "showGroupFeed";
	}
	/**
	 * 集群生长情况图表
	 */
	public String chartAction() throws Exception {
		System.out.println("welcome:" + startDate + ";" + endDate + ";" +chart + ";animalId" + groupId);
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
			List<Timestamp> listDate=groupService.findDate(startDate,endDate,groupId);
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
		//List<Long> serisData1=groupService.makeWeightChar(groupId,String2timeStamp.str2TimeStamp(startDate),String2timeStamp.str2TimeStamp(endDate));
		List<String> legend = Arrays.asList(groupId + "体重", groupId + "产量1");
		json.put("legend", legend);
		System.out.println("json2 = " + json);
		//3.主要数据获取
		List<Series> series = new ArrayList<Series>();
		//---模拟开始：此处模拟数据库读取的三个Long类型集合
		List<Long> serisData1=groupService.makeWeightChar(groupId,String2timeStamp.str2TimeStamp(startDate),String2timeStamp.str2TimeStamp(endDate));
		List<Long> serisData2=groupService.makeYieldChar(groupId,String2timeStamp.str2TimeStamp(startDate),String2timeStamp.str2TimeStamp(endDate));
		//List<Long> serisData2=groupService.makeYieldChar(groupId,String2timeStamp.str2TimeStamp(startDate),String2timeStamp.str2TimeStamp(endDate));
		//---模拟结束---
		if(chart==1){
			series.add(new Series(groupId + "体重", "line", serisData1));
			series.add(new Series(groupId + "产量1", "line", serisData2));
		}else if(chart==2){
			series.add(new Series(groupId +"体重", "bar", serisData1));
			series.add(new Series(groupId +"产量1", "bar", serisData2));
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
	/**
	 * 跳转到集群图表页面
	 */

	public String toMakeChart() throws Exception {
		return "toMakeChart";
	}


	public String toModifyGroup() throws Exception {
		System.out.println("animalId = " + animalId + ";groupId = " + groupId);
		PageBean<TheGroup> pageBean = groupService.findGroup(animalId,groupId,1);
		System.out.println("time = " + pageBean.getList().get(0).getTime());
		ActionContext.getContext().getValueStack().set("theGroup",pageBean.getList().get(0));
		return "toModifyGroup";
	}
	public String modifyGroup() throws Exception {
		System.out.println("animalId = " + animalId + ";groupId = " + groupId);
		groupService.modifyGroup(animalId,groupId,TheTime);
		return null;
	}

	public String deleteOneAnimal() throws Exception {
		System.out.println("删除动物:" + animalId);
		groupService.deleteOneAnimal(animalId);
		System.out.println("path = " + ServletActionContext.getRequest().getContextPath());
		ServletActionContext.getResponse().sendRedirect(ServletActionContext.getRequest().getContextPath()+"/group_findByGroupId?groupId=" + groupId);
		return null;
	}

	public String deleteOneByAjax() throws Exception {
		System.out.println("删除动物:" + animalId);
		groupService.deleteOneAnimal(animalId);
		return null;
	}


	public String deleteOneGroup() throws Exception {
		System.out.println("将要删除的集群Id = " + groupId);
		groupService.deleteOneGroup(groupId);
		return null;
	}
}

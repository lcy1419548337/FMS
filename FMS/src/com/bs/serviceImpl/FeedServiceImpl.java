package com.bs.serviceImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bs.entity.*;
import com.bs.help.String2timeStamp;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.bs.constant.Constant;
import com.bs.dao.FeedDao;
import com.bs.daoImpl.FeedDaoImpl;
import com.bs.help.FeedHelp;

public class FeedServiceImpl implements com.bs.service.FeedService {
	FeedDao feedDao;

	public FeedDao getFeedDao() {
		return feedDao;
	}

	public void setFeedDao(FeedDao feedDao) {
		this.feedDao = feedDao;
	}

	@Override
	public List<FeedCategory> findFeedCategory() {
		// TODO Auto-generated method stub
		return feedDao.findFeedCategory();
	}

	@Override
	public void saveFeed(Feed feed) {
		// TODO Auto-generated method stub
		feedDao.saveFeed(feed);
	}

	@Override
	public void useFeed(AnimalFeedInformation animalFeedInformation) {
		// TODO Auto-generated method stub
		feedDao.useFeed(animalFeedInformation);
	}

	@Override
	public PageBean<test> findAllFeed(Integer page,FeedHelp feedHelp) {
		// TODO Auto-generated method stub
		//List list = feedDao.findAllFeed(page);
		PageBean<test> pageBean = new PageBean<test>();
		System.out.println("pageBean : " + pageBean + ";" + page);
		pageBean.setPage(page);
		pageBean.setLimit(com.bs.constant.Constant.PAGE_LIMIT);
		//int totalCount = feedDao.findCountFeed();
		int totalCount = 0;
		if (feedHelp == null) {
			System.out.println("feedHelp = null");
			totalCount = feedDao.findCountFeed();
		}else {
			System.out.println("feedHelp != null");
			totalCount = feedDao.findCountFeedByInformation(feedHelp);
		}
		System.out.println("totalCount = " + totalCount);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int)Math.ceil((double)totalCount/(double)Constant.PAGE_LIMIT);
		System.out.println("totalPage = " + totalPage);
		pageBean.setTotalPage(totalPage);
		int start = pageBean.getLimit()*(pageBean.getPage() - 1) + 1;
		System.out.println("start = " + start);
		List primarylist = feedDao.findAllFeedByPage(start,feedHelp);
		System.out.println("primarylist == null : " + primarylist == null);
		System.out.println("primarylist.size()>0 : " + (primarylist.size()>0));
		if (primarylist != null && primarylist.size() > 0) {
			System.out.println("查到的list的长度" + primarylist.size());
			System.out.println(primarylist.get(0));
			Feed findfeed = new Feed();
			FeedInformation findfeedInformation = new FeedInformation();
			
			List<test> tests = new ArrayList<test>();
			System.out.println("tests 长度 =" + tests.size());
			for (int i = 0; i < primarylist.size(); i++) {
				test feedlisTest = new test();
				System.out.println("i = " + i);
				Object[] object = (Object[]) primarylist.get(i);
				System.out.println("获取到object，长度为：" + object.length);
				findfeed = (Feed) object[0];
				System.out.println("成功获取到findfeed对象：" + findfeed.getSupplier().getSupplierId() );
				findfeedInformation = (FeedInformation) object[1];
				System.out.println("成功获取到findfeedInformation对象：" + findfeedInformation.getFeed().getFeedId());
				feedlisTest.setFeed(findfeed);
				System.out.println("feedlistTest中成功添加了findfeed对象：" + feedlisTest.getFeed().getFeedId());
				feedlisTest.setFeedInformation(findfeedInformation);
				System.out.println("feedlistTest中成功添加了getFeedInformation对象：" + feedlisTest.getFeedInformation().getFeed().getFeedName());
				tests.add(feedlisTest);
				System.out.println("tests成功添加了feedlistTest对象："+tests.size());
				System.out.println("tests:"
						+ tests.get(i)
						);
			}
			pageBean.setList(tests);
			return pageBean;
		}
else {
	return null;
}
		
	}

	@Override
	public void testHibernates() {
		// TODO Auto-generated method stub
		feedDao.testHibernates();
	}

	@Override
	public void testAnimalFeedInformation() {
		// TODO Auto-generated method stub
		feedDao.testAnimalFeedInformation();
	}

	@Override
	public void addFeedInformation(Feed feed, String supplierId, Integer stock,String changeOrSave,String haveOrNot) {
		// TODO Auto-generated method stub
		Supplier supplier = new Supplier();
		Feed oldFeed = new Feed();
		if (changeOrSave.equals("change")){
			oldFeed = feedDao.findById(feed.getFeedId());
			feedDao.deleteOneFeedInformation(feed.getFeedId());
			Supplier oldSupplier = oldFeed.getSupplier();
			feedDao.modifyFeed(oldFeed,oldSupplier,feed,supplier,Integer.parseInt(supplierId),stock);
		}
		else {
			if (haveOrNot.equals("yes")) {
				System.out.println("yes");
				oldFeed = feedDao.findById(feed.getFeedId());
				supplier.setSupplierId(Integer.parseInt(supplierId));
				oldFeed.setSupplier(supplier);
				System.out.println("supplier = " + feed.getSupplier());
				feedDao.addFI(oldFeed, stock);
			} else {
				System.out.println("false");
				supplier.setSupplierId(Integer.parseInt(supplierId));
				feed.setSupplier(supplier);
				feedDao.addFeedInformation(feed, stock, changeOrSave);
			}

		}
	}

	@Override
	public Feed findById(Integer feedId) {
		// TODO Auto-generated method stub
		
		return feedDao.findById(feedId);
	}

	@Override
	public void realUseFeed(Integer animalId, Integer feedId, Timestamp ts, double feedAmount) {
		// TODO Auto-generated method stub
		Animal animal = feedDao.findAnimalById(animalId);
		Feed feed = feedDao.findById(feedId);
		AnimalFeedInformation animalFeedInformation = new AnimalFeedInformation();
		animalFeedInformation.setFeedAmount(feedAmount);
		animalFeedInformation.setFeedUseTime(ts);
		animalFeedInformation.setFeed(feed);
		animalFeedInformation.setAnimal(animal);
		feedDao.useFeed(animalFeedInformation);
		HistoryFeed historyFeed = new HistoryFeed();
		HistoryFeedId historyFeedId = new HistoryFeedId();
		historyFeedId.setFeedId(feedId);
		historyFeedId.setFeedAccount(((int) feedAmount));
		historyFeedId.setFeedUseTime(ts);
		historyFeedId.setAnimalId(animalId);
		historyFeed.setId(historyFeedId);
/*		historyFeed.getId().setFeedId(feedId);
		historyFeed.getId().setFeedAccount(((int) feedAmount));
		historyFeed.getId().setFeedUseTime(ts);
		historyFeed.getId().setAnimalId(animalId);*/
		feedDao.saveHistoryFeed(historyFeed);
	}

	@Override
	public List<Supplier> findSupplier() {
		// TODO Auto-generated method stub
		return feedDao.findSupplier();
	}

	@Override
	public void deleteOne(Integer feedId) {
		// TODO Auto-generated method stub
		Feed feed = feedDao.findById(feedId);
		feedDao.deleteOneFeed(feed);
		System.out.println("删除饲料所属供应商：" + feed.getSupplier());
	}

	@Override
	public PageBean<HistoryFeed> findFeedHistory(String startDate, String endDate, Integer animalId,Integer page,Integer feedId) {
		Integer totalCount = 0 ;
		Integer totalPage = 0;
        int start = 0;
		PageBean<HistoryFeed> pageBean = new PageBean<>();
		pageBean.setLimit(Constant.PAGE_LIMIT);
		pageBean.setPage(page);
        totalCount = feedDao.findCountHistoryFeed(startDate,endDate,animalId,feedId);
		pageBean.setTotalCount(totalCount);
        totalPage = (int) Math.ceil((double)totalCount/(double)Constant.PAGE_LIMIT);
        pageBean.setTotalPage(totalPage);
        start = (page - 1)*Constant.PAGE_LIMIT + 1;
        System.out.println("start = " + start);
        List<HistoryFeed> list = feedDao.finHistoryFeed(startDate,endDate,animalId,start,feedId);
        pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void addFeedFormula(FeedFormula feedFormula) {
		feedDao.addFeedFormula(feedFormula);
	}

	@Override
	public PageBean<FeedFormula> findFeedFormByPage(Integer feedId, String formulaName, String formula ,Integer page) {
		PageBean<FeedFormula> pageBean = new PageBean<>();
		pageBean.setLimit(Constant.PAGE_LIMIT);
		int totalCount = feedDao.findCountFormula(feedId,formulaName,formula);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil((double)totalCount/(double)Constant.PAGE_LIMIT);
		pageBean.setTotalPage(totalPage);
		int start = (page -1)*Constant.PAGE_LIMIT + 1;
		pageBean.setPage(page);
		List<FeedFormula> list = feedDao.findFormulaByPage(feedId,formulaName,formula,page,start);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void deleteOneFormula(Integer feedId) {
		feedDao.deleteoneFormula(feedId);
	}

	@Override
	public FeedFormula findFormulaById(Integer feedId) {
		FeedFormula feedFormula = feedDao.findFormulaById(feedId);
		return feedFormula;
	}

	@Override
	public void modifyFormula(Integer feedId, String formulaName, String formula, String makeDate) {
		FeedFormula oldFeedFormula = feedDao.findFormulaById(feedId);
		oldFeedFormula.setFormula(formula);
		oldFeedFormula.setFormulaName(formulaName);
		oldFeedFormula.setMakeDate(String2timeStamp.str2TimeStamp(makeDate));
		feedDao.modifyFormule(oldFeedFormula);
	}

	@Override
	public List<FeedFormula> findAllFormula() {
		return feedDao.findAllFormula();
	}

    @Override
    public List<Material> findMaterial() {
        return feedDao.findMaterial();
    }

	@Override
	public int feedStockWaring() {
		List<Double> list = feedDao.feedStockWaring();
		int count = 0;
		if (list != null && list.size() > 0) {
			for (Double i : list) {
				//System.out.println(i + "-----" + (i < Constant.MIN_FEED_STOCK.doubleValue()));
				if (i < Constant.MIN_FEED_STOCK.doubleValue()) {
					count++;
				}
			}
		}
		//System.out.println("count = " + count);
		return count;
	}

	@Override
	public int needUseFeedWaring() {
		List<Integer> animalList = feedDao.findAllAnimal();
		int waringCount = 0;
		Date date = new Date();
		for (Integer animalId:animalList
			 ) {
			HistoryFeed historyFeed = feedDao.findHistoryFeedByAnimalId(animalId);

			if (historyFeed != null){
				//System.out.println("动物id：" + animalId);
				//System.out.println("当前时间：" + date);
				//System.out.println("最后一次使用饲料的时间 ： " + historyFeed.getId().getFeedUseTime());
				long result = (date.getTime()/(60*60*1000) - historyFeed.getId().getFeedUseTime().getTime()/(60*60*1000));
				//System.out.println("相差小时数：" + result);
				if (result > Constant.MIN_FEED_USE){
					waringCount ++;
				}
			}else {
				waringCount ++;
			}

		}
		//System.out.println("warning数量 = " + waringCount);
		return waringCount;
	}

}

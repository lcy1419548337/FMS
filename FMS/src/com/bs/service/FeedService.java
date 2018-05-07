package com.bs.service;

import java.sql.Timestamp;
import java.util.List;

import com.bs.entity.*;
import com.bs.help.FeedHelp;

public interface FeedService {
	List<FeedCategory> findFeedCategory();
	void saveFeed(Feed feed);
	void useFeed(AnimalFeedInformation animalFeedInformation);
	PageBean<test> findAllFeed(Integer page,FeedHelp feedHelp);
	void testHibernates();
	void testAnimalFeedInformation();
	void addFeedInformation(Feed feed, String supplierId, Integer stock,String changeOrSave, String haveOrNot);
	Feed findById(Integer feedId);
	void realUseFeed(Integer animalId, Integer feedId, Timestamp ts, double feedAmount);
	List<Supplier> findSupplier();
	void deleteOne(Integer feedId);

    PageBean<HistoryFeed> findFeedHistory(String startDate, String endDate, Integer animalId,Integer page,Integer feedId);

    void addFeedFormula(FeedFormula feedFormula);

    PageBean<FeedFormula> findFeedFormByPage(Integer feedId, String formulaName, String formula ,Integer page);

	void deleteOneFormula(Integer feedId);

	FeedFormula findFormulaById(Integer feedId);

	void modifyFormula(Integer feedId, String formulaName, String formula, String makeDate);

	List<FeedFormula> findAllFormula();

    List<Material> findMaterial();

    int feedStockWaring();

    int needUseFeedWaring();
}

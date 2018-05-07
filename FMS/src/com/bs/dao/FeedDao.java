package com.bs.dao;

import java.util.List;

import com.bs.entity.*;
import com.bs.help.FeedHelp;

public interface FeedDao {

	List<FeedCategory> findFeedCategory();

	void saveFeed(Feed feed);

	void useFeed(AnimalFeedInformation animalFeedInformation);

	List findAllFeedByPage(Integer start,FeedHelp feedHelp);

	int findCountFeed();

	int findCountFeedByInformation(FeedHelp feedHelp);

	void testHibernates();

	void testAnimalFeedInformation();

	void addFeedInformation(Feed feed , Integer stock,String changeOrSave);

	Feed findById(Integer feedId);

	Animal findAnimalById(Integer animalId);

	List<Supplier> findSupplier();

	void deleteOneFeed(Feed feed);

	void addFI(Feed feed, Integer stock);

    Integer findCountHistoryFeed(String startDate, String endDate, Integer animalId,Integer feedId);

	List<HistoryFeed> finHistoryFeed(String startDate, String endDate, Integer animalId, int start, Integer feedId);

    void modifyFeed(Feed oldFeed, Supplier oldSupplier, Feed feed, Supplier supplier,Integer supplierId,Integer stock);

	void deleteOneFeedInformation(Integer feedId);

    void addFeedFormula(FeedFormula feedFormula);

    int findCountFormula(Integer feedId, String formulaName, String formula);

	List<FeedFormula> findFormulaByPage(Integer feedId, String formulaName, String formula, Integer page ,int start);

	void deleteoneFormula(Integer feedId);

	FeedFormula findFormulaById(Integer feedId);

	void modifyFormule(FeedFormula oldFeedFormula);

	List<FeedFormula> findAllFormula();

	void saveHistoryFeed(HistoryFeed historyFeed);

    List<Material> findMaterial();

    List<Double> feedStockWaring();

    List<Integer> findAllAnimal();

	HistoryFeed findHistoryFeedByAnimalId(Integer animalId);

	/*List findFeedByPage(Integer page);*/

}

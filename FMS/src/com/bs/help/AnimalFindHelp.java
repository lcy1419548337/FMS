package com.bs.help;

public class AnimalFindHelp {
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
	private Integer animalId;
	private String animalName;
	private Integer animalBatch;
	private Integer animalCategory;
	private Integer health;
	public Integer getAnimalId() {
		return animalId;
	}
	public void setAnimalId(Integer animalId) {
		this.animalId = animalId;
	}
	public String getAnimalName() {
		return animalName;
	}
	public void setAnimalName(String animalName) {
		this.animalName = animalName;
	}
	public Integer getAnimalBatch() {
		return animalBatch;
	}
	public void setAnimalBatch(Integer animalBatch) {
		this.animalBatch = animalBatch;
	}
	public Integer getAnimalCategory() {
		return animalCategory;
	}
	public void setAnimalCategory(Integer animalCategory) {
		this.animalCategory = animalCategory;
	}
	public Integer getHealth() {
		return health;
	}
	public void setHealth(Integer health) {
		this.health = health;
	}
	
}

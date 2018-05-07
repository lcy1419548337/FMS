package com.bs.entity;



/**
 * ProductNutrients entity. @author MyEclipse Persistence Tools
 */

public class ProductNutrients2  implements java.io.Serializable {


    // Fields    

     private ProductNutrientsId2 id;
     private ProductInformation productInformation;


    // Constructors

    /** default constructor */
    public ProductNutrients2() {
    }

	/** minimal constructor */
    public ProductNutrients2(ProductNutrientsId2 id) {
        this.id = id;
    }
    
    /** full constructor */
    public ProductNutrients2(ProductNutrientsId2 id, ProductInformation productInformation) {
        this.id = id;
        this.productInformation = productInformation;
    }

   
    // Property accessors

    public ProductNutrientsId2 getId() {
        return this.id;
    }
    
    public void setId(ProductNutrientsId2 id) {
        this.id = id;
    }

    public ProductInformation getProductInformation() {
        return this.productInformation;
    }
    
    public void setProductInformation(ProductInformation productInformation) {
        this.productInformation = productInformation;
    }
   








}
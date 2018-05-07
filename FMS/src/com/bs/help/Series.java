package com.bs.help;

import java.util.List;

public class Series {
	 public String name;  
	    public String type;  
	    public List<Long> data;// 这里要用int 不能用String 不然前台显示不正常（特别是在做数学运算的时候）  
	      
	    public String getName() {  
	        return name;  
	    }  
	  
	    public void setName(String name) {  
	        this.name = name;  
	    }  
	  
	    public String getType() {  
	        return type;  
	    }  
	  
	    public void setType(String type) {  
	        this.type = type;  
	    }  
	      
	    public List<Long> getData() {  
	        return data;  
	    }  
	  
	    public void setData(List<Long> data) {  
	        this.data = data;  
	    }  
	  
	    public Series(String name, String type, List<Long> data) {  
	        this.name = name;  
	        this.type = type;  
	        this.data = data;  
	    }  
}

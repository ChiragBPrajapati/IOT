package com.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class getYear {

	

	private static List<Integer> getPreviousYear() {
		int year = 0;
		Calendar calendar = Calendar.getInstance(); 
		 year = calendar.get(Calendar.YEAR);
		 List<Integer> list = new ArrayList<Integer>();
	    for (int i = 0; i <= 10; i++ ) {	    	 
	    	 year = year - 1;
	    	 System.out.println(year);
	    	 //System.out.println(year);
	    	 list.add(year);
	    }
	
		return list;
	   
	}
/*
	private static int getPreviousYear() {
		int year = 0;
		Calendar calendar = Calendar.getInstance(); 
		 year = calendar.get(Calendar.YEAR);
	    for (int i = 0; i <= 10; i++ ) {	    	 
	    	 year = year - 1;
	    	 System.out.println(year);
	       
	    	 //System.out.println(year);
	    }
	
		return year;
	}*/
}

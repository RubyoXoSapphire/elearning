/**
 * 
 */
package com.softech.elearning.business.servicesimpl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatValidate {
	public static String convertMySqlToJava(String s1) {

		Date date;
		String newstring = null;
		try {
			date = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(s1);
			newstring = new SimpleDateFormat("dd/MM/yyyy").format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return newstring;
	}

	// format date Java to mySql
	public static String convertJavaToMySql(String s1) {
		System.out.println("Go to convert Java to MySql");
		Date date;
		String newstring = null;
		try {
			date = (Date) new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(s1);
			newstring = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newstring;

	}

	public static Date convertToDate(String dateText) {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date;
		try {
			date = formatter.parse(dateText);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String convertToStringDateMySql(Date date) {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateText;
		try {
			dateText = formatter.format(date);
			return dateText;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static Date convertToFormat(String dateText, String pattern) {
		DateFormat formatter = new SimpleDateFormat(pattern);
		try {
			Date date = formatter.parse(dateText);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	// format date Java to mySql
	public static Date convertFromStringToMySqlDate(String s1) {
		System.out.println("Go to convert String to MySql");
		Date date = null;
		try {
			date = (Date) new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(s1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;

	}

}

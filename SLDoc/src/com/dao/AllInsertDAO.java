package com.dao;


import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.AttachmentBean;
import com.bean.CustomerBean;
import com.bean.CustomerProductBean;
import com.bean.DownloadLogBean;
import com.bean.ProductBean;
import com.bean.SectorBean;
import com.bean.UserBean;
import com.util.HibernateUtil;


public class AllInsertDAO {

	
	public boolean sectorInsert(SectorBean sectorBean){
		 boolean result = false;
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(sectorBean);
			 tx.commit();
			 result = true;
			System.out.println("Result :"+result);
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 e.printStackTrace();
			 System.out.println("error :"+e.getMessage());
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	public boolean customerInsert(CustomerBean customerBean){
		 boolean result = false;
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(customerBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			// e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	public boolean userInsert(UserBean userBean){
		 boolean result = false;
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(userBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			// e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	public boolean productInsert(ProductBean productBean){
		 boolean result = false;
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(productBean);
			 tx.commit();
			 result = true;
			System.out.println("Result :"+result);
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}

	
	public boolean customerProductInsert(CustomerProductBean customerProductBean){
		 boolean result = false;
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(customerProductBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			// e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	public boolean attachmentInsert(AttachmentBean attachmentBean){
		boolean result = false;
		
		Session session = HibernateUtil.openSession();
		
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(attachmentBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 e.printStackTrace();
		 } finally {
			 session.close();
		 }
		return result;	
		 
	}
	
	public boolean downloadLogInsert(DownloadLogBean downloadLogBean){
		 boolean result = false;
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(downloadLogBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			// e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
}

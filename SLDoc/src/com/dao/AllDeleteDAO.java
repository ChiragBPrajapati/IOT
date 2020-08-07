package com.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.ProductBean;
import com.bean.UserBean;
import com.util.HibernateUtil;

public class AllDeleteDAO {


	public boolean deleteSector(int wId)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("delete SectorBean where sector_id = :sid");
			 query.setInteger("sid",wId);
			 int result = query.executeUpdate();
			 tx.commit();
			
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return true;
	}
	
	public boolean deleteCustomer(int cId)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("delete CustomerBean where customer_id = :cid");
			 query.setInteger("cid",cId);
			 int result = query.executeUpdate();
			 tx.commit();
			
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return true;
	}
	
	public boolean deleteUser(int cId)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("delete UserBean where customer_id = :cid");
			 query.setInteger("cid",cId);
			 int result = query.executeUpdate();
			 tx.commit();
			
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return true;
	}
	
	public boolean deleteProduct(int pId)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("delete ProductBean where product_id = :sid");
			 query.setInteger("sid",pId);
			 int result = query.executeUpdate();
			 tx.commit();
			
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return true;
	}
	
	
	public boolean deleteAttachment(int wId)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("delete AttachmentBean where attachment_id = :sid");
			 query.setInteger("sid",wId);
			 int result = query.executeUpdate();
			 tx.commit();
			
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return true;
	}
}

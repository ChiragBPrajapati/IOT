package com.dao;

import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.security.core.userdetails.User;

import com.bean.CustomerBean;
import com.bean.UserBean;
import com.util.HibernateUtil;


public class AllUpdateDAO{

	public boolean changePassword(int user_id,String pass)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE UserBean SET password = :p where user_id = :ui");
			 query.setParameter("p" ,pass);
			 query.setParameter("ui",user_id);
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
	
	
	public boolean customerUpdate(String username,String password,String fullname,String wIdArray ,String empCode ,String contact_one ,String email_one ,int customer_id)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE CustomerBean SET username = :u ,password = :p ,fullname = :f ,products = :pd ,empCode = :ec ,contact_one =:mb ,email_one = :ed where customer_id = :ci");
		
			 query.setParameter("u" ,username);
			 query.setParameter("p",password);
			 query.setParameter("f" ,fullname);
			 query.setParameter("pd",wIdArray);
			 query.setParameter("ec" ,empCode);
			 query.setParameter("mb" ,contact_one);
			 query.setParameter("ed" ,email_one);
			 query.setParameter("ci",customer_id);
			 int result = query.executeUpdate();
			 System.out.println("query :"+query);
			 System.out.println("result :"+result);
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
	
	
	/*public boolean customerUpdate(int user_id,String pass){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update("customerBean where customer_id = '"+customer_id+"'");
			 result = true;
			 tx.commit();
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}*/

	public boolean userUpdate(String username,String password,String fullname ,int customer_id){
		Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE UserBean SET username = :u ,password = :p ,name = :f where customer_id = :ci");
		
			 query.setParameter("u" ,username);
			 query.setParameter("p",password);
			 query.setParameter("f" ,fullname);
			 query.setParameter("ci",customer_id);
			 int result = query.executeUpdate();
			 System.out.println("query :"+query);
			 System.out.println("result :"+result);
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

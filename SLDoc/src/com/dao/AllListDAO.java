package com.dao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.xmlbeans.impl.piccolo.xml.EntityManager;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.AttachmentBean;
import com.bean.CustomerBean;
import com.bean.CustomerProductBean;
import com.bean.CustomerTypeBean;
import com.bean.ProductBean;
import com.bean.SectorBean;
import com.bean.UserBean;
import com.controller.DBConnection;
import com.google.gson.Gson;
import com.util.HibernateUtil;

public class AllListDAO {

	public UserBean checkLogin(String username, String password) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		UserBean userBean = new UserBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from UserBean where username ='" + username + "' and password = '"
					+ password + "' and active = 1");
			userBean = (UserBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return userBean;
	}
	
	
	public UserBean checkUsername(String username) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		UserBean userBean = new UserBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from UserBean where username ='" + username + "'");
			userBean = (UserBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return userBean;
	}
	
	
	public SectorBean checksector(String sector_name) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		SectorBean sectorBean = new SectorBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from SectorBean where sector_name ='" + sector_name + "'");
			sectorBean = (SectorBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return sectorBean;
	}
	
	
	public ProductBean checkproduct(String product_name) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		ProductBean productBean = new ProductBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from ProductBean where product_name ='" + product_name + "'");
			productBean = (ProductBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return productBean;
	}
	
	// Details Of User By User id
		public UserBean detailsOfUserByUserId(int uId) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			UserBean userBean = new UserBean();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from UserBean where user_id = '" + uId + "'");
				userBean = (UserBean) query.uniqueResult();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				// e.printStackTrace();
			} finally {
				session.close();
			}
			return userBean;
		}
		
	// Details Of Customer using customer_id
	public CustomerBean customerDetails(int cId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		CustomerBean customerBean = new CustomerBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from CustomerBean where customer_id = '" + cId + "'");
			System.out.println(query);
			customerBean = (CustomerBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return customerBean;
	}
	
	
	// Details Of Customer using username
	public CustomerBean customerDetailsByUsername(String username) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		CustomerBean customerBean = new CustomerBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from CustomerBean where username = '" + username + "'");
			
			customerBean = (CustomerBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return customerBean;
	}
	
	// List Of Sector
	public List<SectorBean> listOfSector() {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<SectorBean> listOfExpo = new ArrayList<SectorBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"from SectorBean order by sector_id DESC");
			listOfExpo = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfExpo;
	}
	
	
	// List Of Customer Type
	public List<CustomerTypeBean> listOfCustomerType() {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<CustomerTypeBean> listOfExpo = new ArrayList<CustomerTypeBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from CustomerTypeBean where customer_type_id != 1");
			listOfExpo = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfExpo;
	}

	
	// List Of Product
	public List<ProductBean> listOfProduct() {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<ProductBean> listOfExpo = new ArrayList<ProductBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from ProductBean");
			listOfExpo = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
				System.out.println("Error"+e.getMessage());
			}
			 e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfExpo;
	} 
	
	
/*	// List Of Customer Type
	public List<ProductBean> listOfProductusingpId(int pId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<ProductBean> listOfExpo = new ArrayList<ProductBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from ProductBean where product_id ='"+pId+"'");
			listOfExpo = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfExpo;
	}
	
	*/
	
	// List Of Customer Type
	public List<ProductBean> listOfProductusingpId(int pId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<ProductBean> listOfExpo = new ArrayList<ProductBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from ProductBean where product_id ='"+pId+"'");
			//Query query = session.createQuery("from  ProductBean inner join SectorBean b on a.sector_id=b.sector_id where product_id ='"+pId+"'");
			//   Query query = session.createQuery("select distinct  b.sector_name from product_tbl inner join sector_tbl b on a.sector_id=b.sector_id where a.product_id ='"+pId+"'");
			   listOfExpo = query.list();
			   System.out.println("query"+ query);
			   System.out.println("listOfExpo"+ listOfExpo.size());
			   
			  
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfExpo;
	}
	
	
	// List Of Customer Type
	public List<ProductBean> listOfProductusingpIdgroupbySectroId(int pId ,int sector_id) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<ProductBean> listOfExpo = new ArrayList<ProductBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from ProductBean where product_id ='"+pId+"' group by '"+sector_id+"'");
			System.out.println("query :"+query);
			listOfExpo = query.list();
		
			
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfExpo;
	}
	
	// List Of Product
		public List<CustomerBean> listOfCustomer() {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<CustomerBean> listOfExpo = new ArrayList<CustomerBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from CustomerBean");
				listOfExpo = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				 e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfExpo;
		} 
	
		// List Of Product
		public List<CustomerBean> listOfOnlyCustomer() {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<CustomerBean> listOfExpo = new ArrayList<CustomerBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from CustomerBean where customer_type_id = 3");
				listOfExpo = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				 e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfExpo;
		} 
		
		// List Of Product
		public List<CustomerBean> listOfOnlyAdmin() {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<CustomerBean> listOfExpo = new ArrayList<CustomerBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from CustomerBean where customer_type_id = 4");
				listOfExpo = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				 e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfExpo;
		} 
		
		
		public List<CustomerBean> listOfOnlyServiceEng() {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<CustomerBean> listOfExpo = new ArrayList<CustomerBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from CustomerBean where customer_type_id = 2");
				listOfExpo = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				 e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfExpo;
		} 
		
		public ProductBean getListOfProductfromId(int pId){
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;
	        ProductBean productBean = null;
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            productBean = (ProductBean) session.createQuery("from ProductBean where product_id ='"+pId+"'").uniqueResult();    
	            
	            tx.commit();
	        } catch (Exception e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	           
	        } finally {
	            session.close();
	        }
	        return productBean;
	    }
	
		// List Of Product
				public List<CustomerProductBean> listOfCustomerProduct2(int customer_id ,int sector_id ,int product_id) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<CustomerProductBean> listOfExpo = new ArrayList<CustomerProductBean>();
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery("from CustomerProductBean where customer_id = "+customer_id+" and sector_id = "+sector_id+" and product_id = "+product_id+"");
						listOfExpo = query.list();
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						 e.printStackTrace();
					} finally {
						session.close();
					}
					return listOfExpo;
				} 

				
				public List<Integer> listOfCustomerProduct3(int custId ,int sector_id) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<Integer> listOfWork = new ArrayList<Integer>();
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = null;

						query = session.createQuery("Select productBean.product_id from CustomerProductBean  where customer_id = '" + custId+ "' and sector_id = "+sector_id+" group by productBean.product_id");
						System.out.println("Query new: "+query);

						listOfWork = query.list();
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						e.printStackTrace();
						System.out.println("Query new: "+e.getMessage());
					} finally {
						session.close();
					}
					return listOfWork;
				}

				
				// List Of Product
				public List<CustomerProductBean> listOfCustomerProduct(int value) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<CustomerProductBean> listOfExpo = new ArrayList<CustomerProductBean>();
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery("from CustomerProductBean where customer_id = "+value+"");
						listOfExpo = query.list();
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						 e.printStackTrace();
					} finally {
						session.close();
					}
					return listOfExpo;
				} 
				
				
				// List Of Product
				public List<CustomerProductBean> listOfCustomerProductusingProdid(int product_id ,int customer_id) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<CustomerProductBean> listOfExpo = new ArrayList<CustomerProductBean>();
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery("from CustomerProductBean where product_id = "+product_id+" and customer_id = "+customer_id+"");
						listOfExpo = query.list();
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						 e.printStackTrace();
					} finally {
						session.close();
					}
					return listOfExpo;
				} 
				
				
		/*		public List<CustomerProductBean> listOfgroupbtSector() {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<CustomerProductBean> listOfExpo = new ArrayList<CustomerProductBean>();
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery("from CustomerProductBean group by sector_id");
						listOfExpo = query.list();
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						 e.printStackTrace();
					} finally {
						session.close();
					}
					return listOfExpo;
				} 
*/
				
				public List<Integer> listOfgroupbtSector(int custId) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<Integer> listOfWork = new ArrayList<Integer>();
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = null;

						query = session.createQuery("Select sectorBean.sector_id from CustomerProductBean  where customer_id = '" + custId+ "' group by sectorBean.sector_id");
						System.out.println("Query new: "+query);
						

						listOfWork = query.list();
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						e.printStackTrace();
						System.out.println("Query new: "+e.getMessage());
					} finally {
						session.close();
					}
					return listOfWork;
				}

				/*public String listOfgroupbtSector(int custId) throws SQLException {
					String output = null;
					String json = null;
					String a1  = null;
					String a2  = null;
				 	Statement smt;
					Connection conn;
					conn = DBConnection.getConnection();
					DatabaseMetaData dbm = conn.getMetaData();
					boolean result = false;
						if (conn != null) 
						{

							try {

								smt = conn.createStatement();
								String sql = "";
								sql = "select distinct  b.sector_name , b.sector_id from cust_prod_tbl a inner join sector_tbl b on a.sector_id=b.sector_id where customer_id = '"+custId+"'";
								Gson gsonObj = new Gson();
								Map<Object,Object> map = null;
								List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
								
								ResultSet rs1 = smt.executeQuery(sql);
								
								int iCheck = 0;
								while(rs1.next()) {
									result = true;
									a1 = rs1.getString(1);
									a2 = rs1.getString(2);
									System.out.println("a1 :"+a1);
									
									map = new HashMap<Object,Object>();
									
									map.put("y", a1); 
									map.put("x", a2); 
									list.add(map);

									//output =  output + "{\"product_count\":\"" +a1+"\",\"time_stamp\":\"" +a2+"\",\"sr_no\":\"" +a3+"\",\"user_id\":\"" +ID+"\"}";
									//System.out.println("a2"+a2);
								}
									output = gsonObj.toJson(list);
								 //  json = new Gson().toJson(map);
								
							} catch (SQLException e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							}
						}
						
					
						return output;
					
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<String> listOfProdcut = new ArrayList<String>();
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery(
								"SELECT productMasterBean.product_master_id  from CustomerProductBean where active = 1 and customerBean = '"
										+ custId + "' group by productMasterBean");

						Query query = session.createQuery("");

						listOfProdcut = query.list();
						
						
						
						
						
						System.out.println("List ni size :"+listOfProdcut.size());
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						 e.printStackTrace();
						 System.out.println("message :"+e.getMessage());
					} finally {
						session.close();
					}
					return listOfProdcut;
				}
				*/
				

				public CustomerProductBean listOfCustomerProductFromprodId(int product_id ,int customer_id){
			        Session session = HibernateUtil.openSession();
			        Transaction tx = null;
			        CustomerProductBean customerProductBean = null;
			        try {
			            tx = session.getTransaction();
			            tx.begin();
			            customerProductBean = (CustomerProductBean) session.createQuery("from CustomerProductBean where product_id ='"+product_id+"' and customer_id = '"+customer_id+"'").uniqueResult();    
			            
			            tx.commit();
			        } catch (Exception e) {
			            if (tx != null) {
			                tx.rollback();
			            }
			           
			        } finally {
			            session.close();
			        }
			        return customerProductBean;
			    }
				
				public CustomerProductBean listOfCustomerProductFromCustProdId(int cust_prod_id){
			        Session session = HibernateUtil.openSession();
			        Transaction tx = null;
			        CustomerProductBean customerProductBean = null;
			        try {
			            tx = session.getTransaction();
			            tx.begin();
			            customerProductBean = (CustomerProductBean) session.createQuery("from CustomerProductBean where cust_prod_id ='"+cust_prod_id+"'").uniqueResult();    
			            
			            tx.commit();
			        } catch (Exception e) {
			            if (tx != null) {
			                tx.rollback();
			            }
			           
			        } finally {
			            session.close();
			        }
			        return customerProductBean;
			    }
				
				// List Of Product
				public List<AttachmentBean> listOfAttachments(int custId , String prodIdd) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<AttachmentBean> listOfExpo = new ArrayList<AttachmentBean>();
					try {
						tx = session.getTransaction();
						tx.begin();
						System.out.println("String prodId"+prodIdd);
						
						int prodId = Integer.parseInt(prodIdd);
						System.out.println("prodId"+prodId);
						Query query = session.createQuery("from AttachmentBean where customer_id = "+custId+" and product_id = "+prodId+"");
						listOfExpo = query.list();
						System.out.println("querys :"+query);
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						 e.printStackTrace();
					} finally {
						session.close();
					}
					return listOfExpo;
				} 	
				
				// List Of Product
				public List<AttachmentBean> listOfAttachment(int custId , int prodId) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<AttachmentBean> listOfExpo = new ArrayList<AttachmentBean>();
					try {
						tx = session.getTransaction();
						tx.begin(); 
						
						Query query = session.createQuery("from AttachmentBean where customer_id = "+custId+" and product_id = "+prodId+"");
						listOfExpo = query.list();
						System.out.println("query :"+query);
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						 e.printStackTrace();
					} finally {
						session.close();
					}
					return listOfExpo;
				} 	
			
	/*			
				public AttachmentBean listOfAttachmentUsingSegment(int custId , int prodId ,String machine_serial_no){
			        Session session = HibernateUtil.openSession();
			        Transaction tx = null;
			        AttachmentBean attachmentBean = null;
			        try {
			            tx = session.getTransaction();
			            tx.begin();
			            attachmentBean = (AttachmentBean) session.createQuery("from AttachmentBean where customer_id = "+custId+" and product_id = "+prodId+" and machine_serial_no = "+machine_serial_no+"").uniqueResult();    
			            
			            tx.commit();
			        } catch (Exception e) {
			            if (tx != null) {
			                tx.rollback();
			            }
			           
			        } finally {
			            session.close();
			        }
			        return attachmentBean;
			    }
				*/
				// List Of Product
				public List<AttachmentBean> listOfAttachmentUsingSegment(int custId , int prodId ,String machine_serial_no) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<AttachmentBean> listOfExpo = new ArrayList<AttachmentBean>();
					try {
						tx = session.getTransaction();
						tx.begin(); 
						
						Query query = session.createQuery("from AttachmentBean where customer_id = "+custId+" and product_id = "+prodId+" and machine_serial_no = "+machine_serial_no+"");
						listOfExpo = query.list();
						System.out.println("query :"+query);
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						 e.printStackTrace();
					} finally {
						session.close();
					}
					return listOfExpo;
				} 	
				
				public SectorBean getListOfSectorfromId(int sId){
			        Session session = HibernateUtil.openSession();
			        Transaction tx = null;
			        SectorBean sectorBean = null;
			        try {
			            tx = session.getTransaction();
			            tx.begin();
			            sectorBean = (SectorBean) session.createQuery("from SectorBean where sector_id ='"+sId+"'").uniqueResult();    
			            
			            tx.commit();
			        } catch (Exception e) {
			            if (tx != null) {
			                tx.rollback();
			            }
			           
			        } finally {
			            session.close();
			        }
			        return sectorBean;
			    }
			
				public List<ProductBean> getListOfProductfromSectorId(int sId) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<ProductBean> listOfExpo = new ArrayList<ProductBean>();
					try {
						tx = session.getTransaction();
						tx.begin(); 
						
						Query query = session.createQuery("from ProductBean where sector_id = "+sId+"");
						listOfExpo = query.list();
						System.out.println("query :"+query);
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						 e.printStackTrace();
					} finally {
						session.close();
					}
					return listOfExpo;
				} 	
				

				public List<CustomerProductBean> getListOfCustomerProductfromSectorId(int sId ,int customer_id) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<CustomerProductBean> listOfExpo = new ArrayList<CustomerProductBean>();
					try {
						tx = session.getTransaction();
						tx.begin(); 
						
						Query query = session.createQuery("from CustomerProductBean where sector_id = "+sId+" and customer_id= "+customer_id+"");
						listOfExpo = query.list();
						System.out.println("query :"+query);
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						 e.printStackTrace();
					} finally {
						session.close();
					}
					return listOfExpo;
				} 	
				

/*				public List<CustomerProductBean> getListOfCustomerProductfromSectorId(int sId) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<CustomerProductBean> listOfExpo = new ArrayList<CustomerProductBean>();
					try {
						tx = session.getTransaction();
						tx.begin(); 
						
						Query query = session.createQuery("from CustomerProductBean where sector_id = "+sId+"");
						listOfExpo = query.list();
						System.out.println("query :"+query);
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						 e.printStackTrace();
					} finally {
						session.close();
					}
					return listOfExpo;
				} */	
				
				public List<AttachmentBean> getListOfExistingFileCheck(int customer_id,String attachment_name)
				{
				    List<AttachmentBean> listOfExistingFileCheck = new ArrayList<AttachmentBean>();
				    Session session = HibernateUtil.openSession();
				    Transaction tx = null;        
				    try {
				        tx = session.getTransaction();
				        tx.begin();
				        listOfExistingFileCheck = session.createQuery("FROM AttachmentBean where customer_id ='"+customer_id+"' and attachment_name='"+attachment_name+"'" ).list();                        
				        tx.commit();
				    } catch (Exception e) {
				        if (tx != null) {
				            tx.rollback();
				        }
				       
				    } finally {
				        session.close();
				    }
				    return listOfExistingFileCheck;
				    
				}
				
				public List<Integer> listOfgroupbySectorService(String products) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<Integer> listOfWork = new ArrayList<Integer>();
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = null;

						query = session.createQuery("Select sectorBean.sector_id from ProductBean  where  product_id in ('"+products+"') group by sectorBean.sector_id");
						System.out.println("Query Updated: "+query);
						

						listOfWork = query.list();
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						e.printStackTrace();
						System.out.println("Query new: "+e.getMessage());
					} finally {
						session.close();
					}
					return listOfWork;
				}
				
		/*		
				public List<Integer> listOfgroupbySectorService(int customerRights) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					List<Integer> listOfWork = new ArrayList<Integer>();
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = null;

						query = session.createQuery("Select sectorBean.rights from Sectorbean");
						System.out.println("Query Updated: "+query);
						
						if((customerRights & query) > 0)

						listOfWork = query.list();
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						e.printStackTrace();
						System.out.println("Query new: "+e.getMessage());
					} finally {
						session.close();
					}
					return listOfWork;
				}*/
				public String listOfSector2(int customerRights) throws SQLException {
					String output = null;
					String json = null;
					int a1  = 0;
					String a2  = null;
				 	Statement smt;
					Connection conn;
					conn = DBConnection.getConnection();
					DatabaseMetaData dbm = conn.getMetaData();
					boolean result = false;
						if (conn != null) 
						{

							try {

								smt = conn.createStatement();
								String sql = "";
								sql = "Select sectorBean.rights from Sectorbean";
								Gson gsonObj = new Gson();
								Map<Object,Object> map = null;
								List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
								
								ResultSet rs1 = smt.executeQuery(sql);
								
								int iCheck = 0;
								while(rs1.next()) {
									result = true;
									a1 = Integer.parseInt(rs1.getString(1));
									System.out.println("a1 :"+a1);
									
									map = new HashMap<Object,Object>();
									
									if((customerRights & a1) >0) {
									map.put("x", a1); 
									list.add(map);

									}else {
										continue;
									}
									//output =  output + "{\"product_count\":\"" +a1+"\",\"time_stamp\":\"" +a2+"\",\"sr_no\":\"" +a3+"\",\"user_id\":\"" +ID+"\"}";
									//System.out.println("a2"+a2);
								}
									output = gsonObj.toJson(list);
								   json = new Gson().toJson(map);
								
							} catch (SQLException e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							}
						}
						
					
						return json;
				}
				
}

package com.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import com.dao.AllInsertDAO;
import com.dao.AllListDAO;
import com.dao.AllUpdateDAO;

public class test {

	public static void main(String[] args) throws UnsupportedEncodingException, ParseException {
		
		
		String encodeText = new EncodeDecode().encodeString("3dViewer");/*YWRkQ2hpbGRTdG9uZUR5bmFtaWNhbGx5*/
		System.out.println(encodeText);
		
		encodeText = "c3RvY2tIaXN0b3J5";
		String decodeText = new EncodeDecode().decodeString(encodeText);
		System.out.println(decodeText);
		
		AllListDAO allListDAO = new AllListDAO();
		AllUpdateDAO allUpdateDAO = new AllUpdateDAO();
		
		/*AllUpdateDAO allUpdateDAO = new AllUpdateDAO();
		List<WorkHistoryBean> listOfworkhistory = allListDAO.listOfWorkHistory(3000);
		System.out.println(listOfworkhistory.size());
		for(WorkHistoryBean workHistoryBean : listOfworkhistory) {
			String wid = workHistoryBean.getWork_history_id();
			System.out.println(wid);
			ChallanLineBean challanLineBean = allListDAO.detailOfChallanById(wid);
			if(challanLineBean != null) {
				System.err.println(challanLineBean.getWorkHistoryBean().getWork_history_id());
				boolean update = allUpdateDAO.updateWorkStockStatus(wid, workHistoryBean.getUserBean().getUser_id(), 2);
				System.out.println("true");
			}
			
		}*/
		
		/*List<Object[]> listOfLine = allListDAO.listOfInvoiceLineId("1901120320162745896");
		
		System.out.println(listOfLine.size());
		
		for(int i=0;i<listOfLine.size();i++) {
			
			Object[] oo = listOfLine.get(i);
			
			System.out.println(oo[0]+"---"+oo[1]);
			
		}*/
		
		
		/*List<InvoiceLineBean> listofInvoiceLine = allListDAO.listOfInvoiceLine();
		
		for(InvoiceLineBean i : listofInvoiceLine) {
			String iid = i.getInvoice_line_id();
			double rate = i.getRate();
			System.out.println("==="+iid+"=========");
			boolean updateInvoiceLine = allUpdateDAO.updateInvoiceRate(iid, rate);
		}*/
		
		
	/*	new sync().challanSync("1301");*/
		
		/*
		List<WorkHistoryBean> listOfWorkHistory = allListDAO.listOfWorkHistory(1);
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		AllUpdateDAO allUpdateDAO = new AllUpdateDAO();
		
		for(WorkHistoryBean ww : listOfWorkHistory) {
			
			String workHistory_id = ww.getWork_history_id();
			
			System.out.println("---"+workHistory_id);
			
			String customerCode = ww.getCustomerBean().getCustomer_code();
			int custId = ww.getCustomerBean().getCustomer_id();
			String kapanName= ww.getKapan_name();
			String lotName = ww.getLot_name();
			String stoneName = ww.getStone_name();
			String actualWeight = ww.getActual_weight();
			String priority = ww.getPriority();
			String color= ww.getColor();
			String clearity = ww.getClearity();
			
			System.out.println("=="+kapanName+"=="+lotName+"=="+stoneName);
			
			boolean deactivateWorkProduct = allUpdateDAO.deactivateWorkProduct(workHistory_id, 0);
			boolean deactivateWorkProductProcess = allUpdateDAO.deactivateWorkProductProcess(workHistory_id,0);
			
			List<ProductMasterBean> listofWorkProduct = allListDAO.listOfProduct();
			
			for(ProductMasterBean pp : listofWorkProduct) {
				
				System.out.println(pp.getProduct_master_id());
				int p_id = pp.getProduct_master_id();

				String customer_code = customerCode;

				WorkHistoryBean w = new WorkHistoryBean();
				w.setWork_history_id(workHistory_id);

				ProductMasterBean p = new ProductMasterBean();
				p.setProduct_master_id(p_id);

				AllInsertDAO allInsertDAO = new AllInsertDAO();
				
				WorkProductBean workProductBean = new WorkProductBean(new Date(), customer_code, p, w, 1);
				boolean workProductInsert = allInsertDAO.workProductInsert(workProductBean, custId);
				String wpId = workProductBean.getWork_product_id();
				WorkProductBean wpb = new WorkProductBean();
				wpb.setWork_product_id(wpId);

				List<ProductProcessBean> listOfProcess = allListDAO.listOfProductProcess(p_id);

				for (ProductProcessBean psb : listOfProcess) {

					int psId = psb.getProduct_process_id();

					ProductProcessBean productProcessBean = new ProductProcessBean();
					productProcessBean.setProduct_process_id(psId);
					Date defaultDate = simpleDateFormat.parse("1900-01-01");
					WorkProductProcessBean workProductProcessBean = new WorkProductProcessBean(customer_code,
							new Date(), defaultDate, defaultDate, "-", "-", 1, "-", w, wpb, productProcessBean,
							kapanName, lotName, stoneName, psb.getProduct_process_name(), 1, actualWeight, priority,
							color, clearity);
					boolean workProductProcessInsert = allInsertDAO.workProductProcessInsert(workProductProcessBean,
							custId);
				}

			}
			
		}*/
		
		
	}
	
}

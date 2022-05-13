package com.paf_project.ElectroGrid.Servlet;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.paf_project.ElectroGrid.Business.PowerconsumptioneService;
import com.paf_project.ElectroGrid.Model.PowerConsumption;
import com.paf_project.ElectroGrid.Model.UnitValue;

/**
 * Servlet implementation class PowerconsumptionServlet
 */
public class PowerconsumptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PowerconsumptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		 	    	
				
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PowerconsumptioneService powerconsumptioneService=new PowerconsumptioneService();
		PowerConsumption powerconsumption = new PowerConsumption();
		
		int cid = Integer.parseInt(request.getParameter("custormerID"));
		int units = Integer.parseInt(request.getParameter("units"));
		
		powerconsumption.setCustomer_ID(cid);
		powerconsumption.setUnits(units);
		
		String output = powerconsumptioneService.addPowerDetails(powerconsumption);
		
		response.getWriter().write(output);
	}
	

	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) 
			 throws ServletException, IOException 
			{ 
					 PowerconsumptioneService powerconsumptioneService=new PowerconsumptioneService();
					 UnitValue unitValue= new UnitValue();
					 
						String uId = request.getParameter("uId");
						int lowerLimit = Integer.parseInt(request.getParameter("lowerLimit")); 
						int upperLimit = Integer.parseInt(request.getParameter("upperLimit")); 
						double cPrice = Double.parseDouble(request.getParameter("cPrice"));
						
						unitValue.setId(uId);
						unitValue.setLower_limit(lowerLimit);
						unitValue.setUpper_limit(upperLimit);
						unitValue.setCurrent_price_per_unit(cPrice);
						
						String output = powerconsumptioneService.updateUnitValue(unitValue);
						
					    response.getWriter().write(output); 
			} 
	


}

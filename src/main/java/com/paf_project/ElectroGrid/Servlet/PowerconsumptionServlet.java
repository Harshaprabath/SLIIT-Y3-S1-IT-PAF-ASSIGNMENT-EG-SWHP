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
				
		 
		
		    	
				PowerconsumptioneService powerconsumptioneService=new PowerconsumptioneService();
				List<UnitValue> unitValues= powerconsumptioneService.getAllUnitValue();
				System.out.print(unitValues);
				
				int x = 5;
		    /*	if(unitValues != null) {
		    		
		    		request.setAttribute("unitValues", unitValues);
		        	request.getRequestDispatcher("powerconsumption.jsp").forward(request, response);
		        	
		        	
		    	}else {
		    		response.sendRedirect("index.jsp");
		    	} */
				
				request.setAttribute("x", x);
	        	request.getRequestDispatcher("powerconsumption.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

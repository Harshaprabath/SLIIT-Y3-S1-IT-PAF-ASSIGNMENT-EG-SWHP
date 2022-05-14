<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page import="com.paf_project.ElectroGrid.Model.*" %>
<%@ page import="com.paf_project.ElectroGrid.Business.*" %>

<%
	PowerconsumptioneService powerconsumptioneService=new PowerconsumptioneService();
	List<UnitValue> unitValues= powerconsumptioneService.getAllUnitValue();
	List<PowerConsumption> powerConsumptions = powerconsumptioneService.getAll();
	
	UnitValue unitValuerow = new UnitValue();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Power Consumption</title>

<link rel="stylesheet" href="views/bootstrap.min.css">

<link rel="stylesheet" href="views/powerconsumption.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="components/pconsumption.js"></script>



</head>
<body>

<figure class="text-center">
  <blockquote class="blockquote">
    <h2><b>Power Consumption Management.</b></h2>
  </blockquote>
  <figcaption class="blockquote-footer">
    edit unit value details, calculate and store consumption
  </figcaption>
</figure>

<div class="container-xl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Units <b>Value</b></h2>
					</div>
					<div class="col-sm-6">
												
					</div>
				</div>
			</div>
			
			
			<table class="table table-striped table-hover">
				<thead>
					<tr>
					    <td></td>					
						<th>Lower Limit</th>
						<th>Upper Limit </th>
						<th>current Price Per Unit</th>
						<th>Actions </th>
					</tr>
				</thead>
				<tbody>
				
				<%for (int recodeCount = 0; recodeCount < unitValues.size();recodeCount++){ %>
					<% UnitValue unitValue = unitValues.get(recodeCount); %>
					<% unitValuerow = unitValue; %>
					<tr>
						<td></td>						
						<td><%=unitValue.getLower_limit() %></td>
						<td><%=unitValue.getUpper_limit() %></td>
						<td><%=unitValue.getCurrent_price_per_unit() %></td>
						<td>
							<a href="#editUnitDetailsModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							
						</td>
					</tr>
				<%} %>
					
				</tbody>
			</table>
		
		</div>
	</div>        
</div>
 

<!-- Edit Modal HTML -->
<div id="editUnitDetailsModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="PCEditform" name="PCEditform">
				<div class="modal-header">						
					<h4 class="modal-title">Edit Unit Details</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<input id="uId" name="uId" value=<%=unitValuerow.getId() %>  type ="hidden">
				<div class="modal-body">					
					<div class="form-group">
						<label>Lower Limit</label>
						<input id="lowerLimit" name="lowerLimit" type="number" class="form-control"  value=<%=unitValuerow.getLower_limit() %> required>
					</div>
					<div class="form-group">
						<label>Upper Limit</label>
						<input id="upperLimit" name="upperLimit" type="number" class="form-control"  value=<%=unitValuerow.getUpper_limit()%> required>
					</div>
					<div class="form-group">
						<label>current Price Per Unit</label>
						<input id="cPrice" name="cPrice" type="number" class="form-control" value=<%=unitValuerow.getCurrent_price_per_unit() %> required>
					</div>					
				</div>
				<div id="alertSuccess" class="alert alert-success"></div>
			 	<div id="alertError" class="alert alert-danger"></div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input id="btnEdit" name="btnEdit" type="submit" class="btn btn-info" value="Save">
				</div>
			</form>
		</div>
	</div>
</div>


<div class="container-xl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Power Consumption <b>Details</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addPowerConsumptionModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add</span></a>
											
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th></th>
						<th>Customer ID</th>
						<th>value</th>
						<th>date</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				
				<%for (int recodeCount = 0; recodeCount < powerConsumptions.size();recodeCount++){ %>
					<% PowerConsumption powerConsumption = powerConsumptions.get(recodeCount); %>
					<tr>
						<td></span>
						</td>
						<td><%=powerConsumption.getCustomer_ID() %></td>
						<td><%=powerConsumption.getValue() %></td>
						<td><%=powerConsumption.getDate() %></td>
						<td>
							<a href="#deletePowerConsumptionModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
		
		</div>
	</div>        
</div>

<!-- Edit Modal HTML -->
<div id="addPowerConsumptionModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="PCAddform" name="PCAddform" >
				<div class="modal-header">						
					<h4 class="modal-title">Add PowerConsumption</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>Customer ID</label>
						<input type="number" class="form-control" id="custormerID" name ="custormerID" required>
					</div>
					<div class="form-group">
						<label>Units</label>
						<input type="number" class="form-control" id="units" name ="units" required>
					</div>					
				</div>
				 <div id="addalertSuccess" class="alert alert-success"></div>
			 	 <div id="addalertError" class="alert alert-danger"></div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input id="btnSave" name="btnSave" type="submit" class="btn btn-success" value="Calculate & Add">
				</div>
			</form>
			
		</div>
	</div>
</div>
<!-- Delete Modal HTML -->
<div id="deletePowerConsumptionModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form  id="deleteform" name="deleteform">
				<div class="modal-header">						
					<h4 class="modal-title">Delete PowerConsumption</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>Are you sure you want to delete these Records?</p>
					<p class="text-warning"><small>This action cannot be undone.</small></p>
				</div>
				<input id="uId" name="uId" value=<%=unitValuerow.getId() %>  type ="hidden">
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input id="btndelete" name="btndelete" type="submit" class="btn btn-danger" value="Delete">
				</div>
			</form>
		</div>
	</div>
</div>

</div>


</body>
</html>
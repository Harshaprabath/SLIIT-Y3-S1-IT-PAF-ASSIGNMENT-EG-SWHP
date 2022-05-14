/**
 * 
 */
 

$(document).ready(function(){
	
	alert("Loaded");
});

function validateItemForm() {

	if ($("#custormerID").val().trim() == "") {
		return "Insert Customer ID.";
	}
	if ($("#units").val().trim() == "") {
		return "Insert Units Count.";
	}
	return true;
}

// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {

	// Clear alerts---------------------
	$("#addalertSuccess").text("");
	$("#addalertSuccess").hide();
	$("#addalertError").text("");
	$("#addalertError").hide();

	// Form validation-------------------
	var status = validateItemForm();

	if (status != true) {
		$("#addalertError").text(status);
		$("#addalertError").show();
		return;
	}

	

	$.ajax({
		url : "PowerconsumptionServlet",
		type : "POST",
		data : $("#PCAddform").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onItemSaveComplete(response.responseText, status);
		}
	});
});

function onItemSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#addalertSuccess").text("Successfully saved.");
			$("#addalertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#addalertError").text(resultSet.data);
			$("#addalertError").show();
		}
	} else if (status == "error") {
		$("#addalertError").text("Error while saving.");
		$("#addalertError").show();
	} else {
		$("#addalertError").text("Unknown error while saving..");
		$("#addalertError").show();
	}
	$("#hidItemIDSave").val("");
	$("#PCAddform")[0].reset();
}

// Edit ============================================

function validateEditForm() {

	if ($("#lowerLimit").val().trim() == "") {
		return "Insert lower limit.";
	}
	if ($("#upperLimit").val().trim() == "") {
		return "Insert upper limit.";
	}
	if ($("#cPrice").val().trim() == "") {
		return "Insert curent price.";
	}
	return true;
}

$(document).on("click", "#btnEdit", function(event) {

	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	// Form validation-------------------
	var status = validateEditForm();

	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}

	

	$.ajax({
		url : "PowerconsumptionServlet",
		type : "PUT",
		data : $("#PCEditform").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onItemEditComplete(response.responseText, status);
		}
	});
});

function onItemEditComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidItemIDSave").val("");
}


//delete================================================================
$(document).ready(function() {
		$.ajax({
				url: "PowerconsumptionServlet",
				type: "DELETE",
				data : $("#deleteform").serialize(),
				dataType : "text",
				cache: false,
				omplete : function(response, status) {
					onItemEditComplete(response.responseText, status);
				}
			});
		$(document).on("click", ".btndelete", function() {
				var $ele = $(this).parent().parent();
							$.ajax({
								url: "PowerconsumptionServlet",
								type: "DELETE",
								cache: false,
								data:{
								id: $(this).attr("id")
								},
								success: function(dataResult){
								var dataResult = JSON.parse(dataResult);
									if(dataResult.statusCode==name){
									$ele.fadeOut().remove();
									}
								}
							});
		});
});
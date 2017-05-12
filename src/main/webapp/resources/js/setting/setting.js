
function AllowDrop(event){
    event.preventDefault();
}
function Drag(event){
    event.dataTransfer.setData("text",event.currentTarget.id);
}
function Drop(event){
    event.preventDefault();
    var data=event.dataTransfer.getData("text");
    event.currentTarget.appendChild(document.getElementById(data));
}



function closeAllHrContent() {
	$("#person").hide();
	$("#manageContent").hide();
	$("#banContent").hide();

	$("#groupContent").hide();
	$("#managegroupContent").hide();
	$("#bangroupContent").hide();
	$("#addMembergroupContent").hide();
	$("#editMembergroupContent").hide();

	$("#AgentreasonContent").hide();
	$("#manageAgentreasonContent").hide();
	$("#banAgentreasonContent").hide();
	$("#addMemberAGRContent").hide();
	$("#editMemberAGRContent").hide();

	$("#CommonlinkContent").hide();
	$("#0Commonlink").hide();
	$("#comm").hide();
	$("#commTB").hide();
	$("#addMemberContentcomm").hide();
	$("#editMemberContentcomm").hide();

	$("#AMContent").hide();
	$("#manageAMContent").hide();
	$("#banAMContent").hide();
	$("#addMemberAMContent").hide();
	$("#editMemberAMContent").hide();

	$("#AGContent").hide();
	$("#manageAGContent").hide();
	$("#banAGContent").hide();
	$("#addMemberAGContent").hide();
	$("#editMemberAGContent").hide();

	$("#ADContent").hide();
	$("#manageADContent").hide();
	$("#banADContent").hide();
	$("#addMemberADContent").hide();
	$("#editMemberADContent").hide();

	$("#addMemberContent").hide();
	$("#editMemberContent").hide();
	
	
	$("#addActivity").hide();
	$("#showAddRoot").hide();
	$('#ActivityView').hide();
	
	
	

	
	
	

	$("#hrTabControlButton button").removeClass("btn-primary");
	$("#hrTabControlButton button").addClass("btn-success");
}
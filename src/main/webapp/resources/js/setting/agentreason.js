function showAgentreason() {
	
            closeAllHrContent();
            $("#AgentreasonContent").show();
            $("#manageAgentreasonContent").show();
           
            $("button.Agentreason").removeClass("btn-success");
            $("button.Agentreason").addClass("btn-primary");
                  select2();
	}


function select2(){
	$("#manageAgentreasonTable tbody tr").empty();
 	$("#banAgentreasonTable tboby tr").empty();
    $.ajax({                              
        url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Select_agentreason",
		        data:{
		        	flag:0
		        	 },
		         type : "POST",                                                                    
		         dataType:'json',
		         
		         error:function(e){                                                                 
		         alert("失敗");
		         callback(data);
		         },
		         success:function(data){ 
		      		console.log("啟用值機",data);
	 
//		        	alert(JSON.stringify(data.person));
		        	$('#manageAgentreasonTable').DataTable( {
		        		destroy: true,
		        		aaData: data.agentreason,
		        		aoColumns: [
					{ data:   "dbid",
		                render: function ( data, type, row ) {
		                    if ( type === 'display' ) {
		                        return '<input type="checkbox" class="editor-active" value='+data+'>';
		                    }
		                    return data;
		                },
		            className: "dt-body-center" },
	                    { "data": "statusname" },
	                    { "data": "statusname_cn" },
	                    { "data": "statusname_en" },
	                    { "data": "statusname_tw" },
	                    { "data": "description" },
	                    { "data": "alarmduration" },
	                    { "data": "alarmcolor" },
	                    { "data": "flag" }
	                ],
	              lengthChange: false
	            } ); 
		        	agentreason2()
		    }  
	     });
		         
    
    $("#manageAgentreasonTable").css("width","100%");
    $("#manageAgentreasonTable_filter").prop("style","float:right;");
    $("#manageAgentreasonTable_wrapper > div:nth-child(1)").hide();

    $("#manageAgentreasonTableSearch").keyup(function(){
        var searchText = $("#manageAgentreasonTableSearch").val();

        $("input[aria-controls='manageAgentreasonTable']").val(searchText);
        $("input[aria-controls='manageAgentreasonTable']").trigger("keyup");
    });

    $.ajax({                              
        url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Select_agentreason",
	        data:{
	        	flag:1
	        	 },
	         type : "POST",                                                                    
	         dataType:'json',
	         
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){
		      		console.log("停用值機",data);

//		        	alert(JSON.stringify(data.person));
	        	$('#banAgentreasonTable').DataTable( {
	        		destroy: true,
	        		aaData: data.agentreason,
	        		aoColumns: [
					{ data:   "dbid",
		                render: function ( data, type, row ) {
		                    if ( type === 'display' ) {
		                        return '<input type="checkbox" class="editor-active" value='+data+'>';
		                    }
		                    return data;
		                },
		                className: "dt-body-center" },
		                { "data": "statusname" },
	                    { "data": "statusname_cn" },
	                    { "data": "statusname_en" },
	                    { "data": "statusname_tw" },
	                    { "data": "description" },
	                    { "data": "alarmduration" },
	                    { "data": "alarmcolor" },
	                    { "data": "flag" }
                ],
              lengthChange: false
            } ); 
	        	agentreason2()
	    }  
     });
     
    $("#banAgentreasonTable").css("width","100%");
    $("#banAgentreasonTable_filter").prop("style","float:right;");
    $("#banAgentreasonTable_wrapper > div:nth-child(1)").hide();

    $("#banAgentreasonTableSearch").keyup(function(){

        var searchText = $("#banAgentreasonTableSearch").val();

        $("input[aria-controls='banAgentreasonTable']").val(searchText);
        $("input[aria-controls='banAgentreasonTable']").trigger("keyup");
    });
} 


function agentreason2() {
 	  $("#manageAgentreasonTable tbody tr td,#banAgentreasonTable tbody tr td").on("click",function(){
           var text = $(this).text();
           if (text && text != "") {
               showEditMemberAgentreason();
           }
       });
 	}

//
//
//顯示 啟用表格
function showManage_Agentreason(){
	closeAllHrContent();

	$("#AgentreasonContent").show();
	$("#manageAgentreasonContent").show();
	
	$("button.manageAgentreason").removeClass("btn-success");
    $("button.manageAgentreason").addClass("btn-primary");
 
}
//顯示 停用表格
function showBan_Agentreason(){
	closeAllHrContent();

	$("#AgentreasonContent").show();
	$("#banAgentreasonContent").show();
	
	$("button.ban").removeClass("btn-success");
    $("button.ban").addClass("btn-primary");

}
//
//新增畫面
function showAddMemberAGR() {
    closeAllHrContent();
    $("#AgentreasonContent").show();
    $("#addMemberAGRContent").show();

    $("button.addMember").show();
    $("button.addMember").removeClass("btn-success");
    $("button.addMember").addClass("btn-primary");
}

//關閉新增畫面
function closeAddMemberAGR() {
    closeAllHrContent();
    $("button.addMember").hide();
    
    $("#AgentreasonContent").show();
    $("#manageAgentreasonContent").show();
    
    $("button.manage").removeClass("btn-success");
    $("button.manage").addClass("btn-primary");
}

//新增功能
function sendAddMemberAgentreason() {
	 closeAddMember();
	 var alarmcolor = document.getElementById('Insert_alarmcolor').value;
	 var alarmduration = document.getElementById('Insert_alarmduration').value;
	 var description = document.getElementById('Insert_description').value;
	 var statusname = document.getElementById('Insert_statusname').value;
	 var statusname_cn = document.getElementById('Insert_statusname_cn').value;
	 var statusname_en = document.getElementById('Insert_statusname_en').value;
	 var statusname_tw = document.getElementById('Insert_statusname_tw').value;
	 var createuserid = document.getElementById('Insert_createuserid').value;
	
	 $.ajax({                              
          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Insert_agentreason",
	         data:{
	        	 flag:0,
	        	 alarmcolor:alarmcolor,
	        	 alarmduration:alarmduration,
	        	 description:description,
	        	 statusname:statusname,
	        	 statusname_cn:statusname_cn,
	        	 statusname_en:statusname_en,
	        	 statusname_tw:statusname_tw,
	        	 createuserid:createuserid
	        	 },
	         type : "POST",                                                                    
	         dataType:'json',
	         
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){
	        	 select2()
	   		     }
	   		        
	   		 });
    showToastSuccess("新增成功");
     closeAllHrContent();
     $("#AgentreasonContent").show();
     $("#manageAgentreasonContent").show();
 }



//更新頁面
function showEditMemberAgentreason() {
    closeAllHrContent();
    $("#AgentreasonContent").show();
    $("#editMemberAGRContent").show();

    $("button.editMember").show();
    $("button.editMember").removeClass("btn-success");
    $("button.editMember").addClass("btn-primary");
}
//更新頁面關閉
function closeEditMemberAgentreason() {
    closeAllHrContent();
    $("button.editMember").hide();
    $("#AgentreasonContent").show();
	$("#manageAgentreasonContent").show();

    $("button.manage").removeClass("btn-success");
    $("button.manage").addClass("btn-primary");
}



function sendEditMemberAgentreason() {

 closeEditMember();
 var flag = document.getElementById('Update_flag').value;
 var dbid = document.getElementById('Update_id').value;;
 var alarmcolor = document.getElementById('alarmcolor').value;
 var alarmduration = document.getElementById('alarmduration').value;
 var description = document.getElementById('description').value;
 var statusname = document.getElementById('statusname').value;
 var statusname_cn = document.getElementById('statusname_cn').value;
 var statusname_en = document.getElementById('statusname_en').value;
 var statusname_tw = document.getElementById('statusname_tw').value;

 $.ajax({                              
      url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Update_agentreason",
         data:{
        	 flag:flag,
        	 dbid:dbid,
        	 alarmcolor:alarmcolor,
        	 alarmduration:alarmduration,
        	 description:description,
        	 statusname:statusname,
        	 statusname_cn:statusname_cn,
        	 statusname_en:statusname_en,
        	 statusname_tw:statusname_tw
        	 },
            
         type : "POST",                                                                    
         dataType:'json',
         
         error:function(e){                                                                 
         alert("失敗");
         callback(data);
         },
         success:function(data){
        	 select2()
   		     }
   		        
   		 }); 
showToastSuccess("修改成功");
 	closeAllHrContent();
 	$("#AgentreasonContent").show();
    $("#manageAgentreasonContent").show();
}


//解鎖對話視窗
function unlockAccountAgentreason() {
    $("#unlockButtonAGR").trigger("click");

}


//停用對話視窗
function confirmBanAgentreason() {
    $("#confirmBanButtonAGR").trigger("click");
}

function AgentreasonDelete(message) {
	var dbid = document.getElementById('D_id').value;
  	 
	 $.ajax({                              
         url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Delete_AgentReason",
	         data:{			        
	        	 dbid:dbid
	        	 },
	         type : "POST",                                                                    
	         dataType:'json',
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){
	        	 select2()
	     	}  
	 }); 
   toastr.success(message);
    closeAllHrContent();
 	$("#AgentreasonContent").show();
	$("#manageAgentreasonContent").show();
}


function AgentreasonLuck(message) {
	 var flag = document.getElementById('Delete_flag').value;
	 var dbid = document.getElementById('Delete_id').value;

	 $.ajax({                              
          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/LogicDelete_agentreason",
	         data:{
	        	 flag:flag,
	        	 dbid:dbid
	        	 },
	         type : "POST",                                                                    
	         dataType:'json',
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){
	        	 select2()
	     	}  
	 });
    toastr.error(message);
    closeAllHrContent();
    $("#AgentreasonContent").show();
    $("#manageAgentreasonContent").show();
}



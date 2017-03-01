function showActivityData() {
	
            closeAllHrContent();
            $("#ADContent").show();
            $("#manageADContent").show();
           
            $("button.Agentreason").removeClass("btn-success");
            $("button.Agentreason").addClass("btn-primary");
                  AD();
                  $("#manageTableAD tbody tr").empty();
               	$("#banTableAD tboby tr").empty();
	}


function groupAD(){
	$("#manageTableAD tbody tr").empty();
 	$("#banTableAD tboby tr").empty();
 	
	var dbid = document.getElementById("menuAD").value
$.ajax({                              
    url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/FLAGDATA",
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
		      		console.log("啟用服務代碼",data);
	 
//	        	alert(JSON.stringify(data.person));
	        	$('#manageTableAD').DataTable( {
	        		destroy: true,
	        		aaData: data.activitydata,
	        		aoColumns: [
				{ data:   "dbid",
	                render: function ( data, type, row ) {
	                    if ( type === 'display' ) {
	                        return '<input type="checkbox" class="editor-active" value='+data+'>';
	                    }
	                    return data;
	                },
	            className: "dt-body-center" },
                    { "data": "dbid" },
                    { "data": "createdatetime" },
                    { "data": "codename" },
                    { "data": "color" },
                    { "data": "deleteflag" },
                    { "data": "titlegroup" },
                    { "data": "titleflag" },
                    { "data": "sort" }
                
                ],
              lengthChange: false
            } ); 
	     AD2();
	    }  
     });
	         

$("#manageTableAD").css("width","100%");
$("#manageTableAD_filter").prop("style","float:right;");
$("#manageTableAD_wrapper > div:nth-child(1)").hide();

$("#manageTableADSearch").keyup(function(){
    var searchText = $("#manageTableADSearch").val();

    $("input[aria-controls='manageTableAD']").val(searchText);
    $("input[aria-controls='manageTableAD']").trigger("keyup");
});

$.ajax({                              
    url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/FLAGDATA",
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
	      		console.log("停用服務代碼",data);

//	        	alert(JSON.stringify(data.person));
        	$('#banTableAD').DataTable( {
        		destroy: true,
        		aaData: data.Flag,
        		aoColumns: [
				{ data:   "dbid",
	                render: function ( data, type, row ) {
	                    if ( type === 'display' ) {
	                        return '<input type="checkbox" class="editor-active" value='+data+'>';
	                    }
	                    return data;
	                },
	                className: "dt-body-center" },
	                { "data": "dbid" },
                    { "data": "createdatetime" },
                    { "data": "codename" },
                    { "data": "color" },
                    { "data": "deleteflag" },
                    { "data": "titlegroup" },
                    { "data": "titleflag" },
                    { "data": "sort" }
            ],
          lengthChange: false
        } ); 
     AD2();
    }  
 });
 
$("#banTableAD").css("width","100%");
$("#banTableAD_filter").prop("style","float:right;");
$("#banTableAD_wrapper > div:nth-child(1)").hide();

$("#banTableADSearch").keyup(function(){

    var searchText = $("#banTableADSearch").val();

    $("input[aria-controls='banTableAD']").val(searchText);
    $("input[aria-controls='banTableAD']").trigger("keyup");
});
} 



function AD(){
	
	 $.ajax({                              
          url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query_ActivityGroup",
	         data:{
	        	 dbid:0
	        	 },
	         type : "POST",                                                                    
	         dataType:'json',
	         
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){
	        	 $('#menuAD').empty();
	        	var menu1 = "<option></option>"
		        	document.getElementById("menuAD").insertAdjacentHTML("BeforeEnd",menu1);
	        	 for(var i=0; i<data.activitygroups.length; i++){
	        	 var menu = "<option value='"+data.activitygroups[i].dbid+"'>"+data.activitygroups[i].groupname+"</option>"
            	 document.getElementById("menuAD").insertAdjacentHTML("BeforeEnd",menu);
	        	 }
     		console.log("服務代碼群組",data);

	     }
	 }); 
	 
		     }
		
		
function AD2() {
 	  $("#manageTableAD tbody tr td,#banTableAD tbody tr td").on("click",function(){
           var text = $(this).text();
           if (text && text != "") {
               showEditMemberAD();
           }
       });
 	}

//
//
//顯示 啟用表格
function showManage_AD(){
	closeAllHrContent();

	$("#ADContent").show();
	$("#manageADContent").show();
	
	$("button.manageAD").removeClass("btn-success");
    $("button.manageAD").addClass("btn-primary");
 
}
//顯示 停用表格
function showBan_AD(){
	closeAllHrContent();

	$("#ADContent").show();
	$("#banADContent").show();
	
	$("button.ban").removeClass("btn-success");
    $("button.ban").addClass("btn-primary");

}
//
//新增畫面
function showAddMemberAD() {
    closeAllHrContent();
    $("#ADContent").show();
    $("#addMemberADContent").show();

    $("button.addMember").show();
    $("button.addMember").removeClass("btn-success");
    $("button.addMember").addClass("btn-primary");
}

//關閉新增畫面
function closeAddMemberAD() {
    closeAllHrContent();
    $("button.addMember").hide();
    
    $("#ADContent").show();
    $("#manageADContent").show();
    
    $("button.manage").removeClass("btn-success");
    $("button.manage").addClass("btn-primary");
}

//新增功能
function sendAddMemberAD() {
	 closeAddMember();
	 var in_activitygroupsid = document.getElementById("menuAD").value;
		var in_codename = document.getElementById("in_codename").value;
		var in_color = document.getElementById("in_color").value;
		var in_titleflag = document.getElementById("in_titleflag").value;
		var in_titlegroup = document.getElementById("in_titlegroup").value;
		//var in_deleteflag = document.getElementById("in_deleteflag").value;
		var in_sort = document.getElementById("in_sort").value;
			
		 $.ajax({                              
	          url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Insert_ActivityData",
		         data:{
		        	 activitygroupsid:in_activitygroupsid,
		        	 codename:in_codename,
		        	 color:in_color,
		        	 titleflag:in_titleflag,
		        	 titlegroup:in_titlegroup,
		        	 deleteflag:0,
		        	 sort:in_sort

		        	 },
		            
		         type : "POST",                                                                    
		         dataType:'json',
		         
		         error:function(e){                                                                 
		         alert("失敗");
		         callback(data);
		         },
		         success:function(data){
		        	 groupAD();
		   		     }
		   		        
		   		 }); 
     showToastSuccess("新增成功");
     closeAllHrContent();
     $("#ADContent").show();
     $("#manageADContent").show();
 }



//更新頁面
function showEditMemberAD() {
    closeAllHrContent();
    $("#ADContent").show();
    $("#editMemberADContent").show();

    $("button.editMember").show();
    $("button.editMember").removeClass("btn-success");
    $("button.editMember").addClass("btn-primary");
}
//更新頁面關閉
function closeEditMemberAD() {
    closeAllHrContent();
    $("button.editMember").hide();
    $("#ADContent").show();
	$("#manageADContent").show();

    $("button.manage").removeClass("btn-success");
    $("button.manage").addClass("btn-primary");
}



function sendEditMemberAD() {

 closeEditMember();
 var up_codename = document.getElementById("up_codenameAD").value;
 var up_color = document.getElementById("up_colorAD").value;
 var up_dbid = document.getElementById("up_dbidAD").value;
 var up_sort = document.getElementById("up_sortAD").value;

	 $.ajax({                              
       url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Update_ActivityData",
	         data:{
	        	 codename:up_codename,
	        	 color:up_color,
	        	 dbid:up_dbid,
	        	 sort:up_sort
	        	 
	        	 },
	            
	         type : "POST",                                                                    
	         dataType:'json',
	         
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){
	        	 groupAD();
	   		     }   		        
	   		 }); 
 showToastSuccess("修改成功");

 	closeAllHrContent();
 	$("#ADContent").show();
	$("#manageADContent").show();
}


//解鎖對話視窗
function unlockAccountAD() {
    $("#unlockButtonAD").trigger("click");

}

function ADLuck(message) {
	 var flag = document.getElementById('Delete_flagAD').value;
	 var dbid = document.getElementById('Delete_idAD').value;

	 $.ajax({                              
          url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_ActivityData",
	         data:{
	        	 deleteflag:flag,
	        	 codename:dbid
	        	 },
	         type : "POST",                                                                    
	         dataType:'json',
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){
	        	 groupAD();
	     	}  
	 }); 
    toastr.error(message);
    closeAllHrContent();
    $("#ADContent").show();
	$("#manageADContent").show();
}



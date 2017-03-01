function showActivityGroup() {
	
            closeAllHrContent();
            $("#AGContent").show();
            $("#manageAGContent").show();
           
            $("button.Agentreason").removeClass("btn-success");
            $("button.Agentreason").addClass("btn-primary");
                  AG();
              	$("#manageTableAG tbody tr").empty();
             	$("#banTableAG tboby tr").empty();
	}

function group(){
	$("#manageTableAG tbody tr").empty();
 	$("#banTableAG tboby tr").empty();
 	var dbid = document.getElementById("menu").value
$.ajax({                              
     url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query_ActivityMenu",
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
		     		console.log("啟用服務代碼群組",data);

//	        	alert(JSON.stringify(data.person));
	        	$('#manageTableAG').DataTable( {
	        		destroy: true,
	        		aaData: data.flag0_group,
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
                    { "data": "groupname" },
                    { "data": "sort" },
                    { "data": "deleteflag" },
                    { "data": "createdatetime" },

                ],
              lengthChange: false
            } ); 
	     AG2();
	    }  
     });
	         

$("#manageTableAG").css("width","100%");
$("#manageTableAG_filter").prop("style","float:right;");
$("#manageTableAG_wrapper > div:nth-child(1)").hide();

$("#manageTableAGSearch").keyup(function(){
    var searchText = $("#manageTableAGSearch").val();

    $("input[aria-controls='manageTableAG']").val(searchText);
    $("input[aria-controls='manageTableAG']").trigger("keyup");
});

$.ajax({                              
     url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query_ActivityMenu",
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
	     		console.log("停用服務代碼群組",data);

//	        	alert(JSON.stringify(data.person));
        	$('#banTableAG').DataTable( {
        		destroy: true,
        		aaData: data.flag1_group,
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
                    { "data": "groupname" },
                    { "data": "sort" },
                    { "data": "createdatetime" },
                    { "data": "deleteflag" }
            ],
          lengthChange: false
        } ); 
     AG2();
    }  
 });
 
$("#banTableAG").css("width","100%");
$("#banTableAG_filter").prop("style","float:right;");
$("#banTableAG_wrapper > div:nth-child(1)").hide();

$("#banTableAGSearch").keyup(function(){

    var searchText = $("#banTableAGSearch").val();

    $("input[aria-controls='banTableAG']").val(searchText);
    $("input[aria-controls='banTableAG']").trigger("keyup");
});
} 



function AG(){
	 $.ajax({                              
	          url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query_ActivityMenu",
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
		        	 $('#menu').empty();
		        	
		        	 var menu1 = "<option></option>"
		        	document.getElementById("menu").insertAdjacentHTML("BeforeEnd",menu1);
		        	 for(var i=0; i<data.activitymenu.length; i++){
		        	 var menu = "<option value='"+data.activitymenu[i].dbid+"'>"+data.activitymenu[i].menuname+"</option>"
             	 document.getElementById("menu").insertAdjacentHTML("BeforeEnd",menu);
		        	 }

	     		console.log("服務代碼清單",data);
		     }
		        
		 });  
		};
	
function AG2() {
 	  $("#manageTableAG tbody tr td,#banTableAG tbody tr td").on("click",function(){
           var text = $(this).text();
           if (text && text != "") {
               showEditMemberAG();
           }
       });
 	}

//
//
//顯示 啟用表格
function showManage_AG(){
	closeAllHrContent();

	$("#AGContent").show();
	$("#manageAGContent").show();
	
	$("button.manageAG").removeClass("btn-success");
    $("button.manageAG").addClass("btn-primary");
 
}
//顯示 停用表格
function showBan_AG(){
	closeAllHrContent();

	$("#AGContent").show();
	$("#banAGContent").show();
	
	$("button.ban").removeClass("btn-success");
    $("button.ban").addClass("btn-primary");

}
//
//新增畫面
function showAddMemberAG() {
    closeAllHrContent();
    $("#AGContent").show();
    $("#addMemberAGContent").show();

    $("button.addMember").show();
    $("button.addMember").removeClass("btn-success");
    $("button.addMember").addClass("btn-primary");
}

//關閉新增畫面
function closeAddMemberAG() {
    closeAllHrContent();
    $("button.addMember").hide();
    
    $("#AGContent").show();
    $("#manageAGContent").show();
    
    $("button.manage").removeClass("btn-success");
    $("button.manage").addClass("btn-primary");
}

//新增功能
function sendAddMemberAG() {
	 closeAddMember();
	 var dbid = document.getElementById("menu").value
	 var in_groupname = document.getElementById('in_groupname').value;
	 var in_sort = document.getElementById('in_sort').value;
	
	 $.ajax({                              
          url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Insert_ActivityGroup",
	         data:{
	        	 activitymenuid:dbid,
	        	 groupname:in_groupname,
	        	 sort:in_sort
	        	 },
	            
	         type : "POST",                                                                    
	         dataType:'json',
	         
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){
	        	 group();
	   		     }
	   		        
	   		 }); 
    showToastSuccess("新增成功");
     closeAllHrContent();
     $("#AGContent").show();
     $("#manageAGContent").show();
 }



//更新頁面
function showEditMemberAG() {
    closeAllHrContent();
    $("#AGContent").show();
    $("#editMemberAGContent").show();

    $("button.editMember").show();
    $("button.editMember").removeClass("btn-success");
    $("button.editMember").addClass("btn-primary");
}
//更新頁面關閉
function closeEditMemberAG() {
    closeAllHrContent();
    $("button.editMember").hide();
    $("#AGContent").show();
	$("#manageAGContent").show();

    $("button.manage").removeClass("btn-success");
    $("button.manage").addClass("btn-primary");
}



function sendEditMemberAG() {

 closeEditMember();
 var dbid = document.getElementById("menu").value
 var up_groupname = document.getElementById('up_groupnameAG').value;
 var up_sort = document.getElementById('up_sortAG').value;
 var up_dbid = document.getElementById('up_dbidAG').value;
 $.ajax({                              
      url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Update_ActivityGroup",
         data:{
        	 activitymenuid:dbid,
        	 groupname:up_groupname,
        	 sort:up_sort,
        	 dbid:up_dbid
        	 },
            
         type : "POST",                                                                    
         dataType:'json',
         
         error:function(e){                                                                 
         alert("失敗");
         callback(data);
         },
         success:function(data){
        	 group();
   		     }  
   		 }); 
showToastSuccess("修改成功");
 	closeAllHrContent();
 	$("#AGContent").show();
	$("#manageAGContent").show();
}


//解鎖對話視窗
function unlockAccountAG() {
    $("#unlockButtonAG").trigger("click");
}

function AGLuck(message) {
	var flag = document.getElementById('Delete_flagAG').value;
	 var dbid = document.getElementById('Delete_idAG').value;

	 $.ajax({                              
         url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_ActivityGroup",
	         data:{
	        	 deleteflag:flag,
	        	 groupname:dbid,
	        	 },
	         type : "POST",                                                                    
	         dataType:'json',
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){
	        	 group();
	     	}  
	 }); 
   toastr.error(message);
    closeAllHrContent();
    $("#AGContent").show();
	$("#manageAGContent").show();
}



function showActivityData() {
	
            closeAllHrContent();
            $("#ADContent").show();
            $("#manageADContent").show();
           
            $("button.Agentreason").removeClass("btn-success");
            $("button.Agentreason").addClass("btn-primary");
                  AD();
	}


function AD(){
	
	 $.ajax({                              
          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Query_ActivityGroup",
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
     		console.log("activitygroups",data);

	     }
	 }); 
	 
		     }
		
		function groupAD(){
			var dbid = document.getElementById("menuAD").value
			  $.ajax({                              
		          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/FLAGDATA",
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
			        	 
			        	 $('#AD0').remove();
			        	 
			        	 var AD00 = "<div class='row ibox' id='AD0'></div>"
			        		 document.getElementById("AD00").insertAdjacentHTML("BeforeEnd",AD00);
			        	 
			        	 var AD0 = "<table class='table table-bordered table-hover' id='manageTableAD' data-pagination='true' data-page-list='[5, 10, 20, 50, 100, 200]'data-search='true' data-url='x'></table>"
			        		 document.getElementById("AD0").insertAdjacentHTML("BeforeEnd",AD0);
			        	 
			        	 
			        $('#manageTableAD').bootstrapTable({
			         columns: [{
			           
			             field: 'dbid',
			             title: 'dbid'
			         }, {
			             field: 'createdatetime',
			             title: 'createdatetime'
			         },
			         {
			             field: 'activitygroupsid',
			             title: 'activitygroupsid'
			         },
			         {
			             field: 'codename',
			             title: 'codename'
			         },
			         {
			             field: 'color',
			             title: 'color'
			         },
			         {
			             field: 'deleteflag',
			             title: 'deleteflag'
			         },
			         {
			             field: 'titlegroup',
			             title: 'titlegroup'
			         },
			         {
			             field: 'titleflag',
			             title: 'titleflag'
			         },{
			             field: 'sort',
			             title: 'sort'
			         }],
			     	data:data.activitydata,
			     	onClickRow : function(row, $element) {
//			     		alert(JSON.stringify(row));
						document.getElementById("up_dbidAD").value=row.dbid;
						document.getElementById("up_codenameAD").value=row.codename;
						document.getElementById("up_colorAD").value=row.color;
						document.getElementById("up_sortAD").value=row.sort;
					},
			     	});"json"
			        AD2();
			        
			        
			        $('#AD1').remove();
		        	 
		        	 var AD11 = "<div class='row ibox' id='AD1'></div>"
		        		 document.getElementById("AD11").insertAdjacentHTML("BeforeEnd",AD11);
		        	 
		        	 var AD1 = "<table class='table table-bordered table-hover' id='banTableAD' data-pagination='true' data-page-list='[5, 10, 20, 50, 100, 200]'data-search='true' data-url='x'></table>"
		        		 document.getElementById("AD1").insertAdjacentHTML("BeforeEnd",AD1);
			       $('#banTableAD').bootstrapTable({
		         columns: [{
		           
		             field: 'dbid',
		             title: 'dbid'
		         }, {
		             field: 'createdatetime',
		             title: 'createdatetime'
		         },{
		             field: 'deletedatetime',
		             title: 'deletedatetime'
		         },
		         {
		             field: 'activitygroupsid',
		             title: 'activitygroupsid'
		         },
		         {
		             field: 'codename',
		             title: 'codename'
		         },
		         {
		             field: 'color',
		             title: 'color'
		         },
		         {
		             field: 'deleteflag',
		             title: 'deleteflag'
		         },
		         {
		             field: 'titlegroup',
		             title: 'titlegroup'
		         },
		         {
		             field: 'titleflag',
		             title: 'titleflag'
		         },{
		             field: 'sort',
		             title: 'sort'
		         }],
		     	data:data.Flag,
		     	onClickRow : function(row, $element) {
//		     		alert(JSON.stringify(row));
					document.getElementById("up_dbidAD").value=row.dbid;
					document.getElementById("up_codenameAD").value=row.codename;
					document.getElementById("up_colorAD").value=row.color;
					document.getElementById("up_sortAD").value=row.sort;
				},
		     	});"json"
			       AD2();
		     	console.log("服務代碼",data);
		     	var a =document.getElementById("menuAD").value;
		     	var b = document.getElementById("Tfalg").value;
		     	var c = a+b
		     	document.getElementById("Tfalg").value = c;
		     	document.getElementById("Tgroup").value=c;
		     	
		         }
			         });
			
	 	 	}
		
		
		

function AD2() {
 	  $("#manageTableAD tbody tr,#banTableAD tbody tr").on("click",function(){
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
	          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Insert_ActivityData",
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
       url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Update_ActivityData",
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
          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/LogicDelete_ActivityData",
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



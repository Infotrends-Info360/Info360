function showActivityGroup() {
	
            closeAllHrContent();
            $("#AGContent").show();
            $("#manageAGContent").show();
           
            $("button.Agentreason").removeClass("btn-success");
            $("button.Agentreason").addClass("btn-primary");
                  AG();
	}


function AG(){
	 $.ajax({                              
	          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Query_ActivityMenu",
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

	     		console.log("activitymenu",data);
		     }
		        
		 });  
		};
		function group(){
	  		var dbid = document.getElementById("menu").value
	 		  $.ajax({                              
	 	          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Query_ActivityMenu",
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
	 		        	 
	 		        	$('#AG0').remove();
			        	 
			        	 var AG00 = "<div class='row ibox' id='AG0'></div>"
			        		 document.getElementById("AG00").insertAdjacentHTML("BeforeEnd",AG00);
			        	 
			        	 var AG0 = "<table class='table table-bordered table-hover' id='manageTableAG' data-pagination='true' data-page-list='[5, 10, 20, 50, 100, 200]'data-search='true' data-url='x'></table>"
			        		 document.getElementById("AG0").insertAdjacentHTML("BeforeEnd",AG0);
	 		        $('#manageTableAG').bootstrapTable({
	 		         columns: [{
	 		           
	 		             field: 'dbid',
	 		             title: '編號'
	 		         }, {
	 		             field: 'createdatetime',
	 		             title: '建立時間'
	 		         },
	 		         {
	 		             field: 'deleteflag',
	 		             title: '開關'
	 		         },
	 		         {
	 		             field: 'groupname',
	 		             title: '群組名稱'
	 		         },
	 		         {
	 		             field: 'sort',
	 		             title: '排序'
	 		         }],
	 		     	data:data.flag0_group,
	 		     	onClickRow : function(row, $element) {
			     		alert(JSON.stringify(row));

						document.getElementById("up_dbidAG").value=row.dbid;
						document.getElementById("up_groupnameAG").value=row.groupname;
						document.getElementById("up_sortAG").value=row.sort;
					},
	 		     	});"json"
	 		       AG2();
	 		        
	 		       
	 		      $('#AG1').remove();
		        	 
		        	 var AG11 = "<div class='row ibox' id='AG1'></div>"
		        		 document.getElementById("AG11").insertAdjacentHTML("BeforeEnd",AG11);
		        	 
		        	 var AG1 = "<table class='table table-bordered table-hover' id='banTableAG' data-pagination='true' data-page-list='[5, 10, 20, 50, 100, 200]'data-search='true' data-url='x'></table>"
		        		 document.getElementById("AG1").insertAdjacentHTML("BeforeEnd",AG1);

		        	 $('#banTableAG').bootstrapTable({
			         columns: [{
			           
			             field: 'dbid',
			             title: '編號'
			         }, {
			             field: 'createdatetime',
			             title: '建立時間'
			         },{
			             field: 'deletedatetime',
			             title: '刪除時間'
			         },
			         {
			             field: 'deleteflag',
			             title: '開關'
			         },
			         {
			             field: 'groupname',
			             title: '群組名稱'
			         },
			         {
			             field: 'sort',
			             title: '開關'
			         }],
			     	data:data.flag1_group,
			     	onClickRow : function(row, $element) {
						document.getElementById("up_dbidAG").value=row.dbid;
						document.getElementById("up_groupnameAG").value=row.groupname;
						document.getElementById("up_sortAG").value=row.sort;
					},
			     	});"json"
		     		console.log("群組",data);
		     		AG2();
	 		         }
	 		         });
	  		
	  		
	 	 	}
		
		
		

function AG2() {
 	  $("#manageTableAG tbody tr,#banTableAG tbody tr").on("click",function(){
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
          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Insert_ActivityGroup",
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
      url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Update_ActivityGroup",
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
         url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/LogicDelete_ActivityGroup",
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



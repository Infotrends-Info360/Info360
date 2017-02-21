function showActivityMenu() {
	
            closeAllHrContent();
            $("#AMContent").show();
            $("#manageAMContent").show();
           
            $("button.Agentreason").removeClass("btn-success");
            $("button.Agentreason").addClass("btn-primary");
                  AM();
	}


function AM(){
	$.ajax({                              
         url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Flag_ActivityMenu",
	         data:{
	        	 deleteflag:0
	        	 },
	            
	         type : "POST",                                                                    
	         dataType:'json',
	         
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){
	        	 
	        	 $('#AM0').remove();
	        	 
	        	 var AM00 = "<div class='row ibox' id='AM0'></div>"
	        		 document.getElementById("AM00").insertAdjacentHTML("BeforeEnd",AM00);
	        	 
	        	 var AM0 = "<table class='table table-bordered table-hover' id='manageTableAM' data-pagination='true' data-page-list='[5, 10, 20, 50, 100, 200]'data-search='true' data-url='x'></table>"
	        		 document.getElementById("AM0").insertAdjacentHTML("BeforeEnd",AM0);
	        	
	        	$('#manageTableAM').bootstrapTable({
	         columns: [{
	           
	             field: 'dbid',
	             title: 'dbid'
	         }, {
	             field: 'createdatetime',
	             title: 'createdatetime'
	         },
	         {
	             field: 'deleteflag',
	             title: 'deleteflag'
	         },
	         {
	             field: 'menuname',
	             title: 'menuname'
	         },
	         {
	             field: 'sort',
	             title: 'sort'
	         }],
	     	data:data.activitymenu,
	     	onClickRow : function(row, $element) {
				document.getElementById("up_menunameam").value=row.menuname;
				document.getElementById("up_dbidam").value=row.dbid;
			},
	     	});"json"
    		console.log("啟用清單",data);
    		AM2(); }
	 }); 
    		
    	 $.ajax({                              
	          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Flag_ActivityMenu",
		         data:{
		        	deleteflag:1
		        	 },
		            
		         type : "POST",                                                                    
		         dataType:'json',
		         
		         error:function(e){                                                                 
		         alert("失敗");
		         callback(data);
		         },
		         success:function(data){
		        	 
		        	 $('#AM1').remove();
		        	 
		        	 var AM11 = "<div class='row ibox' id='AM1'></div>"
		        		 document.getElementById("AM11").insertAdjacentHTML("BeforeEnd",AM11);
		        	 
		        	 var AM1 = "<table class='table table-bordered table-hover' id='banTableAM' data-pagination='true' data-page-list='[5, 10, 20, 50, 100, 200]'data-search='true' data-url='x'></table>"
		        		 document.getElementById("AM1").insertAdjacentHTML("BeforeEnd",AM1);
		        $('#banTableAM').bootstrapTable({
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
		             field: 'deleteflag',
		             title: 'deleteflag'
		         },
		         {
		             field: 'menuname',
		             title: 'menuname'
		         },
		         {
		             field: 'sort',
		             title: 'sort'
		         }],
		     	data:data.activitymenu,
		     	onClickRow : function(row, $element) {
					document.getElementById("up_menunameam").value=row.menuname;
					document.getElementById("up_dbidam").value=row.dbid;
				},
		     	});"json"
		     	
	     		console.log("停用清單",data);
	     		AM2();
		         }
     		}); 
		};

function AM2() {
 	  $("#manageTableAM tbody tr,#banTableAM tbody tr").on("click",function(){
           var text = $(this).text();
           if (text && text != "") {
               showEditMemberAM();
           }
       });
 	}

//
//
//顯示 啟用表格
function showManage_AM(){
	closeAllHrContent();

	$("#AMContent").show();
	$("#manageAMContent").show();
	
	$("button.manageAM").removeClass("btn-success");
    $("button.manageAM").addClass("btn-primary");
 
}
//顯示 停用表格
function showBan_AM(){
	closeAllHrContent();

	$("#AMContent").show();
	$("#banAMContent").show();
	
	$("button.ban").removeClass("btn-success");
    $("button.ban").addClass("btn-primary");

}
//
//新增畫面
function showAddMemberAM() {
    closeAllHrContent();
    $("#AMContent").show();
    $("#addMemberAMContent").show();

    $("button.addMember").show();
    $("button.addMember").removeClass("btn-success");
    $("button.addMember").addClass("btn-primary");
}

//關閉新增畫面
function closeAddMemberAM() {
    closeAllHrContent();
    $("button.addMember").hide();
    
    $("#AMContent").show();
    $("#manageAMContent").show();
    
    $("button.manage").removeClass("btn-success");
    $("button.manage").addClass("btn-primary");
}

//新增功能
function sendAddMemberAM() {
	 closeAddMember();
	 var menuname = document.getElementById('insert_menuname').value;
     //var deleteflag = document.getElementById('insert_deleteflag').value;
      var sort = document.getElementById('insert_sort').value;
		 $.ajax({                              
	          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Insert_ActivityMenu",
		         data:{
		        	 menuname:menuname,
		        	 deleteflag:0,
		        	 sort:sort
		        	 },
		            
		         type : "POST",                                                                    
		         dataType:'json',
		         
		         error:function(e){                                                                 
		         alert("失敗");
		         callback(data);
		         },
		         success:function(data){
		        	AM();
		   		     }
		   		        
		   		 }); 
      showToastSuccess("新增成功");
     closeAllHrContent();
     $("#AMContent").show();
     $("#manageAMContent").show();
 }



//更新頁面
function showEditMemberAM() {
    closeAllHrContent();
    $("#AMContent").show();
    $("#editMemberAMContent").show();

    $("button.editMember").show();
    $("button.editMember").removeClass("btn-success");
    $("button.editMember").addClass("btn-primary");
}
//更新頁面關閉
function closeEditMemberAM() {
    closeAllHrContent();
    $("button.editMember").hide();
    $("#AMContent").show();
	$("#manageAMContent").show();

    $("button.manage").removeClass("btn-success");
    $("button.manage").addClass("btn-primary");
}



function sendEditMemberAM() {

 closeEditMember();
 var dbid = document.getElementById('up_dbidam').value;
 var menuname = document.getElementById('up_menunameam').value;
 var sort = document.getElementById('up_sortam').value;
 
 $.ajax({                              
      url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Update_ActivityMenu",
         data:{
        	 dbid:dbid,
        	 menuname:menuname,
        	 sort:sort
        		 
        	 },
            
         type : "POST",                                                                    
         dataType:'json',
         
         error:function(e){                                                                 
         alert("失敗");
         callback(data);
         },
         success:function(data){
        	 AM();
   		     }
   		        
   		 });
showToastSuccess("修改成功");
 	closeAllHrContent();
 	$("#AMContent").show();
    $("#manageAMContent").show();
}


//解鎖對話視窗
function unlockAccountAM() {
    $("#unlockButtonAM").trigger("click");

}

function AMLuck(message) {
	var deleteflag = document.getElementById('Delete_flagAM').value;
	 var menuname = document.getElementById('Delete_idAM').value;

	 $.ajax({                              
         url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/LogicDelete_activitymenu",
	         data:{
	        	 menuname:menuname,
	        	 deleteflag:deleteflag
	        	 },
	         type : "POST",                                                                    
	         dataType:'json',
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){
	        	 AM();
	     	}  
	 });
    toastr.error(message);
    closeAllHrContent();
    $("#AMContent").show();
    $("#manageAMContent").show();
}



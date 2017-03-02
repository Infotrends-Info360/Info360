function showActivityMenu() {
	
            closeAllHrContent();
            $("#AMContent").show();
            $("#manageAMContent").show();
           
            $("button.Agentreason").removeClass("btn-success");
            $("button.Agentreason").addClass("btn-primary");
                  AM();
	}


function AM(){
	$("#manageTableAM tbody tr").empty();
 	$("#banTableAM tboby tr").empty();
$.ajax({                              
    url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Flag_ActivityMenu",
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
		      		console.log("啟用清單",data);
 	 
//	        	alert(JSON.stringify(data.person));
	        	$('#manageTableAM').DataTable( {
	        		destroy: true,
	        		aaData: data.activitymenu,
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
                    { "data": "menuname" },
                    { "data": "sort" },
                    { "data": "createdatetime" },
                    { "data": "deleteflag" }

                ],
              lengthChange: false
            } ); 
	        	AM2();
	    }  
     });
	         

$("#manageTableAM").css("width","100%");
$("#manageTableAM_filter").prop("style","float:right;");
$("#manageTableAM_wrapper > div:nth-child(1)").hide();

$("#manageTableAMSearch").keyup(function(){
    var searchText = $("#manageTableAMSearch").val();

    $("input[aria-controls='manageTableAM']").val(searchText);
    $("input[aria-controls='manageTableAM']").trigger("keyup");
});

$.ajax({                              
    url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Flag_ActivityMenu",
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
	      		console.log("停用清單",data);

//	        	alert(JSON.stringify(data.person));
        	$('#banTableAM').DataTable( {
        		destroy: true,
        		aaData: data.activitymenu,
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
                    { "data": "menuname" },
                    { "data": "sort" },
                    { "data": "createdatetime" },
                    { "data": "deleteflag" }
            ],
          lengthChange: false
        } ); 
        	AM2();
    }  
 });
 
$("#banTableAM").css("width","100%");
$("#banTableAM_filter").prop("style","float:right;");
$("#banTableAM_wrapper > div:nth-child(1)").hide();

$("#banTableAMSearch").keyup(function(){

    var searchText = $("#banTableAMSearch").val();

    $("input[aria-controls='banTableAM']").val(searchText);
    $("input[aria-controls='banTableAM']").trigger("keyup");
});
} 

function AM2() {
 	  $("#manageTableAM tbody tr td,#banTableAM tbody tr td").on("click",function(){
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
	          url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Insert_ActivityMenu",
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
      url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Update_ActivityMenu",
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
         url:"${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_activitymenu",
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



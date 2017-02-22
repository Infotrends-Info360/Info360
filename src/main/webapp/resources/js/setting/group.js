function showGroup() {
	
            closeAllHrContent();
            $("#groupContent").show();
            $("#managegroupContent").show();
           
            $("button.group").removeClass("btn-success");
            $("button.group").addClass("btn-primary");
            
            select();
	}


function select(){
		$("#managegroupTable tbody tr").empty();
	 	$("#bangroupTable tboby tr").empty();
    $.ajax({                              
        url:"http://ws.crm.com.tw:8080/Info360_Setting/RESTful/Query_Group_STATE",
		        data:{
		        	state:0
		        	 },
		         type : "POST",                                                                    
		         dataType:'json',
		         
		         error:function(e){                                                                 
		         alert("失敗");
		         callback(data);
		         },
		         success:function(data){ 
		      		console.log("啟用部門",data);

//		        	alert(JSON.stringify(data.person));
		        	$('#managegroupTable').DataTable( {
		        		destroy: true,
		        		aaData: data.group,
		        		aoColumns: [
					{ data:   "dbid",
		                render: function ( data, type, row ) {
		                    if ( type === 'display' ) {
		                        return '<input type="checkbox" class="editor-active" value='+data+'>';
		                    }
		                    return data;
		                },
		            className: "dt-body-center" },
	                    { "data": "name" },
	                    { "data": "state" },
	                    { "data": "dbid" }
	                   
	                ],
	              lengthChange: false
	            } ); 
		     group2();
		    }  
	     });
		         
    
    $("#managegroupTable").css("width","100%");
    $("#managegroupTable_filter").prop("style","float:right;");
    $("#managegroupTable_wrapper > div:nth-child(1)").hide();

    $("#managegroupTableSearch").keyup(function(){
        var searchText = $("#managegroupTableSearch").val();

        $("input[aria-controls='managegroupTable']").val(searchText);
        $("input[aria-controls='managegroupTable']").trigger("keyup");
    });

    $.ajax({                              
        url:"http://ws.crm.com.tw:8080/Info360_Setting/RESTful/Query_Group_STATE",
	        data:{
	        	state:1
	        	 },
	         type : "POST",                                                                    
	         dataType:'json',
	         
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){ 
	      		console.log("停用部門",data);

//		        	alert(JSON.stringify(data.person));
	        	$('#bangroupTable').DataTable( {
	        		destroy: true,
	        		aaData: data.group,
	        		aoColumns: [
					{ data:   "dbid",
		                render: function ( data, type, row ) {
		                    if ( type === 'display' ) {
		                        return '<input type="checkbox" class="editor-active" value='+data+'>';
		                    }
		                    return data;
		                },
		                className: "dt-body-center" },
		                { "data": "name" },
	                    { "data": "state" },
	                    { "data": "dbid" }
                ],
              lengthChange: false
            } ); 
	     group2();
	    }  
     });
     
    $("#bangroupTable").css("width","100%");
    $("#bangroupTable_filter").prop("style","float:right;");
    $("#bangroupTable_wrapper > div:nth-child(1)").hide();

    $("#bangroupTableSearch").keyup(function(){

        var searchText = $("#bangroupTableSearch").val();

        $("input[aria-controls='bangroupTable']").val(searchText);
        $("input[aria-controls='bangroupTable']").trigger("keyup");
    });
} 

        
function group2() {
 	  $("#managegroupTable tbody tr td,#bangroupTable tbody tr td").on("click",function(){
           var text = $(this).text();
           if (text && text != "") {
               showEditMembergroup();
           }
       });
 	}



//顯示Group 啟用表格
function showManage_group(){
	closeAllHrContent();

	$("#groupContent").show();
	$("#managegroupContent").show();
	
	$("button.managegroup").removeClass("btn-success");
    $("button.managegroup").addClass("btn-primary");
 
}
//顯示Group 停用表格
function showBan_group(){
	closeAllHrContent();

	$("#groupContent").show();
	$("#bangroupContent").show();
	
	$("button.ban").removeClass("btn-success");
    $("button.ban").addClass("btn-primary");

}

//新增畫面
function showAddMembergroup() {
    closeAllHrContent();
    $("#groupContent").show();
    $("#addMembergroupContent").show();

    $("button.addMember").show();
    $("button.addMember").removeClass("btn-success");
    $("button.addMember").addClass("btn-primary");
}


//新增功能
function sendAddMembergroup() {
	 closeAddMember();
     var in_person_dbid = document.getElementById('in_person_dbid').value;
     var in_name = document.getElementById('in_name').value;
	//	var in_state = document.getElementById('inputState').value;
		$.ajax({                              
	          url:"http://ws.crm.com.tw:8080/Info360_Setting/RESTful/Insert_GroupInfo",
		         data:{
		        	 	state:0,
			        	name:in_name,
			        	person_dbid:in_person_dbid

		        	 },
		         type : "POST",                                                                    
		         dataType:'json',
		         
		         error:function(e){                                                                 
		         alert("失敗");
		         callback(data);
		         },
		         success:function(data){
		        	 select();
		     }
		     });
     showToastSuccess("新增成功");
     closeAllHrContent();
     $("#groupContent").show();
     $("#managegroupContent").show();
 }

function closeAddMembergroup() {
    closeAllHrContent();
    $("button.addMember").hide();
    
    $("#groupContent").show();
    $("#managegroupContent").show();
    
    $("button.managegroup").removeClass("btn-success");
    $("button.managegroup").addClass("btn-primary");
}

//更新頁面
function showEditMembergroup() {
    closeAllHrContent();
    $("#groupContent").show();
    $("#editMembergroupContent").show();

    $("button.editMember").show();
    $("button.editMember").removeClass("btn-success");
    $("button.editMember").addClass("btn-primary");
}
//更新頁面關閉
function closeEditMembergroup() {
    closeAllHrContent();
    $("button.editMember").hide();
    $("#groupContent").show();
	$("#managegroupContent").show();

    $("button.manage").removeClass("btn-success");
    $("button.manage").addClass("btn-primary");
}



function sendEditMembergroup() {

 closeEditMember();
 	var up_dbid = document.getElementById('up_dbid').value;
	var up_name = document.getElementById('up_name').value;	
	var up_state =  document.getElementById('up_state').value;
	$.ajax({                              
     url:"http://ws.crm.com.tw:8080/Info360_Setting/RESTful/Update_GroupInfo",
        data:{
       	state:up_state,
     	name:up_name,
     	dbid:up_dbid
       	 },
        type : "POST",                                                                    
        dataType:'json',
        
        error:function(e){                                                                 
        alert("失敗");
        callback(data);
        },
        success:function(data){
       	select();
    }
    });			  
 showToastSuccess("修改成功");
 	closeAllHrContent();
 	$("#groupContent").show();
	$("#managegroupContent").show();
}






//解鎖對話視窗
function unlockAccountgroup() {
    $("#unlockButtongroup").trigger("click");

}


//停用對話視窗
function confirmBangroup() {
    $("#confirmBanButtongroup").trigger("click");
}

function GroupDelete(message) {
	var deletedbid = document.getElementById('deletedbid_GroupDelete').value;
    $.ajax({                              
        url:"http://ws.crm.com.tw:8080/Info360_Setting/RESTful/Delete_GroupInfo",
	         data:{
	        	 dbid:deletedbid
	        	 },
	         type : "POST",                                                                    
	         dataType:'json',
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){
	        	select();
	     } 
    });
    toastr.success(message);
    closeAllHrContent();
 	$("#groupContent").show();
	$("#managegroupContent").show();
}


function GroupLuck(message) {
	var state = document.getElementById('state_list_Groupluck').value;
    var name = document.getElementById('state_account_Groupluck').value;
    $.ajax({                              
        url:"http://ws.crm.com.tw:8080/Info360_Setting/RESTful/Group_logicdelete",
	         data:{
	        	 state:state,
	        	 name:name
	        	 },
	         type : "POST",                                                                    
	         dataType:'json',
	         
	         error:function(e){                                                                 
	         alert("失敗");
	         },
	         success:function(data){
	        	 alert("成功");
	        select();
	     }  
    });
    toastr.error(message);
    closeAllHrContent();
 	$("#groupContent").show();
	$("#managegroupContent").show();
}



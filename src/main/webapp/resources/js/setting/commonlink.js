function showCommonlink() {
	
            closeAllHrContent();
            $("#CommonlinkContent").show();
            $("#0Commonlink").show();
            $("button.Commonlink").removeClass("btn-success");
            $("button.Commonlink").addClass("btn-primary");
                  selectcomm();
	}


function selectcomm(){
	
  		Uinsertornot = false;
    	insertornot = false;
    	$('#nodeLINKlist').empty();
    	$('#nodeLINKlistU').empty();
    	$('#insert_color').empty();
    	$('#update_color').empty();
	 
	  $.ajax({                              
          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Select_commonlink",
          
	         data:{
	        	 },
	            
	         type : "POST",                                                                    
	         dataType:'json',
	         
	         error:function(e){                                                                 
	         alert("失敗");
	         callback(data);
	         },
	         success:function(data){
	        	 $('#tree').jstree("destroy").empty();
	        	 console.log("Tree",data);
	        	 
	        	 $('#tree').jstree({
	 				'core' : {
	 					'data' : data.Tree,	
	 				},
	 				
	        	 "plugins" : [ "themes", "json_data","ui"],
	        	
	 			}).bind("loaded.jstree", function (event, data) {
	 		        $(this).jstree("open_all")});
	 			
//		 			$('#tree').bind('select_node.jstree', function(e,data) { 
//		 			    window.location.href = data.instance.get_node(data.node, true).children('a').attr('href');
//		 			});
	        	 comm2();
	        		$("#tree").on("select_node.jstree",
		 				     function(evt, data){
		 				         $('#commname').text(data.node.original.text);
		 				         $('#delete_name').text("名稱: "+data.node.original.text);
		 				         $('#Update_myModalLabel').text("更新的節點名稱: "+data.node.original.text);
		 				         $('#INlist').text(data.node.original.id);
		 				     	 $('#UPlist').text(data.node.original.id);
		 				    	 $('#url').text(data.node.original.a_attr.href);
	 				        	 $('#path').text(data.instance.get_path(data.selected[0],"/",0));
	 				       	 	 $('#createuser').text(data.node.original.createuser);
	 				  	  		 $('#delete_number').text("編號:"+data.node.original.id);
 				         		 $('#pass').text(data.node.original.id);
 				        		 $('#type').text(data.node.original.parent);
 				        		 $('#children').text(data.node.children_d);
		 				     }); 
	        	
	        	 	$('#tree').on("select_node.jstree", function(e, data) {
	        	 		console.log("QQ",data.node);
	        	 		console.log("children_d.length",data.node.children_d.length);
	        	 		cot = data.node.parents.length;
	        	 		console.log("parents.length",data.node.parents.length);
	        	 		Upcot = data.node.children_d.length;
	        	 		console.log("id",data.node.id);
	        	 		console.log("text",data.node.text);
	        	 		
	        	 		if(cot<=3){
	        	 			insertornot = true;
	        	 	//		alert("Insert");
		        	 	}
	        	 		if(Upcot==0){
	        	 			Uinsertornot = true;
	        	 	//		alert("Update");
	        	 		}
	        	 	
	        	 	});
	        		var oo1 = "<option value="+0+">#</option>";
	        		var one = "<option  id='UPlist'></option>";
	        		var two = "<option  id='INlist'></option>";
	        		var color ="<option>blue</option><option>yellow</option><option>red</option>";
	        		document.getElementById("insert_color").insertAdjacentHTML("BeforeEnd",color);
	        		document.getElementById("update_color").insertAdjacentHTML("BeforeEnd",color);
	        		document.getElementById("nodeLINKlist").insertAdjacentHTML("BeforeEnd",two);
        	 		document.getElementById("nodeLINKlistU").insertAdjacentHTML("BeforeEnd",one);
	         	 	for(var i=0 ;i<=data.count-1;i++){
	         	 		
	         	 		
	        	 		 var str= "<option value='"+data.Tree[i].id+"'>"+data.Tree[i].text+"</option>"; 
	        	 		document.getElementById("nodeLINKlist").insertAdjacentHTML("BeforeEnd",str);
	        	 		document.getElementById("nodeLINKlistU").insertAdjacentHTML("BeforeEnd",str);
	        	 		
	        	 	}
	        	 	document.getElementById("nodeLINKlist").insertAdjacentHTML("BeforeEnd",oo1);
        	 		document.getElementById("nodeLINKlistU").insertAdjacentHTML("BeforeEnd",oo1);
	         },
	     });	
  	 		};
  	 		
  	 		
  	 		
  	 		function link(){
	 			 $('#tree').jstree.bind("select_node.jstree", function (e, data) {
	 				var href = data.node.a_attr.href;
	 				var parentId = data.node.a_attr.parent_id;
	 				if(href == '#')
	 				return '';
	 				window.open(href);
	 			})	
	 		}
  	 		
  	 		
  	 		function comm2() {
  	 	 	  $("#manageTablecomm tbody tr").on("click",function(){
  	 	           var text = $(this).text();
  	 	           if (text && text != "") {
  	 	               showEditMembercomm();
  	 	           }
  	 	       });
  	 	 	}

//新增畫面
function showAddMembercomm() {
    closeAllHrContent();
    $("#CommonlinkContent").show();
    $("#addMemberContentcomm").show();

    $("button.addMember").show();
    $("button.addMember").removeClass("btn-success");
    $("button.addMember").addClass("btn-primary");
}
//
//關閉新增畫面
function closeAddMembercomm() {
    closeAllHrContent();
    $("button.addMember").hide();
    
    $("#CommonlinkContent").show();
    $("#0Commonlink").show();
    
    $("button.manage").removeClass("btn-success");
    $("button.manage").addClass("btn-primary");
}
//
//新增功能
function sendAddMembercomm() {
	 closeAddMember();
	 
     var a = 0;
		 if(insertornot){
			 	var nodeLINK = document.getElementById('nodeLINKlist').value;
		 		var nodeNAME = document.getElementById('nodeNAME').value;
		 		var nodeURL =  document.getElementById('nodeURL').value;
		 		var nodeUSER = document.getElementById('nodeUSER').value;
		 		var color = document.getElementById('insert_color').value;
		 	    var myMap = new Map();

		 	   $.ajax({                              
			          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Insert_commonlink",
			          
				         data:{
		 				    	 "parnetid":nodeLINK,
		 				    	 "nodetext":nodeNAME,
		 				    	 "nodeurl":nodeURL,
		 				    	 "createuserid":nodeUSER,
		 				    	 "color":color
		 				   	 }, 
				         type : "POST",                                                                    
				         dataType:'json',
				         
				         error:function(e){                                                                 
				         alert("失敗");
				         callback(data);
				         },
				         success:function(data){
				        	 selectcomm();					        
				         }
				         });
		 }else if(document.getElementById('nodeLINKlist').value==""){
			 	var nodeLINK = "0"
		 		var nodeNAME = document.getElementById('nodeNAME').value;
		 		var nodeURL =  document.getElementById('nodeURL').value;
		 		var nodeUSER = document.getElementById('nodeUSER').value;
		 		var color = document.getElementById('insert_color').value;
		 	    var myMap = new Map();

		 	   $.ajax({                              
			          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Insert_commonlink",
			          
				         data:{
		 				    	 "parnetid":nodeLINK,
		 				    	 "nodetext":nodeNAME,
		 				    	 "nodeurl":nodeURL,
		 				    	 "createuserid":nodeUSER,
		 				    	 "color":color
		 				   	 }, 
				         type : "POST",                                                                    
				         dataType:'json',
				         
				         error:function(e){                                                                 
				         alert("失敗");
				         callback(data);
				         },
				         success:function(data){
				        	 selectcomm();		        
				         }
				         });
		 }else{
			 alert("不可超過第四層");
		 } 
		 
     
     showToastSuccess("新增成功");
     closeAllHrContent();
     $("#CommonlinkContent").show();
 	 $("#0Commonlink").show();
 }
//
//
//
//更新頁面
function showEditMembercomm() {
    closeAllHrContent();
    $("#CommonlinkContent").show();
    $("#editMemberContentcomm").show();

    $("button.editMember").show();
    $("button.editMember").removeClass("btn-success");
    $("button.editMember").addClass("btn-primary");
}
//更新頁面關閉
function closeEditMembercomm() {
    closeAllHrContent();
    $("button.editMember").hide();
    $("#CommonlinkContent").show();
	$("#0Commonlink").show();

    $("button.manage").removeClass("btn-success");
    $("button.manage").addClass("btn-primary");
}
//
//
//
function sendEditMembercomm() {

 closeEditMember();
 var a=0;
 if(Uinsertornot){
		var nodeIDu = document.getElementById('pass').innerHTML;
		var nodeLINKu = document.getElementById('nodeLINKlistU').value;
 		var nodeNAMEu = document.getElementById('nodeNAMEu').value;
 		var nodeURLu  = document.getElementById('nodeURLu').value;
 		var nodeUSERu = document.getElementById('nodeUSERu').value;
 		var color = document.getElementById('update_color').value;
 	    var myMap = new Map();

 		  $.ajax({                              
	          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Update_commonlink",
	          
		         data:{
		        	 "parnetid":nodeLINKu,
			    	 "nodetext":nodeNAMEu,
			    	 "nodeurl":nodeURLu,
			    	 "createuserid":nodeUSERu,
		 			 "nodeid":nodeIDu,
		 			 "color":color
 				   	 }, 
		         type : "POST",                                                                    
		         dataType:'json',
		         
		         error:function(e){                                                                 
		         alert("失敗");
		         callback(data);
		         },
		         success:function(data){
		        	 selectcomm();
		         }
 		 
 		  });
 }else{
	 alert("有子節點無法移動");
 }
showToastSuccess("修改成功");
 	closeAllHrContent();
 	$("#CommonlinkContent").show();
	$("#0Commonlink").show();
}

//停用對話視窗
function confirmBancomm() {
    $("#confirmBanButtoncomm").trigger("click");
}
//
function deletefunctioncomm(message) {
	 var a = 0;
		var nodeIDd = document.getElementById('pass').innerHTML;
		var children_list =  document.getElementById('children').innerHTML;
			
	    var myMap = new Map();
	
		$.ajax({                              
  	          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Delete_commonlink",
  	          
  		         data:{
  		        	"nodeid":nodeIDd,
  		        	"children_list":children_list
  		        	 }, 
  		         type : "POST",                                                                    
  		         dataType:'json',
  		         
  		         error:function(e){                                                                 
  		         alert("失敗");
  		         callback(data);
  		         },
  		      success:function(data){
  		    	selectcomm();
		         }
		});
	
   toastr.success(message);
    closeAllHrContent();
    $("#CommonlinkContent").show();
	$("#0Commonlink").show();
}


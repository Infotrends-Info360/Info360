<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>「儀表板」頁面</title>
        <script src="resources/js/jquery.min.js?v=2.1.4"></script>
        <link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
        <link href="resources/css/font-awesome.css?v=4.4.0" rel="stylesheet">
        <link href="resources/css/animate.css" rel="stylesheet">
        <link href="resources/layui/css/layui.css" rel="stylesheet">
        <link href="resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
        <link href="resources/css/style.css?v=4.1.0" rel="stylesheet">
		
		 <link rel="stylesheet" href="resources/jstree/style.min.css" />
        <script type="text/javascript" src="resources/jstree/jstree.min.js"></script>
		
        <link href="resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">

</head>
<style>
.dataTables_filter { display: none; }
</style>
<body class="gray-bg">
	<div class="widget">
		<div class="col-lg-2 col-sm-3">
			<div class="panel panel-success" style="height: 780px;">
				<div class="panel-heading">
					<h3>
						<i class="fa fa-angle-double-right"></i>案件搜尋
					</h3>
				</div>
				<div class="panel-body">
				<input id="today" type="hidden"></input>
				<input id="week" type="hidden"></input>
				
				
					<table class="table table-bordered table-hover">
						<thead>
							<tr class="bg-primary">
								<td><b>快速篩選</b></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td type="button" onclick="today()" >今天</td>
							</tr>
							<tr>
								<td type="button" onclick="week()">本週</td>
							</tr>
							<tr>
								<td>一個月</td>
							</tr>
							<tr>
								<td>三個月</td>
							</tr>
							<tr>
								<td>半年</td>
							</tr>
						</tbody>
					</table>
					<!--
<div class="ibox">
<div class="ibox-body">
<ul class="list-group" style="line-height:30px;">
<li class="list-group-item"><b>快速篩選</b></li>
<li class="list-group-item">今天</li>
<li class="list-group-item">本週</li>
<li class="list-group-item">一個月</li>
<li class="list-group-item">三個月</li>
<li class="list-group-item">半年</li>
</ul>
</div>
</div>
-->
				</div>
			</div>
		</div>
		<div class="col-lg-10 col-sm-9">
			<div class="panel panel-success" style="height: 780px;">
				<div class="panel-body">
					<div class="row ibox">
						<div class="col-lg-6 col-md-6">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">日期</span>
								<div class="input-daterange input-group" id="datepicker">
									<input type="text" class="input-sm form-control" name="start"
										value="2017-01-01" id="startdate"> <span class="input-group-addon">到</span>
									<input type="text" class="input-sm form-control" name="end"
										value="2017-01-22" id="enddate">
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">處理人</span> <input
									type="text" class="form-control" placeholder="請輸入處理人" id="agentid"
									aria-describedby="basic-addon1">
							</div>
						</div>
						<div class="col-lg-3 col-md-3">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">客戶ID</span> <input
									type="text" class="form-control" placeholder="請輸入ID"
									aria-describedby="basic-addon1">
							</div>
						</div>
					</div>
					<div class="row ibox">
						<div class="col-lg-9 col-md-9">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">主旨</span> <input
									type="text" class="form-control" placeholder="請輸入"
									aria-describedby="basic-addon1">
							</div>
						</div>
						<div class="col-lg-3 col-md-3">
							<button class="btn-sm btn-success" onclick="search()">搜尋</button>
							<button class="btn-sm btn-danger">取消</button>
						</div>
					</div>

					<div class="row ibox">
						<div class="col-lg-12 col-md-12" style="overflow: auto; width: 775px; height: 640px; border: 1px silver solid">
							<table class="table table-striped table-bordered table-hover "
								id="queryTable123"  >
								<thead>
									 <tr>
                                         <th class="no-sort"><input type="checkbox" id="manageCheck" ischecked=false></th>
                                         <th>聯繫ID</th>
                                         <th>活動代碼</th>
                                         <th>標題</th>
                                         <th>開始時間</th>
                                         <th>結構化類型</th>
                                         <th>結束時間</th>
                                         <th>結構化文本</th>
                                         <th>實體類型ID</th>
                                         <th>描述</th>
                                         <th>狀態</th>
                                         <th>形態ID</th>
                                         <th>互動ID</th>
                                         <th>停止的描述</th>
                                         <th>評論</th>
                                    </tr>
								</thead>
							</table>
							<div id="form1">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>


 <!-- 全局js -->
   
    <script src="resources/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- Data Tables -->
    <script src="resources/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resources/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- DataPicker -->
    <script src="resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>

    <!-- toastStr -->
    <script src="resources/js/plugins/toastr/toastr.min.js"></script>

    <!-- layui -->
    <script src="resources/layui/layui.js"></script>
<script language="javascript">
var Today=new Date();
document.getElementById("today").value=(Today.getFullYear()+"-"+(Today.getMonth()+1)+"-"+Today.getDate());


document.getElementById("week").value=(Today.getFullYear()+"-"+(Today.getMonth()+1)+"-"+Today.getDate()-7); 
</script>

<script type="text/javascript">
$("#queryTable123 tbody tr ").empty();
function search(){
	
	var ss = $('#startdate').val();
	var ee = $('#enddate').val();
	var aa = $('#agentid').val();
	var pp = $('#page').val();

	$.ajax({                              
	    url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/QueryAll_Interaction",
	       data:{
	      	 startdate:ss,
	      	 enddate:ee,
	      	 agentid:aa
	      	 },
	      	 
	       type : "POST",                                                                    
	       dataType:'json', 
	       error:function(e){                                                                 
	    	alert("請重新整理");
	    	
	       },
	       success:function(all){                                                           
	      	 console.log("ALL",all)
	           var Totalcount="<h4>總共筆數:"+all.Interaction+"筆     共"+Math.ceil(all.Interaction/10)+"頁</h4><br>";
	             	document.getElementById("form1").insertAdjacentHTML("BeforeEnd",Totalcount);
	            	
	          var left="<button type='button' class='btn btn-white' id='Pageleft'"+
	      	"onclick='Pageleft()'>"+"<i class='fa fa-chevron-left'></i></button>"
	      	document.getElementById("form1").insertAdjacentHTML("BeforeEnd",left); 
	      	        			
	      	for(var i=1; i<=Math.ceil(all.Interaction/10); i++){
	      		
	      		    var str= "<button id='bu"+i+"' class='btn btn-white' onclick='page("+i+")' value='"+i+"'>"+i+"</button>"; 
	      		    document.getElementById("form1").insertAdjacentHTML("BeforeEnd",str); 
	      	}
	      	
	      		var right="<button type='button' class='btn btn-white' id='Pageright'"+
				"onclick='Pageright()'>"+"<i class='fa fa-chevron-right'></i></button>"
				document.getElementById("form1").insertAdjacentHTML("BeforeEnd",right);
	       },
	   }); 
	
$.ajax({                              
          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Query_Interaction",
	        data:{
	        	 startdate:ss,
		    	 enddate:ee,
		    	 agentid:aa,
		    	 page:pp
	        	 },
	         type : "POST",                                                                    
	         dataType:'json',
	         
	         error:function(e){                                                                 
	         alert("請重新整理");
	         
	         },
	         success:function(data){ 
	      		console.log(data);
//	        	alert(JSON.stringify(data.person));
	        	$('#queryTable123').DataTable({
	        		autoWidth: false,
	        		destroy: true,
	        		aaData: data.Interaction,
	        		aoColumns: [
				{ data:   "dbid",
	                render: function ( data, type, row ) {
	                    if ( type === 'display' ) {
	                        return '<input type="checkbox" class="editor-active" value='+data+'>';
	                    }
	                    return data;
	                },
	            className: "dt-body-center" },
                    { "data": "contactid" },
                    { "data": "activitycode" },
                    { "data": "subject" },
                    { "data": "startdate" },
                    { "data": "structuredmimetype" },
                    { "data": "enddate" },
                    { "data": "structuredtext" },
                    { "data": "entitytypeid" },
                    { "data": "text" },
                    { "data": "status" },
                    { "data": "typeid" },
                    { "data": "ixnid" },
                    { "data": "stoppedreason" },
                    { "data": "thecomment" }
                    
                ],'columnDefs': [{
                	
                	"bInfo": false,
                    'targets': 0,
                    'searchable':false,
                    'orderable':false,
                    'className': 'dt-body-center',
                    
                 }],
              lengthChange: false
            });	
	    }  
     });
}
</script>


<script type="text/javascript">
$("#queryTable123 tbody tr ").empty();
function page(i){
		
		var r = (i-1)*10;	
		var ss = $('#startdate').val();
		var ee = $('#enddate').val();
		var aa = $('#agentid').val();
		var pp = r;
		
		$.ajax({                              
	          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Query_Interaction",
		        data:{
		        	 startdate:ss,
			    	 enddate:ee,
			    	 agentid:aa,
			    	 page:pp
		        	 },
		         type : "POST",                                                                    
		         dataType:'json',
		         
		         error:function(e){                                                                 
		         alert("請重新整理");
		         
		         },
		         success:function(data){ 
		      		console.log(data);
//		        	alert(JSON.stringify(data.person));
		        	$('#queryTable123').DataTable({
		        		autoWidth: false,
		        		destroy: true,
		        		aaData: data.Interaction,
		        		aoColumns: [
					{ data:   "dbid",
		                render: function ( data, type, row ) {
		                    if ( type === 'display' ) {
		                        return '<input type="checkbox" class="editor-active" value='+data+'>';
		                    }
		                    return data;
		                },
		            className: "dt-body-center" },
	                    { "data": "contactid" },
	                    { "data": "activitycode" },
	                    { "data": "subject" },
	                    { "data": "startdate" },
	                    { "data": "structuredmimetype" },
	                    { "data": "enddate" },
	                    { "data": "structuredtext" },
	                    { "data": "entitytypeid" },
	                    { "data": "text" },
	                    { "data": "status" },
	                    { "data": "typeid" },
	                    { "data": "ixnid" },
	                    { "data": "stoppedreason" },
	                    { "data": "thecomment" }
	                    
	                ],'columnDefs': [{
	               
	                    'targets': 0,
	                    'searchable':false,
	                    'orderable':false,
	                    'className': 'dt-body-center',
	                    
	                 }],
	              lengthChange: false
	            });	
		    }  
	     });

	}
	</script>
	
	
	
	
	
	<script type="text/javascript">

function today(){
	$("#queryTable123 tbody tr ").empty();

	
	var today = $('#today').val();
	var aa = $('#agentid').val();
	var pp = $('#page').val();
$.ajax({                              
          url:"http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Query_Interaction",
	        data:{
	        	 startdate:today,
		    	 enddate:today,
		    	 agentid:aa,
		    	 page:pp
	        	 },
	         type : "POST",                                                                    
	         dataType:'json',
	         
	         error:function(e){                                                                 
	         alert("請重新整理");
	         
	         },
	         success:function(data){ 
	      		console.log(data);
//	        	alert(JSON.stringify(data.person));
	        	$('#queryTable123').DataTable({
	        		autoWidth: false,
	        		destroy: true,
	        		aaData: data.Interaction,
	        		aoColumns: [
				{ data:   "dbid",
	                render: function ( data, type, row ) {
	                    if ( type === 'display' ) {
	                        return '<input type="checkbox" class="editor-active" value='+data+'>';
	                    }
	                    return data;
	                },
	            className: "dt-body-center" },
                    { "data": "contactid" },
                    { "data": "activitycode" },
                    { "data": "subject" },
                    { "data": "startdate" },
                    { "data": "structuredmimetype" },
                    { "data": "enddate" },
                    { "data": "structuredtext" },
                    { "data": "entitytypeid" },
                    { "data": "text" },
                    { "data": "status" },
                    { "data": "typeid" },
                    { "data": "ixnid" },
                    { "data": "stoppedreason" },
                    { "data": "thecomment" }
                    
                ],'columnDefs': [{
               
                    'targets': 0,
                    'searchable':false,
                    'orderable':false,
                    'className': 'dt-body-center',
                    
                 }],
              lengthChange: false
            });	
	    }  
     });
}
</script>



<script>
	$(document).ready(function() {
		// init datepicker
		$("#datepicker").datepicker();
		//init datatable
		$("#queryTable").DataTable();
		$("#queryTable").css("width", "100%");
	});
</script>
</html>

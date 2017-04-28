<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>「設定」頁面</title>



<!--   	<script src="resources/js/plugins/jquery-ui/jquery-ui.min.js"></script> -->
<script src="resources/jstree/jquery.min.js"></script>
<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/layui/css/layui.css" rel="stylesheet">
<link href="resources/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<link href="resources/css/style.css?v=4.1.0" rel="stylesheet">

<link rel="stylesheet" href="resources/jstree/style.min.css" />
<script type="text/javascript" src="resources/jstree/jstree.min.js"></script>

<link href="resources/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">
	
	
<link rel="stylesheet" href="resources/css/farbtastic.css" type="text/css" />

<script src="resources/js/farbtastic.js"></script>
	
	
<style>
label.required:after {
	content: " *";
	color: red;
}
.black {
	color: black !important;
}

.red {
	color: #FF5511 !important;
}

.yellow {
	color: #FFBB00 !important;
}

.blue {
	color: #0000CC !important;
}

.black {
	color: #666666 !important;
}

.dataTables_filter {
	display: none;
}
</style>
<style type="text/css">
#Box2,#Box3,#Box4,#Box5,#Box6{
    width:200px;
    height:100px;
/*     padding:10px; */
    border:1px #ccc dashed;
    float:left;
    margin-right:10px;
}
</style>

</head>
<body class="gray-bg">
			<div class="panel panel-success" style="width: 100%;height: 100%">
		<!-- ActivityGroup  -->
				<!-- 服務代碼清單管理切換頁籤Start -->
				<div id="hrTabControlButton" style="margin: 1px 0px 0px 1px;">
					<button class="btn-sm btn-primary manage" onclick="showManage_AG()">
						<i class="fa fa-fw fa-user"></i>群組管理
					</button>
<!-- 					<button class="btn-sm btn-success ban" onclick="showBan_AG()"> -->
<!-- 						<i class="fa fa-fw fa-user"></i>停用列表 -->
<!-- 					</button> -->
					<button class="btn-sm btn-success addMember" style="display: none;">
						<span onclick="showAddMemberAG()">新增群組</span> <i
							class="fa fa-times" onclick="closeAddMemberAG()"></i>
					</button>
					<button class="btn-sm btn-success editMember"
						style="display: none;">
						<span onclick="showEditMemberAG()" id="UPAG"></span> <i
							class="fa fa-times" onclick="closeEditMemberAG()"></i>
					</button>
					

				</div>
				<!-- 服務代碼清單管理切換頁籤End -->

				<!-- 設定頁面內容頁 Start-->
				<div class="panel-body" id="settingContent">
					<div id="manageAGContent">
						<div id="AGul">
							<ul class="pagination">
								<li onclick="showAddMemberAG()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="unlockAccountAG()"><a href="#"><i
										class="glyphicon glyphicon-trash"></i></a></li>
										<select class="selectpicker" style="width: 127px;" id="menu"
										onchange="group()">
										</select>
							</ul>
							<ul class="pagination" style="float: right;">
								<li><input type="text" id="manageTableAGSearch"
									placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox" id="AG00">
								<div class="spiner-example" id="AGLoading">
                            	<div class="sk-spinner sk-spinner-fading-circle">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            	</div>
                        		</div>
							<div class="col-lg-12 col-md-12" id="AG0">
								<table class="table table-bordered table-hover"
									id="manageTableAG">
									<thead>
										<tr>
											<th style="width: 20px" class="no-sort"><input type="checkbox"
												id="AG0All" ischecked=false></th>
											<th style="display: none;">編號</th>
											<th>群組名稱</th>
											<th style="width: 140px">建立時間</th>
											<th style="width: 50px">排序</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
								<input id="AGupdbid" value="" type="hidden">
								<input id="AGdowdbid" value="" type="hidden">
					</div>

					<!-- 新增  -->
					<div id="addMemberAGContent" style="display: none;">
						<div class="widget">
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">群組名:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="in_groupname"
										placeholder="">
								</div>
							</div>
<!-- 							<div class="form-group col-sm-6"> -->
<!-- 								<label for="inputAccount" class="col-sm-2 control-label">sort:</label> -->
<!-- 								<div class="col-sm-8"> -->
<!-- 									<input type="text" class="form-control" id="in_sort" -->
<!-- 										placeholder=""> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary" onclick="sendAddMemberAG()">儲存</button>
									<button class="btn btn-default" onclick="closeAddMemberAG()">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 新增 END -->
					<!-- 更新  -->
					<div id="editMemberAGContent" style="display: none;">
						<div class="widget">
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">群主名稱:</label>
								<div class="col-sm-8">
									<input type="" class="form-control" id="up_groupnameAG">
								</div>
							</div>

									<input type="hidden" class="form-control" id="up_dbidAG">


							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary" onclick="sendEditMemberAG()">更新</button>
									<button class="btn btn-default" onclick="closeEditMemberAG()">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 更新END -->
		</div>
		<!-- ActivityGroup 結束 -->
			</div>
</body>

<!-- 彈跳對話視窗-->

<!-- ActivityGroup -->
<!-- 鎖符號BUTTON -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#unlockModalAG" style="display: none;" id="unlockButtonAG">unlockDialog</button>
<div id="unlockModalAG" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否刪除？</h3>
			</div>
			<div class="modal-footer">
<!-- 				<div class="form-group col-sm-6"> -->
<!-- 					<label for="inputAssignedDepartment" class="col-sm-2 control-label">群組名稱:</label> -->
<!-- 					<div class="col-sm-4"> -->
<!-- 						<input type="text" class="form-control" id="Delete_idAG" -->
<!-- 							placeholder=""> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="form-group col-sm-6"> -->
<!-- 					<label for="inputAssignedDepartment" class="col-sm-2 control-label">開關:</label> -->
<!-- 					<div class="col-sm-4"> -->
<!-- 						<select class="form-control" id="Delete_flagAG"> -->
<!-- 							<option value="0">啟用</option> -->
<!-- 							<option value="1">停用</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="AGLuck('鎖定成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- 鎖符號BUTTON END -->

<!-- AG_OK -->
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#AG_OK1" style="display: none;" id="AG_OK">unlockDialog</button>
<div id="AG_OK1" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否啟用？</h3>
			</div>
			<div class="modal-footer">
	
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="AGKK('啟用成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- AG_OK END -->
<!-- ActivityGroup  END-->

<!-- 全局js -->
<script src="resources/js/setting/setting.js"></script>

<script src="resources/js/md5.min.js"></script>
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
<script
	src="resources/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script
	src="resources/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="resources/js/demo/bootstrap-table-demo.js"></script>


<script>
$(document).ready(function() {
	showActivityGroup();
});

function showActivityGroup() {
	$("button.editMember").hide();

	closeAllHrContent();
	$("#AGContent").show();
	$("#manageAGContent").show();

	$("button.Agentreason").removeClass("btn-success");
	$("button.Agentreason").addClass("btn-primary");
	AG();
	$("#manageTableAG tbody tr").empty();
	$("#banTableAG tboby tr").empty();
}

function group() {
	$("#AG0").hide();
	$("#AGul").hide();
	$("#AGLoading").show();
	
	
	$("#AG0All").prop("checked", false);
	$("#AG1All").prop("checked", false);
	
	$("#manageTableAG tbody tr").empty();
	$("#banTableAG tboby tr").empty();
	var dbid = document.getElementById("menu").value
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Query_ActivityMenu",
				data : {
					dbid : dbid
				},
				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("請重新整理");
				},
				success : function(data) {
					console.log("啟用服務代碼群組", data);

					//        	alert(JSON.stringify(data.person));
					$('#manageTableAG')
							.DataTable(
									{
										  "ordering": false,
										"autoWidth": false,
										destroy : true,
										aaData : data.flag0_group,
										aoColumns : [
												{
													className : "dt-body-center"
												},
//													{
//														"data" : "dbid"
//													},
												{
													"data" : "groupname"
												},
												{
													"data" : "createdatetime"
												},{
													"data" : "sort"
												},

										],'columnDefs': [{
									         'targets': 0,
									         'searchable': false,
									         'orderable': false,
									         'className': 'dt-body-center',
									         'render': function (data, type, full, meta){
									             return '<input type="checkbox" name="AG0" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
									         }
									      },
									      {
										         'targets': 3,
										         'searchable': false,
										         'orderable': false,
										        'className': "  ",
										         'render': function (data, type, full, meta){
										        	
										        		 return '<label style="padding-left:5px" onclick="AG_up()" class="glyphicon glyphicon-triangle-top"></label><label style="padding-left:5px"  onclick="AG_dow()" class="glyphicon glyphicon-triangle-bottom"></label>';
										        
										         },
										
										      }],
										lengthChange : false
									});
					AG2();
					var AGflag = true;
					var table = $('#manageTableAG').DataTable();
					
					$('#manageTableAG tbody')
							.on(
									'click',
									'tr',
									function() {
										console.log("TableAG", table.row(
												this).data());
										document
												.getElementById('up_groupnameAG').value = table
												.row(this).data().groupname;
										document 
										.getElementById('up_dbidAG').value = table
										.row(this).data().dbid;
										
										document
										.getElementById('UPAG').innerHTML = table
										.row(this).data().groupname;
										document
										.getElementById('AGupdbid').value = table
										.row(this).data().dbid;
										document
										.getElementById('AGdowdbid').value = table
										.row(this).data().dbid;
										if(AGflag){
											showEditMemberAG(data,table.row(this).data());
										}
									});
					$('#manageTableAG tbody').on('click','td',function() {

						var text = $(this).text();	

						if (text && text != "") {
							AGflag = true;
						}else{
							AGflag = false;
							return;
						}
						
									});
				}
			});

	$("#manageTableAG").css("width", "100%");
	$("#manageTableAG_filter").prop("style", "float:right;");
	$("#manageTableAG_wrapper > div:nth-child(1)").hide();

	$("#manageTableAGSearch").keyup(function() {
		var searchText = $("#manageTableAGSearch").val();

		$("input[aria-controls='manageTableAG']").val(searchText);
		$("input[aria-controls='manageTableAG']").trigger("keyup");
	});
	$("#AGul").show();
	$("#AG0").show();
	$("#AGLoading").hide();
}

function AG() {
	$("#AGul").hide();
	$("#AG0").hide();
	$("#AGLoading").show();
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Flag_ActivityMenu",
				data : {
					deleteflag : 0
				},

				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("請重新整理");
				},
				success : function(data) {
					$('#menu').empty();
						var menu = "<option id='abc' value='"+data.activitymenu[0].dbid+"'>"
								+ data.activitymenu[0].menuname
								+ "</option>"
						document.getElementById("menu").insertAdjacentHTML(
								"BeforeEnd", menu);

					for (var i = 1; i < data.activitymenu.length; i++) {
						var menu = "<option value='"+data.activitymenu[i].dbid+"'>"
								+ data.activitymenu[i].menuname
								+ "</option>"
						document.getElementById("menu").insertAdjacentHTML(
								"BeforeEnd", menu);
					}

					console.log("服務代碼清單", data);
					group2();

					function group2() {
						
						
						$("#AG0All").prop("checked", false);
						$("#AG1All").prop("checked", false);
						
						$("#manageTableAG tbody tr").empty();
						$("#banTableAG tboby tr").empty();
						var dbid = document.getElementById("abc").value
						$
								.ajax({
									url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Query_ActivityMenu",
									data : {
										dbid : dbid
									},
									type : "POST",
									dataType : 'json',

									error : function(e) {
										toastr.error("請重新整理");
									},
									success : function(data) {
										console.log("啟用服務代碼群組", data);

										$('#manageTableAG')
												.DataTable(
														{
															  "ordering": false,
															"autoWidth": false,
															destroy : true,
															aaData : data.flag0_group,
															aoColumns : [
																	{
																		className : "dt-body-center"
																	},
//				 													{
//				 														"data" : "dbid"
//				 													},
																	{
																		"data" : "groupname"
																	},
																	{
																		"data" : "createdatetime"
																	}
//																		,{
//																			"data" : "sort"
//																		},

															],'columnDefs': [{
														         'targets': 0,
														         'searchable': false,
														         'orderable': false,
														         'className': 'dt-body-center',
														         'render': function (data, type, full, meta){
//															        	 alert(JSON.stringify(full));
														             return '<input type="checkbox" name="AG0" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
														         }
														      },
														      {
															         'targets': 3,
															         'searchable': false,
															         'orderable': false,
															        'className': "  ",
															         'render': function (data, type, full, meta){
															        	
															        		 return '<label style="padding-left:5px" onclick="AG_up()" class="glyphicon glyphicon-triangle-top"></label><label style="padding-left:5px"  onclick="AG_dow()" class="glyphicon glyphicon-triangle-bottom"></label>';
															        
															         },
															
															      }
														      ],
															lengthChange : false
														});
										AG2();
										var AGflag = true;
										var table = $('#manageTableAG').DataTable();

										$('#manageTableAG tbody')
												.on(
														'click',
														'tr',
														function() {
															console.log("TableAG", table.row(
																	this).data());
															document
																	.getElementById('up_groupnameAG').value = table
																	.row(this).data().groupname;
															document 
															.getElementById('up_dbidAG').value = table
															.row(this).data().dbid;
															
															document
															.getElementById('UPAG').innerHTML = table
															.row(this).data().groupname;
															document
															.getElementById('AGupdbid').value = table
															.row(this).data().dbid;
															document
															.getElementById('AGdowdbid').value = table
															.row(this).data().dbid;
														
															if(AGflag){
																showEditMemberAG(data,table.row(this).data());
															}
														});
										$('#manageTableAG tbody').on('click','td',function() {

											var text = $(this).text();	

											if (text && text != "") {
												AGflag = true;
											}else{
												AGflag = false;
												return;
											}
											
														});
										$("#AG0").show();
										$("#AGul").show();
										$("#AGLoading").hide();
									}
								});

						$("#manageTableAG").css("width", "100%");
						$("#manageTableAG_filter").prop("style", "float:right;");
						$("#manageTableAG_wrapper > div:nth-child(1)").hide();

						$("#manageTableAGSearch").keyup(function() {
							var searchText = $("#manageTableAGSearch").val();

							$("input[aria-controls='manageTableAG']").val(searchText);
							$("input[aria-controls='manageTableAG']").trigger("keyup");
						});

					
					}
				}

			});
};

function AG2() {

	$("#AG1All").click(function() {
		   if($("#AG1All").prop("checked")) {
		     $("input[name='AG1']").each(function() {
		         $(this).prop("checked", true);
		     });
		   } else {
		     $("input[name='AG1']").each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
		});
	$("#AG0All").click(function() {
		   if($("#AG0All").prop("checked")) {
		     $("input[name='AG0']").each(function() {
		         $(this).prop("checked", true);
		     });
		   } else {
		     $("input[name='AG0']").each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
		});
}

function AG_up() {
	  setTimeout(function(){ 
	  var AGupdbid = document.getElementById('AGupdbid').value;

$
		.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/AGroup_Sortup",
			data : {
				dbid:AGupdbid
			},
			type : "POST",
			dataType : 'json',
			error : function(e) {
				toastr.error("至頂");
			},
			success : function(data) {
				group();
				toastr.success("上升排序成功");
			}
		});
	
	  
closeAllHrContent();
$("#AGContent").show();
$("#manageAGContent").show();
	  }, 10);
}
function AG_dow() {

  setTimeout(function(){ 	  
	  var AGdowdbid = document.getElementById('AGdowdbid').value;
	 
$
		.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/AGroup_Sortdown",
			data : {
				dbid:AGdowdbid
			},
			type : "POST",
			dataType : 'json',
			error : function(e) {
				toastr.error("最底層");
			},
			success : function(data) {
				group();
				toastr.success("下降排序成功");
			}
		});
	
	  
closeAllHrContent();
$("#AGContent").show();
$("#manageAGContent").show();
  }, 10);
}
//
//顯示 啟用表格
function showManage_AG() {
	closeAllHrContent();

	$("#AGContent").show();
	$("#manageAGContent").show();

	$("button.manageAG").removeClass("btn-success");
	$("button.manageAG").addClass("btn-primary");

}
//顯示 停用表格
//	function showBan_AG() {
//		closeAllHrContent();

//		$("#AGContent").show();
//		$("#banAGContent").show();

//		$("button.ban").removeClass("btn-success");
//		$("button.ban").addClass("btn-primary");

//	}
//
//新增畫面
function showAddMemberAG() {
	document.getElementById('in_groupname').value="";
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

	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_ActivityGroup",
				data : {
					activitymenuid : dbid,
					groupname : in_groupname
//						sort : in_sort
				},

				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("新增錯誤");
				},
				success : function(data) {
					group();
					toastr.success("新增成功");
				}

			});
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
//		var dbid = document.getElementById("menu").value
	var up_groupname = document.getElementById('up_groupnameAG').value;
//		var up_sort = document.getElementById('up_sortAG').value;
	var up_dbid = document.getElementById('up_dbidAG').value;
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_ActivityGroup",
				data : {
					groupname : up_groupname,
					dbid : up_dbid
				},

				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("更新錯誤");
				},
				success : function(data) {
					group();
					toastr.success("更新成功");
				}
			});
	closeAllHrContent();
	$("#AGContent").show();
	$("#manageAGContent").show();
}

//解鎖對話視窗
function unlockAccountAG() {
	$("#unlockButtonAG").trigger("click");
}
function AG_ok() {
	$("#AG_OK").trigger("click");
}


function AGLuck(message) {
	var selected=[];
    $("[name=AG0]:checkbox:checked").each(function(){
      selected.push($(this).val());
      });
    $("[name=AG1]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
		  
		  var ActivityGroup_DBID_list = selected.join();
		  
//		var flag = document.getElementById('Delete_flagAG').value;
//		var dbid = document.getElementById('Delete_idAG').value;
if(ActivityGroup_DBID_list.length){
	

	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_ActivityGroup",
				data : {
					deleteflag : 1,
					ActivityGroup_DBID_list : ActivityGroup_DBID_list,
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("停用錯誤");
				},
				success : function(data) {
					group();
					toastr.success("停用成功");
				}
			});
}else{
	toastr.error("請選擇停用項目");
}
	closeAllHrContent();
	$("#AGContent").show();
	$("#manageAGContent").show();
}

function AGKK(message) {
	var selected=[];
    $("[name=AG0]:checkbox:checked").each(function(){
      selected.push($(this).val());
      });
    $("[name=AG1]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
		  
		  var ActivityGroup_DBID_list = selected.join();
		  

if(ActivityGroup_DBID_list.length){
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_ActivityGroup",
				data : {
					deleteflag : 0,
					ActivityGroup_DBID_list : ActivityGroup_DBID_list,
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("啟用錯誤");
				},
				success : function(data) {
					group();
					toastr.success("啟用成功");
				}
			});
}else{
toastr.error("選擇啟用項目");
}
	closeAllHrContent();
	$("#AGContent").show();
	$("#banAGContent").show();
}

</script>
</html>


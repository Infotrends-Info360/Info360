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
		<!-- ActivityData 開始 -->
				<!-- 服務代碼管理切換頁籤Start -->
				<div id="hrTabControlButton" style="margin: 1px 0px 0px 1px;">
					<button class="btn-sm btn-primary manage" onclick="showManage_AD()">
						<i class="fa fa-fw fa-user"></i>代碼管理
					</button>
<!-- 					<button class="btn-sm btn-success ban" onclick="showBan_AD()"> -->
<!-- 						<i class="fa fa-fw fa-user"></i>停用列表 -->
<!-- 					</button> -->
					<button class="btn-sm btn-success addMember" style="display: none;">
						<span onclick="showAddMemberAD()">新增代碼</span> <i
							class="fa fa-times" onclick="closeAddMemberAD()"></i>
					</button>
					<button class="btn-sm btn-success editMember"
						style="display: none;">
						<span onclick="showEditMemberAD()" id="UPAD"></span> <i
							class="fa fa-times" onclick="closeEditMemberAD()"></i>
					</button>
					
				</div>
				<!-- 服務代碼管理切換頁籤End -->

				<!-- 設定頁面內容頁 Start-->
				<div class="panel-body" id="settingContent">
					<div id="manageADContent" style="display: none;">
						<div id="ADul">
							<ul class="pagination">
								<li onclick="showAddMemberAD()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="unlockAccountAD()"><a href="#"><i
										class="glyphicon glyphicon-trash"></i></a></li>
										<select class="selectpicker" style="width: 127px;" id="menuAD"
										onchange="groupAD()">
										</select>
							</ul>
							<ul class="pagination" style="float: right;">
								<li><input type="text" id="manageTableADSearch"
									placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox" id="AD00">
						<div class="spiner-example" id="ADLoading">
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
							<div class="col-lg-12 col-md-12" id="AD0">
								<table class="table table-bordered table-hover"
									id="manageTableAD">
									<thead>
										<tr>
											<th style="width:20px" class="no-sort"><input type="checkbox"
												id="AD0All" ischecked=false></th>
											<th style="display: none;">編號</th>
											
											<th>名稱</th>
											<th>顏色</th>
<!-- 											<th>狀態</th> -->
											<th>關聯</th>
											<th>類型</th>
											<th style="width:140px">建立時間</th>
											<th style="width:50px">排序</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
								<input id="ADupdbid" value="" type="hidden">
								<input id="ADdowdbid" value="" type="hidden">

					<!-- 新增  -->
					<div id="addMemberADContent" style="display: none;">
						<div class="widget">
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">代碼名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="in_codename"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">顏色代碼</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" id="in_color"
										placeholder="" value="000000">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">分類:</label>
								<div class="col-sm-8">
									
									<select id="in_titleflag">
										<option value="0">資料</option>
										<option value="1">標題</option>
									</select>
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">關聯:</label>
								<div class="col-sm-8">
									<select id="titleflagD">
									
									</select>
								</div>
							</div>
<!-- 							<div class="form-group col-sm-6"> -->
<!-- 								<label for="inputAccount" class="col-sm-3 control-label">sort:</label> -->
<!-- 								<div class="col-sm-8"> -->
<!-- 									<input type="text" class="form-control" id="in_sort" -->
<!-- 										placeholder=""> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary" onclick="sendAddMemberAD()">儲存</button>
									<button class="btn btn-default" onclick="closeAddMemberAD()">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 新增 END -->
					<!-- 更新  -->
					<div id="editMemberADContent" style="display: none;">
						<div class="widget">
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">代碼名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="up_codenameAD">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputName" class="col-sm-3 control-label">顏色代碼:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="up_colorAD"
										placeholder="">
								</div>
							</div>
									<input type="hidden" class="form-control" id="up_dbidAD"
										placeholder="">

							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary" onclick="sendEditMemberAD()">更新</button>
									<button class="btn btn-default" onclick="closeEditMemberAD()">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 更新END -->
		</div>
		<!-- ActivityData 結束 -->
			</div>
</body>

<!-- 彈跳對話視窗-->

<!-- ActivityData -->
<!-- 鎖符號BUTTON -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#unlockModalAD" style="display: none;" id="unlockButtonAD">unlockDialog</button>
<div id="unlockModalAD" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否刪除？</h3>
			</div>
			<div class="modal-footer">

				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="ADLuck('停用')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- 鎖符號BUTTON END -->

<!-- AD_OK -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#ADok1" style="display: none;" id="ADok2">unlockDialog</button>
<div id="ADok1" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否啟用？</h3>
			</div>
			<div class="modal-footer">

				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="ADok('啟用成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- AD_OK END -->

<!-- ActivityData END-->

<!-- ================================================================================== -->
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
	showActivityData();
});

function showActivityData() {
	$("button.editMember").hide();

	closeAllHrContent();
	$("#ADContent").show();
	$("#manageADContent").show();

	$("button.Agentreason").removeClass("btn-success");
	$("button.Agentreason").addClass("btn-primary");
	AD();
	$("#manageTableAD tbody tr").empty();
	$("#banTableAD tboby tr").empty();
}

function groupAD() {
	
	$("#ADLoading").show();
	$("#AD0").hide();
	$("#ADul").hide();

	$("#titleflagD").empty();
	
	$("#AD1All").prop("checked", false);
	$("#AD0All").prop("checked", false);
	
	$("#manageTableAD tbody tr").empty();
	$("#banTableAD tboby tr").empty();

	var dbid = document.getElementById("menuAD").value
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/FLAGDATA",
				data : {
					dbid : dbid
				},
				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("請重新整理");
				},
				success : function(data) {
					
						for (var i = 0; i < data.Title.length; i++) {
						
							var titleflagD = "<option value='"+data.Title[i].dbid+"'>"
									+ data.Title[i].codename
									+ "</option>"
							document.getElementById("titleflagD")
									.insertAdjacentHTML("BeforeEnd", titleflagD);
						}						
					
					console.log("啟用服務代碼", data);
					var tgroup = data.Title;
					//        	alert(JSON.stringify(data.person));
					$('#manageTableAD')
							.DataTable(
									{
										"ordering": false,
										"autoWidth": false,
										destroy : true,
										aaData : data.Flag0,
										
										aoColumns : [
												{
													className : "dt-body-center"
												},
//													{
//														"data" : "dbid"
//													},
												 {
													"data" : "codename"
												}, {
													"data" : "color"
												},
												{
//														"data" : "titlegroup"
													className:"titlegroup"

												}, 
												{
//														"data" : "titleflag"
													className:"titleflag"
												},	
												{
													"data" : "createdatetime"
												}
//													, {
//														"data" : "sort"
//													}

										],'columnDefs': [{
									         'targets': 0,
									         'searchable': false,
									         'orderable': false,
									         'className': 'dt-body-center',
									         'render': function (data, type, full, meta){
									             return '<input type="checkbox" name="AD0" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
									         }
									      },{
										         'targets': 4,
										         'searchable': false,
										         'orderable': false,
										         'className': 'titleflag',
										         'render': function (data, type, full, meta){
														if(full.titleflag==0){
															 return '<span  ' + $('<div/>').text(data).html() + '">資料</span>';
														}else{
															
										             return '<span  ' + $('<div/>').text(data).html() + '">標題</span>';
														}
												}
										      },
										      {
											         'targets': 3,
											         'searchable': false,
											         'orderable': false,
											         'className': 'titleflag',
											         'render': function (data, type, full, meta){
															if(full.titlegroup==0){
																 return '<span  ' + $('<div/>').text(data).html() + '"></span>';
															}else{
																for(var i = 0; i<tgroup.length;i++){
																	if(tgroup[i].dbid==full.titlegroup){
																		 return '<span  ' + $('<div/>').text(data).html() + '">'+tgroup[i].codename+'</span>';
																	}																						
																}

															}
													}
											      },
											      {
												         'targets': 6,
												         'searchable': false,
												         'orderable': false,
												        'className': "  ",
												         'render': function (data, type, full, meta){
												        	
												        		 return '<label style="padding-left:5px" onclick="AD_up()" class="glyphicon glyphicon-triangle-top"></label><label style="padding-left:5px"  onclick="AD_dow()" class="glyphicon glyphicon-triangle-bottom"></label>';
												        
												         },
												
												      }
									      ],
										lengthChange : false
									});
					AD2();
					var ADflag = true;
					var table = $('#manageTableAD').DataTable();

					$('#manageTableAD tbody')
							.on(
									'click',
									'tr',
									function() {
										console.log("AD0", table.row(
												this).data());
										document
												.getElementById('up_codenameAD').value = table
												.row(this).data().codename;
										document
												.getElementById('up_colorAD').value = table
												.row(this).data().color;
										document
										.getElementById('up_dbidAD').value = table
										.row(this).data().dbid;
										document
										.getElementById('UPAD').innerHTML = table
										.row(this).data().codename;
										document
										.getElementById('ADupdbid').value = table
										.row(this).data().dbid;
										document
										.getElementById('ADdowdbid').value = table
										.row(this).data().dbid;
										
										if(ADflag){
											showEditMemberAD(data,tabledata);
										}
									});
					$('#manageTableAD tbody').on('click','td',function() {

						var text = $(this).text();	

						if (text && text != "") {
							ADflag = true;
						}else{
							ADflag = false;
							return;
						}
						
									});
					$("#ADLoading").hide();
					$("#AD0").show();
					$("#ADul").show();
				}
			});

	$("#manageTableAD").css("width", "100%");
	$("#manageTableAD_filter").prop("style", "float:right;");
	$("#manageTableAD_wrapper > div:nth-child(1)").hide();

	$("#manageTableADSearch").keyup(function() {
		var searchText = $("#manageTableADSearch").val();

		$("input[aria-controls='manageTableAD']").val(searchText);
		$("input[aria-controls='manageTableAD']").trigger("keyup");
	});

}

function AD() {
	$("#ADLoading").show();
	$("#AD0").hide();
	$("#ADul").hide();
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Query_ActivityGroup",
				data : {
					dbid : 0
				},
				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("請重新整理");
				},
				success : function(data) {
					$('#menuAD').empty();
					var menu1 = "<option id='ADfirst' value='"+data.activitygroups[0].dbid+"'>"+data.activitygroups[0].groupname+"</option>"
						document.getElementById("menuAD").insertAdjacentHTML(
								"BeforeEnd", menu1);
					
					
					for (var i = 1; i < data.activitygroups.length; i++) {
						
						var menu = "<option value='"+data.activitygroups[i].dbid+"'>"
								+ data.activitygroups[i].groupname
								+ "</option>"
						document.getElementById("menuAD")
								.insertAdjacentHTML("BeforeEnd", menu);
					}
					
					console.log("服務代碼群組", data);
					
					$("#AD1All").prop("checked", false);
					$("#AD0All").prop("checked", false);
					
					$("#manageTableAD tbody tr").empty();
					$("#banTableAD tboby tr").empty();

					var dbid = document.getElementById("ADfirst").value
					$
							.ajax({
								url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/FLAGDATA",
								data : {
									dbid : dbid
								},
								type : "POST",
								dataType : 'json',

								error : function(e) {
									toastr.error("請重新整理");
								},
								success : function(data) {
									
			 						for (var i = 0; i < data.Title.length; i++) {
										
			 							var titleflagD = "<option value='"+data.Title[i].dbid+"'>"
			 									+ data.Title[i].codename
			 									+ "</option>"
			 							document.getElementById("titleflagD")
			 									.insertAdjacentHTML("BeforeEnd", titleflagD);
			 						}						
									
									console.log("啟用服務代碼", data);
									var tgroup = data.Title;
									$('#manageTableAD')
											.DataTable(
													{
														"ordering": false,
														"autoWidth": false,
														destroy : true,
														aaData : data.Flag0,
														
														aoColumns : [
																{
																	className : "dt-body-center"
																},
//			 													{
//			 														"data" : "dbid"
//			 													},
																 {
																	"data" : "codename"
																}, {
																	"data" : "color"
																},
																{
//																		"data" : "titlegroup"
																	className:"titlegroup"

																}, 
																{
//			 														"data" : "titleflag"
																	className:"titleflag"
																},	
																{
																	"data" : "createdatetime"
																}
//			 													, {
//			 														"data" : "sort"
//			 													}

														],'columnDefs': [{
													         'targets': 0,
													         'searchable': false,
													         'orderable': false,
													         'className': 'dt-body-center',
													         'render': function (data, type, full, meta){
//														        	 alert(JSON.stringify(full));
													             return '<input type="checkbox" name="AD0" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
													         }
													      },{
														         'targets': 4,
														         'searchable': false,
														         'orderable': false,
														         'className': 'titleflag',
														         'render': function (data, type, full, meta){
//																        	 alert(JSON.stringify(tgroup));
																		if(full.titleflag==0){
																			 return '<span  ' + $('<div/>').text(data).html() + '">資料</span>';
																		}else{
																			
														             return '<span  ' + $('<div/>').text(data).html() + '">標題</span>';
																		}
																}
														      },
														      {
															         'targets': 3,
															         'searchable': false,
															         'orderable': false,
															         'className': 'titleflag',
															         'render': function (data, type, full, meta){
//																        	 alert(JSON.stringify(full));
																			if(full.titlegroup==0){
																				 return '<span  ' + $('<div/>').text(data).html() + '"></span>';
																			}else{
//																					alert(JSON.stringify(data.Title));
																				for(var i = 0; i<tgroup.length;i++){
																					if(tgroup[i].dbid==full.titlegroup){
																						 return '<span  ' + $('<div/>').text(data).html() + '">'+tgroup[i].codename+'</span>';
																					}																						
																				}

																			}
																	}
															      }, 
															      {
																         'targets': 6,
																         'searchable': false,
																         'orderable': false,
																        'className': "  ",
																         'render': function (data, type, full, meta){
																        	
																        		 return '<label style="padding-left:5px" onclick="AD_up()" class="glyphicon glyphicon-triangle-top"></label><label style="padding-left:5px"  onclick="AD_dow()" class="glyphicon glyphicon-triangle-bottom"></label>';
																        
																         },
																
																      }
													      ],
														lengthChange : false
													});
									AD2();
									var ADflag = true
									var table = $('#manageTableAD').DataTable();

									$('#manageTableAD tbody')
											.on(
													'click',
													'tr',
													function() {
														console.log("AD0", table.row(
																this).data());
														document
																.getElementById('up_codenameAD').value = table
																.row(this).data().codename;
														document
																.getElementById('up_colorAD').value = table
																.row(this).data().color;
														document
														.getElementById('up_dbidAD').value = table
														.row(this).data().dbid;
														document
														.getElementById('UPAD').innerHTML = table
														.row(this).data().codename;
														document
														.getElementById('ADupdbid').value = table
														.row(this).data().dbid;
														document
														.getElementById('ADdowdbid').value = table
														.row(this).data().dbid;
														
														if(ADflag){
															showEditMemberAD(data,tabledata);
														}
													});
									$('#manageTableAD tbody').on('click','td',function() {

										var text = $(this).text();	
										//$("input[name='person0']")
//											alert(text);
										if (text && text != "") {
//												alert("if");
											ADflag = true;
											//aa(data,table.row(this).data());
										}else{
											ADflag = false;
											return;
										}
										
													});
								}
							});

					$("#manageTableAD").css("width", "100%");
					$("#manageTableAD_filter").prop("style", "float:right;");
					$("#manageTableAD_wrapper > div:nth-child(1)").hide();

					$("#manageTableADSearch").keyup(function() {
						var searchText = $("#manageTableADSearch").val();
						$("input[aria-controls='manageTableAD']").val(searchText);
						$("input[aria-controls='manageTableAD']").trigger("keyup");
					});

					$("#ADLoading").hide();
					$("#AD0").show();
					$("#ADul").show();
				}
			});
	
	
	
	

}
function AD_up() {
	 setTimeout(function(){   
		  var ADupdbid = document.getElementById('ADupdbid').value;
//		alert(ADupdbid);
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/AData_Sortup",
				data : {
					dbid:ADupdbid
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("至頂");
				},
				success : function(data) {
					groupAD();
					toastr.success("上升排序成功");
				}
			});
		
		  
	closeAllHrContent();
	$("#ADContent").show();
	$("#manageADContent").show();
	 }, 10);
}
function AD_dow() {
	setTimeout(function(){   
		  var ADdowdbid = document.getElementById('ADdowdbid').value;
		 
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/AData_Sortdown",
				data : {
					dbid:ADdowdbid
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("最底層");
				},
				success : function(data) {
					groupAD();
					toastr.success("下降排序成功");
				}
			});
		
		  
	closeAllHrContent();
	$("#ADContent").show();
	$("#manageADContent").show();
	}, 10);
}
function AD2() {

	$("#AD0All").click(function() {
		   if($("#AD0All").prop("checked")) {
		     $("input[name='AD0']").each(function() {
		         $(this).prop("checked", true);
		     });
		   } else {
		     $("input[name='AD0']").each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
		});
	$("#AD1All").click(function() {
		   if($("#AD1All").prop("checked")) {
		     $("input[name='AD1']").each(function() {
		         $(this).prop("checked", true);
		     });
		   } else {
		     $("input[name='AD1']").each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
		});
}

//
//
//顯示 啟用表格
function showManage_AD() {
	closeAllHrContent();

	$("#ADContent").show();
	$("#manageADContent").show();

	$("button.manageAD").removeClass("btn-success");
	$("button.manageAD").addClass("btn-primary");

}
//顯示 停用表格
function showBan_AD() {
	closeAllHrContent();

	$("#ADContent").show();
	$("#banADContent").show();

	$("button.ban").removeClass("btn-success");
	$("button.ban").addClass("btn-primary");

}
//
//新增畫面
function showAddMemberAD() {
	
	
	
	document.getElementById("in_codename").value="";
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
	var in_activitygroupsid = document.getElementById("menuAD").value;
	var in_codename = document.getElementById("in_codename").value;
	var in_color = document.getElementById("in_color").value;
	var in_titleflag = document.getElementById("in_titleflag").value;
	var in_titlegroup = document.getElementById("titleflagD").value;
	
	if(in_titleflag==1){
		in_titlegroup=0;
	}
	

	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_ActivityData",
				data : {
					activitygroupsid : in_activitygroupsid,
					codename : in_codename,
					color : in_color,
					titleflag : in_titleflag,
					titlegroup : in_titlegroup,
					deleteflag : 0
					

				},

				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("新增錯誤");
				},
				success : function(data) {
					groupAD();
					toastr.success("新增成功");
				}

			});
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
//		var up_sort = document.getElementById("up_sortAD").value;

	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_ActivityData",
				data : {
					codename : up_codename,
					color : up_color,
					dbid : up_dbid
		

				},

				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("更新錯誤");
				},
				success : function(data) {
					groupAD();
					toastr.error("更新成功");
				}
			});
	closeAllHrContent();
	$("#ADContent").show();
	$("#manageADContent").show();
}

//解鎖對話視窗
function unlockAccountAD() {
	$("#unlockButtonAD").trigger("click");

}
function AD_ok22() {
	$("#ADok2").trigger("click");

}

function ADLuck(message) {

	
	var selected=[];
    $("[name=AD0]:checkbox:checked").each(function(){
      selected.push($(this).val());
      });
    $("[name=AD1]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
		  
		  var ActivityData_DBID_list = selected.join();
		  if(ActivityData_DBID_list.length){
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_ActivityData",
				data : {
					deleteflag : 1,
					ActivityData_DBID_list : ActivityData_DBID_list
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("停用錯誤");
				},
				success : function(data) {
					groupAD();
					toastr.success("停用成功");
				}
			});
		  }else{
			  toastr.error("請選擇停用項目");
		  }
	closeAllHrContent();
	$("#ADContent").show();
	$("#manageADContent").show();
}

function ADok(message) {
	
	var selected=[];
    $("[name=AD0]:checkbox:checked").each(function(){
      selected.push($(this).val());
      });
    $("[name=AD1]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
		  
		  var ActivityData_DBID_list = selected.join();
		  if(ActivityData_DBID_list.length){
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_ActivityData",
				data : {
					deleteflag : 0,
					ActivityData_DBID_list : ActivityData_DBID_list
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("啟用錯誤");
				},
				success : function(data) {
					groupAD();
					toastr.success("啟用成功");
				}
			});
}else{
	toastr.error("請選擇啟用項目");
}
	closeAllHrContent();
	$("#ADContent").show();
	$("#banADContent").show();
}

</script>
</html>


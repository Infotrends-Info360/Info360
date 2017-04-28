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
	
<style type="text/css">
.dataTables_filter {
	display: none;
}
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
				<!-- 部門開始 -->
				<!-- 部門管理切換頁籤Start -->
				<div id="hrTabControlButton" style="margin: 1px 0px 0px 1px;">
					<button class="btn-sm btn-primary manage"
						onclick="showManage_group()">
						<i class="fa fa-fw fa-user"></i>部門管理
					</button>
					<button class="btn-sm btn-success addMember" style="display: none;">
						<span onclick="showAddMembergroup()">新增部門</span> <i
							class="fa fa-times" onclick="closeAddMembergroup()"></i>
					</button>
					<button class="btn-sm btn-success editMember"
						style="display: none;">
						<span onclick="showEditMembergroup()" id="UPgroup"></span> <i
							class="fa fa-times" onclick="closeEditMembergroup()"></i>
					</button>
				</div>
				<!-- 部門管理切換頁籤End -->

				<!-- 設定頁面內容頁 Start-->
				<div class="panel-body" id="settingContent">
					<div id="managegroupContent" style="display: none;">
						<div id="groupul">
							<ul class="pagination">
								<li onclick="showAddMembergroup()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="confirmBangroup()"><a href="#"><i
										class="glyphicon glyphicon-trash"></i></a></li>
							</ul>
							<ul class="pagination" style="float: right;">
								<li><input type="text" id="managegroupTableSearch"
									placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox" id="group00">
						<div class="spiner-example" id="groupLoading">
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

				<div class="col-lg-12 col-md-12" id="group0">
								
								<table class="table table-bordered table-hover"
									id="managegroupTable">
									<thead>
										<tr>
											<th class="no-sort" style="width:20px"><input type="checkbox"
												id="group0All" ischecked=false ></th>
											<th>部門名稱</th>
<!-- 											<th>狀態</th> -->
<!-- 											<th>編號</th> -->
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>

					<!-- 新增  -->
					<div id="addMembergroupContent" style="display: none;">
						<div class="widget">
							<div class="form-group col-sm-12">
								<label for="inputAccount"
									class="col-sm-2 control-label">部門名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="in_name"
										placeholder="">
								</div>
							</div>
							
					<div class="tabs-container" style="width: 100%;height: 100%">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true">部門人員</a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">部門權限</a>
                        </li>
                    </ul>
                    		<div class="tab-content" >
				                        <div id="tab-1" class="tab-pane active" >
				                            <div class="panel-body">
				                                		<div class="form-group col-sm-6">
															<label for="inputEmail" class="col-sm-5 control-label">部門人員</label>
																<div id="Box5" ondrop="Drop(event)" ondragover="AllowDrop(event)" style="overflow: auto; width: 100%; height: 100px; border: 1px silver solid">
																</div>
														</div>
				                                
						                               <div class="form-group col-sm-6"> 
															<label for="inputEmail" class="col-sm-5 control-label">人員列表</label> 
																<div id="Box6" ondrop="Drop(event)" ondragover="AllowDrop(event)" style="overflow: auto; width: 100%; height: 100px; border: 1px silver solid">
															<div class="spiner-example" id="Box66Loading">
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
															<ul id="Box66"> 
															</ul>	
														</div>
														</div>	
														<button class="btn btn-primary" onclick="">新增</button>
														<button class="btn btn-default" onclick="">取消</button>
				                            </div>
				                        </div>
				                        <div id="tab-2" class="tab-pane" >
				                            <div class="panel-body">
														<div class="form-group col-sm-6">
															<label for="inputEmail" class="col-sm-5 control-label">部門權限</label>
																<div id="Box77" ondrop="Drop(event)" ondragover="AllowDrop(event)" style="overflow: auto; width: 100%; height: 100px; border: 1px silver solid">
																</div>
														</div>   
														<div class="form-group col-sm-6"> 
															<label for="inputEmail" class="col-sm-5 control-label">權限列表</label> 
																	<div id="Box8" ondrop="Drop(event)" ondragover="AllowDrop(event)" style="overflow: auto; width: 100%; height: 100px; border: 1px silver solid">
																			<div class="spiner-example" id="Box88Loading">
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
																		<ul id="Box88"> 
																		</ul>	
																	</div>
														</div>	
													                
											</div>
				                        </div>
                    		</div>
                	</div>
							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary" onclick="sendAddMembergroup()">儲存</button>
									<button class="btn btn-default" onclick="closeAddMembergroup()">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 新增 END -->
					<!-- 更新  -->
					<div id="editMembergroupContent" style="display: none;">
						<div class="widget">
							
									<input type="hidden" class="form-control" id="up_dbid" disabled>
						

							<div class="form-group col-sm-12">
								<label for="inputDepartment" class="col-sm-2 control-label">部門名稱:</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="up_name"
										placeholder="">
								</div>
							</div>
						<div class="tabs-container">
					                    <ul class="nav nav-tabs">
					                        <li class="active"><a data-toggle="tab" href="#tab-3" aria-expanded="true">人員列表</a>
					                        </li>
					                        <li class=""><a data-toggle="tab" href="#tab-4" aria-expanded="false">部門列表</a>
					                        </li>
					                    </ul>
					                    <div class="tab-content">
					                        <div id="tab-3" class="tab-pane active">
					                            <div class="panel-body">
					                                <div class="form-group col-sm-12"> 
														<label for="inputEmail" class="col-sm-5 control-label">人員列表</label> 
														<div style="overflow: auto; width: 100%; height: 450px; border: 1px silver solid">	
														<table class="table table-striped">
							                                <thead>
							                                    <tr>
							                                        <th></th>
							                                        <th>姓名</th>
							                                        <th>帳號</th>
							                                        <th>員工編號</th>
							                                    </tr>
							                                </thead>
							                                <tbody id="HavePerson">
							                                </tbody>
							                            </table>
														</div>
													</div>	

													<button class="btn btn-primary" onclick="addPersonButton()">新增</button>
													<button class="btn btn-primary" onclick="backPerson()">剔除</button>
													<button class="btn btn-default" onclick="">取消</button>         
												</div>
					                        </div>
					                        <div id="tab-4" class="tab-pane">
					                            <div class="panel-body">
					                            	<div class="form-group col-sm-12"> 
															<label for="inputEmail" class="col-sm-5 control-label">部門權限</label> 
																<div style="overflow: auto; width: 100%; height: 450px; border: 1px silver solid">
																	<table  class="table table-striped">
										                                <thead>
										                                    <tr>
										                                        <th></th>
										                                        <th>權限名稱</th>
										                                        <th>權限描述</th>
										                                    </tr>
										                                </thead>
										                                <tbody id="HaveAuthority">
										                                    
										                                </tbody>
										                            </table>
																</div>
													</div>
													<button class="btn btn-primary" onclick="addAuthorityButton()">新增</button>
													<button class="btn btn-primary" onclick="backAuthority()">剔除</button>
													<button class="btn btn-default" onclick="">取消</button>  	
					                            </div>
					                        </div>
					                    </div>
                		</div>						
							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary" onclick="sendEditMembergroup()">更新</button>
									<button class="btn btn-default"	onclick="closeEditMembergroup()">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 更新END -->

				</div>
				<!-- 設定頁面內容頁 End-->
		<!-- GROUP 結束 -->
			</div>
			
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#addPerson" id="addPersonButton" style="display: none;" ></button>
<div id="addPerson" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
			<h3 class="btn btn-w-m btn-primary">人員列表</h3><p>
					<div>
					
						<table class="table table-striped" style="border:3px #cccccc solid;" cellpadding="10" border='1'>
							    <thead>
							        <tr>
										<th class="no-sort" style="width:20px"><input type="checkbox"
												id="NotHavePersonAll" ischecked=false ></th>
							          <th>姓名</th>
							          <th>帳號</th>
							          <th>員工編號</th>
							       </tr>
							    </thead>
							      <tbody id="NotHavePerson">
							                                    
							     </tbody>
						</table>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="addPerson()">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>

<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#addAuthority" id="addAuthorityButton" style="display: none;" ></button>
<div id="addAuthority" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3 class="btn btn-w-m btn-primary">權限列表</h3><p>
					<div >
						<table  class="table table-striped" style="border:3px #cccccc solid;" cellpadding="10" border='1'>
							<thead>
									<tr>
										<th></th>
										<th>權限名稱</th>
										<th>權限描述</th>
									</tr>
							 </thead>
							<tbody id="NotHaveAuthority">
							</tbody>
						</table>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="addAuthority()">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>			
			
</body>

<!-- 彈跳對話視窗-->
<!-- 垃圾桶符號BUTTON -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#confirmBangroup" style="display: none;"
	id="confirmBanButtongroup">banDialog</button>

<!-- 垃圾桶符號BUTTON -->
<div id="confirmBangroup" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否刪除？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
					<div class="col-sm-3">
						<input type="hidden" class="form-control"
							id="deletedbid_GroupDelete" placeholder="">
					</div>
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="GroupDelete('刪除成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>

	</div>
</div>
<!-- 垃圾桶符號BUTTON END -->
<!-- GROUP 結束-->



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
var insertPerson = "";
var insertAuthority = "";


$(document).ready(function() {
	showGroup();
});

function showGroup() {
	$("button.editMember").hide();

	closeAllHrContent();
	$("#groupContent").show();
	$("#managegroupContent").show();
	$("button.group").removeClass("btn-success");
	$("button.group").addClass("btn-primary");

	select();
}

function groupperson(){

	$("#Box22").empty();
	$("#Box3").empty();
	$("#Box1").empty();
	$("#Box4").empty();
	$("#Box5").empty();
	$("#Box66").empty();
}
function select() {
	$("#groupLoading").show();
	$("#group0").hide();
	$("#groupul").hide();
	$('#Box77').empty();
	$('#Box5').empty();
	$('#Box88').empty();
	$('#Box66').empty();
	$('#Box0').empty();
	$('#Box9').empty();
	$('#Box90').empty();
	$('#Box09').empty();
	groupperson();
	$("#group0All").prop("checked", false);

	
	$("#Box66").empty();
	$("#Box88").empty();
	$("#managegroupTable tbody tr").empty();
	$("#bangroupTable tboby tr").empty();
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Query_Group_STATE",
				data : {
					state : 0
				},
				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("請重新整理");
				},
				success : function(data) {
					console.log("啟用部門", data);

					$('#managegroupTable')
							.DataTable(
									{
										"autoWidth": false,
										destroy : true,
										aaData : data.group,
										aoColumns : [{
											
											className : "dt-body-center"
										}, {
											"data" : "name"
										}
										],'columnDefs': [{
									         'targets': 0,
									         'searchable': false,
									         'orderable': false,
									         'className': 'dt-body-center',
									         'render': function (data, type, full, meta){
									             return '<input type="checkbox" name="group0" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
									         }
									      }],
										lengthChange : false
									});
					group2();
					var groupflag = true; 			
				var table = $('#managegroupTable').DataTable();
									$('#managegroupTable tbody')
											.on(
													'click',
													'tr',
													function() {
														
							document
									.getElementById('deletedbid_GroupDelete').value = table
									.row(this).data().dbid;

							document
									.getElementById('up_dbid').value = table
									.row(this).data().dbid;

							document
									.getElementById('UPgroup').innerHTML = table
									.row(this).data().name;
							
							document
							.getElementById('up_name').value = table
							.row(this).data().name;
							if(groupflag){
								showEditMembergroup(data,table.row(this).data());
							}
//								
						});
							$('#managegroupTable tbody').on('click','td',function() {

									var text = $(this).text();	

									if (text && text != "") {
										groupflag = true;
									}else{
										groupflag = false;
										return;
									}
													});
								$("#groupLoading").hide();
								$("#group0").show();
								$("#groupul").show();

				}
			});
	

	$("#managegroupTable").css("width", "100%");
	$("#managegroupTable_filter").prop("style", "float:right;");
	$("#managegroupTable_wrapper > div:nth-child(1)").hide();

	$("#managegroupTableSearch").keyup(function() {
		var searchText = $("#managegroupTableSearch").val();

		$("input[aria-controls='managegroupTable']").val(searchText);
		$("input[aria-controls='managegroupTable']").trigger("keyup");
	});
	
}

function group2(data,tabledata) {

	$("#group0All").click(function() {
		   if($("#group0All").prop("checked")) {
		     $("input[name='group0']").each(function() {
		         $(this).prop("checked", true);
		     });
		   } else {
		     $("input[name='group0']").each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
		});
	
// 	$("#NotHavePersonAll").click(function() {
// 		   if($("#NotHavePersonAll").prop("checked")) {
// 		     $("input[name='NotHavePerson']").each(function() {
// 		         $(this).prop("checked", true);
// 		     });
// 		   } else {
// 		     $("input[name='NotHavePerson']").each(function() {
// 		         $(this).prop("checked", false);
// 		     });           
// 		   }
// 		});
	
}

//顯示Group 啟用表格
function showManage_group() {
	closeAllHrContent();

	$("#groupContent").show();
	$("#managegroupContent").show();
	$("button.managegroup").removeClass("btn-success");
	$("button.managegroup").addClass("btn-primary");

}
//顯示Group 停用表格
function showBan_group() {
	closeAllHrContent();

	$("#groupContent").show();
	$("#bangroupContent").show();
	$("button.ban").removeClass("btn-success");
	$("button.ban").addClass("btn-primary");

}

//新增畫面
function showAddMembergroup() {
	$("#Box88").hide();
	$("#Box66").hide();
	$("#Box66Loading").show();
	$("#Box88Loading").show();
	
	$('#Box77').empty();
	$('#Box5').empty();
	$('#Box88').empty();
	$('#Box66').empty();
	$('#Box0').empty();
	$('#Box9').empty();
	$('#Box09').empty();
	$('#Box90').empty();
	
	document.getElementById('in_name').value=""
		$
		.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Query_Group_STATE",
			data : {
				state : 0
			},
			type : "POST",
			dataType : 'json',

			error : function(e) {
				toastr.error("請重新整理");
			},
			success : function(data) {
				for(var i=0; i<data.ALLperson.length; i++){
					var person = "<td><input type='checkbox' name='group0' value='"+data.ALLperson[i].dbid+"'></td></td>"+data.ALLperson[i].user_name+"</td><p>"
// 			        var menu1 = "<li id='Imggroup"+data.ALLperson[i].dbid+"'  draggable='true' ondragstart='Drag(event)'  style='margin-top:5px;padding:5px 15px; background:#d65c5c;color:white; border:0 none; width: 100%; cursor:pointer;-webkit-border-radius: 5px;border-radius: 5px;'><input  type='hidden'  value="+data.ALLperson[i].dbid+" ><p>"+data.ALLperson[i].user_name+"</p></li>"
			        document.getElementById("Box66").insertAdjacentHTML("BeforeEnd",person);
				}
				
				for(var a=0; a<data.ALLfunction.length; a++){
			        var Function = "<li id='Imggroupf"+data.ALLfunction[a].dbid+"'  draggable='true' ondragstart='Drag(event)'  style='margin-top:5px;padding:5px 15px; background:#d65c5c;color:white; border:0 none; width: 100%; cursor:pointer;-webkit-border-radius: 5px;border-radius: 5px;'><input  type='hidden'  value="+data.ALLfunction[a].dbid+" ><p>"+data.ALLfunction[a].name+"</p></li>"
			        document.getElementById("Box88").insertAdjacentHTML("BeforeEnd",Function);
				}
				$("#Box66Loading").hide();
				$("#Box88Loading").hide();
				$("#Box66").show();
				$("#Box88").show();			
			}
		});
	
	closeAllHrContent();
	$("#groupContent").show();
	$("#addMembergroupContent").show();

	$("button.addMember").show();
	$("button.addMember").removeClass("btn-success");
	$("button.addMember").addClass("btn-primary");
}

//新增功能
function sendAddMembergroup() {
	   if (!validateGroupN()) {
           return;
       }
	closeAddMember();
	
	var in_name = document.getElementById('in_name').value;

	var groupperson = $('#Box5 input');
	var arr = $.makeArray(groupperson);
	
	var kk = "";
	for(var i=0;i<arr.length;i++){
	var hh = arr[i].value;
	kk += arr[i].value+",";
	}
	
	
	var groupfunction = $('#Box77 input');
	var arr = $.makeArray(groupfunction);
	
	var ll = "";
	for(var a=0;a<arr.length;a++){
	var hh = arr[a].value;
	ll += arr[a].value+",";
	}

	$
			.ajax({
				url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_GroupInfo",
				data : {
					state : 0,
					name : in_name,
					person_dbid:kk,
					function_dbid:ll
					
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("新增錯誤");
				},
				success : function(data) {
					select();
					toastr.success("新增成功");		
					}
			});

	
	closeAllHrContent();
	$("#groupContent").show();
	$("#managegroupContent").show();
}

function validateGroupN() {
    var IN = $("#in_name").val();
    
	var groupfunction = $('#Box77 input');
	var arr = $.makeArray(groupfunction);
	
    var GF = arr.length; 
    
   
    if (!IN || IN == '' ) {
        toastr.error("請輸入部門名稱");
        return false;
    }
    if (IN !='' && isValidNumber(IN)) {
        toastr.error("名稱請輸入中文或英文");
        return false;
    }
    
    if (GF==0) {
        toastr.error("請選擇權限");
        return false;
    }
	   return true;
}
function isValidNumber(IN) {
	var re = /^[0-9]*$/;		
	return re.test(IN);
}

function closeAddMembergroup() {
	closeAllHrContent();
	$("button.addMember").hide();

	$("#groupContent").show();
	$("#managegroupContent").show();

	$("button.managegroup").removeClass("btn-success");
	$("button.managegroup").addClass("btn-primary");
}


function jump(data,tabledata){
	var arr = tabledata.have_person_username.split(',');
	var arrdbid = tabledata.have_person_dbid.split(',');
	var arrAccount = tabledata.HavePersonAccount.split(',');
	var arrEmployeeId = tabledata.HavePersonEmployeeId.split(',');

	for (var i in arrdbid ) {
		if(arrdbid[i].trim()!="" && arr[i].trim()!="" ){

			var HavePerson = "<tr id='removeHavePerson"+arrdbid[i]+"'><td><input type='checkbox' name='HavePersonTitle' class='i-checks' value='"+arrdbid[i]+"'></td><td>"+arr[i]+"</td><td>"+arrAccount[i]+"</td><td>"+arrEmployeeId[i]+"</td><input type='hidden' id='1HavePerson"+arrdbid[i]+"' value='"+arrdbid[i]+"'><input type='hidden' id='2HavePerson"+arrdbid[i]+"' value='"+arr[i]+"'><input type='hidden' id='3HavePerson"+arrdbid[i]+"' value='"+arrAccount[i]+"'><input type='hidden' id='4HavePerson"+arrdbid[i]+"' value='"+arrEmployeeId[i]+"'></tr>"
	        document.getElementById("HavePerson").insertAdjacentHTML("BeforeEnd",HavePerson);	
		}
	}
	
	var arr = tabledata.have_function.split(',');
	var arrdbid = tabledata.have_function_dbid.split(',');
	var arrdescription = tabledata.HaveFunctionDescription.split(',');

	for (var i in arrdbid ) {
		if(arrdbid[i].trim()!="" && arr[i].trim()!="" ){
			var HaveAuthority ="<tr id='removeHaveAuthority"+arrdbid[i]+"'><td><input type='checkbox' name='HaveAuthorityTitle' class='i-checks' value='"+arrdbid[i]+"'></td><td>"+arr[i]+"</td><td>"+arrdescription[i]+"</td><input type='hidden' id='1HaveAuthority"+arrdbid[i]+"' value='"+arrdbid[i]+"'><input type='hidden' id='2HaveAuthority"+arrdbid[i]+"' value='"+arr[i]+"'><input type='hidden' id='3HaveAuthority"+arrdbid[i]+"' value='"+arrdescription[i]+"'></tr>"
	        document.getElementById("HaveAuthority").insertAdjacentHTML("BeforeEnd",HaveAuthority);	
		}
	}
	
	
	var arr = tabledata.not_have_person_username.split(',');
	var arrdbid = tabledata.not_have_person_dbid.split(',');
	var arrAccount = tabledata.NotHavePersonAccount.split(',');
	var arrEmployeeId = tabledata.NotHavePersonEmployeeId.split(',');
	for (var i in arrdbid ) {
		if(arrdbid[i].trim()!="" && arr[i].trim()!="" ){
			var NotHavePerson = "<tr id='removePerson"+arrdbid[i]+"'><td><input type='checkbox' name='NotHavePersonTitle' class='i-checks' value='"+arrdbid[i]+"'></td><td>"+arr[i]+"</td><td>"+arrAccount[i]+"</td><td>"+arrEmployeeId[i]+"</td><input type='hidden' id='1NotHavePerson"+arrdbid[i]+"' value='"+arrdbid[i]+"'><input type='hidden' id='2NotHavePerson"+arrdbid[i]+"' value='"+arr[i]+"'><input type='hidden' id='3NotHavePerson"+arrdbid[i]+"' value='"+arrAccount[i]+"'><input type='hidden' id='4NotHavePerson"+arrdbid[i]+"' value='"+arrEmployeeId[i]+"'></tr>"
	        document.getElementById("NotHavePerson").insertAdjacentHTML("BeforeEnd",NotHavePerson);	
		}
	}
	
	
	var arr = tabledata.not_function.split(',');
	var arrdbid = tabledata.not_function_dbid.split(',');
	var arrdescription = tabledata.NotHaveFunctionDescription.split(',');

	for (var i in arrdbid ) {
		if(arrdbid[i].trim()!="" && arr[i].trim()!="" ){
			var NotHaveAuthority ="<tr id='removeAuthority"+arrdbid[i]+"' ><td><input type='checkbox' name='NotHaveAuthorityTitle' class='i-checks' value='"+arrdbid[i]+"'></td><td>"+arr[i]+"</td><td>"+arrdescription[i]+"</td><input type='hidden' id='1NotHaveAuthority"+arrdbid[i]+"' value='"+arrdbid[i]+"'><input type='hidden' id='2NotHaveAuthority"+arrdbid[i]+"' value='"+arr[i]+"'><input type='hidden' id='3NotHaveAuthority"+arrdbid[i]+"' value='"+arrdescription[i]+"'></tr>"
	        document.getElementById("NotHaveAuthority").insertAdjacentHTML("BeforeEnd",NotHaveAuthority);	
		}
	}

	}

//更新頁面
function showEditMembergroup(data,tabledata) {
	$('#NotHaveAuthority').empty();
	$('#NotHavePerson').empty();
	$('#HavePerson').empty();
	$('#HaveAuthority').empty();
	$('#Box0').empty();
	$('#Box9').empty();
	$('#Box90').empty();
	$('#Box09').empty();

	jump(data,tabledata);

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
// 	   if (!validateGroupU()) {
//            return;
//        }
 		var HaveAuthority=[];
	   		$("[name=HaveAuthorityTitle]").each(function(){
	    		HaveAuthority.push($(this).val());
	      	});
		  	var HaveAuthorityList = HaveAuthority.join();
		  	
		var HavePerson=[];
			$("[name=HavePersonTitle]").each(function(){
				HavePerson.push($(this).val());
			});
			var HavePersonList = HavePerson.join();
			
// 			alert("Person="+HavePersonList);
// 			alert("Authority="+HaveAuthorityList)
				
	var up_dbid = document.getElementById('up_dbid').value;
	var up_name = document.getElementById('up_name').value;

	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_GroupInfo",
				data : {
					state : 0,
					name:up_name,
					person_dbid:HavePersonList,
					function_dbid:HaveAuthorityList,
					groupDBID_list:up_dbid
				},
				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("更新錯誤");
				},
				success : function(data) {
					select();
					toastr.success("更新成功");
				}
			});
	
	closeAllHrContent();
	$("#groupContent").show();
	$("#managegroupContent").show();
}

function validateGroupU() {
    var IN = $("#up_name").val();
    
    var groupfunction = $('#Box9 input');
	var arr = $.makeArray(groupfunction);
    var GF = arr.length;

    if (!IN || IN == '' ) {
        toastr.error("請輸入部門名稱");
        return false;
    }
    if (IN !='' && isValidNumber(IN)) {
        toastr.error("名稱請輸入中文或英文");
        return false;
    }
    if (GF==0) {
        toastr.error("請選擇權限");
        return false;
    }
	   return true;
}
function isValidNumber(IN) {
	var re = /^[0-9]*$/;		
	return re.test(IN);
}

//新增人員對話視窗
function addPersonButton() {
	$("#addPersonButton").trigger("click");

}
//新增權限對話視窗
function addAuthorityButton() {
	$("#addAuthorityButton").trigger("click");

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
//		var deletedbid = document.getElementById('deletedbid_GroupDelete').value;
	
	var selected=[];
    $("[name=group0]:checkbox:checked").each(function(){
      selected.push($(this).val());
      });
	  var groupDBID_list = selected.join();
	  if(groupDBID_list.length!=0){
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Delete_GroupInfo",
				data : {
					groupDBID_list : groupDBID_list
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("刪除失敗");
					
				},
				success : function(data) {
					select();
					toastr.success(message);
				}
			});
	
	  }else{
		  toastr.error("請選擇要刪除的項目");
	  }
	closeAllHrContent();
	$("#groupContent").show();
	$("#managegroupContent").show();
}

function addPerson() {
	var NotHavePerson=[];
    $("[name=NotHavePersonTitle]:checkbox:checked").each(function(){
    	NotHavePerson.push($(this).val());
      });
 
	var NotHavePersonList = NotHavePerson.join();
	insertPerson=NotHavePersonList;

	var List = NotHavePersonList.split(',');
	
	for (var i in List ) {
			var arrDbid = document.getElementById("1NotHavePerson"+List[i]).value;
			var arrName = document.getElementById("2NotHavePerson"+List[i]).value;
			var arrAccount = document.getElementById("3NotHavePerson"+List[i]).value;
			var arrEmployeeId = document.getElementById("4NotHavePerson"+List[i]).value;		

			var HavePerson = "<tr id='removeHavePerson"+arrDbid+"'><td><input type='checkbox' name='HavePersonTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><td>"+arrAccount+"</td><td>"+arrEmployeeId+"</td><input type='hidden' id='1HavePerson"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2HavePerson"+arrDbid+"' value='"+arrName+"'><input type='hidden' id='3HavePerson"+arrDbid+"' value='"+arrAccount+"'><input type='hidden' id='4HavePerson"+arrDbid+"' value='"+arrEmployeeId+"'></tr>"
			document.getElementById("HavePerson").insertAdjacentHTML("BeforeEnd",HavePerson);	
			$('#removePerson'+List[i]).remove();
		}
	sendEditMembergroup();
}

function addAuthority() {
	var NotHaveAuthority=[];
    $("[name=NotHaveAuthorityTitle]:checkbox:checked").each(function(){
    	NotHaveAuthority.push($(this).val());
      });
 
	var NotHaveAuthorityList = NotHaveAuthority.join();
	var List = NotHaveAuthorityList.split(',');
	
	for (var i in List ) {
			var arrDbid = document.getElementById("1NotHaveAuthority"+List[i]).value;
			var arrName = document.getElementById("2NotHaveAuthority"+List[i]).value;
			var arrDescription = document.getElementById("3NotHaveAuthority"+List[i]).value;

			var HaveAuthority = "<tr id='removeHaveAuthority"+arrDbid+"'><td><input type='checkbox' name='HaveAuthorityTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><td>"+arrDescription+"</td><input type='hidden' id='1HaveAuthority"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2HaveAuthority"+arrDbid+"' value='"+arrName+"'><input type='hidden' id='3HaveAuthority"+arrDbid+"' value='"+arrDescription+"'></tr>"

			document.getElementById("HaveAuthority").insertAdjacentHTML("BeforeEnd",HaveAuthority);	
			$('#removeAuthority'+List[i]).remove();
		}
	sendEditMembergroup();
}

function backPerson() {
	var HavePerson=[];
    $("[name=HavePersonTitle]:checkbox:checked").each(function(){
    	HavePerson.push($(this).val());
      });
 
	var HavePersonList = HavePerson.join();
	insertPerson=HavePersonList;
	var List = HavePersonList.split(',');
	
	for (var i in List ) {
			var arrDbid = document.getElementById("1HavePerson"+List[i]).value;
			var arrName = document.getElementById("2HavePerson"+List[i]).value;
			var arrAccount = document.getElementById("3HavePerson"+List[i]).value;
			var arrEmployeeId = document.getElementById("4HavePerson"+List[i]).value;		

			var NotHavePerson = "<tr id='removePerson"+arrDbid+"'><td><input type='checkbox' name='NotHavePersonTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><td>"+arrAccount+"</td><td>"+arrEmployeeId+"</td><input type='hidden' id='1NotHavePerson"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2NotHavePerson"+arrDbid+"' value='"+arrName+"'><input type='hidden' id='3NotHavePerson"+arrDbid+"' value='"+arrAccount+"'><input type='hidden' id='4NotHavePerson"+arrDbid+"' value='"+arrEmployeeId+"'></tr>"

			document.getElementById("NotHavePerson").insertAdjacentHTML("BeforeEnd",NotHavePerson);	
			$('#removeHavePerson'+List[i]).remove();
		}
	sendEditMembergroup();
}


function backAuthority() {
	var HaveAuthority=[];
    $("[name=HaveAuthorityTitle]:checkbox:checked").each(function(){
    	HaveAuthority.push($(this).val());
      });
 
	var HaveAuthorityList = HaveAuthority.join();
	var List = HaveAuthorityList.split(',');
	
	for (var i in List ) {
			var arrDbid = document.getElementById("1HaveAuthority"+List[i]).value;
			var arrName = document.getElementById("2HaveAuthority"+List[i]).value;
			var arrDescription = document.getElementById("3HaveAuthority"+List[i]).value;

			var NotHaveAuthority = "<tr id='removeAuthority"+arrDbid+"' ><td><input type='checkbox' name='NotHaveAuthorityTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><td>"+arrDescription+"</td><input type='hidden' id='1NotHaveAuthority"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2NotHaveAuthority"+arrDbid+"' value='"+arrName+"'><input type='hidden' id='3NotHaveAuthority"+arrDbid+"' value='"+arrDescription+"'></tr>"
			document.getElementById("NotHaveAuthority").insertAdjacentHTML("BeforeEnd",NotHaveAuthority);	
			$('#removeHaveAuthority'+List[i]).remove();
		}
	sendEditMembergroup();
}
</script>

</html>


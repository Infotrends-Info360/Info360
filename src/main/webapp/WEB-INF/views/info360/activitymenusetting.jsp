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
		<!-- ActivityMenu -->
			<div id="hrTabControlButton" style="margin: 1px 0px 0px 1px;">
					<button class="btn-sm btn-primary manage" onclick="showManage_AM()">
						<i class="fa fa-fw fa-user"></i>分類管理
					</button>
					<button class="btn-sm btn-success addMember" style="display: none;">
						<span onclick="showAddMember()">新增分類</span> <i class="fa fa-times"
							onclick="closeAddMemberAM()"></i>
					</button>
					<button class="btn-sm btn-success editMember"
						style="display: none;">
						<span onclick="showEditMember()" id="UPAM"></span> <i
							class="fa fa-times" onclick="closeEditMemberAM()"></i>
					</button>
				</div>
				<!-- 服務代碼分類管理切換頁籤End -->

				<!-- 設定頁面內容頁 Start-->
				<div class="panel-body" id="settingContent">
					<div id="manageAMContent" style="display: none;">
						<div id="AMul">
							<ul class="pagination">
								<li onclick="showAddMemberAM()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="unlockAccountAM()"><a href="#"><i
										class="glyphicon glyphicon-trash"></i></a></li>
							</ul>
							
							<ul class="pagination" style="float: right;">
								<li><input type="text" id="manageTableAMSearch"
									placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox" id="AM00">
						<div class="spiner-example" id="AMLoading">
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
							<div class="col-lg-12 col-md-12" id="AM0">
							
								<table class="table table-bordered table-hover"
									id="manageTableAM">
								<thead>
										<tr>
											<th style="width:20px" class="no-sort"><input type="checkbox"
												id="AM0All" ischecked=false ></th>
												
											<th style="display: none;" >編號</th>
											<th>清單名稱</th>
											<th style="width:140px"> 建立時間</th>
											<th style="width: 50px">排序</th>
										</tr>
									</thead>
									
								</table>
								<input id="AMupdbid" value="" type="hidden">
								<input id="AMdowdbid" value="" type="hidden">
							</div>
						</div>
					</div>

					<!-- 新增  -->
					<div id="addMemberAMContent" style="display: none;">
						<div class="widget">
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">分類名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="insert_menuname"
										placeholder="">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary" onclick="sendAddMemberAM()">儲存</button>
									<button class="btn btn-default" onclick="closeAddMemberAM()">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 新增 END -->
					<!-- 更新  -->
					<div id="editMemberAMContent" style="display: none;">
						<div class="widget">
						<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">分類名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="up_menunameam">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<div class="col-sm-8">
									<input type="hidden" class="form-control" id="up_dbidam"
										>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary" onclick="sendEditMemberAM()">更新</button>
									<button class="btn btn-default" onclick="closeEditMemberAM()">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 更新END -->
				</div>
				<!-- 設定頁面內容頁 End-->
		<!-- ActivityMenu 結束 -->
			</div>
</body>

<!-- 彈跳對話視窗-->

<!-- ActivityMENU -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#unlockModalAM" style="display: none;" id="unlockButtonAM">unlockDialog</button>
<div id="unlockModalAM" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否刪除？</h3>
			</div>
			<div class="modal-footer">
<!-- 				<div class="form-group col-sm-6"> -->
<!-- 					<label for="inputAssignedDepartment" class="col-sm-5 control-label">清單名稱:</label> -->
<!-- 					<div class="col-sm-6"> -->
<!-- 						<input type="text" class="form-control" id="Delete_idAM" -->
<!-- 							placeholder=""> -->
<!-- 					</div> -->
<!-- 				</div> -->
			
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="AMLuck('解鎖成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- 鎖符號BUTTON END -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#am_ok" style="display: none;" id="am_ok2">unlockDialog</button>
<div id="am_ok" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否啟用帳號？</h3>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="AMOK2('啟用')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>

<!-- ActivityMENU END -->


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
	showActivityMenu();
});

function showActivityMenu() {
	$("button.editMember").hide();

	closeAllHrContent();
	$("#AMContent").show();
	$("#manageAMContent").show();

	$("button.Agentreason").removeClass("btn-success");
	$("button.Agentreason").addClass("btn-primary");
	AM();
}

function AM() {
	$("#AMLoading").show();
	$("#AM0").hide();
	$("#AMul").hide();
	
	
	$("#AM0All").prop("checked", false);
	$("#manageTableAM tbody tr").empty();
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
					console.log("啟用清單", data);

					$('#manageTableAM')
							.DataTable(
									{
										  "ordering": false,
										"autoWidth": false,
										destroy : true,
										aaData : data.activitymenu,
										aoColumns : [
												{
													className : "dt-body-center"
												},
//													{
//														"data" : "dbid"
//													},
												{
													"data" : "menuname"
												},{
													"data" : "createdatetime"
												},
//													{
//														"data" : "sort"
//													},
												

										],'columnDefs': [{
									         'targets': 0,
									         'searchable': false,
									         'orderable': false,
									         'className': 'dt-body-center',
									         'render': function (data, type, full, meta){
									             return '<input  type="checkbox" name="AM0" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
									         }
									      }
										,
									      {
										         'targets': 3,
										         'searchable': false,
										         'orderable': false,
										        'className': "  ",
										         'render': function (data, type, full, meta){

										        		 return '<label style="padding-left:5px" onclick="AM_up()" class="glyphicon glyphicon-triangle-top"></label><label style="padding-left:5px"  onclick="AM_dow()" class="glyphicon glyphicon-triangle-bottom"></label>';
										        
										         },
										
										      }
									      ],
										lengthChange : false
									});
					
				
					AM2();
					var Amflag = true;
					var table = $('#manageTableAM').DataTable();
				

					$('#manageTableAM tbody')
							.on(
									'click',
									'tr',
									function() {
										console.log("AM", table.row(
												this).data());
										document
												.getElementById('up_menunameam').value = table
												.row(this).data().menuname;
										document
										.getElementById('up_dbidam').value = table
										.row(this).data().dbid;
										
										document
										.getElementById('AMupdbid').value = table
										.row(this).data().dbid;
										document
										.getElementById('AMdowdbid').value = table
										.row(this).data().dbid;
										document
										.getElementById('UPAM').innerHTML = table
										.row(this).data().menuname;
										
										if(AMflag){
											showEditMemberAM(data,table.row(this).data());
										}
							});
				
					
					
					
					$('#manageTableAM tbody').on('click','td',function() {

						var text = $(this).text();	

						if (text && text != "") {
							AMflag = true;
						}else{
							AMflag = false;
							return;
						}
						
									});
					
					$("#AMLoading").hide();
					$("#AM0").show();
					$("#AMul").show();
					
				}
			});

	$("#manageTableAM").css("width", "100%");
	$("#manageTableAM_filter").prop("style", "float:right;");
	$("#manageTableAM_wrapper > div:nth-child(1)").hide();

	$("#manageTableAMSearch").keyup(function() {
		var searchText = $("#manageTableAMSearch").val();

		$("input[aria-controls='manageTableAM']").val(searchText);
		$("input[aria-controls='manageTableAM']").trigger("keyup");
	});


}

function AM2() {

	$("#AM0All").click(function() {
		   if($("#AM0All").prop("checked")) {
		     $("input[name='AM0']").each(function() {
		         $(this).prop("checked", true);
		     });
		   } else {
		     $("input[name='AM0']").each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
		});
	$("#AM1All").click(function() {
		   if($("#AM1All").prop("checked")) {
		     $("input[name='AM1']").each(function() {
		         $(this).prop("checked", true);
		     });
		   } else {
		     $("input[name='AM1']").each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
		});
}

//顯示 啟用表格
function showManage_AM() {
	closeAllHrContent();

	$("#AMContent").show();
	$("#manageAMContent").show();

	$("button.manageAM").removeClass("btn-success");
	$("button.manageAM").addClass("btn-primary");

}
//顯示 停用表格
//	function showBan_AM() {
//		closeAllHrContent();

//		$("#AMContent").show();
//		$("#banAMContent").show();

//		$("button.ban").removeClass("btn-success");
//		$("button.ban").addClass("btn-primary");

//	}
//
//新增畫面
function showAddMemberAM() {
	
	document.getElementById('insert_menuname').value=""
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

	$
			.ajax({
				url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_ActivityMenu",
				data : {
					menuname : menuname,
					deleteflag : 0
//						sort : sort
				},

				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("新增錯誤");
				},
				success : function(data) {
					AM();
					toastr.success("新增成功");
				}

			});
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
//		var sort = document.getElementById('up_sortam').value;

	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_ActivityMenu",
				data : {
					dbid : dbid,
					menuname : menuname
				
				},

				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("更新錯誤");
				},
				success : function(data) {
					AM();
					toastr.success("更新成功");
				}

			});

	closeAllHrContent();
	$("#AMContent").show();
	$("#manageAMContent").show();
}

//解鎖對話視窗
function unlockAccountAM() {
	$("#unlockButtonAM").trigger("click");

}
//啟用對話視窗
function AccountAM_ok() {
	$("#am_ok2").trigger("click");

}


function AM_up() {

setTimeout(function(){ 
		  var AMupdbid = document.getElementById('AMupdbid').value;
	$
			.ajax({
				url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/AMenu_Sortup",
				data : {
					dbid:AMupdbid
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("至頂");
				},
				success : function(data) {
					AM();
					toastr.success("上升排序成功");
				}
			});
		
		  
	closeAllHrContent();
	$("#AMContent").show();
	$("#manageAMContent").show();
	
	}, 10);
}
function AM_dow() {

		  setTimeout(function(){ 
		  var AMdowdbid = document.getElementById('AMdowdbid').value;
		 
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/AMenu_Sortdown",
				data : {
					dbid:AMdowdbid
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("最底層");
				},
				success : function(data) {
					AM();
					toastr.success("下降排序成功");
				}
			});
		
		  
	closeAllHrContent();
	$("#AMContent").show();
	$("#manageAMContent").show();
			}, 10);
}


function AMLuck(message) {

var selected=[];
    $("[name=AM0]:checkbox:checked").each(function(){
      selected.push($(this).val());
      });
    $("[name=AM1]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
		  
		  var ActivityMenu_DBID_list = selected.join();
		  
		  if(ActivityMenu_DBID_list.length!=0){

	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_activitymenu",
				data : {
					ActivityMenu_DBID_list : ActivityMenu_DBID_list,
					deleteflag : 1
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("停用錯誤");
				},
				success : function(data) {
					AM();
					toastr.success("停用成功");
				}
			});
		  }else{
				toastr.error("請選擇停用項目");

		  }
		  
	closeAllHrContent();
	$("#AMContent").show();
	$("#manageAMContent").show();
}


function AMOK2(message) {

var selected=[];
    $("[name=AM0]:checkbox:checked").each(function(){
      selected.push($(this).val());
      });
    $("[name=AM1]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
		  
		  var ActivityMenu_DBID_list = selected.join();
		  if(ActivityMenu_DBID_list.length!=0){
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_activitymenu",
				data : {
					ActivityMenu_DBID_list : ActivityMenu_DBID_list,
					deleteflag : 0
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("啟用錯誤");
				},
				success : function(data) {
					AM();
					toastr.success("啟用成功");
				}
			});
		  }else{
			  toastr.error("請選擇啟用項目");
		  }
	closeAllHrContent();
	$("#AMContent").show();
	$("#banAMContent").show();
}

</script>
</html>


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
		<!-- AgentReason 開始 -->

				<!-- 值機管理切換頁籤Start -->
				<div id="hrTabControlButton" style="margin: 1px 0px 0px 1px;">
					<button class="btn-sm btn-primary manage"
						onclick="showManage_Agentreason()">
						<i class="fa fa-fw fa-user"></i>值機管理
					</button>

					<button class="btn-sm btn-success addMember" style="display: none;">
						<span onclick="showAddMemberAGR()">新增值機狀態</span> <i
							class="fa fa-times" onclick="closeAddMemberAGR()"></i>
					</button>
					<button class="btn-sm btn-success editMember"
						style="display: none;">
						<span onclick="showEditMemberAgentreason()" id="UPagentreason"></span> <i
							class="fa fa-times" onclick="closeEditMemberAgentreason()"></i>
					</button>
				</div>
				<!-- 值機管理切換頁籤End -->

				<!-- 設定頁面內容頁 Start-->
				<div class="panel-body" id="settingContent">
					<div id="manageAgentreasonContent" style="display: none;">
						<div id="ARul">
							<ul class="pagination">
								<li onclick="showAddMemberAGR()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="AgentReasonB()"><a href="#"><i
										class="glyphicon glyphicon-trash"></i></a></li>
							</ul>
							<ul class="pagination" style="float: right;">
								<li><input type="text" id="manageAgentreasonTableSearch"
									placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox" id="agentreason00">
						<div class="spiner-example" id="ARLoading">
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
							<div class="col-lg-12 col-md-12" id="agentreason0">
								
								<table class="table table-bordered table-hover"
									id="manageAgentreasonTable">
									<thead>
										<tr>
											<th class="no-sort"><input type="checkbox"
												id="agentreason0All" ischecked=false></th>
											<th>名稱</th>
											<th>繁體名稱</th>
											<th>英文名稱</th>
											<th>簡體名稱</th>
											<th>告警顏色</th>
											<th>告警時間</th>
											<th>註解</th>
<!-- 											<th>狀態</th> -->
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>

					<!-- 新增  -->
					<div id="addMemberAGRContent" style="display: none;">
						<div class="widget">
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label required">名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="Insert_statusname"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">繁體名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control"
										id="Insert_statusname_tw" placeholder="">
								</div>
							</div>
							
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">英文名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control"
										id="Insert_statusname_en" placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">簡體名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control"
										id="Insert_statusname_cn" placeholder="">
								</div>
							</div>

							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">告警顏色:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="Insert_alarmcolor"
										placeholder="" value="000000">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label required">告警時間:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control"
										id="Insert_alarmduration" placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">註解:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="Insert_description"
										placeholder="">
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary"
										onclick="sendAddMemberAgentreason()">儲存</button>
									<button class="btn btn-default"
										onclick="closeAddMemberAGR()">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 新增 END -->
					<!-- 更新  -->
					<div id="editMemberAGRContent" style="display: none;">
						<div class="widget">
<!-- 							<div class="form-group col-sm-6"> -->
<!-- 								<label for="inputAccount" -->
<!-- 									class="col-sm-2 control-label ">編碼:</label> -->
<!-- 								<div class="col-sm-8"> -->
									<input type="hidden" class="form-control" id="Update_id" >
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="form-group col-sm-6">
								<label for="inputFirstName" class="col-sm-2 control-label">名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="statusname"
										placeholder="" disabled>
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputPassword" class="col-sm-2 control-label">繁體名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="statusname_tw"
										placeholder="">
								</div>
							</div>
						
							<div class="form-group col-sm-6">
								<label for="inputPhoneNumber" class="col-sm-2 control-label">英文名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="statusname_en"
										placeholder="">
								</div>
							</div>
								<div class="form-group col-sm-6">
								<label for="inputEmployNumber" class="col-sm-2 control-label">簡體名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="statusname_cn"
										placeholder="">
								</div>
							</div>
							
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">告警顏色:</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" id="alarmcolor">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputName" class="col-sm-2 control-label">告警時間:</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" id="alarmduration"
										placeholder="">
								</div>
							</div>

							<div class="form-group col-sm-6">
								<label for="inputLastName" class="col-sm-2 control-label">註解:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="description"
										placeholder="">
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary"
										onclick="sendEditMemberAgentreason()">更新</button>
									<button class="btn btn-default"
										onclick="closeEditMemberAgentreason()">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 更新END -->

				</div>
		<!-- AgentReason 結束 -->			
			</div>
</body>

<!-- 彈跳對話視窗-->
<!-- Agentreason 開始 -->
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#confirmBanAGR" style="display: none;"
	id="confirmBanButtonAGR">banDialog</button>

<!-- 禁止符號BUTTON -->
<div id="confirmBanAGR" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否確定停用帳號？</h3>
			</div>
			<div class="modal-footer">
<!-- 				<div class="form-group col-sm-6"> -->
<!-- 					<label for="inputAssignedDepartment" class="col-sm-6 control-label">名稱:<span id="agentreasonluck2"></span></label> -->
<!-- 					<div class="col-sm-4"> -->
<!-- 						<input type="hidden" class="form-control" id="D_id" placeholder=""> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 					<div class="form-group col-sm-6"> -->
<!-- 					<label for="inputAssignedDepartment" class="col-sm-2 control-label">開關:</label> -->
<!-- 					<div class="col-sm-4"> -->
<!-- 						<select class="form-control" id="flag2"> -->
<!-- 							<option value="0">啟用</option> -->
<!-- 							<option value="1">停用</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 					</div> -->
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="AgentreasonDelete('停用成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>

	</div>
</div>
<!-- 禁止符號BUTTON END -->

<!-- 鎖符號BUTTON -->
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#unlockModalAGR" style="display: none;"
	id="unlockButtonAGR">unlockDialog</button>
<div id="unlockModalAGR" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否解除/鎖定帳號？</h3>
			</div>
			<div class="modal-footer">
			<div class="form-group col-sm-6">
					<div class="col-sm-6">
					<label class="radio-inline">
     					 <input type="radio" name="agentreasonL" value="0">啟用
    				</label>
    				</div>
    				<div class="col-sm-6">
    				<label class="radio-inline">
      						<input type="radio" name="agentreasonL"  value="2">鎖定
					</label>
					</div>
					</div>

				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="AgentreasonLuck('鎖定成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- 鎖符號BUTTON END -->

<!-- Agent_OK -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#AgentReason_OK" style="display: none;"
	id="AgentReasonOK">unlockDialog</button>
	
<div id="AgentReason_OK" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否啟用帳號？</h3>
			</div>
			<div class="modal-footer">

				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="AgentReason_OK2('啟用成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>

	</div>
</div>
<!-- Agent_OK END -->

<!-- AgentTrashBUTTON -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#AgentReason" style="display: none;"
	id="AgentReasonB">unlockDialog</button>
	
<div id="AgentReason" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否確定刪除帳號？</h3>
			</div>
			<div class="modal-footer">

				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="AgentReasonD('刪除成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>

	</div>
</div>
<!-- AgentTrashBUTTON END -->

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
	showAgentreason();
});

function showAgentreason() {
	$("button.editMember").hide();
	closeAllHrContent();
	$("#AgentreasonContent").show();
	$("#manageAgentreasonContent").show();

	$("button.Agentreason").removeClass("btn-success");
	$("button.Agentreason").addClass("btn-primary");
	select2();
}

function select2() {
	$("#ARLoading").show();
	$("#agentreason0").hide();
	$("#ARul").hide();
	
	
	$("#agentreason0All").prop("checked", false);
	$("#agentreason1All").prop("checked", false);
	
	
	$("#manageAgentreasonTable tbody tr").empty();
	$("#banAgentreasonTable tboby tr").empty();
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Select_agentreason",
				data : {
					flag : 0
				},
				type : "POST",
				dataType : 'json',

				error : function(e) {
					alert("請重新整理");
				},
				success : function(data) {
					console.log("啟用值機", data);

					//	        	alert(JSON.stringify(data.person));
					$('#manageAgentreasonTable')
							.DataTable(
									{
										"autoWidth": false,
										destroy : true,
										aaData : data.agentreason,
										aoColumns : [
												{
													className : "dt-body-center"
												},
												{
													"data" : "statusname"
												},
												{
													"data" : "statusname_tw"
												},
												{
													"data" : "statusname_en"
												},
												{
													"data" : "statusname_cn"
												},
												{
													"data" : "alarmcolor"
												},
												{
													"data" : "alarmduration"
												}, {
													"data" : "description"
												}
//													}, {
//														"data" : "flag"
												 ],'columnDefs': [{
											         'targets': 0,
											         'searchable': false,
											         'orderable': false,
											         'className': 'dt-body-center',
											         'render': function (data, type, full, meta){
											             return '<input type="checkbox" name="agentreason0" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
											         }}, 

												],
										lengthChange : false
									});
					agentreason2();
					var ARflag = true; 
					var table = $('#manageAgentreasonTable').DataTable();
					$('#manageAgentreasonTable tbody')
							.on(
									'click',
									'tr',
									function() {
			document
					.getElementById('Update_id').value = table
					.row(this).data().dbid;
			document
					.getElementById('statusname').value = table
					.row(this).data().statusname;
			
			document
					.getElementById('alarmcolor').value = table
					.row(this).data().alarmcolor;
			document
					.getElementById('alarmduration').value = table
					.row(this).data().alarmduration;
			document
					.getElementById('description').value = table
					.row(this).data().description;
			document
					.getElementById('statusname_cn').value = table
					.row(this).data().statusname_cn;
			document
					.getElementById('statusname_en').value = table
					.row(this).data().statusname_en;
			document
					.getElementById('statusname_tw').value = table
					.row(this).data().statusname_tw;
			document
				.getElementById('UPagentreason').innerHTML = table
				.row(this).data().statusname;

			if(ARflag){
				showEditMemberAgentreason(data,table.row(this).data());
			}
		});
					
					$('#manageAgentreasonTable tbody').on('click','td',function() {

						var text = $(this).text();	
						if (text && text != "") {
							ARflag = true;
						}else{
							ARflag = false;
							return;
						}
						
									});	
					$("#ARLoading").hide();
					$("#ARul").show();
					$("#agentreason0").show();
				}
			});

	$("#manageAgentreasonTable").css("width", "100%");
	$("#manageAgentreasonTable_filter").prop("style", "float:right;");
	$("#manageAgentreasonTable_wrapper > div:nth-child(1)").hide();

	$("#manageAgentreasonTableSearch").keyup(
			
			function() {
				var searchText = $("#manageAgentreasonTableSearch").val();

				$("input[aria-controls='manageAgentreasonTable']").val(
						searchText);
				$("input[aria-controls='manageAgentreasonTable']").trigger(
						"keyup");
			});

}

function agentreason2() {

	$("#agentreason0All").click(function() {
		   if($("#agentreason0All").prop("checked")) {
		     $("input[name='agentreason0']").each(function() {
		         $(this).prop("checked", true);
		     });
		   } else {
		     $("input[name='agentreason0']").each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
		});
	
	$("#agentreason1All").click(function() {
		   if($("#agentreason1All").prop("checked")) {
		     $("input[name='agentreason1']").each(function() {
		         $(this).prop("checked", true);
		     });
		   } else {
		     $("input[name='agentreason1']").each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
		});
}

//
//
//顯示 啟用表格
function showManage_Agentreason() {
	closeAllHrContent();

	$("#AgentreasonContent").show();
	$("#manageAgentreasonContent").show();

	$("button.manageAgentreason").removeClass("btn-success");
	$("button.manageAgentreason").addClass("btn-primary");

}
//顯示 停用表格
//	function showBan_Agentreason() {
//		closeAllHrContent();

//		$("#AgentreasonContent").show();
//		$("#banAgentreasonContent").show();

//		$("button.ban").removeClass("btn-success");
//		$("button.ban").addClass("btn-primary");

//	}
//
//新增畫面
function showAddMemberAGR() {
	document.getElementById('Insert_statusname_tw').value="";
	document.getElementById('Insert_statusname_en').value="";
	document.getElementById('Insert_statusname_cn').value="";
	document.getElementById('Insert_statusname').value="";
	document.getElementById('Insert_description').value="";
	document.getElementById('Insert_alarmduration').value="";
	
	closeAllHrContent();
	$("#AgentreasonContent").show();
	$("#addMemberAGRContent").show();

	$("button.addMember").show();
	$("button.addMember").removeClass("btn-success");
	$("button.addMember").addClass("btn-primary");
}


//關閉新增畫面
function closeAddMemberAGR() {
	closeAllHrContent();
	$("button.addMember").hide();

	$("#AgentreasonContent").show();
	$("#manageAgentreasonContent").show();

	$("button.manage").removeClass("btn-success");
	$("button.manage").addClass("btn-primary");
}

//新增功能
function sendAddMemberAgentreason() {
	   if (!validateAR()) {
           return;
       }
	
	closeAddMember();
	var alarmcolor = document.getElementById('Insert_alarmcolor').value;
	var alarmduration = document.getElementById('Insert_alarmduration').value;
	var description = document.getElementById('Insert_description').value;
	var statusname = document.getElementById('Insert_statusname').value;
	var statusname_cn = document.getElementById('Insert_statusname_cn').value;
	var statusname_en = document.getElementById('Insert_statusname_en').value;
	var statusname_tw = document.getElementById('Insert_statusname_tw').value;
//		var createuserid = document.getElementById('Insert_createuserid').value;

	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_agentreason",
				data : {
					flag : 0,
					alarmcolor : alarmcolor,
					alarmduration : alarmduration,
					description : description,
					statusname : statusname,
					statusname_cn : statusname_cn,
					statusname_en : statusname_en,
					statusname_tw : statusname_tw
//						createuserid : createuserid
				},
				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("新增錯誤");		
					},
				success : function(data) {
					select2()
					toastr.success("新增成功");
				}

			});
	
	closeAllHrContent();
	$("#AgentreasonContent").show();
	$("#manageAgentreasonContent").show();
}

function validateAR() {
    var Iac = $("#Insert_alarmcolor").val();
    var Iaa = $("#Insert_alarmduration").val();
    var Id = $("#Insert_description").val();
    var Is = $("#Insert_statusname").val();
    var Iscn = $("#Insert_statusname_cn").val();
    var Isen = $("#Insert_statusname_en").val();
    var Itw = $("#Insert_statusname_tw").val();

    
    if (!Is || Is == '' ) {
        toastr.error("請輸入名稱");
        return false;
    }

    if (!Iaa || Iaa == '') {
        toastr.error("請輸入告警時間");
        return false;
    }
    if (Iaa !='' && !isValidNumber(Iaa)) {
        toastr.error("告警時間請輸入數字");
        return false;
    }
   
    return true;
}

 function isValidNumber(Iaa) {
		var re2 = /^[0-9]*$/;
		return re2.test(Iaa);
	}


//更新頁面
function showEditMemberAgentreason() {
	closeAllHrContent();
	$("#AgentreasonContent").show();
	$("#editMemberAGRContent").show();

	$("button.editMember").show();
	$("button.editMember").removeClass("btn-success");
	$("button.editMember").addClass("btn-primary");
}
//更新頁面關閉
function closeEditMemberAgentreason() {
	closeAllHrContent();
	$("button.editMember").hide();
	$("#AgentreasonContent").show();
	$("#manageAgentreasonContent").show();

	$("button.manage").removeClass("btn-success");
	$("button.manage").addClass("btn-primary");
}

function sendEditMemberAgentreason() {
	   if (!validateARU()) {
           return;
       }
		

	closeEditMember();
//		var flag = document.getElementById('Update_flag').value;
	var dbid = document.getElementById('Update_id').value;
	var alarmcolor = document.getElementById('alarmcolor').value;
	var alarmduration = document.getElementById('alarmduration').value;
	var description = document.getElementById('description').value;
	var statusname = document.getElementById('statusname').value;
	var statusname_cn = document.getElementById('statusname_cn').value;
	var statusname_en = document.getElementById('statusname_en').value;
	var statusname_tw = document.getElementById('statusname_tw').value;

	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_agentreason",
				data : {
					flag : 0,
					dbid : dbid,
					alarmcolor : alarmcolor,
					alarmduration : alarmduration,
					description : description,
					statusname : statusname,
					statusname_cn : statusname_cn,
					statusname_en : statusname_en,
					statusname_tw : statusname_tw
				},

				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("更新錯誤");
				},
				success : function(data) {
					select2();
					toastr.success("更新成功");	
					}

			});
	
	closeAllHrContent();
	$("#AgentreasonContent").show();
	$("#manageAgentreasonContent").show();
}

function validateARU() {
   
    var Iaa = $("#alarmduration").val();
   

    if (!Iaa || Iaa == '') {
        toastr.error("請輸入告警時間");
        return false;
    }
    if (Iaa !='' && !isValidNumber(Iaa)) {
        toastr.error("告警時間請輸入數字");
        return false;
    }
   
    return true;
}

//解鎖對話視窗
function unlockAccountAgentreason() {
	$("#unlockButtonAGR").trigger("click");
	
}

//停用對話視窗
//	function confirmBanAgentreason() {
//		$("#confirmBanButtonAGR").trigger("click");
//	}
//停用對話視窗
function AgentReasonB() {
	$("#AgentReasonB").trigger("click");
}

function AgentReason_ok() {
	$("#AgentReasonOK").trigger("click");
}

function AgentreasonDelete(message) {
	
	var selected=[];
    $("[name=agentreason0]:checkbox:checked").each(function(){
      selected.push($(this).val());
      });
    $("[name=agentreason1]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
	  var Agentreason_DBID_list = selected.join();
	  
	  
	  if(Agentreason_DBID_list.length!=0){
		
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_agentreason",
				data : {
					flag : 1,
					Agentreason_DBID_list : Agentreason_DBID_list
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("停用錯誤");	
				},
				success : function(data) {
					select2();
					toastr.success(message);
				}
			});
	
	  }else{
			toastr.error("請選擇要停用的項目");
	  }
	
	closeAllHrContent();
	$("#AgentreasonContent").show();
	$("#manageAgentreasonContent").show();
}




function AgentreasonLuck(message) {
	
	var selected=[];
    $("[name=agentreason0]:checkbox:checked").each(function(){
      selected.push($(this).val());
      });
    $("[name=agentreason1]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
    var selected2=[];
    $("[name=agentreasonL]:radio:checked").each(function(){
      selected2.push($(this).val());
      });
   
	  var Agentreason_DBID_list = selected.join();
	
	  var flag = selected2.join();

	 if(Agentreason_DBID_list.length!=0){
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_agentreason",
				data : {
					flag : flag,
					Agentreason_DBID_list : Agentreason_DBID_list
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("鎖定錯誤");
				},
				success : function(data) {
					select2();
					toastr.success(message);
				}
			});
	 }else{
		 toastr.error("請選擇要鎖定的項目");
	 }
	
	closeAllHrContent();
	$("#AgentreasonContent").show();
	$("#manageAgentreasonContent").show();
}


function AgentReasonD(message) {
	
	var selected=[];
    $("[name=agentreason0]:checkbox:checked").each(function(){
      selected.push($(this).val());
      });
    $("[name=agentreason1]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
	  var Agentreason_DBID_list = selected.join();
	
if(Agentreason_DBID_list.length!=0){
	$
			.ajax({
				url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Delete_AgentReason",
				data : {
					Agentreason_DBID_list : Agentreason_DBID_list
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("刪除錯誤");
				},
				success : function(data) {
					select2()
					toastr.success(message);
				}
			});
	
}else{
	toastr.error("請選擇刪除的項目");
}
	closeAllHrContent();
	$("#AgentreasonContent").show();
	$("#manageAgentreasonContent").show();
}

function AgentReason_OK2(message) {
	
	var selected=[];
    $("[name=agentreason0]:checkbox:checked").each(function(){
      selected.push($(this).val());
      });
    $("[name=agentreason1]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
	  var Agentreason_DBID_list = selected.join();
	  if(Agentreason_DBID_list.length!=0){
//		var dbid = document.getElementById('AgentReasondbid').value;
	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_agentreason",
				data : {
					flag : 0,
					Agentreason_DBID_list : Agentreason_DBID_list
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("啟用錯誤");
				},
				success : function(data) {
					select2();
					toastr.success(message);
				}
			});
	  }else{
			toastr.error("請選擇啟用項目");

	  }
	
	closeAllHrContent();
	$("#AgentreasonContent").show();
	$("#banAgentreasonContent").show();
}

</script>
</html>


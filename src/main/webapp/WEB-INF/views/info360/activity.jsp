<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>「服務代碼設定」頁面</title>

<script src="resources/jstree/jquery.min.js"></script>
<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/layui/css/layui.css" rel="stylesheet">
<link href="resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="resources/css/style.css?v=4.1.0" rel="stylesheet">
<link rel="stylesheet" href="resources/jstree/style.min.css" />
<script type="text/javascript" src="resources/jstree/jstree.min.js"></script>
<link href="resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">
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
			<div class="panel panel-success" style="width: 100%;height: 100%" id="">
		<!-- 服務代碼開始 -->
				<!-- 服務代碼切換頁籤Start -->
				<div id="hrTabControlButton" style="margin: 1px 0px 0px 1px;">
					<button class="btn-sm btn-primary manage"
						onclick="showActivityButton()">
						<i class="fa fa-fw fa-user"></i>服務代碼管理
					</button>
					<button  class="btn-sm btn-success addRoot" id="addRoot" style="display: none;">
						<span onclick="showAddRoot()">新增服務代碼</span> <i
							class="fa fa-times" onclick="closeAddRoot()"></i>
					</button>
					<button class="btn-sm btn-success addMember" style="display: none;">
						<span onclick="showAddActivity()">新增服務代碼</span> <i
							class="fa fa-times" onclick="closeAddActivity()"></i>
					</button>
					<button class="btn-sm btn-success editMember"
						style="display: none;">
						<span onclick="showEditActivity()">更新服務代碼</span> <i
							class="fa fa-times" onclick="closeEditMembercomm()"></i>
					</button>
				</div>
				<!-- 服務代碼管理切換頁籤End -->
				<!-- 設定頁面內容頁 Start-->
				<div class="panel-body" id="ActivityView">
					<div id="ActivityShow" style="display: none;">
						<div id="ActivityBouutonList">
							<ul class="pagination">
								<li onclick="showAddRoot()"><a href="#"><i
										class="glyphicon glyphicon-briefcase"></i></a></li>
								<li onclick="showAddActivity()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="ActivityTrashButton()"><a href="#"><i
										class="glyphicon glyphicon-trash"></i></a></li>
							</ul>
						</div>
						<div class="row ibox">
							<div class="col-lg-6 col-md-6">
								<div id="ActivityTree"></div>
							</div>
							<div class="spiner-example" id="ActivityLoading">
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
<!-- 							<div class="col-lg-3 col-md-3" id="comm" style="display: none;"> -->
<!-- 								<h2>請選擇節點</h2> -->
<!-- 							</div> -->

							<div class="col-lg-5 col-md-5" id="showActivityTable" style="display: none;">
								<table class="table table-bordered table-hover"
									id="ActivityTable">
									<thead>
										<tr>
											<td>名稱</td>
											<td id="ColorTD" style="display: none;">顏色</td>
											<td>路徑</td>
											<td>類型</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td id=""><input id="Name" value=""></td>
											<td id="inputColorTD" style="display: none;"><input id="Color" value=""></td>
											<td id="Path"></td>
											<td id="Type"></td>	
										</tr>
									</tbody>
								  </table>
								  
								<button class="btn btn-primary" onclick="updateButton()">更新</button>
								<button class="btn btn-primary" onclick="GetJson()">儲存排序</button>
								<button class="btn btn-primary" onclick="GetCheckBox()">批次移動</button>	
								<select id="moveActivity" >
									
								</select>							
								
								<input id="SortJson" type="hidden" value="" style="height: 500px;width: 500px">
								
							</div>
						</div>
					</div>
				</div>

				<!-- 新增  -->
				<div id="showAddRoot" style="display: none;">
					<div class="widget">
					
						<div class="form-group col-sm-6" >
							<label for="inputAccount" class="col-sm-2 control-label">名稱:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="addRootName" value="" placeholder="請輸入名稱. . ." >
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-9 col-sm-3">
								<button class="btn btn-primary" onclick="insertActivityRoot()">儲存</button>
								<button class="btn btn-default" onclick="closeAddActivity()">取消</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 新增 END -->
				
				
				<!-- 新增  -->
				<div id="addActivity" style="display: none;">
					<div class="widget">
					
						<div class="form-group col-sm-6" >
							<label for="inputAccount" class="col-sm-2 control-label">節點名稱:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="addName" value="" placeholder="請輸入名稱. . ." >
								<input type="hidden" class="form-control" id="addDbid" value="">
								<input type="hidden" class="form-control" id="Activitymenuid" value="">
								<input type="hidden" class="form-control" id="Activitygroupsid" value="">
								<input type="hidden" class="form-control" id="Titlegroup" value="">
							</div>
						</div>
						
						<div class="form-group col-sm-6" >
							<label for="inputName" class="col-sm-2 control-label">選擇檔案階層:</label>
							<div class="col-sm-4">
								<input class="form-control" id="NodeType" type="text" value="" disabled > 
							</div>
							<label for="inputName" class="col-sm-2 control-label">新增的階層:</label>
							<div class="col-sm-4">
								<input class="form-control" id="NextNodeType" type="text" value="" disabled > 
							</div>
						</div>
						
						<div class="form-group col-sm-6"  id="showAddColor">
							<label for="inputAccount" class="col-sm-2 control-label">節點名稱:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="addColor" value="" placeholder="請輸入色碼. . ." >
							</div>
						</div>
<!-- 						新增ActivityGroup -->
						
						<div class="form-group">
							<div class="col-sm-offset-9 col-sm-3">
								<button class="btn btn-primary" onclick="insertActivity()">儲存</button>
								<button class="btn btn-default" onclick="closeAddActivity()">取消</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 新增 END -->

			</div>
</body>


<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#Trash" style="display: none;"
	id="ActivityTrashButton"></button>

<!-- 垃圾桶符號BUTTON -->
<div id="Trash" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否確定刪除？</h3>
				
				<input id="DeleteDbid" type="" value="">
				<input id="DeleteType" type="" value="">
				<input id="DeleteChildren_d" type="" value="">
				
				
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="LogicDelete()">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>

	</div>
</div>

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
var chechbox = "";
var moveActivityPaerntId="";
var moveActivityParents = "";
var moveActivityId="";

$(document).ready(function() {
	showActivity();
});

//一開始載入Activity
function showActivity() {
	$("button.editMember").hide();
	closeAllHrContent();
	$("#ActivityView").show();
	$("#ActivityShow").show();

	$("button.Commonlink").removeClass("btn-success");
	$("button.Commonlink").addClass("btn-primary");
	SelectActivity();
}
//左上角服務代碼管理按鈕
function showActivityButton() {
	$("button.editMember").hide();
	closeAllHrContent();
	$("#ActivityView").show();

	$("#ActivityShow").show();
	$("#showActivityTable").show();
	$("button.Commonlink").removeClass("btn-success");
	$("button.Commonlink").addClass("btn-primary");
	
}

function SelectActivity() {

	Uinsertornot = false;
	insertornot = false;
	$('#ActivityLoading').show();
	$('#ActivityTree').hide();
	$('#ActivityBouutonList').hide();
	$('#showActivityTable').hide();

	

	$.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/getActivityTree",
				data : {
					aDeleteFlag:0
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("請重新整理");
				},
				success : function(data) {
					$('#ActivityTree').jstree("destroy").empty();
					console.log("ActivityTree", data);
					
					$('#ActivityTree').jstree({
						'core' : {
							'data' : data.ActivityTree,
						      "check_callback" : true
						},
						 'checkbox': {       
						      three_state : false, // to avoid that fact that checking a node also check others
// 						      whole_node : false,  // to avoid checking the box just clicking the node 
// 						      tie_selection : false // for checking without selecting and selecting without checking
						    },
						
						 "types" : {
				              "#" : {
				                  valid_children : ['root'],
				              },
				              "root" : {
				                  valid_children : ['default', 'file'],
				              	  "icon" : "glyphicon glyphicon-lock"
				              },
				              "default" : {
				                  valid_children : ['default', 'file'],
				                  'icon': 'glyphicon glyphicon-book'
				              },
				              "file" : {
				                  "icon" : "glyphicon glyphicon-folder-open",
				              },
				              "text" : {
				                  "icon" : "glyphicon glyphicon-file",
				              },
				        },
						"plugins" : [ "themes", "json_data", "ui","types" 
						              ,"dnd","wholerow","checkbox"
						              ],
					})

					OnClickTdActivity();
					$("#ActivityTree").on(
							"select_node.jstree",
							function(evt, data) {
								
// 								if(data.node.parent=="#"){
// 									return false;
// 								}	
								console.log("OnClikc", data.node);

								if(data.node.type=="root"){
									$('#inputColorTD').hide();
									$('#ColorTD').hide();
									
								}else if(data.node.type=="default"){
									$('#inputColorTD').hide();
									$('#ColorTD').hide();
									document.getElementById('Activitymenuid').value = data.node.original.Activitymenuid;
									

								}else if(data.node.type=="file"){
									document.getElementById('Activitygroupsid').value = data.node.original.Activitygroupsid;
									document.getElementById('Titlegroup').value = data.node.original.Titlegroup;
									$('#inputColorTD').show();
									$('#ColorTD').show();

									document.getElementById('Color').value = data.node.li_attr.class;


								}else if(data.node.type=="text"){
									$('#inputColorTD').show();
									$('#ColorTD').show();
									document.getElementById('Activitygroupsid').value = data.node.original.Activitygroupsid;
									document.getElementById('Titlegroup').value = data.node.original.Titlegroup;

								}
								$('#addDbid').empty();
								$('#DeleteDbid').empty();
								$('#DeleteType').empty();
								$('#DeleteChildren_d').empty();
								document.getElementById('addDbid').value = data.node.original.dbid;
								document.getElementById('DeleteDbid').value = data.node.original.dbid;
								document.getElementById('DeleteType').value = data.node.original.type;

								if(data.node.children_d.length>0){
									document.getElementById('DeleteChildren_d').value = data.node.children_d;
								}

								
								document.getElementById('Name').value = data.node.original.text;
								$('#Type').text(data.node.original.type);

								$('#Path').text(data.instance.get_path(data.selected[0], "/", 0));
								document.getElementById('NodeType').value = data.node.type;
								moveActivityPaerntId=data.node.parent;
								moveActivityId=data.node.id;
								moveActivityParents=data.node.parents[1];
								moveAvtivity();

							});

					$('#showActivityTable').show();
					$('#ActivityLoading').hide();
					$('#ActivityTree').show();
					$('#ActivityBouutonList').show();
					$('#showActivityTable').show();
				},
			});
};

// function link() {
// 	$('#ActivityTree').jstree.bind("select_node.jstree", function(e, data) {
		
// 		var href = data.node.a_attr.href;
// 		var parentId = data.node.a_attr.parent_id;
// 		if (href == '#')
// 			return '';
// 		window.open(href);
// 	})
// }

function OnClickTdActivity() {
	$("#ActivityTable tbody tr td").on("click", function() {
		var text = $(this).text();
		if (text && text != "") {
			showEditMembercomm();
		}
	});
}



//新增Root畫面
function showAddRoot() {
	$('#addRootName').empty();
	$('#ActivityView').hide();

	
	closeAllHrContent();
	$("#showAddRoot").show();
	$("button.addRoot").show();
	$("button.addRoot").removeClass("btn-success");
	$("button.addRoot").addClass("btn-primary");

}

//新增畫面
function showAddActivity() {
	$('#addName').empty();
	$('#addColor').empty();
	$('#showAddColor').show();
	
	var NodeType = document.getElementById('NodeType').value;
	if(NodeType!=""){
			if(NodeType=='text'){
				document.getElementById('NodeType').value ='Data'
				document.getElementById('NextNodeType').value ='Data'
					
			}else if(NodeType=='file'){
				document.getElementById('NodeType').value ='DataTitle'
				document.getElementById('NextNodeType').value ='Data'
				
		
			}else if(NodeType=='default'){
				document.getElementById('NodeType').value ='Group'
				document.getElementById('NextNodeType').value ='DataTitle'
				$('#showAddColor').hide();
		
			}else if(NodeType=='root'){
				document.getElementById('NodeType').value ='Menu'
				document.getElementById('NextNodeType').value ='Group'
				$('#showAddColor').hide();
			}
			
			closeAllHrContent();
			$("#addActivity").show();
			$('#ActivityView').hide();

			$("button.addMember").show();
			$("button.addMember").removeClass("btn-success");
			$("button.addMember").addClass("btn-primary");
	}else{
		toastr.error("請選擇新增節點");
	}
	
}

//關閉新增Root畫面
function closeAddRoot() {
	closeAllHrContent();
	$("button.addRoot").hide();

	$("#ActivityView").show();
	$("#ActivityShow").show();
	$("#showActivityTable").show();

	$("button.manage").removeClass("btn-success");
	$("button.manage").addClass("btn-primary");
}

//關閉新增畫面
function closeAddActivity() {
	closeAllHrContent();
	$("button.addMember").hide();

	$("#ActivityView").show();
	$("#ActivityShow").show();
	$("#showActivityTable").show();

	$("button.manage").removeClass("btn-success");
	$("button.manage").addClass("btn-primary");
}


function insertActivityRoot() {
	var addName = document.getElementById('addRootName').value;
			$.ajax({
				url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_ActivityMenu",
				data : {
					menuname : addName,
					deleteflag : 0
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("新增錯誤");
				},
				success : function(data) {
					SelectActivity();
					toastr.success("新增成功");
				}
			});
			closeAddRoot();
}

// //新增功能
function insertActivity() {

	var NextNodeType = document.getElementById('NextNodeType').value;
	var addName = document.getElementById('addName').value;
	var addColor = document.getElementById('addColor').value;
	var addDbid = document.getElementById('addDbid').value;
	var Titlegroup = document.getElementById('Titlegroup').value;
	var Activitygroupsid = document.getElementById('Activitygroupsid').value;
	var Activitymenuid = document.getElementById('Activitymenuid').value;
	
	if(NextNodeType=='Data'){
			$.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_ActivityData",
				data : {
					activitygroupsid : Activitygroupsid,
					codename : addName,
					color : addColor,
					titleflag : 0,
					titlegroup : addDbid,
					deleteflag : 0
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("新增錯誤");
				},
				success : function(data) {
					SelectActivity();
					toastr.success("新增成功");
				}
			});
			
	}else if(NextNodeType=='DataTitle'){
			$.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_ActivityData",
				data : {
					activitygroupsid : addDbid,
					codename : addName,
					color : addColor,
					titleflag : 1,
					titlegroup : 0,
					deleteflag : 0
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("新增錯誤");
				},
				success : function(data) {
					SelectActivity();
					toastr.success("新增成功");
				}
			});

	}else if(NextNodeType=='Group'){
			$.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_ActivityGroup",
				data : {
					activitymenuid : addDbid,
					groupname : addName
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("新增錯誤");
				},
				success : function(data) {
					SelectActivity();
					toastr.success("新增成功");
				}
			});

	}else if(NextNodeType=='Menu'){
			$.ajax({
				url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_ActivityMenu",
				data : {
					menuname : addName,
					deleteflag : 0
				},
				type : "POST",
				dataType : 'json',
				error : function(e) {
					toastr.error("新增錯誤");
				},
				success : function(data) {
					SelectActivity();
					toastr.success("新增成功");
				}
			});
	}
	closeAddActivity();
}

// function validateCmI() {
//     var nodeNAME = $("#nodeNAME").val();
//     var file = $("#file").val();
//     var nodeURL =$("#nodeURL").val();
    
//     if(file==2){
//     	if (!nodeURL || nodeURL == '' ) {
//         	toastr.error("請輸入URL");
//         	return false;
//     	}
//     }
//     if (!nodeNAME || nodeNAME == '' ) {
//         toastr.error("請輸入名稱");
//         return false;
//     }
//     return true;
// }

function updateButton() {
	var DeleteType = document.getElementById('DeleteType').value

	if(DeleteType=='text'){
		document.getElementById('DeleteType').value ='Data'
			
	}else if(DeleteType=='file'){
		document.getElementById('DeleteType').value ='DataTitle'

	}else if(DeleteType=='default'){
		document.getElementById('DeleteType').value ='Group'

	}else if(DeleteType=='root'){
		document.getElementById('DeleteType').value ='Menu'
	}
	var DeleteType = document.getElementById('DeleteType').value
	var UpdateDbid = document.getElementById('DeleteDbid').value
	var Name = document.getElementById('Name').value
	var Color = document.getElementById('Color').value

	if(DeleteType=='Data'){

		$.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_ActivityData",
			data : {
				codename : Name,
				color : Color,
				dbid : UpdateDbid
			},
			type : "POST",
			dataType : 'json',
			error : function(e) {
				toastr.error("更新錯誤");
			},
			success : function(data) {
				SelectActivity();
				toastr.success("更新成功");
			}
		});
	}else if(DeleteType=='DataTitle'){

		$.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_ActivityData",
			data : {
				codename : Name,
				color : Color,
				dbid : UpdateDbid
			},
			type : "POST",
			dataType : 'json',
			error : function(e) {
				toastr.error("更新錯誤");
			},
			success : function(data) {
				SelectActivity();
				toastr.success("更新成功");
			}
		});
	}else if(DeleteType=='Group'){
		$.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_ActivityGroup",
			data : {
				groupname : Name,
				dbid : UpdateDbid
			},
			type : "POST",
			dataType : 'json',
			error : function(e) {
				toastr.error("更新錯誤");
			},
			success : function(data) {
				SelectActivity();
				toastr.success("更新成功");
			}
		});

	}else if(DeleteType=='Menu'){

		$.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_ActivityMenu",
			data : {
				dbid : UpdateDbid,
				menuname : Name
			},
			type : "POST",
			dataType : 'json',
			error : function(e) {
				toastr.error("更新錯誤");
			},
			success : function(data) {
				SelectActivity();
				toastr.success("更新成功");
			}
		});
	}

	closeAllHrContent();
	$("#ActivityView").show();
	$("#ActivityShow").show();
}


//呼叫刪除對話視窗
function ActivityTrashButton() {
	var DeleteType = document.getElementById('DeleteType').value

	if(DeleteType==""){
		toastr.error("請選擇預刪除節點");
	}else{
		if(DeleteType=='text'){
			document.getElementById('DeleteType').value ='Data'
				
		}else if(DeleteType=='file'){
			document.getElementById('DeleteType').value ='DataTitle'

		}else if(DeleteType=='default'){
			document.getElementById('DeleteType').value ='Group'

		}else if(DeleteType=='root'){
			document.getElementById('DeleteType').value ='Menu'
		}
		$("#ActivityTrashButton").trigger("click");
	}

}
//刪除功能
function LogicDelete() {
	var DeleteDbid = document.getElementById('DeleteDbid').value
	var DeleteType = document.getElementById('DeleteType').value
	var DeleteChildren_d = document.getElementById('DeleteChildren_d').value
	
	if(DeleteType=='Data'){
		$.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_ActivityData",
			data : {
				deleteflag : 1,
				ActivityData_DBID_list : DeleteDbid,
				aDeleteChildren_d:DeleteChildren_d
			},
			type : "POST",
			dataType : 'json',
			error : function(e) {
				toastr.error("請重新整理");
			},
			success : function(data) {
				SelectActivity();
				toastr.success("刪除成功");
			}
		});
	}else if(DeleteType=='DataTitle'){
		$.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_ActivityData",
			data : {
				deleteflag : 1,
				ActivityData_DBID_list : DeleteDbid,
				aDeleteChildren_d:DeleteChildren_d
			},
			type : "POST",
			dataType : 'json',
			error : function(e) {
				toastr.error("請重新整理");
			},
			success : function(data) {
				SelectActivity();
				toastr.success("刪除成功");
			}
		});
	}else if(DeleteType=='Group'){
		$.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_ActivityGroup",
			data : {
				deleteflag : 1,
				ActivityGroup_DBID_list : DeleteDbid,
				aDeleteChildren_d:DeleteChildren_d
			},
			type : "POST",
			dataType : 'json',
			error : function(e) {
				toastr.error("請重新整理");
			},
			success : function(data) {
				SelectActivity();
				toastr.success("刪除成功");
			}
		});
	}else if(DeleteType=='Menu'){
		$
		.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_activitymenu",
			data : {
				ActivityMenu_DBID_list:DeleteDbid,
				deleteflag:1,
				aDeleteChildren_d:DeleteChildren_d
			},
			type : "POST",
			dataType : 'json',
			error : function(e) {
				toastr.error("請重新整理");
			},
			success : function(data) {
				SelectActivity();
				toastr.success("刪除成功");
			}
		});
	}

	closeAllHrContent();
	$("#ActivityView").show();
	$("#ActivityShow").show();
}


function GetJson(){

    
	var json = $("#ActivityTree").jstree(true).get_json();
	
	$.ajax({
		url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/getActivityJson",
		data : {
			aJson:JSON.stringify(json)
		},
		type : "POST",
		dataType : 'json',
		error : function(e) {
			toastr.error("請重新整理");
		},
		success : function(data) {
			toastr.success("成功");
		}
	});
}

//批次移動的清單
function moveAvtivity(){
	$('#moveActivity').empty();
	var NodeType = $( "#NodeType" ).val();
	if(NodeType=='text'){
		$.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/QueryTitleFlagActivityData",
			data : {
				
			},
			type : "POST",
			dataType : 'json',
			error : function(e) {
				toastr.error("請重新整理");
			},
			success : function(data) {
				console.log(data);
				for(var i =0;i<data.ActivityDataTitleFlag.length;i++){
					var moveActivity = " <option value='"+data.ActivityDataTitleFlag[i].dbid+"'>"+data.ActivityDataTitleFlag[i].codename+"</option>"
					document.getElementById("moveActivity").insertAdjacentHTML("BeforeEnd",moveActivity);	
				}
			}
		});

	}else if(NodeType=='file'){

		$.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Query_ActivityGroup",
			data : {
				dbid:0
			},
			type : "POST",
			dataType : 'json',
			error : function(e) {
				toastr.error("請重新整理");
			},
			success : function(data) {
				console.log(data);
				for(var i =0;i<data.activitygroups.length;i++){
					var moveActivity = " <option value='"+data.activitygroups[i].dbid+"'>"+data.activitygroups[i].groupname+"</option>"
					document.getElementById("moveActivity").insertAdjacentHTML("BeforeEnd",moveActivity);	
				}
			}
		});


	}else if(NodeType=='default'){
		$.ajax({
			url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Query_ActivityMenu",
			data : {
				dbid:0
			},
			type : "POST",
			dataType : 'json',
			error : function(e) {
				toastr.error("請重新整理");
			},
			success : function(data) {
				console.log(data);
				for(var i =0;i<data.activitymenu.length;i++){
					var moveActivity = " <option value='"+data.activitymenu[i].dbid+"'>"+data.activitymenu[i].menuname+"</option>"
					document.getElementById("moveActivity").insertAdjacentHTML("BeforeEnd",moveActivity);	
				}
			}
		});

	}else if(NodeType=='root'){
// 		alert('root');
	}	
	
}

//批次移動
function GetCheckBox(){
		var NodeType = $( "#NodeType" ).val();

	  	var checked_ids = [];
	    var checkedNodes = $("#ActivityTree").jstree("get_checked", null, true);
	    
	    var aParent = $( "#moveActivity" ).val();
	    var aIds = checkedNodes.toString();
	    
// 	    alert(aIds);
// 	    alert(aParent);
	    	if(NodeType=='text'){
	    		$.ajax({
					url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/moveActivity",
					data : {
						aIds:aIds,
						aParent:aParent
					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						toastr.error("請重新整理");
					},
					success : function(data) {
						GetJson();
						SelectActivity();
						toastr.success("Box");
					}
				});

	    	}else if(NodeType=='file'){
		    	$.ajax({
					url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/moveActivity",
					data : {
						aIds:aIds,
						aParent:aParent
					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						toastr.error("請重新整理");
					},
					success : function(data) {
						SelectActivity();
						toastr.success("Box");
					}
				});

	    	}else if(NodeType=='default'){
		    	$.ajax({
					url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/moveActivity",
					data : {
						aIds:aIds,
						aParent:aParent
					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						toastr.error("請重新整理");
					},
					success : function(data) {
						SelectActivity();
						toastr.success("Box");
					}
				});

	    	}else if(NodeType=='root'){

	    	}
	    	
}
 </script> 
</html>


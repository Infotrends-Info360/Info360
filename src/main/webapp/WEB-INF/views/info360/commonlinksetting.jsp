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
		<!-- Commlink開始 -->
				<!-- 常用連結管理切換頁籤Start -->
				<div id="hrTabControlButton" style="margin: 1px 0px 0px 1px;">
					<button class="btn-sm btn-primary manage"
						onclick="showCommonlink2()">
						<i class="fa fa-fw fa-user"></i>常用連結管理
					</button>
					<!--                         <button class="btn-sm btn-success ban" onclick="showBan()"><i class="fa fa-fw fa-user"></i>停用列表</button> -->
					<button class="btn-sm btn-success addMember" style="display: none;">
						<span onclick="showAddMembercomm()">新增常用連結</span> <i
							class="fa fa-times" onclick="closeAddMembercomm()"></i>
					</button>
					<button class="btn-sm btn-success editMember"
						style="display: none;">
						<span onclick="showEditMember()">更新常用連結</span> <i
							class="fa fa-times" onclick="closeEditMembercomm()"></i>
					</button>
				</div>
				<!-- 常用連結管理切換頁籤End -->
				<!-- 設定頁面內容頁 Start-->
				<div class="panel-body" id="settingContent">
					<div id="0Commonlink" style="display: none;">
						<div id="commonlinkul">
							<ul class="pagination">
								<li onclick="showAddMembercomm()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="confirmBancomm()"><a href="#"><i
										class="glyphicon glyphicon-trash"></i></a></li>
							</ul>
						</div>
						<div class="row ibox">
							<div class="col-lg-3 col-md-3">
								<div id="tree"></div>
							</div>
							<div class="spiner-example" id="commonlinkLoading">
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
							<div class="col-lg-8 col-md-8" id="comm" style="display: none;">
								<h2>請選擇節點</h2>
							</div>

							<div class="col-lg-8 col-md-8" id="commTB" style="display: none;">

								<table class="table table-bordered table-hover"
									id="manageTablecomm">
									<thead>
										<tr>
											<td>名稱</td>
<!-- 											<td>編號</td> -->
											<td>路徑</td>
<!-- 											<td>相關節點</td> -->
<!-- 											<td>狀態</td> -->
											<td>URL</td>
											<td>建立者</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td id="commname"></td>
											<td id="pass" style="display: none;"></td>
											<td id="path"></td>
											<td id="children" style="display: none;"></td>
<!-- 											<td id="type"></td> -->
											<td id="url"></td>
											<td id="createuser"></td>
										</tr>
									</tbody>
								  </table>
							</div>
						</div>
					</div>
				</div>

				<!-- 新增  -->
				<div id="addMemberContentcomm" style="display: none;">
					<div class="widget">
						<div class="form-group col-sm-6" >
							<label for="inputAccount" class="col-sm-3 control-label">常用連結名稱:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="nodeNAME"
									placeholder="">
							</div>
						</div>
						
						<div class="form-group col-sm-6" style="padding: 10px">
							<label for="inputName" class="col-sm-3 control-label">檔案類型:</label>
							<div class="col-sm-8">
								<select id="file" onchange="file()">
									<option value="2">檔案</option>
									<option value="1">資料夾</option>
									
								</select>
							</div>
						</div>
	
						<div class="form-group col-sm-6">
							<label for="inputFirstName" class="col-sm-3 control-label">上層節點:</label>
							<div class="col-sm-8"><span id="nodeLINKlist"></span>
							
							</div>
						</div>
						
						<div class="form-group col-sm-5" id="urllink" >
							<label for="inputName" class="col-sm-3 control-label">連結URL:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="nodeURL"
									placeholder="">
							</div>
						</div>

						<div class="form-group col-sm-6">
							<label for="inputEmployNumber" class="col-sm-3 control-label">顏色:</label>
							<div class="col-sm-8">
								<select id="insert_color">
								</select>
							</div>
						</div>
						
						<input type="hidden" class="form-control" id="nodeUSER"
									placeholder="">

						<div class="form-group">
							<div class="col-sm-offset-9 col-sm-3">
								<button class="btn btn-primary" onclick="sendAddMembercomm()">儲存</button>
								<button class="btn btn-default" onclick="closeAddMembercomm()">取消</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 新增 END -->
				
				<script type="text/javascript">
					function file(){ 
						if(document.getElementById('file').value==1){ 
							$("#urllink").hide();
							$("#urllink2").hide();
							
						}else{ 
 							$("#urllink").show(); 
 							$("#urllink2").show(); 
						} 
					
 					} 
				</script>
				<script type="text/javascript">
					function file2(){ 
						if(document.getElementById('file2').value==1){ 
						
							$("#urllink2").hide();
							
						}else{ 
 							$("#urllink2").show(); 
						} 
					
 					} 
				</script>
				
				<!-- 更新  -->
				<div id="editMemberContentcomm" style="display: none;">
					<div class="widget">
						<!--                                 <form class="form-horizontal"> -->
						<div class="form-group col-sm-6">
							<label for="inputAccount" class="col-sm-3 control-label">常用連結名稱:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="nodeNAMEu">
							</div>
						</div>
						
						<div class="form-group col-sm-6" id="" style="padding: 10px">
							<label for="inputName" class="col-sm-3 control-label">檔案類型:</label>
							<div class="col-sm-8">
								<select id="file2" onchange="file2()">
									<option value="2">檔案</option>
									<option value="1">資料夾</option>
									
								</select>
							</div>
						</div>
						
						<div class="form-group col-sm-6">
							<label for="inputFirstName" class="col-sm-3 control-label" >上層節點:</label>
							<div class="col-sm-8"><span id="nodeLINKlistU"></span>

							</div>
						</div>
						
						<div class="form-group col-sm-6" id="urllink2">
							<label for="inputName" class="col-sm-3 control-label">連結URL:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="nodeURLu"
									placeholder="">
							</div>
						</div>

<!-- 						<div class="form-group col-sm-6"> -->
<!-- 							<label for="inputLastName" class="col-sm-3 control-label">建立者名稱:</label> -->
<!-- 							<div class="col-sm-8"> -->
								<input type="hidden" class="form-control" id="nodeUSERu"
									placeholder="" >
<!-- 							</div> -->
						</div>
						
						<div class="form-group col-sm-6">
							<label for="inputEmployNumber" class="col-sm-3 control-label">節點顏色:</label>
							<div class="col-sm-8">
								<select id="update_color">
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-9 col-sm-3">
								<button class="btn btn-primary" onclick="sendEditMembercomm()">更新</button>
								<button class="btn btn-default" onclick="closeEditMembercomm()">取消</button>
							</div>
						</div>
					</div>
				
				<!-- 更新END -->
		<!-- Commlink  END -->
			</div>
</body>

<!-- 彈跳對話視窗-->
<!-- Commonlink 開始-->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#confirmBancomm" style="display: none;"
	id="confirmBanButtoncomm">banDialog</button>

<!-- 禁止符號BUTTON -->
<div id="confirmBancomm" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否確定刪除？(相關子節點將連帶刪除)</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
					
<!-- 					<h3 id="delete_name">名稱:</h3> -->
<!-- 					<h3 id="delete_number">編號:</h3> -->
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="deletefunctioncomm('刪除成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>

	</div>
</div>
<!-- 禁止符號BUTTON END -->
<!-- Commonlink END-->

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
	showCommonlink();
});
function showCommonlink() {
	$('#nodeLINKlist').empty();
	$('#nodeLINKlistU').empty();
	$('#insert_color').empty();
	$('#update_color').empty();
	$('#nodeLINKlistU').empty();
	
	$('#nodeUSERu').empty();
	
	$("button.editMember").hide();
	closeAllHrContent();
	$("#CommonlinkContent").show();

	$("#0Commonlink").show();
	$("#comm").show();

	$("button.Commonlink").removeClass("btn-success");
	$("button.Commonlink").addClass("btn-primary");
	selectcomm();
}

function showCommonlink2() {
	$("button.editMember").hide();
	closeAllHrContent();
	$("#CommonlinkContent").show();

	$("#0Commonlink").show();
	$("#comm").show();

	$("button.Commonlink").removeClass("btn-success");
	$("button.Commonlink").addClass("btn-primary");
	
}

function selectcomm() {

	Uinsertornot = false;
	insertornot = false;
	$('#commonlinkLoading').show();
	$('#tree').hide();
	$('#comm').hide();
	$('#commonlinkul').hide();
	
	
	
	$('#nodeLINKlist').empty();
	$('#nodeLINKlistU').empty();
	$('#insert_color').empty();
	$('#update_color').empty();
	$('#nodeLINKlistU').empty();
	
	$('#nodeUSERu').empty();

	$
			.ajax({
				url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Select_commonlink",

				data : {},

				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("請重新整理");

				},
				success : function(data) {
					
					$('#tree').jstree("destroy").empty();
					console.log("Tree", data);

					
					$('#tree').jstree({
						'core' : {
							'data' : data.Tree,
						},
						
						 "types" : {
				              "#" : {
				                  valid_children : ['root'],
				              },
				              "root" : {
				                  valid_children : ['default', 'file'],
				              	  "icon" : "resources/Home-icon.png"

				              },
				              "default" : {
				                  valid_children : ['default', 'file'],
				                  'icon': 'jstree-folder'
				              },
				              "file" : {
				                  "icon" : "jstree-file",

				              },
				        },

						"plugins" : [ "themes", "json_data", "ui","types" ],
				          

					}).bind("loaded.jstree", function(event, data) {
					
						$(this).jstree("open_all")
					});

					//	 			$('#tree').bind('select_node.jstree', function(e,data) { 
					//	 			    window.location.href = data.instance.get_node(data.node, true).children('a').attr('href');
					//	 			});
					comm2();
					$("#tree").on(
							"select_node.jstree",
							function(evt, data) {
								
								if(data.node.parent=="#"){
									return false;
								}	
								$('#commname')
										.text(data.node.original.text);

								$('#Update_myModalLabel').text(
										"更新的節點名稱: "
												+ data.node.original.text);
								$('#INlist').text(data.node.original.id);
								$('#UPlist').text(data.node.original.id);
								$('#url').text(
										data.node.original.a_attr.href);
								$('#path').text(
										data.instance.get_path(
												data.selected[0], "/", 0));
								$('#createuser').text(
										data.node.original.createuser);

								$('#type').text(data.node.original.parent);
								
								$('#pass').text(data.node.original.id);
								$('#children').text(data.node.children_d);

							});

					$('#tree').on(
							"select_node.jstree",
							function(e, data) {
								console.log("QQ", data.node);

								cot = data.node.parents.length;

								Upcot = data.node.children_d.length;
								
								abc= data.node.a_attr.href

								document.getElementById('nodeNAMEu').value = data.node.text;
								document.getElementById('nodeURLu').value = data.node.a_attr.href;
								document.getElementById('nodeUSERu').value = data.node.parent;
								document.getElementById('nodeLINKlist').innerHTML = data.node.text;
								document.getElementById('nodeUSER').value = data.node.id;
								document.getElementById('update_color').value = data.node.li_attr.class;

								if (abc=="") {
											document.getElementById('file2').value=1
											$("#urllink2").hide();
											document.getElementById('file').value=1
											$("#urllink").hide();
								}else{
									document.getElementById('file2').value=2
									$("#urllink2").show();
									document.getElementById('file').value=2
									$("#urllink").show();
								}
								if (cot <= 3&&data.node.children.length!=0) {
									insertornot = true;
								}
								if (Upcot == 0) {
									Uinsertornot = true;
								}
								$('#tree').show();
								$('#comm').hide();
								$('#commTB').show();
								$('#commonlinkul').show();

							});

					var color = "<option>black</option><option>blue</option><option>yellow</option><option>red</option>";
					document.getElementById("insert_color")
							.insertAdjacentHTML("BeforeEnd", color);
					document.getElementById("update_color")
							.insertAdjacentHTML("BeforeEnd", color);

					$('#commonlinkLoading').hide();
					$('#tree').show();
					$('#comm').show();
					$('#commonlinkul').show();

				},
			});
};

function link() {
	$('#tree').jstree.bind("select_node.jstree", function(e, data) {
		
		var href = data.node.a_attr.href;
		var parentId = data.node.a_attr.parent_id;
		if (href == '#')
			return '';
		window.open(href);
	})
}

function comm2() {
	$("#manageTablecomm tbody tr td").on("click", function() {
		var text = $(this).text();
		if (text && text != "") {
			showEditMembercomm();
		}
	});
}

//新增畫面
function showAddMembercomm() {
	document.getElementById('nodeNAME').value=""
	document.getElementById('nodeURL').value=""

	var nodeid =  document.getElementById('nodeUSER').value

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
	$("#commTB").show();

	$("button.manage").removeClass("btn-success");
	$("button.manage").addClass("btn-primary");
}
//
//新增功能
function sendAddMembercomm() {

	   if (!validateCmI()) {
           return;
       }
	closeAddMember();

	var a = 0;
	if (insertornot) {
		var nodeLINK = document.getElementById('nodeUSER').value;
		var nodeNAME = document.getElementById('nodeNAME').value;
		var nodeURL = document.getElementById('nodeURL').value;

		var color = document.getElementById('insert_color').value;
		var myMap = new Map();

		$
				.ajax({
					url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_commonlink",

					data : {
						"parnetid" : nodeLINK,
						"nodetext" : nodeNAME,
						"nodeurl" : nodeURL,
						"createuserid" : parent.UserID_g,
						"color" : color
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						toastr.error("新增錯誤");

					},
					success : function(data) {
						selectcomm();
						toastr.success("新增成功");
					}
				});
	} else if (document.getElementById('nodeLINKlist').value == "") {
		var nodeLINK = "0"
		var nodeNAME = document.getElementById('nodeNAME').value;
		var nodeURL = document.getElementById('nodeURL').value;
//			var nodeUSER = document.getElementById('nodeUSER').value;
		var color = document.getElementById('insert_color').value;
		var myMap = new Map();

		$
				.ajax({
					url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_commonlink",

					data : {
						"parnetid" : nodeLINK,
						"nodetext" : nodeNAME,
						"nodeurl" : nodeURL,
						"createuserid" : parent.UserID_g,
						"color" : color
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						toastr.error("新增錯誤");
					},
					success : function(data) {
						selectcomm();
						toastr.success("新增成功");
					}
				});
	} else {
		toastr.error("不可超過第三層或在檔案下建立");
	}


	closeAllHrContent();
	$("#CommonlinkContent").show();
	$("#0Commonlink").show();
}

function validateCmI() {
    var nodeNAME = $("#nodeNAME").val();
    var file = $("#file").val();
    var nodeURL =$("#nodeURL").val();
    
    if(file==2){
    	if (!nodeURL || nodeURL == '' ) {
        	toastr.error("請輸入URL");
        	return false;
    	}
    }
    if (!nodeNAME || nodeNAME == '' ) {
        toastr.error("請輸入名稱");
        return false;
    }
    return true;
}


//更新頁面
function showEditMembercomm() {
	
	$('#nodeLINKlistU').empty();

	var nodeLINKu = document.getElementById('nodeUSERu').value;

	$
	.ajax({
		url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Select_commonlink",

		data : {
			"nodeid" : nodeLINKu
		},
		type : "POST",
		dataType : 'json',

		error : function(e) {
		
		},
		success : function(data) {
			var str = "<span >"+data.Tree[0].text+"</span>"	
			document.getElementById("nodeLINKlistU").innerHTML=str;
		}

	});

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
	   if (!validateCmU()) {
           return;
       }

	closeEditMember();
	var a = 0;
	if (Uinsertornot) {
		var nodeIDu = document.getElementById('pass').innerHTML;
		var nodeLINKu = document.getElementById('nodeUSERu').value;
		var nodeNAMEu = document.getElementById('nodeNAMEu').value;
		var nodeURLu = document.getElementById('nodeURLu').value;
//			var nodeUSERu = document.getElementById('nodeUSERu').value;
		var color = document.getElementById('update_color').value;
		var myMap = new Map();

		$
				.ajax({
					url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_commonlink",

					data : {
						"parnetid" : nodeLINKu,
						"nodetext" : nodeNAMEu,
						"nodeurl" : nodeURLu,
						"createuserid" : parent.UserID_g,
						"nodeid" : nodeIDu,
						"color" : color
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						toastr.error("更新錯誤");
					},
					success : function(data) {
						selectcomm();
						toastr.success("更新成功");
					}

				});
	} else {
		alert("有子節點無法移動");
	}
	
	closeAllHrContent();
	$("#CommonlinkContent").show();
	$("#0Commonlink").show();
}

function validateCmU() {
    var nodeNAME = $("#nodeNAMEu").val();
    var file2 = $("#file2").val();
    var nodeURLu = $("#nodeURLu").val();
    if(file2==2){
    	if (!nodeURLu || nodeURLu == '' ) {
        	toastr.error("請輸入URL");
        	return false;
    	}
    }
    if (!nodeNAME || nodeNAME == '' ) {
        toastr.error("請輸入名稱");
        return false;
    }
  
    return true;
}

//停用對話視窗
function confirmBancomm() {
	$("#confirmBanButtoncomm").trigger("click");
}

function deletefunctioncomm(message) {
	var a = 0;
	var nodeIDd = document.getElementById('pass').innerHTML;
	var children_list = document.getElementById('children').innerHTML;
	var myMap = new Map();
	$
			.ajax({
				url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Delete_commonlink",

				data : {
					"nodeid" : nodeIDd,
					"children_list" : children_list
				},
				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("刪除錯誤");
				},
				success : function(data) {
					selectcomm();
					toastr.success("刪除成功");
				}
			});

	closeAllHrContent();
	$("#CommonlinkContent").show();
	$("#0Commonlink").show();
}
</script>
</html>


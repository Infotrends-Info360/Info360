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
				<!-- 人員管理切換頁籤Start -->
				<div id="hrTabControlButton" >
					<button class="btn-sm btn-primary manage" onclick="showManage()">
						<i class="fa fa-fw fa-user"></i>人員管理
					</button>
					<button class="btn-sm btn-success ban" onclick="showBan()">
						<i class="fa fa-fw fa-user"></i>停用列表
					</button>
					<button class="btn-sm btn-success addMember" style="display: none;">
						<span onclick="showAddMember()">新增人員</span> <i class="fa fa-times"
							onclick="closeAddMember()"></i>
					</button>
					<button class="btn-sm btn-success editMember"
						style="display: none;">
						<span onclick="showEditMember()" id="UPpeople"></span> <i
							class="fa fa-times" onclick="closeEditMember()"></i>
					</button>
				</div>
				<!-- 人員管理切換頁籤End -->

				<!-- 設定頁面內容頁 Start-->
				<div class="panel-body" id="settingContent">
					<div id="manageContent">
						<div id="personul" style="display: none;">
							<ul class="pagination">
								<li onclick="showAddMember()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="confirmBan()"><a href="#"><i
										class="fa fa-fw fa-unlock-alt"></i></a></li>		
								<li onclick="unlockAccount()"><a href="#"><i
										class="fa fa-fw fa-ban"></i></a></li>
								<li onclick="personTrashBun()"><a href="#"><i
										class="glyphicon glyphicon-trash"></i></a></li>
							</ul>

							<ul class="pagination" style="float: right;" >
								<li><input type="text" id="person0Search" placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>
						
						<div class="row ibox">
						<div class="spiner-example" id="personLoding">
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
							<div class="col-lg-12 col-md-12" id="persondiv" style="display: none;">
							
							<form id="person0_form">
								<table class="table table-bordered table-hover"
									id="person0Table" >
									<thead>
										<tr>
											<th class="no-sort"><input type="checkbox"
												 ischecked=false name="person0All" id="person0All"></th>
											<th>帳號</th>
											<th>姓名</th>
											<th>員工編號</th>
											<th>分機號碼</th>
											<th>信箱</th>
											<th>最大接通數</th>
											<th >狀態</th>
										</tr>
									</thead>
								</table>
								</form>
							</div>
							
						</div>
					</div>

					<div id="banContent" style="display: none;">
						<div id="personul1">
							<ul class="pagination">

								<li onclick="person_ok()"><a href="#"><i
										class="glyphicon glyphicon-ok"></i></a></li>
								<li onclick="personTrashBun()"><a href="#"><i
										class="glyphicon glyphicon-trash"></i></a></li>
							</ul>

							<ul class="pagination" style="float: right;">
								<li><input type="text" id="person1Search" placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox">
								<div class="spiner-example" id="personLoding1">
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
							<div class="col-lg-12 col-md-12" id="persondiv1">
								
								<table class="table table-bordered table-hover"
									id="person1Table">
									<thead>
										<tr>
											<th class="no-sort"><input type="checkbox"
												 name="person1All" id="person1All" ischecked=false></th>
											<th>帳號</th>
											<th>姓名</th>
											<th>員工編號</th>
											<th>分機號碼</th>
											<th>信箱</th>
											<th>最大接通數</th>
										
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>

					<!-- 新增  -->
					<div id="addMemberContent" style="display: none;">
						<div class="widget">
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label ">帳號</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="inputAccount"
										placeholder="" >
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputName" class="col-sm-2 control-label ">姓名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="inputName"
										placeholder="">
								</div>
							</div>

							<div class="form-group col-sm-6">
								<label for="inputLastName" class="col-sm-2 control-label">名字</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="inputLastName"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputFirstName" class="col-sm-2 control-label">姓氏</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="inputFirstName"
										placeholder="" pattern="[0-9]">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputEmployNumber" class="col-sm-2 control-label">員工編號</label>
								<div class="col-sm-8">
									<input type="tel" class="form-control"
										id="inputEmployNumber" placeholder="" pattern="[0-9]">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputPhoneNumber" class="col-sm-2 control-label">分機號碼</label>
								<div class="col-sm-8">
									<input type="tel" class="form-control" id="inputPhoneNumber"
										placeholder="" pattern="[0-9]">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputPassword" class="col-sm-2 control-label ">密碼</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="inputPassword"
										placeholder="">
								</div>
							</div>

							<div class="form-group col-sm-6">
								<label for="inputDepartment" class="col-sm-2 control-label">最大接通數</label>
								<div class="col-sm-8">
									<input type="tel" class="form-control" id="inputMaxcount"
										placeholder="" pattern="[0-9]">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label for="inputEmail" class="col-sm-1 control-label">信箱</label>
								<div class="col-sm-9">
									<input type="email" class="form-control" id="inputEmail"
										placeholder="">
								</div>
							</div>
							
				<div class="form-group col-sm-6">
					<label for="inputEmail" class="col-sm-5 control-label">人員所屬部門</label>
						<div id="Box3" ondrop="Drop(event)" ondragover="AllowDrop(event)" style="overflow: auto; width: 100%; height: 100px; border: 1px silver solid">
							<ul id="Box33" >

							</ul>	
							</div>
						<div style="clear:both;"></div>
				</div>

				<div class="form-group col-sm-6"> 
					<label for="inputEmail" class="col-sm-5 control-label">部門列表</label> 
							<div id="Box2" ondrop="Drop(event)" ondragover="AllowDrop(event)" style="overflow: auto; width: 100%; height: 100px; border: 1px silver solid">
									<div class="spiner-example" id="Box22Loading">
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
									
									<ul id="Box22"> 
									</ul>	
								</div>
				</div>		
							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary" onclick="sendAddMember()">儲存</button>
									<button class="btn btn-default" onclick="closeAddMember()">取消</button>
								</div>
							</div>
						</div>
			
					</div>
					<!-- 新增 END -->
					<!-- 更新  -->
					<div id="editMemberContent" style="display: none;">
						<div class="widget">
							<!--                                 <form class="form-horizontal"> -->
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label  ">帳號</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="updateAccount"
										disabled>
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputName" class="col-sm-2 control-label ">姓名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="updateName"
										placeholder="">
								</div>
							</div>

							<div class="form-group col-sm-6">
								<label for="inputLastName" class="col-sm-2 control-label">名字</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="updateLastName"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputFirstName" class="col-sm-2 control-label">姓氏</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="updateFirstName"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputEmployNumber" class="col-sm-2 control-label">員工編號</label>
								<div class="col-sm-8">
									<input type="tel"class="form-control" id="updateEmployNumber"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputPhoneNumber" class="col-sm-2 control-label">分機號碼</label>
								<div class="col-sm-8">
									<input type="tel" class="form-control"
										id="updatePhoneNumber" placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputPassword" class="col-sm-2 control-label ">密碼</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="updatePassword"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputDepartment" class="col-sm-2 control-label">最大接通數</label>
								<div class="col-sm-6">
									<input type="tel" class="form-control" id="updateMaxcount"
										placeholder="">
								</div>
							</div>

							<div class="form-group col-sm-12">
								<label for="inputEmail" class="col-sm-1 control-label">信箱</label>
								<div class="col-sm-8">
									<input type="email" class="form-control" id="updateEmail"
										placeholder="">
								</div>
							</div>
							
							
							
											<div class="form-group col-sm-6">
					 							<div class="panel-body">
					                                <div class="form-group col-sm-12"> 
														<label for="inputEmail" class="col-sm-5 control-label">部門列表</label> 
														<div style="overflow: auto; width: 100%; height: 300px; border: 1px silver solid">	
														<table class="table table-striped">
							                                <thead>
							                                    <tr>
							                                        <th></th>
							                                        <th>部門名稱</th>
							                                    </tr>
							                                </thead>
							                                <tbody id="HaveGroup">
							                                    
							                                </tbody>
							                            </table>
							                            <button class="btn btn-primary" onclick="backGroup()">剔除</button>
														</div>
													</div>	

													<button class="btn btn-primary" onclick="addGroupButton()">新增</button>
													<button class="btn btn-default" onclick="">取消</button>       
												</div>
					                        </div>
					
					
							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary" onclick="sendEditMember()">更新</button>
									<button class="btn btn-default" onclick="closeEditMember()">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 更新END -->

				</div>
				<!-- 設定頁面內容頁 End-->
			</div>
			
			
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#addGroup" id="addGroupButton" style="display: none;" ></button>
<div id="addGroup" class="modal fade" role="dialog">
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
												id="NotHaveGroupAll" ischecked=false ></th>
							            <th>部門名稱</th>

							       </tr>
							    </thead>
							      <tbody id="NotHaveGroup">
							                                    
							    </tbody>
						</table>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="addGroup()">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
			
			
</body>

<!-- 彈跳對話視窗-->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#confirmBan" style="display: none;" id="confirmBanButton">banDialog</button>

<!-- 鎖定符號BUTTON -->
<div id="confirmBan" class="modal fade" role="dialog" >
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否啟用/鎖定帳號？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
						<input type="hidden" class="form-control" id="deletedbid"
							placeholder="" >
					<div class="col-sm-6">
					<label class="radio-inline">
     					 <input type="radio" name="personL" value="0">啟用
    				</label>
    				</div>
    				<div class="col-sm-6">
    				<label class="radio-inline">
      						<input type="radio" name="personL"  value="2">鎖定
					</label>
					</div>

				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="showToastSuccess('鎖定')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>

	</div>
</div>
<!-- 鎖定符號BUTTON END -->

<!-- 停用號BUTTON -->
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#unlockModal" style="display: none;" id="unlockButton">unlockDialog</button>
<div id="unlockModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否停用帳號？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">

						<input type="hidden" class="form-control" id="state_account"
							placeholder="">
					</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="showToastError('停用')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- 停用號BUTTON END -->

<!-- PersonTrashBUTTON -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#personTrash" style="display: none;" id="personTrashBun">unlockDialog</button>
<div id="personTrash" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否刪除？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
<!-- 					<label for="inputDepartment" class="col-sm-6 control-label">帳號:<span id="person3"></span></label> -->
						<input type="hidden" class="form-control" id="personTrashdbid"
							placeholder="">
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="personTrash('刪除')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- PersonTrashBUTTON END -->

<!-- Person_ok -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#person_ok" style="display: none;" id="person_okBun">unlockDialog</button>
<div id="person_ok" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否啟用帳號？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
<!-- 					<label for="inputDepartment" class="col-sm-6 control-label">帳號:<span id="person3"></span></label> -->
						<input type="hidden" class="form-control" id="personok_dbid"
							placeholder="">
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="person_ok22('啟用')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- Person_ok END -->


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
	showPerson();
});

function showPerson() {
	$("button.editMember").hide();

	closeAllHrContent();
	$("#person").show();
	$("#manageContent").show();

	$("button.group").removeClass("btn-success");
	$("button.group").addClass("btn-primary");
	$("#persondiv").hide();
	person();
}

function person_groupmenu(){
	$("#persondiv").hide();
	$("#persondiv1").hide();
	$("#personul").hide();
	$("#personul1").hide();
	
	
	$("#Box22").hide();
	$("#Box22Loading").show();
	
	$("#updateDepartment").empty();
	$("#inputDepartment").empty();
	$("#Box3").empty();
	$("#Box4").empty();
$.ajax({
	url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Query_Group_STATE",
	data : {
		state : 0
	},
	type : "POST",
	dataType : 'json',

	error : function(e) {
		toastr.error("請重新整理");

	},
	success : function(data) {
		console.log("Pgroup",data)
		for(var i=0; i<data.group.length; i++){
	        var menu = "<li id='Imgperson"+data.group[i].dbid+"'  draggable='true' ondragstart='Drag(event)'  style='margin-top:5px;padding:5px 15px; background:#d65c5c;color:white; border:0 none; width: 100%; cursor:pointer;-webkit-border-radius: 5px;border-radius: 5px;'><input  type='hidden'  value="+data.group[i].dbid+" ><p>"+data.group[i].name+"</p></li>"
	        document.getElementById("Box22").insertAdjacentHTML("BeforeEnd",menu);
	        	 }
		$("#Box22").show();
		$("#Box22Loading").hide();
	}
});
}
var dataa;
var tabledata;
	function person() {
		person_groupmenu();

		$("#personLoding").show();
		$("#personLoding1").show();
		$("#persondiv").hide();
		$("#persondiv1").hide();
		$("#personul").hide();
		$("#personul1").hide();
		$("#person1All").prop("checked", false);
		$("#person0All").prop("checked", false);
		
		$("#person0Table tbody tr").empty();
		$("#person1Table tboby tr").empty();
		$
				.ajax({
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Query_Person_STATE",
					data : {
						state : 0
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						toastr.error("請重新整理");

					},
					success : function(data) {
						console.log("啟用人員", data);

						$('#person0Table')
								.DataTable(
										{
											"autoWidth": false,
											destroy : true,
											aaData : data.person,
											aoColumns : [{
														className : "dt-body-center"
													}, {
														"data" : "account"
													}, {
														"data" : "user_name"
													}, {
														"data" : "employee_id"
													}, {
														"data" : "dn"
													}, {
														"data" : "emailaddress"
													}, 
													{
														"data" : "max_count"
													},
// 													{
// 														className : "label label-danger",
//  														"data" : "state"
// 													} 
													],'columnDefs': [{
												         'targets': 0,
												         'searchable': false,
												         'orderable': false,
												         'className': 'dt-body-center',
												         'render': function (data, type, full, meta){
												             return '<input type="checkbox" name="person0" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
												         },
												
												      },
												      {
													         'targets': 7,
													         'searchable': false,
													         'orderable': false,
													        'className': "  ",
													         'render': function (data, type, full, meta){
													        	 if(full.state!=null&&full.state!=""){
													        		 return '<label class="label label-danger">'+full.state+'</label>';
													        	 }else{
													        		 return '<label>'+full.state+'</label>';
													        	 }
													         },
													
													      }
												      ],
											lengthChange : false
										});

						var table = $('#person0Table').DataTable();					

						var flag = true; 
						
						$('#person0Table tbody')
								.on('click',
										'tr',
										function() {
											console.log("person0", table.row(
													this).data());
											document
													.getElementById('updateAccount').value = table
													.row(this).data().account;
											document
													.getElementById('updateEmail').value = table
													.row(this).data().emailaddress;
											document
													.getElementById('updatePhoneNumber').value = table
													.row(this).data().dn;
											document
													.getElementById('updateName').value = table
													.row(this).data().user_name;
											document
													.getElementById('updateEmployNumber').value = table
													.row(this).data().employee_id;

											document
													.getElementById('deletedbid').value = table
													.row(this).data().dbid;

											document
													.getElementById('state_account').value = table
													.row(this).data().dbid;
											document
													.getElementById('personTrashdbid').value = table
													.row(this).data().dbid;
											document
													.getElementById('UPpeople').innerHTML = table
													.row(this).data().account;
											document
											.getElementById('updateMaxcount').value = table
											.row(this).data().max_count;
											document
											.getElementById('updateLastName').value = table
											.row(this).data().last_name;
											document
											.getElementById('updateFirstName').value = table
											.row(this).data().first_name;
											document
											.getElementById('updatePassword').value = table
											.row(this).data().password;


											aa(data,table.row(this).data());

											dataa = data;
											tabledata = table.row(this).data();

											if(flag){
												showEditMember(data,tabledata);
											}
			 								
											
										});
						
						
						$('#person0Table tbody').on('click','td',function() {

							var text = $(this).text();	

							if (text && text != "") {
								flag = true;
							}else{
								flag = false;
								return;
							}
					});
						$("#personLoding").hide();
						$("#persondiv").show();
						$("#personul").show();
						
					}	
				});

		$("#person0Table").css("width", "100%");
		$("#person0Table_filter").prop("style", "float:right;");
		$("#person0Table_wrapper > div:nth-child(1)").hide();

		$("#person0Search").keyup(function() {
			var searchText = $("#person0Search").val();

			$("input[aria-controls='person0Table']").val(searchText);
			$("input[aria-controls='person0Table']").trigger("keyup");
		});

		$
				.ajax({
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Query_Person_STATE",
					data : {
						state : 1
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						toastr.error("請重新整理");

					},
					success : function(data) {
						console.log("停用人員", data);

						$('#person1Table')
								.DataTable(
										{
											"autoWidth": false,
											destroy : true,
											aaData : data.person,
											aoColumns : [{
												
														className : "dt-body-center"
													}, {
														"data" : "account"
													}, {
														"data" : "user_name"
													}, {
														"data" : "employee_id"
													}, {
														"data" : "dn"
													}, {
														"data" : "emailaddress"
													}, {
														"data" : "max_count"
													} ],'columnDefs': [{
												         'targets': 0,
												         'searchable': false,
												         'orderable': false,
												         'className': 'dt-body-center',
												         'render': function (data, type, full, meta){
												             return '<input type="checkbox" name="person1" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
												         }
												      }],
											lengthChange : false
										});

						var table = $('#person1Table').DataTable();

						$('#person1Table tbody')
								.on(
										'click',
										'tr',
										function() {
											console.log("person1", table.row(
													this).data());
											document
											.getElementById('updateAccount').value = table
											.row(this).data().account;
									document
											.getElementById('updateEmail').value = table
											.row(this).data().emailaddress;
									document
											.getElementById('updatePhoneNumber').value = table
											.row(this).data().dn;
									document
											.getElementById('updateName').value = table
											.row(this).data().user_name;
									document
											.getElementById('updateEmployNumber').value = table
											.row(this).data().employee_id;
									document
											.getElementById('deletedbid').value = table
											.row(this).data().dbid;

									document
											.getElementById('state_account').value = table
											.row(this).data().dbid;
									document
											.getElementById('personTrashdbid').value = table
											.row(this).data().dbid;
									document
											.getElementById('UPpeople').innerHTML = table
											.row(this).data().account;
									document
									.getElementById('updateMaxcount').value = table
									.row(this).data().max_count;
									document
									.getElementById('updateLastName').value = table
									.row(this).data().last_name;
									document
									.getElementById('updateFirstName').value = table
									.row(this).data().first_name;
									document
									.getElementById('updatePassword').value = table
									.row(this).data().password;
									
									aa(data,table.row(this).data());						
									dataa = data;
									tabledata = table.row(this).data();								
									if(flag){
										showEditMember(data,tabledata);
									}
	 								
								});
				
				
				$('#person1Table tbody').on('click','td',function() {

					var text = $(this).text();	
					if (text && text != "") {
						flag = true;
					}else{
						flag = false;
						return;
					}
					
								});
						
				$("#personLoding1").hide();
				$("#persondiv1").show();
				$("#personul1").show();
					}
				});

		$("#person1Table").css("width", "100%");
		$("#person1Table_filter").prop("style", "float:right;");
		$("#person1Table_wrapper > div:nth-child(1)").hide();

		$("#person1Search").keyup(function() {

			var searchText = $("#person1Search").val();

			$("input[aria-controls='person1Table']").val(searchText);
			$("input[aria-controls='person1Table']").trigger("keyup");
		});
		
	}

	function personjump(data,tabledata){
		console.log("personjump",tabledata)
		var arrName = tabledata.groupname.split(',');
		var arrDbid = tabledata.groupdbid.split(',');
		
		for (var i in arrDbid ) {
			if(arrDbid[i].trim()!="" && arrName[i].trim()!="" ){
				var HaveGroup = "<tr id='removeHaveGroup"+arrDbid[i]+"'><td><input type='checkbox' name='HaveGroupTitle' class='i-checks' value='"+arrDbid[i]+"'></td><td>"+arrName[i]+"</td><input type='hidden' id='1HaveGroup"+arrDbid[i]+"' value='"+arrDbid[i]+"'><input type='hidden' id='2HaveGroup"+arrDbid[i]+"' value='"+arrName[i]+"'></tr>"
		        document.getElementById("HaveGroup").insertAdjacentHTML("BeforeEnd",HaveGroup);	
			}
		}
		
		
		var arrName = tabledata.notgroupname.split(',');
		var arrDbid = tabledata.notgroupdbid.split(',');
		for (var i in arrDbid ) {
			if(arrDbid[i].trim()!="" && arrName[i].trim()!="" ){
				var NotHaveGroup = "<tr id='removeGroup"+arrDbid[i]+"'><td><input type='checkbox' name='NotHaveGroupTitle' class='i-checks' value='"+arrDbid[i]+"'></td><td>"+arrName[i]+"</td><input type='hidden' id='1NotHaveGroup"+arrDbid[i]+"' value='"+arrDbid[i]+"'><input type='hidden' id='2NotHaveGroup"+arrDbid[i]+"' value='"+arrName[i]+"'></tr>"

		        document.getElementById("NotHaveGroup").insertAdjacentHTML("BeforeEnd",NotHaveGroup);	
			}
		}
	}
	
	
	function aa(data,tabledata) {

		$("#person0All").click(function() {
			   if($("#person0All").prop("checked")) {
			     $("input[name='person0']").each(function() {
			         $(this).prop("checked", true);
			     });
			   } else {
			     $("input[name='person0']").each(function() {
			         $(this).prop("checked", false);
			     });           
			   }
			});
		$("#person1All").click(function() {
			   if($("#person1All").prop("checked")) {
			     $("input[name='person1']").each(function() {
			         $(this).prop("checked", true);
			     });
			   } else {
			     $("input[name='person1']").each(function() {
			         $(this).prop("checked", false);
			     });           
			   }
			});
		
	}
	
	
	function checkbox(){
		$("#person0All").click(function() {
			   if($("#person0All").prop("checked")) {
			     $("input[name='person0']").each(function() {
			         $(this).prop("checked", true);
			     });
			   } else {
			     $("input[name='person0']").each(function() {
			         $(this).prop("checked", false);
			     });           
			   }
			});
		$("#person1All").click(function() {
			   if($("#person1All").prop("checked")) {
			     $("input[name='person1']").each(function() {
			         $(this).prop("checked", true);
			     });
			   } else {
			     $("input[name='person1']").each(function() {
			         $(this).prop("checked", false);
			     });           
			   }
			});
	}
	
	function showManage() {
		closeAllHrContent();
		$("#person").show();
		$("#manageContent").show();

		$("button.manage").removeClass("btn-success");
		$("button.manage").addClass("btn-primary");
	}

	function showBan() {
		closeAllHrContent();
		$("#person").show();
		$("#banContent").show();

		$("button.ban").removeClass("btn-success");
		$("button.ban").addClass("btn-primary");
	}

	function showAddMember() {
		$("#Box22").empty();
		$("#Box3").empty();
		person_groupmenu();
		
		document.getElementById('inputFirstName').value = "";
		document.getElementById('inputLastName').value = "";
		document.getElementById('inputName').value = "";
		document.getElementById('inputEmail').value = "";
		document.getElementById('inputPassword').value = "";
		document.getElementById('inputEmployNumber').value = "";
// 		document.getElementById('inputDepartment').value = "";
		document.getElementById('inputAccount').value = "";
		document.getElementById('inputPhoneNumber').value = "";
		document.getElementById('inputMaxcount').value = "";
		
		closeAllHrContent();
		$("#person").show();
		$("#addMemberContent").show();

		$("button.addMember").show();
		$("button.addMember").removeClass("btn-success");
		$("button.addMember").addClass("btn-primary");
	}

	function showEditMember(data,tabledata) {
		$("#HaveGroup").empty();
		$("#NotHaveGroup").empty();
		
		personjump(data,tabledata);
		
		closeAllHrContent();
		$("#person").show();
		$("#editMemberContent").show();

		$("button.editMember").show();
		$("button.editMember").removeClass("btn-success");
		$("button.editMember").addClass("btn-primary");
	}

	function sendAddMember() {

		            if (!validateAddMember()) {
		                return;
		            }

		closeAddMember();
	
		var aa = $('#Box3 input');
		var arr = $.makeArray(aa);
		
		for(var i=0;i<arr.length;i++){
		var hh = arr[i].value;
		
		var in_first_name = document.getElementById('inputFirstName').value;
		var in_last_name = document.getElementById('inputLastName').value;
		var in_user_name = document.getElementById('inputName').value;
		var in_emailaddress = document.getElementById('inputEmail').value;
		var in_password = document.getElementById('inputPassword').value;
		var hash = md5(in_password);

		var in_employee_id = document.getElementById('inputEmployNumber').value;
		var in_group_dbid = hh;
		var in_account = document.getElementById('inputAccount').value;
		var in_dn = document.getElementById('inputPhoneNumber').value;
		var in_maxcount = document.getElementById('inputMaxcount').value;

		$
				.ajax({
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_PersonInfo",
					data : {
						first_name : in_first_name,
						last_name : in_last_name,
						user_name : in_user_name,
						emailaddress : in_emailaddress,
						password : hash,
						employee_id : in_employee_id,
						group_dbid : in_group_dbid,
						account : in_account,
						state : 0,
						dn : in_dn,
						max_count : in_maxcount

					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						toastr.error("新增錯誤");
					},
					success : function(data) {
						person();
						
					}
				});
			}
		toastr.success("新增成功");
	}
	 function validateAddMember() {
         var account = $("#inputAccount").val();
         var name = $("#inputName").val();
         var passowrd = $("#inputPassword").val();
         var email = $("#inputEmail").val();
         var FN = $("#inputFirstName").val();
         var LN = $("#inputLastName").val();
         var EN = $("#inputEmployNumber").val();
         var PN = $("#inputPhoneNumber").val();
         var MX = $("#inputMaxcount").val();
         
     	var aa = $('#Box3 input');
		var arr = $.makeArray(aa);
         
         var DT = $("#Box3").val();
         
         if (!account || account == '' ) {
             toastr.error("請輸入帳號");
             return false;
         }

         if (!name || name == '') {
             toastr.error("請輸入姓名");
             return false;
         }
         
         if (name !='' && isValidNumber(name)) {
             toastr.error("姓名請輸入中文或英文");
             return false;
         }
         
         if (!FN || FN == '') {
             toastr.error("請輸入姓氏");
             return false;
         }
         
         if (FN !='' && isValidNumber(FN)) {
             toastr.error("姓氏請輸入中文或英文");
             return false;
         }
         if (!LN || LN == '') {
             toastr.error("請輸入名字");
             return false;
         }
         
         if (LN !='' && isValidNumber(LN)) {
             toastr.error("名字請輸入中文或英文");
             return false;
         }
         if (!EN || EN == '') {
             toastr.error("請輸入員工編號");
             return false;
         }
         
         if (EN !='' && !isValidNumber(EN)) {
             toastr.error("員工編號請輸入數字");
             return false;
         }
         if (!PN || PN == '') {
             toastr.error("請輸入分機號碼");
             return false;
         }
         
         if (PN !='' && !isValidNumber(PN)) {
             toastr.error("分機號碼請輸入數字");
             return false;
         }
         if (!PN || MX == '') {
             toastr.error("請輸入接通數");
             return false;
         }
         
         if (MX !='' && !isValidNumber(MX)) {
             toastr.error("接通數請輸入數字");
             return false;
         }
//          if (!DT || DT == '') {
//              toastr.error("請選擇部門");
//              return false;
//          }

         if (!passowrd || passowrd == '') {
             toastr.error("請輸入密碼");
             return false;
         }
         if (!email || email == '') {
             toastr.error("請輸入Email");
             return false;
         }

         if (email !='' && !isValidEmail(email)) {
             toastr.error("請輸入正確的Email格式");
             return false;
         }
         
         if(arr.length==0){
 			toastr.error("請選擇部門");
 			 return false;
 		}

         return true;
     }
	
	 function isValidEmail(email) {
			var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			return re.test(email);
		}
	 function isValidNumber(name) {
			var re2 = /^[0-9]*$/;
			return re2.test(name);
		}
	 function isValidNumber(FN) {
			var re3 = /^[0-9]*$/;
			return re3.test(FN);
		}
	 function isValidNumber(LN) {
			var re4 = /^[0-9]*$/;
			return re4.test(LN);
		}
	 function isValidNumber(EN) {
			var re5 = /^[0-9]*$/;
			return re5.test(EN);
		}
	 function isValidNumber(PN) {
			var re5 = /^[0-9]*$/;
			return re5.test(PN);
		}
	 function isValidNumber(MX) {
			var re5 = /^[0-9]*$/;
			return re5.test(MX);
		}
	 

	function closeAddMember() {
		closeAllHrContent();
		$("button.addMember").hide();
		$("#person").show();
		$("#persondiv").show();
		$("#personul").show();
		$("#manageContent").show();
		
		$("button.manage").removeClass("btn-success");
		$("button.manage").addClass("btn-primary");
		
	}

	function closeEditMember() {
		closeAllHrContent();
		$("button.editMember").hide();
		$("#person").show();
		$("#manageContent").show();
		
		$("button.manage").removeClass("btn-success");
		$("button.manage").addClass("btn-primary");
	}

function sendEditMember() {
		            if (!validatePersonUP()) {
		                return;
		            }
  
		closeEditMember();
		
 		var HaveGroup=[];
   		$("[name=HaveGroupTitle]").each(function(){
    		HaveGroup.push($(this).val());
      	});
	  	var HaveGroupList = HaveGroup.join();
		if(HaveGroupList.length==0){
			
			var up_first_name = $('#updateFirstName').val();
			var up_last_name = $('#updateLastName').val();
			var up_user_name = $('#updateName').val();
			var up_emailaddress = $('#updateEmail').val();
			var up_password = $('#updatePassword').val();
			var hash = md5(up_password);
			var up_employee_id = $('#updateEmployNumber').val();
			var up_account = $('#updateAccount').val();
//	 		var up_state = $('#updateState').val();
			var up_dn = $('#updatePhoneNumber').val();
			var up_updateMaxcount = $('#updateMaxcount').val();
			$
				.ajax({
				url : '${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_PersonInfo',
				data : {
					max_count :up_updateMaxcount,
					first_name : up_first_name,
					last_name : up_last_name,
					user_name : up_user_name,
					emailaddress : up_emailaddress,
					password : hash,
					employee_id : up_employee_id,
					group_dbid : "",
					account : up_account,
					state : 0,
					dn : up_dn,
					
				},
				type : "POST",
				dataType : 'json',

				error : function(e) {
					toastr.error("更新失敗");
				},
				success : function(data) {
					person();
					toastr.success("更新成功");
				}

			});
		}else{
			
		
		
		var up_first_name = $('#updateFirstName').val();
		var up_last_name = $('#updateLastName').val();
		var up_user_name = $('#updateName').val();
		var up_emailaddress = $('#updateEmail').val();
		var up_password = $('#updatePassword').val();
		var hash = md5(up_password);
		var up_employee_id = $('#updateEmployNumber').val();
		var up_account = $('#updateAccount').val();
// 		var up_state = $('#updateState').val();
		var up_dn = $('#updatePhoneNumber').val();
		var up_updateMaxcount = $('#updateMaxcount').val();
		 
		$
			.ajax({
			url : '${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_PersonInfo',
			data : {
				max_count :up_updateMaxcount,
				first_name : up_first_name,
				last_name : up_last_name,
				user_name : up_user_name,
				emailaddress : up_emailaddress,
				password : hash,
				employee_id : up_employee_id,
				GP_DBID_list: HaveGroupList,
				account : up_account,
				state : 0,
				dn : up_dn,
				
			},
			type : "POST",
			dataType : 'json',

			error : function(e) {
				toastr.error("更新失敗");
			},
			success : function(data) {
				person();
				toastr.success("更新成功");
			}

		});
	}
		
}
	
	 function validatePersonUP() {
         var account = $("#updateAccount").val();
         var name = $("#updateName").val();
         var passowrd = $("#updatePassword").val();
         var email = $("#updateEmail").val();
         var FN = $("#updateFirstName").val();
         var LN = $("#updateLastName").val();
         var EN = $("#updateEmployNumber").val();
         var PN = $("#updatePhoneNumber").val();
         var MX = $("#updateMaxcount").val();
//          var DT = $("#Box1").val();
         
         var aa = $('#Box1 input');
 		var arr = $.makeArray(aa);
         
         
         if (!account || account == '' ) {
             toastr.error("請輸入帳號");
             return false;
         }

         if (!name || name == '') {
             toastr.error("請輸入姓名");
             return false;
         }
         
         if (name !='' && isValidNumber(name)) {
             toastr.error("姓名請輸入中文或英文");
             return false;
         }
         
         if (!FN || FN == '') {
             toastr.error("請輸入姓氏");
             return false;
         }
         
         if (FN !='' && isValidNumber(FN)) {
             toastr.error("姓氏請輸入中文或英文");
             return false;
         }
         if (!LN || LN == '') {
             toastr.error("請輸入名字");
             return false;
         }
         
         if (LN !='' && isValidNumber(LN)) {
             toastr.error("名字請輸入中文或英文");
             return false;
         }
         if (!EN || EN == '') {
             toastr.error("請輸入員工編號");
             return false;
         }
         
         if (EN !='' && !isValidNumber(EN)) {
             toastr.error("員工編號請輸入數字");
             return false;
         }
         if (!PN || PN == '') {
             toastr.error("請輸入分機號碼");
             return false;
         }
         
         if (PN !='' && !isValidNumber(PN)) {
             toastr.error("分機號碼請輸入數字");
             return false;
         }
         if (!PN || MX == '') {
             toastr.error("請輸入接通數");
             return false;
         }
         
         if (MX !='' && !isValidNumber(MX)) {
             toastr.error("接通數請輸入數字");
             return false;
         }

         if (!passowrd || passowrd == '') {
             toastr.error("請輸入密碼");
             return false;
         }
         if (!email || email == '') {
             toastr.error("請輸入Email");
             return false;
         }

         if (email !='' && !isValidEmail(email)) {
             toastr.error("請輸入正確的Email格式");
             return false;
         }
//          if(arr.length==0){
//   			toastr.error("請選擇部門");
//   			 return false;
//   		}

         return true;
     }
	//更新部門對話視窗
	 function addGroupButton() {
	 	$("#addGroupButton").trigger("click");

	 }
	// 解鎖對話視窗
	function unlockAccount() {
		$("#unlockButton").trigger("click");
	}

	// 停用對話視窗
	function confirmBan() {
		$("#confirmBanButton").trigger("click");
	}
	function personTrashBun() {
		$("#personTrashBun").trigger("click");
	}
	function person_ok() {
		$("#person_okBun").trigger("click");
	}

	/*show toastStr*/
	toastr.options = {
		"closeButton" : false,
		"debug" : false,
		"progressBar" : true,
		"positionClass" : "toast-top-right",
		"onclick" : null,
		"showDuration" : "2000",
		"timeOut" : "2000",
		"showEasing" : "swing",
		"hideEasing" : "linear",
		"showMethod" : "fadeIn",
		"hideMethod" : "fadeOut"
	}

	
	
	function showToastSuccess(message) {
		var selected2=[];
	    $("[name=personL]:radio:checked").each(function(){
	      selected2.push($(this).val());
	      });
		var state = selected2.join();
		
		var selected=[];
	    $("[name=person0]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
	    $("[name=person1]:checkbox:checked").each(function(){
		      selected.push($(this).val());
		      });
	    
        var personDBID_list = selected.join();
        
        
        if(personDBID_list.length!=0){
		$
	 			.ajax({
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Person_logicdelete",
					data : {
						state : state,
						personDBID_list : personDBID_list
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
					
						toastr.error("鎖定失敗");
					},
					success : function(data) {
						person();
						toastr.success(message);
					}

				});
    		}else{
    			toastr.error("請選擇啟用/鎖定的項目");
    		}
	}

	function showToastError(message) {
// 		var state = document.getElementById('state_list').value;
		
		var selected=[];
	    $("[name=person0]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
	    $("[name=person1]:checkbox:checked").each(function(){
		      selected.push($(this).val());
		      });
	    
        var personDBID_list = selected.join();
        if(personDBID_list.length!=0){
        	
		$
				.ajax({
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Person_logicdelete",
					data : {

						state : 1,
						personDBID_list:personDBID_list

					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						toastr.error("停用失敗");
					},
					success : function(data) {
						person();
						toastr.success(message);
					}

				});
        }else{
        	toastr.error("請選擇停用的項目");
        }
	}
	

	function person_ok22(message) {
		var selected=[];
	    $("[name=person0]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
	    $("[name=person1]:checkbox:checked").each(function(){
		      selected.push($(this).val());
		      });
	    
		var dbid = selected.join();
		 if(dbid.length!=0){
			 
		 
		$
				.ajax({
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Person_logicdelete",
					data : {
						state : 0,
						personDBID_list : dbid

					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						toastr.error("啟用錯誤");

					},
					success : function(data) {
						person();
						toastr.success(message);
					}

				});
		 }else{
			 toastr.error('請勾選要啟用的項目');
		 }
	}
	
	
	function personTrash(message) {
		var selected=[];
	    $("[name=person0]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
	    $("[name=person1]:checkbox:checked").each(function(){
		      selected.push($(this).val());
		      });
		var dbid = selected.join();
		
		if(dbid.length!=0){
					$
				.ajax({
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Person_logicdelete",
					data : {
						
						personDBID_list : dbid,
						state:3

					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						toastr.error("失敗");
					},
					success : function(data) {
						person();
						toastr.success(message);
					}

				});
		}else{
			toastr.error("請選擇要刪除的欄位");
		}
	}

	/* 表格全選控制 */
	$("#manageCheck").on(
			"change",
			function() {
				if ($("#manageCheck").prop("ischecked") == false) {
					$("#manageCheck").prop("ischecked", true);
					$("#manageTable tbody tr td:first-child input").prop(
							"checked", false);
				} else {
					$("#manageCheck").prop("ischecked", false);
					$("#manageTable tbody tr td:first-child input").prop(
							"checked", true);
				}
			});

	$("#banCheck").on(
			"change",
			function() {
				if ($("#banCheck").prop("ischecked") == false) {
					$("#banCheck").prop("ischecked", true);
					$("#banTable tbody tr td:first-child input").prop(
							"checked", false);
				} else {
					$("#banCheck").prop("ischecked", false);
					$("#banTable tbody tr td:first-child input").prop(
							"checked", true);
				}
			});
	
	function addGroup() {
		var NotHaveGroup=[];
	    $("[name=NotHaveGroupTitle]:checkbox:checked").each(function(){
	    	NotHaveGroup.push($(this).val());
	      });
	 
		var NotHaveGroupList = NotHaveGroup.join();
		var List = NotHaveGroupList.split(',');
		
		for (var i in List ) {
				var arrDbid = document.getElementById("1NotHaveGroup"+List[i]).value;
				var arrName = document.getElementById("2NotHaveGroup"+List[i]).value;
	
				var HaveGroup = "<tr id='removeHaveGroup"+arrDbid+"'><td><input type='checkbox' name='HaveGroupTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><input type='hidden' id='1HaveGroup"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2HaveGroup"+arrDbid+"' value='"+arrName+"'></tr>"

				document.getElementById("HaveGroup").insertAdjacentHTML("BeforeEnd",HaveGroup);	
				$('#removeGroup'+List[i]).remove();
			}
	}
	
	function backGroup() {
		var HaveGroup=[];
	    $("[name=HaveGroupTitle]:checkbox:checked").each(function(){
	    	HaveGroup.push($(this).val());
	      });
	 
		var HaveGroupList = HaveGroup.join();
		var List = HaveGroupList.split(',');
		
		for (var i in List ) {
				var arrDbid = document.getElementById("1HaveGroup"+List[i]).value;
				var arrName = document.getElementById("2HaveGroup"+List[i]).value;
				
				var NotHaveGroup = "<tr id='removeGroup"+arrDbid+"'><td><input type='checkbox' name='NotHaveGroupTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><input type='hidden' id='1NotHaveGroup"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2NotHaveGroup"+arrDbid+"' value='"+arrName+"'></tr>"

				document.getElementById("NotHaveGroup").insertAdjacentHTML("BeforeEnd",NotHaveGroup);	
				$('#removeHaveGroup'+List[i]).remove();
			}
	}
	
	
</script>
</html>


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
	<div class="widget">
		<div class="col-lg-2 col-sm-3">
			<div class="panel panel-success" style="height: 780px;">
				<div class="panel-heading">
					<h3>
						<i class="fa fa-angle-double-right"></i> 設定
					</h3>
				</div>
				<div class="panel-body">
					<div class="ibox">
						<div class="fa-tree-list">
							<ul style="list-style-type: none; margin-left: 0px;">
								<li><span> <i class="fa fa-fw fa-folder-open"></i>
										使用者管理
								</span>
									<ul style="list-style-type: none; margin-left: 20px;">
										<li onclick=""><i class="fa fa-fw fa-file-text-o"></i><a
											onclick="showPerson()">人員管理</a></li>
										<li onclick=""><i class="fa fa-fw fa-file-text-o"></i><a
											onclick="showGroup()">部門權限管理</a></li>
										<li onclick=""><i class="fa fa-fw fa-file-text-o"></i><a
											onclick="showAgentreason()">值機狀態管理</a></li>
									</ul></li>
								<!--                                     <li class="active"> -->
								<!--                                         <span> -->
								<!--                                             <i class="fa fa-fw fa-folder-open"></i> -->
								<!--                                             管道管理 -->
								<!--                                         </span> -->
								<!--                                         <ul style="list-style-type:none;margin-left:20px;"> -->
								<!--                                             <li><i class="fa fa-fw fa-file-text-o"></i>分派小組管理</li> -->
								<!--                                             <li><i class="fa fa-fw fa-file-text-o"></i>Chat管道設定</li> -->
								<!--                                         </ul> -->
								<!--                                     </li> -->
								<li><span> <i class="fa fa-fw fa-folder-open"></i>
										案件管理
								</span>

									<ul style="list-style-type: none; margin-left: 20px;">
										<li><i class="fa fa-fw fa-file-text-o"></i><a
											onclick="showCommonlink()">常用連結管理</a></li>
										<li><i class="fa fa-fw fa-file-text-o"></i><a
											onclick="showActivityMenu()">服務代碼分類管理</a></li>
										<li><i class="fa fa-fw fa-file-text-o"></i><a
											onclick="showActivityGroup()">服務代碼群組管理</a></li>
										<li><i class="fa fa-fw fa-file-text-o"></i><a
											onclick="showActivityData()">服務代碼管理</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-10 col-sm-9" id="person">
			<div class="panel panel-success" style="height: 780px;">
				<!-- 人員管理切換頁籤Start -->
				<div id="hrTabControlButton" style="margin: 1px 0px 0px 1px;">
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
						<div>
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

							<ul class="pagination" style="float: right;">
								<li><input type="text" id="person0Search" placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox">
							<div class="col-lg-12 col-md-12" type="">
							<form id="person0_form">
								<table class="table table-bordered table-hover"
									id="person0Table">
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
						<div>
							<ul class="pagination">
<!-- 								<li onclick="showAddMember()"><a href="#"><i -->
<!-- 										class="fa fa-fw fa-plus"></i></a></li> -->
<!-- 								<li onclick="confirmBan()"><a href="#"><i -->
<!-- 										class="fa fa-fw fa-unlock-alt"></i></a></li>		 -->
<!-- 								<li onclick="unlockAccount()"><a href="#"><i -->
<!-- 										class="fa fa-fw fa-ban"></i></a></li> -->
								
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
							<div class="col-lg-12 col-md-12">
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
									<ul id="Box22"> 
									</ul>	
								</div>
				</div>		

					<div style="clear:both;"></div>



							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary" onclick="sendAddMember()">儲存</button>
									<button class="btn btn-default" onclick="closeAddMember()">取消</button>
								</div>
							</div>
						</div>
						
<script type="text/javascript">
function AllowDrop(event){
    event.preventDefault();
}
function Drag(event){
    event.dataTransfer.setData("text",event.currentTarget.id);
}
function Drop(event){
    event.preventDefault();
    var data=event.dataTransfer.getData("text");
    event.currentTarget.appendChild(document.getElementById(data));
}
</script>
				

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
					<label for="inputEmail" class="col-sm-5 control-label">人員所屬部門</label>
						<div id="Box1" ondrop="Drop(event)" ondragover="AllowDrop(event)" style="overflow: auto; width: 100%; height: 100px; border: 1px silver solid">
							
							</div>
						<div style="clear:both;"></div>
				</div>
				<div class="form-group col-sm-6"> 
					<label for="inputEmail" class="col-sm-5 control-label">部門列表</label> 
							<div id="Box4" ondrop="Drop(event)" ondragover="AllowDrop(event)" style="overflow: auto; width: 100%; height: 100px; border: 1px silver solid">
								</div>
					</div>		
							
<!-- 							<div class="form-group col-sm-6"> -->
<!-- 								<label for="inputDepartment" class="col-sm-2 control-label">部門</label>		 -->
<!-- 								<div class="col-sm-6"> -->
<!-- 									<select class="form-control" id="updateDepartment"> -->
									
<!-- 									</select>				 -->
<!-- 								</div> -->
								
<!-- 							</div> -->

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
		</div>

		<!-- ========================================================================================== -->
		<!-- 部門開始 -->
		<div class="col-lg-10 col-sm-9" id="groupContent"
			style="display: none;">
			<div class="panel panel-success" style="height: 780px;">
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
						<div>
							<ul class="pagination">
								<li onclick="showAddMembergroup()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
<!-- 								<li onclick="unlockAccountgroup()"><a href="#"><i -->
<!-- 										class="fa fa-fw fa-unlock-alt"></i></a></li> -->
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
							
							
				<div class="form-group col-sm-6">
					<label for="inputEmail" class="col-sm-5 control-label">人員所屬部門</label>
						<div id="Box5" ondrop="Drop(event)" ondragover="AllowDrop(event)" style="overflow: auto; width: 100%; height: 100px; border: 1px silver solid">
						
							</div>
						<div style="clear:both;"></div>
				</div>

				<div class="form-group col-sm-6"> 
					<label for="inputEmail" class="col-sm-5 control-label">部門列表</label> 
							<div id="Box6" ondrop="Drop(event)" ondragover="AllowDrop(event)" style="overflow: auto; width: 100%; height: 100px; border: 1px silver solid">
									<ul id="Box66"> 
									</ul>	
								</div>
				</div>		

					<div style="clear:both;"></div>
							
							
							

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
						

							<div class="form-group col-sm-6">
								<label for="inputDepartment" class="col-sm-3 control-label">部門名稱:</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="up_name"
										placeholder="">
								</div>
							</div>
						
							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary" onclick="sendEditMembergroup()">更新</button>
									<button class="btn btn-default"
										onclick="closeEditMembergroup()">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 更新END -->

				</div>
				<!-- 設定頁面內容頁 End-->
			</div>
		</div>
		<!-- GROUP 結束 -->
		<!-- ========================================================================================== -->
		<!-- AgentReason 開始 -->
		<div class="col-lg-10 col-sm-9" id="AgentreasonContent"
			style="display: none;">
			<div class="panel panel-success" style="height: 780px;">
				<!-- 值機管理切換頁籤Start -->
				<div id="hrTabControlButton" style="margin: 1px 0px 0px 1px;">
					<button class="btn-sm btn-primary manage"
						onclick="showManage_Agentreason()">
						<i class="fa fa-fw fa-user"></i>值機管理
					</button>
<!-- 					<button class="btn-sm btn-success ban" -->
<!-- 						onclick="showBan_Agentreason()"> -->
<!-- 						<i class="fa fa-fw fa-user"></i>停用列表 -->
<!-- 					</button> -->
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
						<div>
							<ul class="pagination">
								<li onclick="showAddMemberAGR()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
<!-- 								<li onclick="unlockAccountAgentreason()"><a href="#"><i -->
<!-- 										class="fa fa-fw fa-unlock-alt"></i></a></li> -->
<!-- 								<li onclick="confirmBanAgentreason()"><a href="#"><i -->
<!-- 										class="fa fa-fw fa-ban"></i></a></li> -->
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
							
							<form><input type="text" id="color" name="color" value="#123456" /></form>

							<div id="colorpicker"></div>
							
							<script type="text/javascript">

  							$(document).ready(function() {

    						$('#colorpicker').farbtastic('#color');

  							});

							</script>
							
							
							
							
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
				<!-- 設定頁面內容頁 End-->
			</div>
		</div>
		<!-- AgentReason 結束 -->
		<!-- ========================================================================================== -->

		<!-- Commlink開始 -->
		<div class="col-lg-10 col-sm-9" id="CommonlinkContent"
			style="display: none;">
			<div class="panel panel-success" style="height: 780px;">
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
						<div>
							<ul class="pagination">
								<li onclick="showAddMembercomm()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
<!-- 								<li onclick="unlockAccountcomm()"><a href="#"><i -->
<!-- 										class="fa fa-fw fa-unlock-alt"></i></a></li> -->
								<li onclick="confirmBancomm()"><a href="#"><i
										class="glyphicon glyphicon-trash"></i></a></li>
							</ul>
							
							
						</div>

						<div class="row ibox">
							<div class="col-lg-3 col-md-3">
								<div id="tree"></div>
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
						<div class="form-group col-sm-6">
							<label for="inputAccount" class="col-sm-3 control-label">常用連結名稱:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="nodeNAME"
									placeholder="">
							</div>
						</div>
						<div class="form-group col-sm-6">
							<label for="inputName" class="col-sm-3 control-label">連結URL:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="nodeURL"
									placeholder="">
							</div>
						</div>

						<div class="form-group col-sm-6">
							<label for="inputLastName" class="col-sm-3 control-label">建立者名稱:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="nodeUSER"
									placeholder="">
							</div>
						</div>
						<div class="form-group col-sm-6">
							<label for="inputFirstName" class="col-sm-3 control-label">上層節點:</label>
							<div class="col-sm-8">
								<select id="nodeLINKlist">
								</select><br>
							</div>
						</div>
						<div class="form-group col-sm-6">
							<label for="inputEmployNumber" class="col-sm-3 control-label">顏色:</label>
							<div class="col-sm-8">
								<select id="insert_color">
								</select>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-9 col-sm-3">
								<button class="btn btn-primary" onclick="sendAddMembercomm()">儲存</button>
								<button class="btn btn-default" onclick="closeAddMembercomm()">取消</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 新增 END -->
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
						<div class="form-group col-sm-6">
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
							<label for="inputFirstName" class="col-sm-3 control-label">上層節點:</label>
							<div class="col-sm-8">
								<select id="nodeLINKlistU">
								</select><br>
							</div>
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
			</div>
		</div>
		<!-- Commlink  END -->
		<!-- ============================================================================================== -->
		<!-- ActivityMenu -->

		<div class="col-lg-10 col-sm-9" id="AMContent" style="display: none;">
			<div class="panel panel-success" style="height: 780px;">
				<!-- 服務代碼分類管理切換頁籤Start -->
				<div id="hrTabControlButton" style="margin: 1px 0px 0px 1px;">
					<button class="btn-sm btn-primary manage" onclick="showManage_AM()">
						<i class="fa fa-fw fa-user"></i>分類管理
					</button>
<!-- 					<button class="btn-sm btn-success ban" onclick="showBan_AM()"> -->
<!-- 						<i class="fa fa-fw fa-user"></i>停用列表 -->
<!-- 					</button> -->
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
						<div>
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
							<div class="col-lg-12 col-md-12" id="AM0">
								<table class="table table-bordered table-hover"
									id="manageTableAM">
								<thead>
										<tr>
											<th class="no-sort"><input type="checkbox"
												id="AM0All" ischecked=false></th>
											<th style="display: none;">編號</th>
											<th>清單名稱</th>
											<th>建立時間</th>
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

							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">sort:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="insert_sort"
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
<!-- 								<label for="inputAccount" -->
<!-- 									class="col-sm-2 control-label required">編號:</label> -->
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
			</div>
		</div>
		<!-- ActivityMenu 結束 -->
		<!-- ============================================================================================== -->
		<!-- ActivityGroup  -->

		<div class="col-lg-10 col-sm-9" id="AGContent" style="display: none;">
			<div class="panel panel-success" style="height: 780px;">
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
						<div>
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
							<div class="col-lg-12 col-md-12" id="AG0">
								<table class="table table-bordered table-hover"
									id="manageTableAG">
									<thead>
										<tr>
											<th class="no-sort"><input type="checkbox"
												id="AG0All" ischecked=false></th>
											<th style="display: none;">編號</th>
											<th>群組名稱</th>
											<th>建立時間</th>
											<th>排序</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
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
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">sort:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="in_sort"
										placeholder="">
								</div>
							</div>
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
			</div>
		</div>
		<!-- ActivityGroup 結束 -->

		<!-- ActivityData 開始 -->
		<div class="col-lg-10 col-sm-9" id="ADContent" style="display: none;">
			<div class="panel panel-success" style="height: 780px;">
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
						<div>
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
							<div class="col-lg-12 col-md-12" id="AD0">
								<table class="table table-bordered table-hover"
									id="manageTableAD">
									<thead>
										<tr>
											<th class="no-sort"><input type="checkbox"
												id="AD0All" ischecked=false></th>
											<th style="display: none;">編號</th>
											
											<th>名稱</th>
											<th>顏色</th>
<!-- 											<th>狀態</th> -->
											<th>titlegroup</th>
											<th>titleflag</th>
											<th>建立時間</th>
											<th>排序</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>

					<div id="banADContent" style="display: none;">
						<div>
							<ul class="pagination">
						
								<li onclick="AD_ok22()"><a href="#"><i
										class="glyphicon glyphicon-ok"></i></a></li>
							</ul>
							<ul class="pagination" style="float: right;">
								<li><input type="text" id="banTableADSearch"
									placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox" id=AD11>
							<div class="col-lg-12 col-md-12" id="AD1">
								<table class="table table-bordered table-hover" id="banTableAD">
									<thead>
										<tr>
											<th class="no-sort"><input type="checkbox"
												id="AD1All" ischecked=false></th>
											<th style="display: none;">編號</th>
											
											<th>名稱</th>
											<th>顏色</th>
<!-- 											<th>狀態</th> -->
											<th>titlegroup</th>
											<th>titleflag</th>
											<th>停用時間</th>
											<th>排序</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
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
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">titleflag:</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" id=in_titleflag
											placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">titlegroup:</label>
								<div class="col-sm-8">
									<select id="titleflagD">
									<option></option>
									</select>
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">sort:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="in_sort"
										placeholder="">
								</div>
							</div>
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
			</div>
		</div>
		<!-- ActivityData 結束 -->







	</div>
</body>

<!-- 彈跳對話視窗-->
<!-- Modal -->
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#confirmBan" style="display: none;" id="confirmBanButton">banDialog</button>

<!-- 鎖定符號BUTTON -->
<div id="confirmBan" class="modal fade" role="dialog" >
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否確定啟用/鎖定帳號？</h3>
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
				<h3>是否刪除帳號？</h3>
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



<!-- ========================================================================================================= -->
<!-- GROUP 開始-->

<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#confirmBangroup" style="display: none;"
	id="confirmBanButtongroup">banDialog</button>

<!-- 垃圾桶符號BUTTON -->
<div id="confirmBangroup" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否確定刪除帳號？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
<!-- 					<label for="inputDepartment" class="col-sm-5 control-label">編號:<span id="deletegroup"></span></label> -->
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

<!-- 鎖符號BUTTON -->
<!-- Trigger the modal with a button -->
<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" -->
<!-- 	data-target="#unlockModalgroup" style="display: none;" -->
<!-- 	id="unlockButtongroup">unlockDialog</button> -->
<!-- <div id="unlockModalgroup" class="modal fade" role="dialog"> -->
<!-- 	<div class="modal-dialog"> -->

<!-- 		<!-- Modal content--> 
<!-- 		<div class="modal-content"> -->
<!-- 			<div class="modal-body"> -->
<!-- 				<h3>是否解除/鎖定帳號？</h3> -->
<!-- 			</div> -->
<!-- 			<div class="modal-footer"> -->
<!-- 				<div class="form-group col-sm-6"> -->
<!-- 					<label for="inputDepartment" class="col-sm-3 control-label">帳號:</label> -->
<!-- 					<div class="col-sm-6"> -->
<!-- 						<input type="text" class="form-control" -->
<!-- 							id="state_account_Groupluck" placeholder=""> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="form-group col-sm-6"> -->
<!-- 					<label for="inputDepartment" class="col-sm-3 control-label">開關:</label> -->
<!-- 					<div class="col-sm-6"> -->
<!-- 						<select id="state_list_Groupluck"> -->
<!-- 							<option value="0">開啟</option> -->
<!-- 							<option value="1">鎖定</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<button type="button" class="btn btn-success" data-dismiss="modal" -->
<!-- 					onclick="GroupLuck('鎖定/解鎖')">確定</button> -->
<!-- 				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- 鎖符號BUTTON END -->
<!-- GROUP 結束-->

<!-- ====================================================================================================-->
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

<!-- ================================================================================== -->
<!-- Commonlink 開始-->
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#confirmBancomm" style="display: none;"
	id="confirmBanButtoncomm">banDialog</button>

<!-- 禁止符號BUTTON -->
<div id="confirmBancomm" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否確定刪除？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
					<h2>ps.相關聯子節點全數刪除</h2>
					<h3 id="delete_name">名稱:</h3>
					<h3 id="delete_number">編號:</h3>
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
<!-- ================================================================================== -->
<!-- ActivityMENU -->
<!-- 鎖符號BUTTON -->
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#unlockModalAM" style="display: none;" id="unlockButtonAM">unlockDialog</button>
<div id="unlockModalAM" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否停用？</h3>
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


<!-- AM_OK -->

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
<!-- AM_OK END -->
<!-- ActivityMENU END -->

<!-- ================================================================================== -->
<!-- ActivityGroup -->
<!-- 鎖符號BUTTON -->
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#unlockModalAG" style="display: none;" id="unlockButtonAG">unlockDialog</button>
<div id="unlockModalAG" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否停用？</h3>
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
<!-- ================================================================================== -->
<!-- ActivityData -->
<!-- 鎖符號BUTTON -->
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#unlockModalAD" style="display: none;" id="unlockButtonAD">unlockDialog</button>
<div id="unlockModalAD" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否停用？</h3>
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
<!-- Trigger the modal with a button -->
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

function person_groupmenu(){
	$("#updateDepartment").empty();
	$("#inputDepartment").empty();
	$("#Box3").empty();
// 	$("#Box1").empty();
	$("#Box4").empty();
$.ajax({
	url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Query_Group_STATE",
	data : {
		state : 0
	},
	type : "POST",
	dataType : 'json',

	error : function(e) {
		toastr.error("請重新整理");

	},
	success : function(data) {
		
		for(var i=0; i<data.group.length; i++){
	        var menu = "<li id='Imgperson"+data.group[i].dbid+"'  draggable='true' ondragstart='Drag(event)'  style='margin-top:5px;padding:5px 15px; background:#d65c5c;color:white; border:0 none; width: 100%; cursor:pointer;-webkit-border-radius: 5px;border-radius: 5px;'><input  type='hidden'  value="+data.group[i].dbid+" ><p>"+data.group[i].name+"</p></li>"
	        document.getElementById("Box22").insertAdjacentHTML("BeforeEnd",menu);
	        
// 	        var menu2 = "<li id='Imgperson"+data.group[i].dbid+"'  draggable='true' ondragstart='Drag(event)'  style='margin-top:5px;padding:5px 15px; background:#1c84c6;color:white; border:0 none; width: 100%; cursor:pointer;-webkit-border-radius: 5px;border-radius: 5px;'><input  type='hidden'  value="+data.group[i].dbid+" ><p>"+data.group[i].name+"</p></li>"
// 	        document.getElementById("Box4").insertAdjacentHTML("BeforeEnd",menu2);
	      
	        	 }
	}
});
}
	function person() {
		person_groupmenu();
		
		$("#person1All").prop("checked", false);
		$("#person0All").prop("checked", false);
		
		$("#person0Table tbody tr").empty();
		$("#person1Table tboby tr").empty();
		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Query_Person_STATE",
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

						//    		        	alert(JSON.stringify(data.person));
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
						aa();
						var table = $('#person0Table').DataTable();

						$('#person0Table tbody')
								.on(
										'click',
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
// 											document
// 													.getElementById('person1').innerHTML = table
// 													.row(this).data().account;
											document
													.getElementById('deletedbid').value = table
													.row(this).data().dbid;
// 											document
// 													.getElementById('person2').innerHTML = table
// 													.row(this).data().account;
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
											.getElementById('ggg').value = table
											.row(this).data().groupname;
											
											var aa = $('#ggg');
											

											var arr = table.row(this).data().groupname.split(',');
											var arrdbid = table.row(this).data().groupdbid.split(',');
											
											for (var i in arrdbid ) {
												if(arrdbid[i].trim()!="" && arr[i].trim()!="" ){
// 													alert("arr " +arr[i]);
// 													alert("arrdbid " +arrdbid[i]);
													
													var menu3 = "<li id='Imgperson3"+arrdbid[i]+"'  draggable='true' ondragstart='Drag(event)'  style='margin-top:5px;padding:5px 15px; background:#d65c5c;color:white; border:0 none; width: 100%; cursor:pointer;-webkit-border-radius: 5px;border-radius: 5px;'><input  type='hidden'  value="+arrdbid[i]+" ><p>"+arr[i]+"</p></li>"
											        document.getElementById("Box1").insertAdjacentHTML("BeforeEnd",menu3);	
												}
											}
											
											
											var notarr = table.row(this).data().notgroupname.split(',');
											var notarrdbid = table.row(this).data().notgroupdbid.split(',');
											for (var i in notarrdbid ) {
												if(notarrdbid[i].trim()!="" && notarr[i].trim()!="" ){

													var menu4 = "<li id='Imgperson2"+notarrdbid[i]+"'  draggable='true' ondragstart='Drag(event)'  style='margin-top:5px;padding:5px 15px; background:#d65c5c;color:white; border:0 none; width: 100%; cursor:pointer;-webkit-border-radius: 5px;border-radius: 5px;'><input  type='hidden'  value="+notarrdbid[i]+" ><p>"+notarr[i]+"</p></li>"
											        document.getElementById("Box4").insertAdjacentHTML("BeforeEnd",menu4);	
												}
											}
											
											
										});
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
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Query_Person_STATE",
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

						//    		        	alert(JSON.stringify(data.person));
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
// 												        	 alert(JSON.stringify(full));
												             return '<input type="checkbox" name="person1" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
												         }
												      }],
											lengthChange : false
										});
						aa();
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
// 											document
// 													.getElementById('person1').innerHTML = table
// 													.row(this).data().account;
											document
													.getElementById('deletedbid').value = table
													.row(this).data().dbid;
// 											document
// 													.getElementById('person2').innerHTML = table
// 													.row(this).data().account;
											document
													.getElementById('state_account').value = table
													.row(this).data().dbid;
											document
													.getElementById('personTrashdbid').value = table
													.row(this).data().dbid;
// 											document
// 													.getElementById('person3').innerHTML = table
// 													.row(this).data().account;
											document
											.getElementById('updateMaxcount').value = table
											.row(this).data().max_count;
											
										});
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

	$(document).ready(function() {

		person();

	});
	function aa() {
		$("#person0Table tbody tr td,#person1Table tbody tr td").on("click",
				function() {
					var text = $(this).text();

					if (text && text != "") {
						showEditMember();
					}
				});
		
		
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

	function showEditMember() {
		$("#Box4").empty();
		$("#Box1").empty();
		person_groupmenu();

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
		var in_employee_id = document.getElementById('inputEmployNumber').value;
		var in_group_dbid = hh;
		var in_account = document.getElementById('inputAccount').value;
		var in_dn = document.getElementById('inputPhoneNumber').value;
		var in_maxcount = document.getElementById('inputMaxcount').value;

		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Insert_PersonInfo",
					data : {
						first_name : in_first_name,
						last_name : in_last_name,
						user_name : in_user_name,
						emailaddress : in_emailaddress,
						password : in_password,
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
		
		var aa = $('#Box1 input');
		var arr = $.makeArray(aa);
		
		for(var i=0;i<arr.length;i++){
		var hh = arr[i].value;
		
		var up_first_name = $('#updateFirstName').val();
		var up_last_name = $('#updateLastName').val();
		var up_user_name = $('#updateName').val();
		var up_emailaddress = $('#updateEmail').val();
		var up_password = $('#updatePassword').val();
		var up_employee_id = $('#updateEmployNumber').val();
		var up_group_dbid = hh;
		var up_account = $('#updateAccount').val();
// 		var up_state = $('#updateState').val();
		var up_dn = $('#updatePhoneNumber').val();
		var up_updateMaxcount = $('#updateMaxcount').val();
		 
		$
			.ajax({
			url : '${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Update_PersonInfo',
			data : {
				max_count :up_updateMaxcount,
				first_name : up_first_name,
				last_name : up_last_name,
				user_name : up_user_name,
				emailaddress : up_emailaddress,
				password : up_password,
				employee_id : up_employee_id,
				group_dbid : up_group_dbid,
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
         var DT = $("#updateDepartment").val();
         
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
         if (!DT || DT == '') {
             toastr.error("請選擇部門");
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

         return true;
     }
	
	
	
	function closeAllHrContent() {

		$("#person").hide();
		$("#manageContent").hide();
		$("#banContent").hide();

		$("#groupContent").hide();
		$("#managegroupContent").hide();
		$("#bangroupContent").hide();
		$("#addMembergroupContent").hide();
		$("#editMembergroupContent").hide();

		$("#AgentreasonContent").hide();
		$("#manageAgentreasonContent").hide();
		$("#banAgentreasonContent").hide();
		$("#addMemberAGRContent").hide();
		$("#editMemberAGRContent").hide();

		$("#CommonlinkContent").hide();
		$("#0Commonlink").hide();
		$("#comm").hide();
		$("#commTB").hide();
		$("#addMemberContentcomm").hide();
		$("#editMemberContentcomm").hide();

		$("#AMContent").hide();
		$("#manageAMContent").hide();
		$("#banAMContent").hide();
		$("#addMemberAMContent").hide();
		$("#editMemberAMContent").hide();

		$("#AGContent").hide();
		$("#manageAGContent").hide();
		$("#banAGContent").hide();
		$("#addMemberAGContent").hide();
		$("#editMemberAGContent").hide();

		$("#ADContent").hide();
		$("#manageADContent").hide();
		$("#banADContent").hide();
		$("#addMemberADContent").hide();
		$("#editMemberADContent").hide();

		$("#addMemberContent").hide();
		$("#editMemberContent").hide();

		$("#hrTabControlButton button").removeClass("btn-primary");
		$("#hrTabControlButton button").addClass("btn-success");
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
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Person_logicdelete",
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
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Person_logicdelete",
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
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Person_logicdelete",
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
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Delete_PersonInfo",
					data : {
						
						personDBID_list : dbid

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
</script>

<script>
	function showPerson() {
		$("button.editMember").hide();

		closeAllHrContent();
		$("#person").show();
		$("#manageContent").show();

		$("button.group").removeClass("btn-success");
		$("button.group").addClass("btn-primary");

		person();
	}
</script>
<!-- =======================================Person=END============================================================================ -->


<!-- =======================================Group============================================================================== -->

<script>
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
		
		$
		.ajax({
			url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Query_Person_STATE",
			data : {
				dbid : 0
			},
			type : "POST",
			dataType : 'json',

			error : function(e) {
				toastr.error("請重新整理");
			},
			success : function(data) {
				console.log("查詢人員", data);
	
		
		for(var i=0; i<data.person.length; i++){
	        var gp = "<li id='Imgperson"+data.person[i].dbid+"'draggable='true' ondragstart='Drag(event)'  style='margin-top:5px;padding:5px 15px; background:#d65c5c;color:white; border:0 none; width: 100%; cursor:pointer;-webkit-border-radius: 5px;border-radius: 5px;'><input  type='hidden'  value="+data.person[i].dbid+" ><p>"+data.person[i].account+"</p></li>"
	        document.getElementById("Box66").insertAdjacentHTML("BeforeEnd",gp);
		}
// 	        var menu2 = "<li id='Imgperson"+data.group[i].dbid+"'  draggable='true' ondragstart='Drag(event)'  style='margin-top:5px;padding:5px 15px; background:#d65c5c;color:white; border:0 none; width: 100%; cursor:pointer;-webkit-border-radius: 5px;border-radius: 5px;'><input  type='hidden'  value="+data.group[i].dbid+" ><p>"+data.group[i].name+"</p></li>"
// 	        document.getElementById("Box44").insertAdjacentHTML("BeforeEnd",menu2);
				}
			}
	)};
	

	function select() {
		
		groupperson();
		$("#group0All").prop("checked", false);

		
		$("#managegroupTable tbody tr").empty();
		$("#bangroupTable tboby tr").empty();
		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Query_Group_STATE",
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

						//	        	alert(JSON.stringify(data.person));
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
										
					var table = $('#managegroupTable').DataTable();
										$('#managegroupTable tbody')
												.on(
														'click',
														'tr',
														function() {
															
								document
										.getElementById('deletedbid_GroupDelete').value = table
										.row(this).data().dbid;
// 								document
// 										.getElementById('deletegroup').innerHTML = table
// 										.row(this).data().name;
								document
										.getElementById('up_dbid').value = table
										.row(this).data().dbid;
								document
										.getElementById('up_name').value = table
										.row(this).data().name;
								
								document
										.getElementById('UPgroup').innerHTML = table
										.row(this).data().name;
								

							});
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

	function group2() {
		$("#managegroupTable tbody tr td,#bangroupTable tbody tr td").on(
				"click", function() {
					var text = $(this).text();
					if (text && text != "") {
						showEditMembergroup();
					}
				});
		
		
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
		document.getElementById('in_name').value=""
		
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

		var aa = $('#Box5 input');
		var arr = $.makeArray(aa);
		for(var i=0;i<arr.length;i++){
		var hh = arr[i].value;
		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Insert_GroupInfo",
					data : {
						state : 0,
						name : in_name,
						person_dbid:hh
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
		}
		
		closeAllHrContent();
		$("#groupContent").show();
		$("#managegroupContent").show();
	}

	function validateGroupN() {
        var IN = $("#in_name").val();
       
        if (!IN || IN == '' ) {
            toastr.error("請輸入部門名稱");
            return false;
        }
        if (IN !='' && isValidNumber(IN)) {
            toastr.error("名稱請輸入中文或英文");
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

	//更新頁面
	function showEditMembergroup() {
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
		   if (!validateGroupU()) {
               return;
           }

		closeEditMember();
		var up_dbid = document.getElementById('up_dbid').value;
		var up_name = document.getElementById('up_name').value;
		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Update_GroupInfo",
					data : {
						state : 0,
						name : up_name,
						dbid : up_dbid
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
       
        if (!IN || IN == '' ) {
            toastr.error("請輸入部門名稱");
            return false;
        }
        if (IN !='' && isValidNumber(IN)) {
            toastr.error("名稱請輸入中文或英文");
            return false;
        }
		   return true;
    }
	function isValidNumber(IN) {
		var re = /^[0-9]*$/;		
		return re.test(IN);
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
// 		var deletedbid = document.getElementById('deletedbid_GroupDelete').value;
		
		var selected=[];
	    $("[name=group0]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
		  var groupDBID_list = selected.join();
		  if(groupDBID_list.length!=0){
		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Delete_GroupInfo",
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

</script>

<script>
	function showCommonlink() {
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
		$('#nodeLINKlist').empty();
		$('#nodeLINKlistU').empty();
		$('#insert_color').empty();
		$('#update_color').empty();

		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/IMWebSocket/RESTful/Select_commonlink",

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

							"plugins" : [ "themes", "json_data", "ui" ],

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
									$('#commname')
											.text(data.node.original.text);
									$('#delete_name').text(
											"名稱: " + data.node.original.text);
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
									$('#delete_number').text(
											"編號:" + data.node.original.id);
									
									
									$('#type').text(data.node.original.parent);
									
									$('#pass').text(data.node.original.id);
									$('#children').text(data.node.children_d);
									
									
									
									$("#comm").hide();
									$("#commTB").show();
								});

						$('#tree').on(
								"select_node.jstree",
								function(e, data) {
									console.log("QQ", data.node);
									console.log("children_d.length",
											data.node.children_d.length);
									cot = data.node.parents.length;
									console.log("parents.length",
											data.node.parents.length);
									Upcot = data.node.children_d.length;
									console.log("id", data.node.id);
									console.log("text", data.node.text);
								
									document.getElementById('nodeNAMEu').value = data.node.text;
									document.getElementById('nodeURLu').value = data.node.a_attr.href;
									document.getElementById('nodeUSERu').value = data.node.original.createuser;

									

									if (cot <= 3) {
										insertornot = true;
										//		alert("Insert");
									}
									if (Upcot == 0) {
										Uinsertornot = true;
										//		alert("Update");
									}

								});
						var oo1 = "<option value="+0+">#</option>";
						var one = "<option  id='UPlist'></option>";
						var two = "<option  id='INlist'></option>";
						var color = "<option>black</option><option>blue</option><option>yellow</option><option>red</option>";
						document.getElementById("insert_color")
								.insertAdjacentHTML("BeforeEnd", color);
						document.getElementById("update_color")
								.insertAdjacentHTML("BeforeEnd", color);
						document.getElementById("nodeLINKlist")
								.insertAdjacentHTML("BeforeEnd", two);
						document.getElementById("nodeLINKlistU")
								.insertAdjacentHTML("BeforeEnd", one);
						for (var i = 0; i <= data.count - 1; i++) {

							var str = "<option value='"+data.Tree[i].id+"'>"
									+ data.Tree[i].text + "</option>";
							document.getElementById("nodeLINKlist")
									.insertAdjacentHTML("BeforeEnd", str);
							document.getElementById("nodeLINKlistU")
									.insertAdjacentHTML("BeforeEnd", str);

						}
						document.getElementById("nodeLINKlist")
								.insertAdjacentHTML("BeforeEnd", oo1);
						document.getElementById("nodeLINKlistU")
								.insertAdjacentHTML("BeforeEnd", oo1);
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
			var nodeLINK = document.getElementById('nodeLINKlist').value;
			var nodeNAME = document.getElementById('nodeNAME').value;
			var nodeURL = document.getElementById('nodeURL').value;
			var nodeUSER = document.getElementById('nodeUSER').value;
			var color = document.getElementById('insert_color').value;
			var myMap = new Map();

			$
					.ajax({
						url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Insert_commonlink",

						data : {
							"parnetid" : nodeLINK,
							"nodetext" : nodeNAME,
							"nodeurl" : nodeURL,
							"createuserid" : nodeUSER,
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
			var nodeUSER = document.getElementById('nodeUSER').value;
			var color = document.getElementById('insert_color').value;
			var myMap = new Map();

			$
					.ajax({
						url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Insert_commonlink",

						data : {
							"parnetid" : nodeLINK,
							"nodetext" : nodeNAME,
							"nodeurl" : nodeURL,
							"createuserid" : nodeUSER,
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
			alert("不可超過第三層");
		}


		closeAllHrContent();
		$("#CommonlinkContent").show();
		$("#0Commonlink").show();
	}

	function validateCmI() {
        var nodeNAME = $("#nodeNAME").val();
     
        if (!nodeNAME || nodeNAME == '' ) {
            toastr.error("請輸入名稱");
            return false;
        }
       
      
        return true;
    }
	
	
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
		   if (!validateCmU()) {
               return;
           }

		closeEditMember();
		var a = 0;
		if (Uinsertornot) {
			var nodeIDu = document.getElementById('pass').innerHTML;
			var nodeLINKu = document.getElementById('nodeLINKlistU').value;
			var nodeNAMEu = document.getElementById('nodeNAMEu').value;
			var nodeURLu = document.getElementById('nodeURLu').value;
			var nodeUSERu = document.getElementById('nodeUSERu').value;
			var color = document.getElementById('update_color').value;
			var myMap = new Map();

			$
					.ajax({
						url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Update_commonlink",

						data : {
							"parnetid" : nodeLINKu,
							"nodetext" : nodeNAMEu,
							"nodeurl" : nodeURLu,
							"createuserid" : nodeUSERu,
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
	//
	function deletefunctioncomm(message) {
		var a = 0;
		var nodeIDd = document.getElementById('pass').innerHTML;
		var children_list = document.getElementById('children').innerHTML;

		var myMap = new Map();

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Delete_commonlink",

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

<!-- =======================================Group=END============================================================================= -->


<!-- =======================================Agentreason============================================================================= -->

<script>
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
		
		$("#agentreason0All").prop("checked", false);
		$("#agentreason1All").prop("checked", false);
		
		
		$("#manageAgentreasonTable tbody tr").empty();
		$("#banAgentreasonTable tboby tr").empty();
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Select_agentreason",
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
// 													}, {
// 														"data" : "flag"
													 ],'columnDefs': [{
												         'targets': 0,
												         'searchable': false,
												         'orderable': false,
												         'className': 'dt-body-center',
												         'render': function (data, type, full, meta){
//													        	 alert(JSON.stringify(full));
												             return '<input type="checkbox" name="agentreason0" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
												         }}, 
// 												         {
// 													         'targets': 8,
// 													         'searchable': false,
// 													         'orderable': false,
// 													        'className': "  ",
// 													         'render': function (data, type, full, meta){
// 													        	 if(full.flag!=null&&full.flag!=""){
// 													        		 return '<label class="label label-danger">'+full.flag+'</label>';
// 													        	 }else{
// 													        		 return '<label>'+full.flag+'</label>';
// 													        	 }
// 													         }
// 												         }
													],
											lengthChange : false
										});
						agentreason2();
						
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
				
			
			});
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
		$(
				"#manageAgentreasonTable tbody tr td,#banAgentreasonTable tbody tr td")
				.on("click", function() {
					var text = $(this).text();
					if (text && text != "") {
						showEditMemberAgentreason();
					}
				});
		
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
// 	function showBan_Agentreason() {
// 		closeAllHrContent();

// 		$("#AgentreasonContent").show();
// 		$("#banAgentreasonContent").show();

// 		$("button.ban").removeClass("btn-success");
// 		$("button.ban").addClass("btn-primary");

// 	}
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
// 		var createuserid = document.getElementById('Insert_createuserid').value;

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Insert_agentreason",
					data : {
						flag : 0,
						alarmcolor : alarmcolor,
						alarmduration : alarmduration,
						description : description,
						statusname : statusname,
						statusname_cn : statusname_cn,
						statusname_en : statusname_en,
						statusname_tw : statusname_tw
// 						createuserid : createuserid
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
// 		var flag = document.getElementById('Update_flag').value;
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
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Update_agentreason",
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
// 	function confirmBanAgentreason() {
// 		$("#confirmBanButtonAGR").trigger("click");
// 	}
	//停用對話視窗
	function AgentReasonB() {
		$("#AgentReasonB").trigger("click");
	}
	
	function AgentReason_ok() {
		$("#AgentReasonOK").trigger("click");
	}

	function AgentreasonDelete(message) {
// 		var dbid = document.getElementById('D_id').value;
// 		var flag = document.getElementById('flag2').value;
		
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
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_agentreason",
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
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_agentreason",
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
		
// 		var dbid = document.getElementById('AgentReasondbid').value;
	if(Agentreason_DBID_list.length!=0){
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Delete_AgentReason",
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
// 		var dbid = document.getElementById('AgentReasondbid').value;
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_agentreason",
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

<script>
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
		
		$("#AM0All").prop("checked", false);
		
		$("#manageTableAM tbody tr").empty();
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Flag_ActivityMenu",
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

						//        	alert(JSON.stringify(data.person));
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
// 													{
// 														"data" : "dbid"
// 													},
													{
														"data" : "menuname"
													},{
														"data" : "createdatetime"
													},
// 													{
// 														"data" : "sort"
// 													},
													

											],'columnDefs': [{
										         'targets': 0,
										         'searchable': false,
										         'orderable': false,
										         'className': 'dt-body-center',
										         'render': function (data, type, full, meta){
//											        	 alert(JSON.stringify(full));
										             return '<input type="checkbox" name="AM0" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
										         }
										      },
										      {
											         'targets': 3,
											         'searchable': false,
											         'orderable': false,
											        'className': "  ",
											         'render': function (data, type, full, meta){
											        	
											        		 return '<label style="padding-left:5px" ondblclick="AM_up()" class="glyphicon glyphicon-triangle-top"></label><label style="padding-left:5px"  ondblclick="AM_dow()" class="glyphicon glyphicon-triangle-bottom"></label>';
											        
											         },
											
											      }],
											lengthChange : false
										});
						AM2();
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
											

					});
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
		$("#manageTableAM tbody tr td,#banTableAM tbody tr td").on("click",
				function() {
					var text = $(this).text();
					if (text && text != "") {
						showEditMemberAM();
					}
				});

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

	//
	//
	//顯示 啟用表格
	function showManage_AM() {
		closeAllHrContent();

		$("#AMContent").show();
		$("#manageAMContent").show();

		$("button.manageAM").removeClass("btn-success");
		$("button.manageAM").addClass("btn-primary");

	}
	//顯示 停用表格
// 	function showBan_AM() {
// 		closeAllHrContent();

// 		$("#AMContent").show();
// 		$("#banAMContent").show();

// 		$("button.ban").removeClass("btn-success");
// 		$("button.ban").addClass("btn-primary");

// 	}
	//
	//新增畫面
	function showAddMemberAM() {
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
		//var deleteflag = document.getElementById('insert_deleteflag').value;
		var sort = document.getElementById('insert_sort').value;
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Insert_ActivityMenu",
					data : {
						menuname : menuname,
						deleteflag : 0,
						sort : sort
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
// 		var sort = document.getElementById('up_sortam').value;

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Update_ActivityMenu",
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
// 		var deleteflag = document.getElementById('Delete_flagAM').value;
// 		var menuname = document.getElementById('Delete_idAM').value;

			  
			  var AMupdbid = document.getElementById('AMupdbid').value;
		
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/AMenu_Sort2",
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
	}
	function AM_dow() {
// 		var deleteflag = document.getElementById('Delete_flagAM').value;
// 		var menuname = document.getElementById('Delete_idAM').value;

			  
			  var AMdowdbid = document.getElementById('AMdowdbid').value;
			 
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/AMenu_Sort",
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
	}
	
	
	
	

	function AMLuck(message) {
// 		var deleteflag = document.getElementById('Delete_flagAM').value;
// 		var menuname = document.getElementById('Delete_idAM').value;
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
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_activitymenu",
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
// 		var deleteflag = document.getElementById('Delete_flagAM').value;
// 		var menuname = document.getElementById('Delete_idAM').value;
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
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_activitymenu",
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

<script>
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
		
		$("#AG0All").prop("checked", false);
		$("#AG1All").prop("checked", false);
		
		$("#manageTableAG tbody tr").empty();
		$("#banTableAG tboby tr").empty();
		var dbid = document.getElementById("menu").value
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query_ActivityMenu",
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
// 													{
// 														"data" : "dbid"
// 													},
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
//											        	 alert(JSON.stringify(full));
										             return '<input type="checkbox" name="AG0" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
										         }
										      }],
											lengthChange : false
										});
						AG2();
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

	
	}

	function AG() {
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Flag_ActivityMenu",
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

// 						var menu1 = "<option id=''></option>"
// 						document.getElementById("menu").insertAdjacentHTML(
// 								"BeforeEnd", menu1);
						
				
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
										url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query_ActivityMenu",
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
//					 													{
//					 														"data" : "dbid"
//					 													},
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
//																        	 alert(JSON.stringify(full));
															             return '<input type="checkbox" name="AG0" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
															         }
															      }],
																lengthChange : false
															});
											AG2();
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

						
						}
					}

				});
		
		
	};

	function AG2() {
		$("#manageTableAG tbody tr td,#banTableAG tbody tr td").on("click",
				function() {
					var text = $(this).text();
					if (text && text != "") {
						showEditMemberAG();
					}
				});
		
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

	//
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
// 	function showBan_AG() {
// 		closeAllHrContent();

// 		$("#AGContent").show();
// 		$("#banAGContent").show();

// 		$("button.ban").removeClass("btn-success");
// 		$("button.ban").addClass("btn-primary");

// 	}
	//
	//新增畫面
	function showAddMemberAG() {
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
		var in_sort = document.getElementById('in_sort').value;

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Insert_ActivityGroup",
					data : {
						activitymenuid : dbid,
						groupname : in_groupname,
						sort : in_sort
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
// 		var dbid = document.getElementById("menu").value
		var up_groupname = document.getElementById('up_groupnameAG').value;
// 		var up_sort = document.getElementById('up_sortAG').value;
		var up_dbid = document.getElementById('up_dbidAG').value;
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Update_ActivityGroup",
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
			  
// 		var flag = document.getElementById('Delete_flagAG').value;
// 		var dbid = document.getElementById('Delete_idAG').value;
	if(ActivityGroup_DBID_list.length){
		
	
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_ActivityGroup",
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
			  
// 		var flag = document.getElementById('Delete_flagAG').value;
// 		var dbid = document.getElementById('Delete_idAG').value;
if(ActivityGroup_DBID_list.length){
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_ActivityGroup",
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
<!-- ===============================================服務代碼===============================================================  -->
<script>
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
		
		$("#AD1All").prop("checked", false);
		$("#AD0All").prop("checked", false);
		
		$("#manageTableAD tbody tr").empty();
		$("#banTableAD tboby tr").empty();

		var dbid = document.getElementById("menuAD").value
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/FLAGDATA",
					data : {
						dbid : dbid
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						toastr.error("請重新整理");
					},
					success : function(data) {
						
						for (var i = 0; i < data.activitydata.length; i++) {
							var titleflagD = "<option value='"+data.activitydata[i].titleflag+"'>"
									+ data.activitydata[i].codename
									+ "</option>"
							document.getElementById("titleflagD")
									.insertAdjacentHTML("BeforeEnd", titleflagD);
						}						
						
						console.log("啟用服務代碼", data);

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
// 													{
// 														"data" : "dbid"
// 													},
													 {
														"data" : "codename"
													}, {
														"data" : "color"
													},{
														"data" : "titlegroup"
													}, {
														"data" : "titleflag"
													},	{
														"data" : "createdatetime"
													}, {
														"data" : "sort"
													}

											],'columnDefs': [{
										         'targets': 0,
										         'searchable': false,
										         'orderable': false,
										         'className': 'dt-body-center',
										         'render': function (data, type, full, meta){
//											        	 alert(JSON.stringify(full));
										             return '<input type="checkbox" name="AD0" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
										         }
										      }],
											lengthChange : false
										});
						AD2();
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

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/FLAGDATA",
					data : {
						dbid : dbid
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						toastr.error("請重新整理");
					},
					success : function(data) {
						console.log("停用服務代碼", data);

						//        	alert(JSON.stringify(data.person));
						$('#banTableAD')
								.DataTable(
										{
											"ordering": false,
											"autoWidth": false,
											destroy : true,
											aaData : data.Flag1,
											aoColumns : [
													{
														className : "dt-body-center"
													},
// 													{
// 														"data" : "dbid"
// 													},
												 {
														"data" : "codename"
													}, {
														"data" : "color"
													}, {
														"data" : "titlegroup"
													}, {
														"data" : "titleflag"
													}
													,{
														"data" : "deletedatetime"
													}
													,{
														"data" : "sort"
													} ],'columnDefs': [{
												         'targets': 0,
												         'searchable': false,
												         'orderable': false,
												         'className': 'dt-body-center',
												         'render': function (data, type, full, meta){
// 												        	 alert(JSON.stringify(full));
												             return '<input type="checkbox" name="AD1" value='+full.dbid+' ' + $('<div/>').text(data).html() + '">';
												         }
												      }],
											lengthChange : false
										});
						AD2();
						var table = $('#banTableAD').DataTable();

						$('#banTableAD tbody')
								.on(
										'click',
										'tr',
										function() {
											console.log("AD1", table.row(
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
										});
					}
				});

		$("#banTableAD").css("width", "100%");
		$("#banTableAD_filter").prop("style", "float:right;");
		$("#banTableAD_wrapper > div:nth-child(1)").hide();

		$("#banTableADSearch").keyup(function() {

			var searchText = $("#banTableADSearch").val();

			$("input[aria-controls='banTableAD']").val(searchText);
			$("input[aria-controls='banTableAD']").trigger("keyup");
		});
	}

	function AD() {

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query_ActivityGroup",
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
						var menu1 = "<option></option>"
						document.getElementById("menuAD").insertAdjacentHTML(
								"BeforeEnd", menu1);
						for (var i = 0; i < data.activitygroups.length; i++) {
							var menu = "<option value='"+data.activitygroups[i].dbid+"'>"
									+ data.activitygroups[i].groupname
									+ "</option>"
							document.getElementById("menuAD")
									.insertAdjacentHTML("BeforeEnd", menu);
						}
						console.log("服務代碼群組", data);

					}
				});

	}

	function AD2() {
		$("#manageTableAD tbody tr td,#banTableAD tbody tr td").on("click",
				function() {
					var text = $(this).text();
					if (text && text != "") {
						showEditMemberAD();
					}
				});
		
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
		closeAddMember();
		var in_activitygroupsid = document.getElementById("menuAD").value;
		var in_codename = document.getElementById("in_codename").value;
		var in_color = document.getElementById("in_color").value;
		var in_titleflag = document.getElementById("in_titleflag").value;
		var in_titlegroup = document.getElementById("in_titlegroup").value;
		//var in_deleteflag = document.getElementById("in_deleteflag").value;
		var in_sort = document.getElementById("in_sort").value;

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Insert_ActivityData",
					data : {
						activitygroupsid : in_activitygroupsid,
						codename : in_codename,
						color : in_color,
						titleflag : in_titleflag,
						titlegroup : in_titlegroup,
						deleteflag : 0,
						sort : in_sort

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
// 		var up_sort = document.getElementById("up_sortAD").value;

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Update_ActivityData",
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
// 		var flag = document.getElementById('Delete_flagAD').value;
// 		var dbid = document.getElementById('Delete_idAD').value;
		
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
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_ActivityData",
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
// 		var flag = document.getElementById('Delete_flagAD').value;
// 		var dbid = document.getElementById('Delete_idAD').value;
		
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
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_ActivityData",
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


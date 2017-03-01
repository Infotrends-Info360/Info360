<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>「設定」頁面</title>
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
<style>
label.required:after {
	content: " *";
	color: red;
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
											onclick="showActivityMenu()">服務代碼清單管理</a></li>
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
						<span onclick="showEditMember()">更新人員</span> <i
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
								<li onclick="unlockAccount()"><a href="#"><i
										class="fa fa-fw fa-unlock-alt"></i></a></li>
								<li onclick="confirmBan()"><a href="#"><i
										class="fa fa-fw fa-ban"></i></a></li>
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
								<table class="table table-bordered table-hover"
									id="person0Table">
									<thead>
										<tr>
											<th class="no-sort"><input type="checkbox"
												id="manageCheck" ischecked=false></th>
											<th>帳號</th>
											<th>姓名</th>
											<th>員工編號</th>
											<th>分機號碼</th>
											<th>Email</th>
											<th>狀態</th>
											<th>最大接通數</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>

					<div id="banContent" style="display: none;">
						<div>
							<ul class="pagination">
								<li onclick="showAddMember()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="unlockAccount()"><a href="#"><i
										class="fa fa-fw fa-unlock-alt"></i></a></li>
								<li onclick="confirmBan()"><a href="#"><i
										class="fa fa-fw fa-ban"></i></a></li>
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
												id="manageCheck" ischecked=false></th>
											<th>帳號</th>
											<th>姓名</th>
											<th>員工編號</th>
											<th>分機號碼</th>
											<th>Email</th>
											<th>狀態</th>
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
										placeholder="">
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
								<label for="inputLastName" class="col-sm-2 control-label">姓氏</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="inputLastName"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputFirstName" class="col-sm-2 control-label">名字</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="inputFirstName"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputEmployNumber" class="col-sm-2 control-label">員工編號</label>
								<div class="col-sm-8">
									<input type="number" class="form-control"
										id="inputEmployNumber" placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputPhoneNumber" class="col-sm-2 control-label">分機號碼</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" id="inputPhoneNumber"
										placeholder="">
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
								<label for="inputConfirmPassword"
									class="col-sm-2 control-label ">確認密碼</label>
								<div class="col-sm-8">
									<input type="password" class="form-control"
										id="inputConfirmPassword" placeholder="">
								</div>
							</div>


							<div class="form-group col-sm-12">
								<label for="inputEmail" class="col-sm-1 control-label">Email</label>
								<div class="col-sm-9">
									<input type="email" class="form-control" id="inputEmail"
										placeholder="">
								</div>
							</div>

							<div class="form-group col-sm-12">
								<label for="inputDepartment" class="col-sm-1 control-label">最大接通數</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="inputMaxcount"
										placeholder="">
								</div>
							</div>

							<div class="form-group col-sm-12">
								<label for="inputDepartment" class="col-sm-1 control-label">部門</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="inputDepartment"
										placeholder="">
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
								<label for="inputLastName" class="col-sm-2 control-label">姓氏</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="updateLastName"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputFirstName" class="col-sm-2 control-label">名字</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="updateFirstName"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputEmployNumber" class="col-sm-2 control-label">員工編號</label>
								<div class="col-sm-8">
									<input type="" class="form-control" id="updateEmployNumber"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputPhoneNumber" class="col-sm-2 control-label">分機號碼</label>
								<div class="col-sm-8">
									<input type="number" class="form-control"
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
								<label for="inputConfirmPassword"
									class="col-sm-2 control-label ">確認密碼</label>
								<div class="col-sm-8">
									<input type="password" class="form-control"
										id="updateConfirmPassword" placeholder="">
								</div>
							</div>


							<div class="form-group col-sm-12">
								<label for="inputEmail" class="col-sm-1 control-label">Email</label>
								<div class="col-sm-9">
									<input type="email" class="form-control" id="updateEmail"
										placeholder="">
								</div>
							</div>

							<div class="form-group col-sm-6">
								<label for="inputDepartment" class="col-sm-2 control-label">最大接通數</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="updateMaxcount"
										placeholder="">
								</div>
							</div>

							<div class="form-group col-sm-6">
								<label for="inputDepartment" class="col-sm-2 control-label">部門</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="updateDepartment"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputConfirmPassword" class="col-sm-2 control-label">啟用狀態:</label>
								<div class="col-sm-8">
									<select class="form-control" id="updateState">
										<option value="0">啟用</option>
										<option value="1">停用</option>
									</select>
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
					<button class="btn-sm btn-success ban" onclick="showBan_group()">
						<i class="fa fa-fw fa-user"></i>停用列表
					</button>
					<button class="btn-sm btn-success addMember" style="display: none;">
						<span onclick="showAddMembergroup()">新增部門</span> <i
							class="fa fa-times" onclick="closeAddMembergroup()"></i>
					</button>
					<button class="btn-sm btn-success editMember"
						style="display: none;">
						<span onclick="showEditMembergroup()">更新部門</span> <i
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
								<li onclick="unlockAccountgroup()"><a href="#"><i
										class="fa fa-fw fa-unlock-alt"></i></a></li>
								<li onclick="confirmBangroup()"><a href="#"><i
										class="fa fa-fw fa-ban"></i></a></li>
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
											<th class="no-sort"><input type="checkbox"
												id="manageCheck" ischecked=false></th>
											<th>部門名稱</th>
											<th>狀態</th>
											<th>編號</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>

					<div id="bangroupContent" style="display: none;">
						<div>
							<ul class="pagination">
								<li onclick="showAddMembergroup()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="unlockAccountgroup()"><a href="#"><i
										class="fa fa-fw fa-unlock-alt"></i></a></li>
								<li onclick="confirmBangroup()"><a href="#"><i
										class="fa fa-fw fa-ban"></i></a></li>
							</ul>
							<ul class="pagination" style="float: right;">
								<li><input type="text" id="bangroupTableSearch"
									placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox" id="group11">
							<div class="col-lg-12 col-md-12" id="group1">
								<table class="table table-bordered table-hover"
									id="bangroupTable">
									<thead>
										<tr>
											<th class="no-sort"><input type="checkbox"
												id="manageCheck" ischecked=false></th>
											<th>部門名稱</th>
											<th>狀態</th>
											<th>編號</th>
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
									class="col-sm-2 control-label required">部門名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="in_name"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label for="" class="col-sm-2 control-label">相關人員ID:</label>
								<div class="col-sm-8">
									<input type="" class="form-control" id="in_person_dbid"
										placeholder="">
								</div>
							</div>
							<!--                                     <div class="form-group col-sm-6"> -->
							<!--                                         <label for="inputConfirmPassword" class="col-sm-2 control-label">啟用狀態:</label> -->
							<!--                                         <div class="col-sm-8"> -->
							<!--                                             <select class="form-control" id="inputState"> -->
							<!--       											<option value="0">啟用</option> -->
							<!-- 	  											<option value="1">停用</option> -->
							<!--       										</select> -->
							<!--                                         </div> -->
							<!--                                     </div> -->
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
							<div class="form-group col-sm-12">
								<label for="inputEmail" class="col-sm-1 control-label">編號:</label>
								<div class="col-sm-9">
									<input type="email" class="form-control" id="up_dbid" disabled>
								</div>
							</div>

							<div class="form-group col-sm-6">
								<label for="inputDepartment" class="col-sm-2 control-label">更新部門名稱:</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="up_name"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputConfirmPassword" class="col-sm-3 control-label">啟用狀態:</label>
								<div class="col-sm-8">
									<select class="form-control" id="up_state">
										<option value="0">啟用</option>
										<option value="1">停用</option>
									</select>
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
					<button class="btn-sm btn-success ban"
						onclick="showBan_Agentreason()">
						<i class="fa fa-fw fa-user"></i>停用列表
					</button>
					<button class="btn-sm btn-success addMember" style="display: none;">
						<span onclick="showAddMemberAGR()">新增值機狀態</span> <i
							class="fa fa-times" onclick="closeAddMemberAGR()"></i>
					</button>
					<button class="btn-sm btn-success editMember"
						style="display: none;">
						<span onclick="showEditMemberAgentreason()">更新值機狀態</span> <i
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
								<li onclick="unlockAccountAgentreason()"><a href="#"><i
										class="fa fa-fw fa-unlock-alt"></i></a></li>
								<li onclick="confirmBanAgentreason()"><a href="#"><i
										class="fa fa-fw fa-ban"></i></a></li>
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
												id="manageCheck" ischecked=false></th>
											<th>狀態名</th>
											<th>狀態名_CE</th>
											<th>狀態名_EN</th>
											<th>狀態名_TW</th>
											<th>註解</th>
											<th>告警時間</th>
											<th>告警顏色</th>
											<th>開關</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>

					<div id="banAgentreasonContent" style="display: none;">
						<div>
							<ul class="pagination">
								<li onclick="showAddMember()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="unlockAccount()"><a href="#"><i
										class="fa fa-fw fa-unlock-alt"></i></a></li>
								<li onclick="confirmBan()"><a href="#"><i
										class="fa fa-fw fa-ban"></i></a></li>
							</ul>
							<ul class="pagination" style="float: right;">
								<li><input type="text" id="banAgentreasonTableSearch"
									placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox" id="agentreason11">
							<div class="col-lg-12 col-md-12" id="agentreason1">
								<table class="table table-bordered table-hover"
									id="banAgentreasonTable">
									<thead>
										<tr>
											<th class="no-sort"><input type="checkbox"
												id="manageCheck" ischecked=false></th>
											<th>狀態名</th>
											<th>狀態名_CE</th>
											<th>狀態名_EN</th>
											<th>狀態名_TW</th>
											<th>註解</th>
											<th>告警時間</th>
											<th>告警顏色</th>
											<th>開關</th>
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
								<label for="inputAccount" class="col-sm-2 control-label">狀態名:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="Insert_statusname"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">狀態名_CN:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control"
										id="Insert_statusname_cn" placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">狀態名_EN:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control"
										id="Insert_statusname_en" placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">狀態名_TW:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control"
										id="Insert_statusname_tw" placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">告警顏色:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="Insert_alarmcolor"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">告警時間:</label>
								<div class="col-sm-8">
									<input type="number" class="form-control"
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
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-2 control-label">建立者:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control"
										id="Insert_createuserid" placeholder="">
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-9 col-sm-3">
									<button class="btn btn-primary"
										onclick="sendAddMemberAgentreason()">儲存</button>
									<button class="btn btn-default"
										onclick="closeAddMemberAgentreason()">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 新增 END -->
					<!-- 更新  -->
					<div id="editMemberAGRContent" style="display: none;">
						<div class="widget">
							<div class="form-group col-sm-6">
								<label for="inputAccount"
									class="col-sm-2 control-label required">編碼:</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" id="Update_id">
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
							<div class="form-group col-sm-6">
								<label for="inputFirstName" class="col-sm-2 control-label">狀態名:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="statusname"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputEmployNumber" class="col-sm-2 control-label">狀態名_CN:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="statusname_cn"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputPhoneNumber" class="col-sm-2 control-label">狀態名_EN:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="statusname_en"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputPassword" class="col-sm-2 control-label">狀態名_TW:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="statusname_tw"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputConfirmPassword" class="col-sm-2 control-label">啟用狀態:</label>
								<div class="col-sm-8">
									<select class="form-control" id="Update_flag">
										<option value="0">啟用</option>
										<option value="1">停用</option>
									</select>
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
						onclick="showCommonlink()">
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
								<li onclick="unlockAccountcomm()"><a href="#"><i
										class="fa fa-fw fa-unlock-alt"></i></a></li>
								<li onclick="confirmBancomm()"><a href="#"><i
										class="fa fa-fw fa-ban"></i></a></li>
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
											<td>編號</td>
											<td>路徑</td>
											<td>相關節點</td>
											<td>狀態</td>
											<td>URL</td>
											<td>建立者</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td id="commname"></td>
											<td id="pass"></td>
											<td id="path"></td>
											<td id="children"></td>
											<td id="type"></td>
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

						<div class="form-group col-sm-6">
							<label for="inputLastName" class="col-sm-3 control-label">建立者名稱:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="nodeUSERu"
									placeholder="">
							</div>
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
				</div>
				<!-- 更新END -->
			</div>
		</div>
		<!-- Commlink  END -->
		<!-- ============================================================================================== -->
		<!-- ActivityMenu -->

		<div class="col-lg-10 col-sm-9" id="AMContent" style="display: none;">
			<div class="panel panel-success" style="height: 780px;">
				<!-- 服務代碼清單管理切換頁籤Start -->
				<div id="hrTabControlButton" style="margin: 1px 0px 0px 1px;">
					<button class="btn-sm btn-primary manage" onclick="showManage_AM()">
						<i class="fa fa-fw fa-user"></i>清單管理
					</button>
					<button class="btn-sm btn-success ban" onclick="showBan_AM()">
						<i class="fa fa-fw fa-user"></i>停用列表
					</button>
					<button class="btn-sm btn-success addMember" style="display: none;">
						<span onclick="showAddMember()">新增清單</span> <i class="fa fa-times"
							onclick="closeAddMemberAM()"></i>
					</button>
					<button class="btn-sm btn-success editMember"
						style="display: none;">
						<span onclick="showEditMember()">更新清單</span> <i
							class="fa fa-times" onclick="closeEditMemberAM()"></i>
					</button>
				</div>
				<!-- 服務代碼清單管理切換頁籤End -->

				<!-- 設定頁面內容頁 Start-->
				<div class="panel-body" id="settingContent">
					<div id="manageAMContent" style="display: none;">
						<div>
							<ul class="pagination">
								<li onclick="showAddMemberAM()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="unlockAccountAM()"><a href="#"><i
										class="fa fa-fw fa-unlock-alt"></i></a></li>
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
												id="manageCheck" ischecked=false></th>
											<th>編號</th>
											<th>清單名稱</th>
											<th>排序</th>
											<th>建立時間</th>
											<th>狀態</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>

					<div id="banAMContent" style="display: none;">
						<div>
							<ul class="pagination">
								<li onclick="showAddMemberAM()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="unlockAccountAM()"><a href="#"><i
										class="fa fa-fw fa-unlock-alt"></i></a></li>
							</ul>
							<ul class="pagination" style="float: right;">
								<li><input type="text" id="banTableAMSearch"
									placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox" id="AM11">
							<div class="col-lg-12 col-md-12" id="AM1">
								<table class="table table-bordered table-hover" id="banTableAM">
									<thead>
										<tr>
											<th class="no-sort"><input type="checkbox"
												id="manageCheck" ischecked=false></th>
											<th>編號</th>
											<th>清單名稱</th>
											<th>排序</th>
											<th>建立時間</th>
											<th>狀態</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<!-- 新增  -->
					<div id="addMemberAMContent" style="display: none;">
						<div class="widget">
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">清單名稱:</label>
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
							<!--                                      <div class="form-group col-sm-6"> -->
							<!--                                         <label for="inputConfirmPassword" class="col-sm-2 control-label">啟用狀態:</label> -->
							<!--                                         <div class="col-sm-8"> -->
							<!--                                             <select class="form-control" id="insert_deleteflag"> -->
							<!--       											<option value="0">啟用</option> -->
							<!-- 	  											<option value="1">停用</option> -->
							<!--       										</select> -->
							<!--                                         </div> -->
							<!--                                     </div> -->
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
								<label for="inputAccount"
									class="col-sm-2 control-label required">編號:</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" id="up_dbidam"
										disabled>
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">清單名稱:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="up_menunameam">
								</div>
							</div>

							<div class="form-group col-sm-6">
								<label for="inputName" class="col-sm-2 control-label">sort:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="up_sortam"
										placeholder="">
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
					<button class="btn-sm btn-success ban" onclick="showBan_AG()">
						<i class="fa fa-fw fa-user"></i>停用列表
					</button>
					<button class="btn-sm btn-success addMember" style="display: none;">
						<span onclick="showAddMemberAG()">新增群組</span> <i
							class="fa fa-times" onclick="closeAddMemberAG()"></i>
					</button>
					<button class="btn-sm btn-success editMember"
						style="display: none;">
						<span onclick="showEditMemberAG()">更新群組</span> <i
							class="fa fa-times" onclick="closeEditMemberAG()"></i>
					</button>
					<select class="selectpicker" style="width: 127px;" id="menu"
						onchange="group()">
					</select>

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
										class="fa fa-fw fa-unlock-alt"></i></a></li>
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
												id="manageCheck" ischecked=false></th>
											<th>編號</th>
											<th>群組名稱</th>
											<th>排序</th>
											<th>建立時間</th>
											<th>狀態</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>

					<div id="banAGContent" style="display: none;">
						<div>
							<ul class="pagination">
								<li onclick="showAddMemberAG()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="unlockAccountAG()"><a href="#"><i
										class="fa fa-fw fa-unlock-alt"></i></a></li>
							</ul>
							<ul class="pagination" style="float: right;">
								<li><input type="text" id="banTableAGSearch"
									placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox" id="AG11">
							<div class="col-lg-12 col-md-12" id="AG1">
								<table class="table table-bordered table-hover" id="banTableAG">
									<thead>
										<tr>
											<th class="no-sort"><input type="checkbox"
												id="manageCheck" ischecked=false></th>
											<th>編號</th>
											<th>群組名稱</th>
											<th>排序</th>
											<th>狀態</th>
											<th>建立時間</th>
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
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">編號:</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" id="up_dbidAG"
										disabled>
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputName" class="col-sm-3 control-label">sort:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="up_sortAG"
										placeholder="">
								</div>
							</div>

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

		<!-- ActivityData 結束 -->
		<div class="col-lg-10 col-sm-9" id="ADContent" style="display: none;">
			<div class="panel panel-success" style="height: 780px;">
				<!-- 服務代碼管理切換頁籤Start -->
				<div id="hrTabControlButton" style="margin: 1px 0px 0px 1px;">
					<button class="btn-sm btn-primary manage" onclick="showManage_AD()">
						<i class="fa fa-fw fa-user"></i>代碼管理
					</button>
					<button class="btn-sm btn-success ban" onclick="showBan_AD()">
						<i class="fa fa-fw fa-user"></i>停用列表
					</button>
					<button class="btn-sm btn-success addMember" style="display: none;">
						<span onclick="showAddMemberAD()">新增代碼</span> <i
							class="fa fa-times" onclick="closeAddMemberAD()"></i>
					</button>
					<button class="btn-sm btn-success editMember"
						style="display: none;">
						<span onclick="showEditMemberAD()">更新代碼</span> <i
							class="fa fa-times" onclick="closeEditMemberAD()"></i>
					</button>
					<select class="selectpicker" style="width: 127px;" id="menuAD"
						onchange="groupAD()">
					</select>
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
										class="fa fa-fw fa-unlock-alt"></i></a></li>
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
												id="manageCheck" ischecked=false></th>
											<th>編號</th>
											<th>建立時間</th>
											<th>名稱</th>
											<th>顏色</th>
											<th>狀態</th>
											<th>titlegroup</th>
											<th>titleflag</th>
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
								<li onclick="showAddMember()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="unlockAccount()"><a href="#"><i
										class="fa fa-fw fa-unlock-alt"></i></a></li>
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
												id="manageCheck" ischecked=false></th>
											<th>編號</th>
											<th>建立時間</th>
											<th>名稱</th>
											<th>顏色</th>
											<th>狀態</th>
											<th>titlegroup</th>
											<th>titleflag</th>
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
									<select id="in_titleflag">
										<option id="Tfalg" value="">1</option>
										<option id="tflag" value="0">0</option>
									</select>
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputAccount" class="col-sm-3 control-label">titlegroup:</label>
								<div class="col-sm-8">
									<select id="in_titlegroup">
										<option id="Tgroup" value="">1</option>
										<option id="tgroup" value="0">0</option>
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
							<!--                                      <div class="form-group col-sm-6"> -->
							<!--                                         <label for="inputConfirmPassword" class="col-sm-2 control-label">啟用狀態:</label> -->
							<!--                                         <div class="col-sm-8"> -->
							<!--                                             <select class="form-control" id="in_deleteflag"> -->
							<!--       											<option value="0">啟用</option> -->
							<!-- 	  											<option value="1">停用</option> -->
							<!--       										</select> -->
							<!--                                         </div> -->
							<!--                                      </div> -->
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
							<div class="form-group col-sm-6">
								<label for="inputPassword" class="col-sm-3 control-label"
									disabled>編號:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="up_dbidAD"
										placeholder="">
								</div>
							</div>
							<div class="form-group col-sm-6">
								<label for="inputPassword" class="col-sm-3 control-label">sort:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="up_sortAD"
										placeholder="">
								</div>
							</div>
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

<!-- 禁止符號BUTTON -->
<div id="confirmBan" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否確定停用帳號？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
					<label for="inputDepartment" class="col-sm-3 control-label">編號:</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="deletedbid"
							placeholder="">
					</div>
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="showToastSuccess('刪除成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>

	</div>
</div>
<!-- 禁止符號BUTTON END -->

<!-- 鎖符號BUTTON -->
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#unlockModal" style="display: none;" id="unlockButton">unlockDialog</button>
<div id="unlockModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否解除/鎖定帳號？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
					<label for="inputDepartment" class="col-sm-3 control-label">帳號:</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="state_account"
							placeholder="">
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label for="inputDepartment" class="col-sm-3 control-label">開關:</label>
					<div class="col-sm-6">
						<select id="state_list">
							<option value="0">開啟</option>
							<option value="1">鎖定</option>
						</select>
					</div>
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="showToastError('鎖定/解鎖')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- 鎖符號BUTTON END -->

<!-- ========================================================================================================= -->
<!-- GROUP 開始-->

<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#confirmBangroup" style="display: none;"
	id="confirmBanButtongroup">banDialog</button>

<!-- 禁止符號BUTTON -->
<div id="confirmBangroup" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否確定停用帳號？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
					<label for="inputDepartment" class="col-sm-3 control-label">編號:</label>
					<div class="col-sm-6">
						<input type="text" class="form-control"
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
<!-- 禁止符號BUTTON END -->

<!-- 鎖符號BUTTON -->
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#unlockModalgroup" style="display: none;"
	id="unlockButtongroup">unlockDialog</button>
<div id="unlockModalgroup" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否解除/鎖定帳號？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
					<label for="inputDepartment" class="col-sm-3 control-label">帳號:</label>
					<div class="col-sm-6">
						<input type="text" class="form-control"
							id="state_account_Groupluck" placeholder="">
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label for="inputDepartment" class="col-sm-3 control-label">開關:</label>
					<div class="col-sm-6">
						<select id="state_list_Groupluck">
							<option value="0">開啟</option>
							<option value="1">鎖定</option>
						</select>
					</div>
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="GroupLuck('鎖定/解鎖')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- 鎖符號BUTTON END -->
<!-- GROUP 結束-->

<!-- ========================================================================================== -->
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
				<div class="form-group col-sm-6">
					<label for="inputAssignedDepartment" class="col-sm-2 control-label">編號:</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="D_id" placeholder="">
					</div>
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="AgentreasonDelete('刪除成功')">確定</button>
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
					<label for="inputAssignedDepartment" class="col-sm-2 control-label">編號:</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="Delete_id"
							placeholder="">
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label for="inputAssignedDepartment" class="col-sm-2 control-label">開關:</label>
					<div class="col-sm-4">
						<select class="form-control" id="Delete_flag">
							<option value="0">啟用</option>
							<option value="1">停用</option>
						</select>
					</div>
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="AgentreasonLuck('鎖定/解鎖成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- 鎖符號BUTTON END -->
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
				<h3>是否解除鎖定帳號？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
					<label for="inputAssignedDepartment" class="col-sm-5 control-label">清單名稱:</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="Delete_idAM"
							placeholder="">
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label for="inputAssignedDepartment" class="col-sm-2 control-label">開關:</label>
					<div class="col-sm-4">
						<select class="form-control" id="Delete_flagAM">
							<option value="0">啟用</option>
							<option value="1">停用</option>
						</select>
					</div>
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="AMLuck('鎖定/解鎖成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- 鎖符號BUTTON END -->
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
				<h3>是否解除鎖定帳號？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
					<label for="inputAssignedDepartment" class="col-sm-2 control-label">群組名稱:</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="Delete_idAG"
							placeholder="">
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label for="inputAssignedDepartment" class="col-sm-2 control-label">開關:</label>
					<div class="col-sm-4">
						<select class="form-control" id="Delete_flagAG">
							<option value="0">啟用</option>
							<option value="1">停用</option>
						</select>
					</div>
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="AGLuck('鎖定/解鎖成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- 鎖符號BUTTON END -->
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
				<h3>是否解除鎖定帳號？</h3>
			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
					<label for="inputAssignedDepartment" class="col-sm-2 control-label">代碼名稱:</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="Delete_idAD"
							placeholder="">
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label for="inputAssignedDepartment" class="col-sm-2 control-label">開關:</label>
					<div class="col-sm-4">
						<select class="form-control" id="Delete_flagAD">
							<option value="0">啟用</option>
							<option value="1">停用</option>
						</select>
					</div>
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="ADLuck('鎖定/解鎖成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- 鎖符號BUTTON END -->

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

<!-- <script src="resources/js/setting/group.js"></script> -->
<!-- <script src="resources/js/setting/agentreason.js"></script> -->
<!-- <script src="resources/js/setting/commonlink.js"></script> -->
<!-- <script src="resources/js/setting/activitymenu.js"></script> -->
<!-- <script src="resources/js/setting/activitygroup.js"></script> -->
<!-- <script src="resources/js/setting/activitydata.js"></script> -->
<!-- <script src="resources/js/setting/person.js"></script> -->
<script>
	function person() {
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
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						console.log("啟用人員", data);

						//    		        	alert(JSON.stringify(data.person));
						$('#person0Table')
								.DataTable(
										{
											destroy : true,
											aaData : data.person,
											aoColumns : [
													{
														data : "dbid",
														render : function(data,
																type, row) {
															if (type === 'display') {
																return '<input type="checkbox" class="editor-active" value='+data+'>';
															}
															return data;
														},
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
														"data" : "state"
													}, {
														"data" : "max_count"
													} ],
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
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						console.log("停用人員", data);

						//    		        	alert(JSON.stringify(data.person));
						$('#person1Table')
								.DataTable(
										{
											destroy : true,
											aaData : data.person,
											aoColumns : [
													{
														data : "dbid",
														render : function(data,
																type, row) {

															if (type === 'display') {
																return '<input type="checkbox" class="editor-active" value='+data+'>';
															}
															return data;
														},
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
														"data" : "state"
													}, {
														"data" : "max_count"
													} ],
											lengthChange : false
										});
						aa();
						var table = $('#person1Table').DataTable();

						$('#person1Table tbody')
								.on(
										'click',
										'tr',
										function() {
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
		closeAllHrContent();
		$("#person").show();
		$("#addMemberContent").show();

		$("button.addMember").show();
		$("button.addMember").removeClass("btn-success");
		$("button.addMember").addClass("btn-primary");
	}

	function showEditMember() {
		closeAllHrContent();
		$("#person").show();
		$("#editMemberContent").show();

		$("button.editMember").show();
		$("button.editMember").removeClass("btn-success");
		$("button.editMember").addClass("btn-primary");
	}

	function sendAddMember() {
		//             if (!validateAddMember()) {
		//                 return;
		//             }

		closeAddMember();
		var in_first_name = document.getElementById('inputFirstName').value;
		var in_last_name = document.getElementById('inputLastName').value;
		var in_user_name = document.getElementById('inputName').value;
		var in_emailaddress = document.getElementById('inputEmail').value;
		var in_password = document.getElementById('inputPassword').value;
		var in_employee_id = document.getElementById('inputEmployNumber').value;
		var in_group_dbid = document.getElementById('inputDepartment').value;
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
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						person();
					}
				});
		showToastSuccess("新增成功");
	}

	function sendEditMember() {
		//             if (!validateEditMember()) {
		//                 return;
		//             }

		closeEditMember();
		var up_first_name = document.getElementById('updateFirstName').value;
		var up_last_name = document.getElementById('updateLastName').value;
		var up_user_name = document.getElementById('updateName').value;
		var up_emailaddress = document.getElementById('updateEmail').value;
		var up_password = document.getElementById('updatePassword').value;
		var up_employee_id = document.getElementById('updateEmployNumber').value;
		var up_group_dbid = document.getElementById('updateDepartment').value;
		var up_account = document.getElementById('updateAccount').value;
		var up_state = document.getElementById('updateState').value;
		var up_dn = document.getElementById('updatePhoneNumber').value;
		var up_updateMaxcount = document.getElementById('updateMaxcount').value;

		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Update_PersonInfo",
					data : {
						first_name : up_first_name,
						last_name : up_last_name,
						user_name : up_user_name,
						emailaddress : up_emailaddress,
						password : up_password,
						employee_id : up_employee_id,
						group_dbid : up_group_dbid,
						account : up_account,
						state : up_state,
						dn : up_dn,
						max_count : updateMaxcount

					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						person();
					}
				});
		showToastSuccess("修改成功");
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
		var deletedbid = document.getElementById('deletedbid').value;

		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Delete_PersonInfo",
					data : {

						dbid : deletedbid

					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						person();
					}

				});
		toastr.success(message);
	}

	function showToastError(message) {
		var state = document.getElementById('state_list').value;
		var account = document.getElementById('state_account').value;
		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Person_logicdelete",
					data : {

						state : state,
						account : account

					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						person();
					}

				});
		toastr.error(message);
	}

	function isValidEmail(email) {
		var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

		return re.test(email);
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

		closeAllHrContent();
		$("#person").show();
		$("#manageContent").show();

		$("button.group").removeClass("btn-success");
		$("button.group").addClass("btn-primary");

		person();
	}
</script>

<script>
	function showGroup() {

		closeAllHrContent();
		$("#groupContent").show();
		$("#managegroupContent").show();

		$("button.group").removeClass("btn-success");
		$("button.group").addClass("btn-primary");

		select();
	}

	function select() {
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
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						console.log("啟用部門", data);

						//	        	alert(JSON.stringify(data.person));
						$('#managegroupTable')
								.DataTable(
										{
											destroy : true,
											aaData : data.group,
											aoColumns : [
													{
														data : "dbid",
														render : function(data,
																type, row) {
															if (type === 'display') {
																return '<input type="checkbox" class="editor-active" value='+data+'>';
															}
															return data;
														},
														className : "dt-body-center"
													}, {
														"data" : "name"
													}, {
														"data" : "state"
													}, {
														"data" : "dbid"
													}

											],
											lengthChange : false
										});
						group2();
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

		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Query_Group_STATE",
					data : {
						state : 1
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						console.log("停用部門", data);

						//	        	alert(JSON.stringify(data.person));
						$('#bangroupTable')
								.DataTable(
										{
											destroy : true,
											aaData : data.group,
											aoColumns : [
													{
														data : "dbid",
														render : function(data,
																type, row) {
															if (type === 'display') {
																return '<input type="checkbox" class="editor-active" value='+data+'>';
															}
															return data;
														},
														className : "dt-body-center"
													}, {
														"data" : "name"
													}, {
														"data" : "state"
													}, {
														"data" : "dbid"
													} ],
											lengthChange : false
										});
						group2();
					}
				});

		$("#bangroupTable").css("width", "100%");
		$("#bangroupTable_filter").prop("style", "float:right;");
		$("#bangroupTable_wrapper > div:nth-child(1)").hide();

		$("#bangroupTableSearch").keyup(function() {

			var searchText = $("#bangroupTableSearch").val();

			$("input[aria-controls='bangroupTable']").val(searchText);
			$("input[aria-controls='bangroupTable']").trigger("keyup");
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
		closeAllHrContent();
		$("#groupContent").show();
		$("#addMembergroupContent").show();

		$("button.addMember").show();
		$("button.addMember").removeClass("btn-success");
		$("button.addMember").addClass("btn-primary");
	}

	//新增功能
	function sendAddMembergroup() {
		closeAddMember();
		var in_person_dbid = document.getElementById('in_person_dbid').value;
		var in_name = document.getElementById('in_name').value;
		//	var in_state = document.getElementById('inputState').value;
		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Insert_GroupInfo",
					data : {
						state : 0,
						name : in_name,
						person_dbid : in_person_dbid

					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						select();
					}
				});
		showToastSuccess("新增成功");
		closeAllHrContent();
		$("#groupContent").show();
		$("#managegroupContent").show();
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

		closeEditMember();
		var up_dbid = document.getElementById('up_dbid').value;
		var up_name = document.getElementById('up_name').value;
		var up_state = document.getElementById('up_state').value;
		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Update_GroupInfo",
					data : {
						state : up_state,
						name : up_name,
						dbid : up_dbid
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						select();
					}
				});
		showToastSuccess("修改成功");
		closeAllHrContent();
		$("#groupContent").show();
		$("#managegroupContent").show();
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
		var deletedbid = document.getElementById('deletedbid_GroupDelete').value;
		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Delete_GroupInfo",
					data : {
						dbid : deletedbid
					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						select();
					}
				});
		toastr.success(message);
		closeAllHrContent();
		$("#groupContent").show();
		$("#managegroupContent").show();
	}

	function GroupLuck(message) {
		var state = document.getElementById('state_list_Groupluck').value;
		var name = document.getElementById('state_account_Groupluck').value;
		$
				.ajax({
					url : "${Info360_Setting_protocol}//${Info360_Setting_hostname}:${Info360_Setting_port}/Info360_Setting/RESTful/Group_logicdelete",
					data : {
						state : state,
						name : name
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
					},
					success : function(data) {
						alert("成功");
						select();
					}
				});
		toastr.error(message);
		closeAllHrContent();
		$("#groupContent").show();
		$("#managegroupContent").show();
	}
</script>

<script>
	function showCommonlink() {

		closeAllHrContent();
		$("#CommonlinkContent").show();

		$("#0Commonlink").show();
		$("#comm").show();

		$("button.Commonlink").removeClass("btn-success");
		$("button.Commonlink").addClass("btn-primary");
		selectcomm();
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
						alert("失敗");
						callback(data);
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
									$('#pass').text(data.node.original.id);
									$('#type').text(data.node.original.parent);
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
						var color = "<option>blue</option><option>yellow</option><option>red</option>";
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
							alert("失敗");
							callback(data);
						},
						success : function(data) {
							selectcomm();
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
							alert("失敗");
							callback(data);
						},
						success : function(data) {
							selectcomm();
						}
					});
		} else {
			alert("不可超過第四層");
		}

		showToastSuccess("新增成功");
		closeAllHrContent();
		$("#CommonlinkContent").show();
		$("#0Commonlink").show();
	}
	//
	//
	//
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
							alert("失敗");
							callback(data);
						},
						success : function(data) {
							selectcomm();
						}

					});
		} else {
			alert("有子節點無法移動");
		}
		showToastSuccess("修改成功");
		closeAllHrContent();
		$("#CommonlinkContent").show();
		$("#0Commonlink").show();
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
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						selectcomm();
					}
				});

		toastr.success(message);
		closeAllHrContent();
		$("#CommonlinkContent").show();
		$("#0Commonlink").show();
	}
</script>

<script>
	function showAgentreason() {

		closeAllHrContent();
		$("#AgentreasonContent").show();
		$("#manageAgentreasonContent").show();

		$("button.Agentreason").removeClass("btn-success");
		$("button.Agentreason").addClass("btn-primary");
		select2();
	}

	function select2() {
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
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						console.log("啟用值機", data);

						//	        	alert(JSON.stringify(data.person));
						$('#manageAgentreasonTable')
								.DataTable(
										{
											destroy : true,
											aaData : data.agentreason,
											aoColumns : [
													{
														data : "dbid",
														render : function(data,
																type, row) {
															if (type === 'display') {
																return '<input type="checkbox" class="editor-active" value='+data+'>';
															}
															return data;
														},
														className : "dt-body-center"
													},
													{
														"data" : "statusname"
													},
													{
														"data" : "statusname_cn"
													},
													{
														"data" : "statusname_en"
													},
													{
														"data" : "statusname_tw"
													},
													{
														"data" : "description"
													},
													{
														"data" : "alarmduration"
													}, {
														"data" : "alarmcolor"
													}, {
														"data" : "flag"
													} ],
											lengthChange : false
										});
						agentreason2()
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

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Select_agentreason",
					data : {
						flag : 1
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						console.log("停用值機", data);

						//	        	alert(JSON.stringify(data.person));
						$('#banAgentreasonTable')
								.DataTable(
										{
											destroy : true,
											aaData : data.agentreason,
											aoColumns : [
													{
														data : "dbid",
														render : function(data,
																type, row) {
															if (type === 'display') {
																return '<input type="checkbox" class="editor-active" value='+data+'>';
															}
															return data;
														},
														className : "dt-body-center"
													},
													{
														"data" : "statusname"
													},
													{
														"data" : "statusname_cn"
													},
													{
														"data" : "statusname_en"
													},
													{
														"data" : "statusname_tw"
													},
													{
														"data" : "description"
													},
													{
														"data" : "alarmduration"
													}, {
														"data" : "alarmcolor"
													}, {
														"data" : "flag"
													} ],
											lengthChange : false
										});
						agentreason2()
					}
				});

		$("#banAgentreasonTable").css("width", "100%");
		$("#banAgentreasonTable_filter").prop("style", "float:right;");
		$("#banAgentreasonTable_wrapper > div:nth-child(1)").hide();

		$("#banAgentreasonTableSearch").keyup(function() {

			var searchText = $("#banAgentreasonTableSearch").val();

			$("input[aria-controls='banAgentreasonTable']").val(searchText);
			$("input[aria-controls='banAgentreasonTable']").trigger("keyup");
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
	function showBan_Agentreason() {
		closeAllHrContent();

		$("#AgentreasonContent").show();
		$("#banAgentreasonContent").show();

		$("button.ban").removeClass("btn-success");
		$("button.ban").addClass("btn-primary");

	}
	//
	//新增畫面
	function showAddMemberAGR() {
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
		closeAddMember();
		var alarmcolor = document.getElementById('Insert_alarmcolor').value;
		var alarmduration = document.getElementById('Insert_alarmduration').value;
		var description = document.getElementById('Insert_description').value;
		var statusname = document.getElementById('Insert_statusname').value;
		var statusname_cn = document.getElementById('Insert_statusname_cn').value;
		var statusname_en = document.getElementById('Insert_statusname_en').value;
		var statusname_tw = document.getElementById('Insert_statusname_tw').value;
		var createuserid = document.getElementById('Insert_createuserid').value;

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
						statusname_tw : statusname_tw,
						createuserid : createuserid
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						select2()
					}

				});
		showToastSuccess("新增成功");
		closeAllHrContent();
		$("#AgentreasonContent").show();
		$("#manageAgentreasonContent").show();
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

		closeEditMember();
		var flag = document.getElementById('Update_flag').value;
		var dbid = document.getElementById('Update_id').value;
		;
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
						flag : flag,
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
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						select2()
					}

				});
		showToastSuccess("修改成功");
		closeAllHrContent();
		$("#AgentreasonContent").show();
		$("#manageAgentreasonContent").show();
	}

	//解鎖對話視窗
	function unlockAccountAgentreason() {
		$("#unlockButtonAGR").trigger("click");

	}

	//停用對話視窗
	function confirmBanAgentreason() {
		$("#confirmBanButtonAGR").trigger("click");
	}

	function AgentreasonDelete(message) {
		var dbid = document.getElementById('D_id').value;

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Delete_AgentReason",
					data : {
						dbid : dbid
					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						select2()
					}
				});
		toastr.success(message);
		closeAllHrContent();
		$("#AgentreasonContent").show();
		$("#manageAgentreasonContent").show();
	}

	function AgentreasonLuck(message) {
		var flag = document.getElementById('Delete_flag').value;
		var dbid = document.getElementById('Delete_id').value;

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_agentreason",
					data : {
						flag : flag,
						dbid : dbid
					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						select2()
					}
				});
		toastr.error(message);
		closeAllHrContent();
		$("#AgentreasonContent").show();
		$("#manageAgentreasonContent").show();
	}
</script>

<script>
	function showActivityMenu() {

		closeAllHrContent();
		$("#AMContent").show();
		$("#manageAMContent").show();

		$("button.Agentreason").removeClass("btn-success");
		$("button.Agentreason").addClass("btn-primary");
		AM();
	}

	function AM() {
		$("#manageTableAM tbody tr").empty();
		$("#banTableAM tboby tr").empty();
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Flag_ActivityMenu",
					data : {
						deleteflag : 0
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						console.log("啟用清單", data);

						//        	alert(JSON.stringify(data.person));
						$('#manageTableAM')
								.DataTable(
										{
											destroy : true,
											aaData : data.activitymenu,
											aoColumns : [
													{
														data : "dbid",
														render : function(data,
																type, row) {
															if (type === 'display') {
																return '<input type="checkbox" class="editor-active" value='+data+'>';
															}
															return data;
														},
														className : "dt-body-center"
													},
													{
														"data" : "dbid"
													},
													{
														"data" : "menuname"
													},
													{
														"data" : "sort"
													},
													{
														"data" : "createdatetime"
													}, {
														"data" : "deleteflag"
													}

											],
											lengthChange : false
										});
						AM2();
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

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Flag_ActivityMenu",
					data : {
						deleteflag : 1
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						console.log("停用清單", data);

						//        	alert(JSON.stringify(data.person));
						$('#banTableAM')
								.DataTable(
										{
											destroy : true,
											aaData : data.activitymenu,
											aoColumns : [
													{
														data : "dbid",
														render : function(data,
																type, row) {
															if (type === 'display') {
																return '<input type="checkbox" class="editor-active" value='+data+'>';
															}
															return data;
														},
														className : "dt-body-center"
													},
													{
														"data" : "dbid"
													},
													{
														"data" : "menuname"
													},
													{
														"data" : "sort"
													},
													{
														"data" : "createdatetime"
													}, {
														"data" : "deleteflag"
													} ],
											lengthChange : false
										});
						AM2();
					}
				});

		$("#banTableAM").css("width", "100%");
		$("#banTableAM_filter").prop("style", "float:right;");
		$("#banTableAM_wrapper > div:nth-child(1)").hide();

		$("#banTableAMSearch").keyup(function() {

			var searchText = $("#banTableAMSearch").val();

			$("input[aria-controls='banTableAM']").val(searchText);
			$("input[aria-controls='banTableAM']").trigger("keyup");
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
	function showBan_AM() {
		closeAllHrContent();

		$("#AMContent").show();
		$("#banAMContent").show();

		$("button.ban").removeClass("btn-success");
		$("button.ban").addClass("btn-primary");

	}
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
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						AM();
					}

				});
		showToastSuccess("新增成功");
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
		var sort = document.getElementById('up_sortam').value;

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Update_ActivityMenu",
					data : {
						dbid : dbid,
						menuname : menuname,
						sort : sort

					},

					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						AM();
					}

				});
		showToastSuccess("修改成功");
		closeAllHrContent();
		$("#AMContent").show();
		$("#manageAMContent").show();
	}

	//解鎖對話視窗
	function unlockAccountAM() {
		$("#unlockButtonAM").trigger("click");

	}

	function AMLuck(message) {
		var deleteflag = document.getElementById('Delete_flagAM').value;
		var menuname = document.getElementById('Delete_idAM').value;

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_activitymenu",
					data : {
						menuname : menuname,
						deleteflag : deleteflag
					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						AM();
					}
				});
		toastr.error(message);
		closeAllHrContent();
		$("#AMContent").show();
		$("#manageAMContent").show();
	}
</script>

<script>
	function showActivityGroup() {

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
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						console.log("啟用服務代碼群組", data);

						//        	alert(JSON.stringify(data.person));
						$('#manageTableAG')
								.DataTable(
										{
											destroy : true,
											aaData : data.flag0_group,
											aoColumns : [
													{
														data : "dbid",
														render : function(data,
																type, row) {
															if (type === 'display') {
																return '<input type="checkbox" class="editor-active" value='+data+'>';
															}
															return data;
														},
														className : "dt-body-center"
													},
													{
														"data" : "dbid"
													},
													{
														"data" : "groupname"
													},
													{
														"data" : "sort"
													},
													{
														"data" : "deleteflag"
													},
													{
														"data" : "createdatetime"
													},

											],
											lengthChange : false
										});
						AG2();
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

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query_ActivityMenu",
					data : {
						dbid : dbid
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						console.log("停用服務代碼群組", data);

						//        	alert(JSON.stringify(data.person));
						$('#banTableAG')
								.DataTable(
										{
											destroy : true,
											aaData : data.flag1_group,
											aoColumns : [
													{
														data : "dbid",
														render : function(data,
																type, row) {
															if (type === 'display') {
																return '<input type="checkbox" class="editor-active" value='+data+'>';
															}
															return data;
														},
														className : "dt-body-center"
													},
													{
														"data" : "dbid"
													},
													{
														"data" : "groupname"
													},
													{
														"data" : "sort"
													},
													{
														"data" : "createdatetime"
													}, {
														"data" : "deleteflag"
													} ],
											lengthChange : false
										});
						AG2();
					}
				});

		$("#banTableAG").css("width", "100%");
		$("#banTableAG_filter").prop("style", "float:right;");
		$("#banTableAG_wrapper > div:nth-child(1)").hide();

		$("#banTableAGSearch").keyup(function() {

			var searchText = $("#banTableAGSearch").val();

			$("input[aria-controls='banTableAG']").val(searchText);
			$("input[aria-controls='banTableAG']").trigger("keyup");
		});
	}

	function AG() {
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query_ActivityMenu",
					data : {
						dbid : 0
					},

					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						$('#menu').empty();

						var menu1 = "<option></option>"
						document.getElementById("menu").insertAdjacentHTML(
								"BeforeEnd", menu1);
						for (var i = 0; i < data.activitymenu.length; i++) {
							var menu = "<option value='"+data.activitymenu[i].dbid+"'>"
									+ data.activitymenu[i].menuname
									+ "</option>"
							document.getElementById("menu").insertAdjacentHTML(
									"BeforeEnd", menu);
						}

						console.log("服務代碼清單", data);
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
	function showBan_AG() {
		closeAllHrContent();

		$("#AGContent").show();
		$("#banAGContent").show();

		$("button.ban").removeClass("btn-success");
		$("button.ban").addClass("btn-primary");

	}
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
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						group();
					}

				});
		showToastSuccess("新增成功");
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
		var dbid = document.getElementById("menu").value
		var up_groupname = document.getElementById('up_groupnameAG').value;
		var up_sort = document.getElementById('up_sortAG').value;
		var up_dbid = document.getElementById('up_dbidAG').value;
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Update_ActivityGroup",
					data : {
						activitymenuid : dbid,
						groupname : up_groupname,
						sort : up_sort,
						dbid : up_dbid
					},

					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						group();
					}
				});
		showToastSuccess("修改成功");
		closeAllHrContent();
		$("#AGContent").show();
		$("#manageAGContent").show();
	}

	//解鎖對話視窗
	function unlockAccountAG() {
		$("#unlockButtonAG").trigger("click");
	}

	function AGLuck(message) {
		var flag = document.getElementById('Delete_flagAG').value;
		var dbid = document.getElementById('Delete_idAG').value;

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_ActivityGroup",
					data : {
						deleteflag : flag,
						groupname : dbid,
					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						group();
					}
				});
		toastr.error(message);
		closeAllHrContent();
		$("#AGContent").show();
		$("#manageAGContent").show();
	}
</script>

<script>
	function showActivityData() {

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
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						console.log("啟用服務代碼", data);

						//        	alert(JSON.stringify(data.person));
						$('#manageTableAD')
								.DataTable(
										{
											destroy : true,
											aaData : data.activitydata,
											aoColumns : [
													{
														data : "dbid",
														render : function(data,
																type, row) {
															if (type === 'display') {
																return '<input type="checkbox" class="editor-active" value='+data+'>';
															}
															return data;
														},
														className : "dt-body-center"
													},
													{
														"data" : "dbid"
													},
													{
														"data" : "createdatetime"
													}, {
														"data" : "codename"
													}, {
														"data" : "color"
													}, {
														"data" : "deleteflag"
													}, {
														"data" : "titlegroup"
													}, {
														"data" : "titleflag"
													}, {
														"data" : "sort"
													}

											],
											lengthChange : false
										});
						AD2();
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
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						console.log("停用服務代碼", data);

						//        	alert(JSON.stringify(data.person));
						$('#banTableAD')
								.DataTable(
										{
											destroy : true,
											aaData : data.Flag,
											aoColumns : [
													{
														data : "dbid",
														render : function(data,
																type, row) {
															if (type === 'display') {
																return '<input type="checkbox" class="editor-active" value='+data+'>';
															}
															return data;
														},
														className : "dt-body-center"
													},
													{
														"data" : "dbid"
													},
													{
														"data" : "createdatetime"
													}, {
														"data" : "codename"
													}, {
														"data" : "color"
													}, {
														"data" : "deleteflag"
													}, {
														"data" : "titlegroup"
													}, {
														"data" : "titleflag"
													}, {
														"data" : "sort"
													} ],
											lengthChange : false
										});
						AD2();
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
						alert("失敗");
						callback(data);
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
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						groupAD();
					}

				});
		showToastSuccess("新增成功");
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
		var up_sort = document.getElementById("up_sortAD").value;

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Update_ActivityData",
					data : {
						codename : up_codename,
						color : up_color,
						dbid : up_dbid,
						sort : up_sort

					},

					type : "POST",
					dataType : 'json',

					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						groupAD();
					}
				});
		showToastSuccess("修改成功");

		closeAllHrContent();
		$("#ADContent").show();
		$("#manageADContent").show();
	}

	//解鎖對話視窗
	function unlockAccountAD() {
		$("#unlockButtonAD").trigger("click");

	}

	function ADLuck(message) {
		var flag = document.getElementById('Delete_flagAD').value;
		var dbid = document.getElementById('Delete_idAD').value;

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/LogicDelete_ActivityData",
					data : {
						deleteflag : flag,
						codename : dbid
					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						alert("失敗");
						callback(data);
					},
					success : function(data) {
						groupAD();
					}
				});
		toastr.error(message);
		closeAllHrContent();
		$("#ADContent").show();
		$("#manageADContent").show();
	}
</script>

</html>


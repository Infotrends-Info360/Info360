<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>「設定」頁面</title>

<link rel="shortcut icon" href="favicon.ico">

<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/layui/css/layui.css" rel="stylesheet">
<link href="resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="resources/css/style.css?v=4.1.0" rel="stylesheet">

<link href="resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">

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
					<div class="fa-tree-list">
						<ul style="list-style-type: none; margin-left: 0px;">
							<li><span> <i class="fa fa-fw fa-folder-open"></i>
									使用者管理
							</span>
								<ul style="list-style-type: none; margin-left: 20px;">
									<li onclick=""><i class="fa fa-fw fa-file-text-o"></i>人員管理</li>
									<li onclick=""><i class="fa fa-fw fa-file-text-o"></i>部門權限管理</li>
									<li onclick=""><i class="fa fa-fw fa-file-text-o"></i>值機狀態管理</li>
								</ul></li>
							<li class="active"><span> <i
									class="fa fa-fw fa-folder-open"></i> 管道管理
							</span>
								<ul style="list-style-type: none; margin-left: 20px;">
									<li><i class="fa fa-fw fa-file-text-o"></i>分派小組管理</li>
									<li><i class="fa fa-fw fa-file-text-o"></i>Chat管道設定</li>
								</ul></li>
							<li><span> <i class="fa fa-fw fa-folder-open"></i>
									案件管理
							</span>

								<ul style="list-style-type: none; margin-left: 20px;">
									<li><i class="fa fa-fw fa-file-text-o"></i>常用連結管理</li>
									<li><i class="fa fa-fw fa-file-text-o"></i>服務代碼管理</li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-10 col-sm-9">
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
						<span onclick="showEditMember()">HolyLin</span> <i
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
								<li><input type="text" id="manageSearch" placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox">
							<div class="col-lg-12 col-md-12">
								<table class="table table-bordered table-hover" id="manageTable">
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
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>Holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td><label class="label label-danger">鎖定</label></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td><label class="label label-danger">鎖定</label></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
									</tbody>
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
								<li><input type="text" id="banSearch" placeholder="搜索"
									style="background-color: #FFFFFF; border: 1px solid #DDDDDD; color: inherit; float: left; line-height: 1.42857; margin-left: -1px; padding: 4px 10px; position: relative; text-decoration: none;">
								</li>

								<li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li>
							</ul>
						</div>

						<div class="row ibox">
							<div class="col-lg-12 col-md-12">
								<table class="table table-bordered table-hover" id="banTable">
									<thead>
										<tr>
											<th class="no-sort"><input type="checkbox" id="banCheck"
												ischecked=false></th>
											<th>帳號</th>
											<th>姓名</th>
											<th>員工編號</th>
											<th>分機號碼</th>
											<th>Email</th>
											<th>狀態</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>Holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td><label class="label label-danger">鎖定</label></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td><label class="label label-danger">鎖定</label></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>Taslin</td>
											<td>弘霖</td>
											<td>10003</td>
											<td>1113</td>
											<td>Tsailin@crm.com.tw</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>HolyLin</td>
											<td>智凱</td>
											<td>10002</td>
											<td>1112</td>
											<td>holylin@crm.com.tw</td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div id="addMemberContent" style="display: none;">
						<div class="widget">
							<form class="form-horizontal">
								<div class="form-group col-sm-6">
									<label for="inputAccount"
										class="col-sm-2 control-label required">帳號</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="inputAccount"
											placeholder="">
									</div>
								</div>
								<div class="form-group col-sm-6">
									<label for="inputName" class="col-sm-2 control-label required">姓名</label>
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
										<input type="number" class="form-control"
											id="inputPhoneNumber" placeholder="">
									</div>
								</div>
								<div class="form-group col-sm-6">
									<label for="inputPassword"
										class="col-sm-2 control-label required">密碼</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" id="inputPassword"
											placeholder="">
									</div>
								</div>
								<div class="form-group col-sm-6">
									<label for="inputConfirmPassword"
										class="col-sm-2 control-label required">確認密碼</label>
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
									<label for="inputDeskPhone" class="col-sm-1 control-label">分機</label>
									<div class="col-sm-4">
										<input type="number" class="form-control" id="inputDeskPhone"
											placeholder="">
									</div>
								</div>
								<div class="form-group col-sm-12">
									<label for="inputDepartment" class="col-sm-1 control-label">所屬部門</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="inputDepartment"
											placeholder="">
									</div>
								</div>
								<div class="form-group col-sm-12">
									<label for="inputAssignedDepartment"
										class="col-sm-1 control-label">分派部門</label>
									<div class="col-sm-4">
										<input type="text" class="form-control"
											id="inputAssignedDepartment" placeholder="">
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-9 col-sm-3">
										<button class="btn btn-primary" onclick="sendAddMember()">儲存</button>
										<button class="btn btn-default">取消</button>
									</div>
								</div>


							</form>
						</div>
					</div>

					<div id="editMemberContent" style="display: none;">
						<div class="widget">
							<form class="form-horizontal">
								<div class="form-group col-sm-6">
									<label for="inputAccount"
										class="col-sm-2 control-label required">帳號</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="inputAccount"
											value="HolyLin" readonly>
									</div>
								</div>
								<div class="form-group col-sm-6">
									<label for="inputName" class="col-sm-2 control-label required">姓名</label>
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
										<input type="number" class="form-control"
											id="inputPhoneNumber" placeholder="">
									</div>
								</div>
								<div class="form-group col-sm-6">
									<label for="inputPassword"
										class="col-sm-2 control-label required">密碼</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" id="inputPassword"
											placeholder="">
									</div>
								</div>
								<div class="form-group col-sm-6">
									<label for="inputConfirmPassword"
										class="col-sm-2 control-label required">確認密碼</label>
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
									<label for="inputDeskPhone" class="col-sm-1 control-label">分機</label>
									<div class="col-sm-4">
										<input type="number" class="form-control" id="inputDeskPhone"
											placeholder="">
									</div>
								</div>
								<div class="form-group col-sm-12">
									<label for="inputDepartment" class="col-sm-1 control-label">所屬部門</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="inputDepartment"
											placeholder="">
									</div>
								</div>
								<div class="form-group col-sm-12">
									<label for="inputAssignedDepartment"
										class="col-sm-1 control-label">分派部門</label>
									<div class="col-sm-4">
										<input type="text" class="form-control"
											id="inputAssignedDepartment" placeholder="">
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-10">
										<div class="checkbox">
											<span class="label label-primary" style="margin-right: 10px;">
												帳戶狀態：<span>正常</span>
											</span> <label class=""> <input type="checkbox">停用帳戶
											</label> <label class=""> <input type="checkbox">解除鎖定
											</label>
										</div>
									</div>
								</div>



								<div class="form-group">
									<div class="col-sm-offset-9 col-sm-3">
										<button class="btn btn-primary" onclick="sendEditMember()">儲存</button>
										<button class="btn btn-default">取消</button>
									</div>
								</div>


							</form>
						</div>
					</div>


				</div>
				<!-- 設定頁面內容頁 End-->
			</div>
		</div>
	</div>
</body>

<!-- 彈跳對話視窗-->
<!-- Modal -->
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#confirmBan" style="display: none;" id="confirmBanButton">banDialog</button>

<div id="confirmBan" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否確定停用帳號？</h3>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="showToastSuccess('停用成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>

	</div>
</div>

<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#unlockModal" style="display: none;" id="unlockButton">unlockDialog</button>

<div id="unlockModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3>是否解除鎖定帳號？</h3>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="showToastError('鎖定失敗')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>

	</div>
</div>

<!-- 全局js -->
<script src="resources/js/jquery.min.js?v=2.1.4"></script>
<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>

<!-- Data Tables -->
<script src="resources/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="resources/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- DataPicker -->
<script src="resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>

<!-- toastStr -->
<script src="resources/js/plugins/toastr/toastr.min.js"></script>


<script>
	$(document).ready(function() {
		//init datatable
		$("#manageTable").DataTable({
			"columnDefs" : [ {
				"targets" : 'no-sort',
				"orderable" : false,
			} ]
		});

		$("#manageTable").css("width", "100%");
		$("#manageTable_filter").prop("style", "float:right;");
		$("#manageTable_wrapper > div:nth-child(1)").hide();

		$("#manageSearch").keyup(function() {
			var searchText = $("#manageSearch").val();

			$("input[aria-controls='manageTable']").val(searchText);
			$("input[aria-controls='manageTable']").trigger("keyup");
		});

		$("#banTable").DataTable({
			"columnDefs" : [ {
				"targets" : 'no-sort',
				"orderable" : false,
			} ]
		});
		$("#banTable").css("width", "100%");
		$("#banTable_filter").prop("style", "float:right;");
		$("#banTable_wrapper > div:nth-child(1)").hide();

		$("#banSearch").keyup(function() {

			var searchText = $("#banSearch").val();

			$("input[aria-controls='banTable']").val(searchText);
			$("input[aria-controls='banTable']").trigger("keyup");
		});
	});

	$("#manageTable tbody tr td,#banTable tbody tr td").on("click", function() {
		var text = $(this).text();

		if (text && text != "") {
			showEditMember();
		}
	});

	function showManage() {
		closeAllHrContent();
		$("#manageContent").show();

		$("button.manage").removeClass("btn-success");
		$("button.manage").addClass("btn-primary");
	}

	function showBan() {
		closeAllHrContent();
		$("#banContent").show();

		$("button.ban").removeClass("btn-success");
		$("button.ban").addClass("btn-primary");
	}

	function showAddMember() {
		closeAllHrContent();
		$("#addMemberContent").show();

		$("button.addMember").show();
		$("button.addMember").removeClass("btn-success");
		$("button.addMember").addClass("btn-primary");
	}

	function showEditMember() {
		closeAllHrContent();
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
		showToastSuccess("新增成功");
	}

	function sendEditMember() {
		if (!validateEditMember()) {
			return;
		}

		closeEditMember();
		showToastSuccess("修改成功");
	}

	function closeAddMember() {
		closeAllHrContent();
		$("button.addMember").hide();

		$("#manageContent").show();
		$("button.manage").removeClass("btn-success");
		$("button.manage").addClass("btn-primary");
	}

	function closeEditMember() {
		closeAllHrContent();
		$("button.editMember").hide();

		$("#manageContent").show();
		$("button.manage").removeClass("btn-success");
		$("button.manage").addClass("btn-primary");
	}

	function closeAllHrContent() {
		$("#manageContent").hide();
		$("#banContent").hide();
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
		toastr.success(message);
	}

	function showToastError(message) {
		toastr.error(message);
	}

	function validateAddMember() {
		var account = $("#inputAccount", "#addMemberContent").val();
		var name = $("#inputName", "#addMemberContent").val();
		var passowrd = $("#inputPassword", "#addMemberContent").val();
		var confirmPassword = $("#inputConfirmPassword", "#addMemberContent")
				.val();
		var email = $("#inputEmail", "#addMemberContent").val();

		if (!account || account == '') {
			toastr.error("請輸入帳號");
			return false;
		}

		if (!name || name == '') {
			toastr.error("請輸入姓名");
			return false;
		}

		if (!passowrd || passowrd == '') {
			toastr.error("請輸入密碼");
			return false;
		}

		if (email != '' && !isValidEmail(email)) {
			toastr.error("請輸入正確的Email格式");
			return false;
		}

		if (!confirmPassword || confirmPassword == '') {
			toastr.error("請輸入確認密碼");
			return false;
		}

		if (passowrd != confirmPassword) {
			toastr.error("密碼與確認密碼不同，請重新輸入");
			return false;
		}

		return true;
	}

	function validateEditMember() {
		var account = $("#inputAccount", "#editMemberContent").val();
		var name = $("#inputName", "#editMemberContent").val();
		var passowrd = $("#inputPassword", "#editMemberContent").val();
		var confirmPassword = $("#inputConfirmPassword", "#editMemberContent")
				.val();
		var email = $("#inputEmail", "#editMemberContent").val();

		if (!name || name == '') {
			toastr.error("請輸入姓名");
			return false;
		}

		if (!passowrd || passowrd == '') {
			toastr.error("請輸入密碼");
			return false;
		}

		if (!confirmPassword || confirmPassword == '') {
			toastr.error("請輸入確認密碼");
			return false;
		}

		if (email != '' && !isValidEmail(email)) {
			toastr.error("請輸入正確的Email格式");
			return false;
		}

		if (passowrd != confirmPassword) {
			toastr.error("密碼與確認密碼不同，請重新輸入");
			return false;
		}

		return true;
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
</html>

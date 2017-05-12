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

								<li><span> <i class="fa fa-fw fa-folder-open"></i>
										案件管理
								</span>

									<ul style="list-style-type: none; margin-left: 20px;">
										<li><i class="fa fa-fw fa-file-text-o"></i><a
											onclick="showCommonlink()">常用連結管理</a></li>
										<li><i class="fa fa-fw fa-file-text-o"></i><a
											onclick="showActivity()">服務代碼管理</a></li>
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
							<div class="form-group col-sm-12">
	 							<div class="">
	                                <div class="form-group"> 
										<label for="inputEmail" class="col-sm-5 control-label">部門列表</label> 
										<div style="overflow: auto; width: 100%; height: 300px; border: 1px silver solid">	
										<table class="table table-striped">
			                                <thead>
			                                    <tr>
			                                       <th class="no-sort" style="width:20px"><input type="checkbox"
													id="addHaveGroupAll" ischecked=false ></th>
			                                        <th>部門名稱</th>
			                                    </tr>
			                                </thead>
			                                <tbody id="addHaveGroup">
			                                    
			                                </tbody>
			                            </table>
										</div>
									</div>	

									<button class="btn btn-primary" onclick="insertGroupButton()">剔除</button>
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
											<div class="form-group col-sm-12">
					 							<div class="">
					                                <div class="form-group"> 
														<label for="inputEmail" class="col-sm-5 control-label">部門列表</label> 
														<div style="overflow: auto; width: 100%; height: 300px; border: 1px silver solid">	
														<table class="table table-striped">
							                                <thead>
							                                    <tr>
							                                       <th class="no-sort" style="width:20px"><input type="checkbox"
																	id="HaveGroupAll" ischecked=false ></th>
							                                        <th>部門名稱</th>
							                                    </tr>
							                                </thead>
							                                <tbody id="HaveGroup">
							                                    
							                                </tbody>
							                            </table>
														</div>
													</div>	
													<button class="btn btn-primary" onclick="addGroupButton()">新增</button>
													<button class="btn btn-primary" onclick="backGroup()">剔除</button>
													<button class="btn btn-default" onclick="closeEditMember()">取消</button>       
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
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#insertGroup" id="insertGroupButton" style="display: none;" ></button>
<div id="insertGroup" class="modal fade" role="dialog">
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
												id="addNotHaveGroupAll" ischecked=false ></th>
							            <th>部門名稱</th>

							       </tr>
							    </thead>
							      <tbody id="addNotHaveGroup">
							                                    
							    </tbody>
						</table>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="backInsertGroup()">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>			

<!-- 更新			 -->
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
						<div id="groupul">
							<ul class="pagination">
								<li onclick="showAddMembergroup()"><a href="#"><i
										class="fa fa-fw fa-plus"></i></a></li>
								<li onclick="confirmBangroup()"><a href="#"><i
										class="glyphicon glyphicon-trash"></i></a></li>
								<li onclick="changeGroupNameButton()"><a href="#"><i
										class="glyphicon glyphicon-edit"></i></a></li>
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
							<div class="container col-sm-12">
					                    <div class="tab-content">
					                    	<ul class="nav nav-pills">
    											<li class="active"><a data-toggle="pill" href="#tab-1">人員列表</a></li>
    											<li><a data-toggle="pill" href="#tab-2">權限列表</a></li>
  											</ul>
					                        <div id="tab-1" class="tab-pane active">
					                                <div class="form-group"> 
														<div style="overflow: auto; height: 450px; border: 1px silver solid">	
														<table class="table table-striped">
							                                <thead>
							                                    <tr>
							                                        <th class="no-sort" style="width:20px"><input type="checkbox"
																	id="addPersonCheckBox" ischecked=false ></th>
							                                        <th>姓名</th>
							                                        <th>帳號</th>
							                                        <th>員工編號</th>
							                                    </tr>
							                                </thead>
							                                <tbody id="addPerson">
							                                </tbody>
							                            </table>
														</div>
													</div>	
<!-- 													<button class="btn btn-primary" onclick="">新增</button> -->
													<button class="btn btn-primary" onclick="InsertPersonButton()">剔除</button>
					                        </div>
					                        <div id="tab-2" class="tab-pane">
					                            	<div class="form-group "> 
																<div style="overflow: auto; height: 450px; border: 1px silver solid">
																	<table  class="table table-striped">
										                                <thead>
										                                    <tr>
										                                       <th class="no-sort" style="width:20px"><input type="checkbox"
																				id="addAuthorityCheckBox" ischecked=false ></th>
										                                        <th>權限名稱</th>
										                                        <th>權限描述</th>
										                                    </tr>
										                                </thead>
										                                <tbody id="addAuthority">
										                                    
										                                </tbody>
										                            </table>
																</div>
													</div>
													<button class="btn btn-primary" onclick="InsertAuthorityButton()">剔除</button>
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
<!-- 								<label for="inputDepartment" class="col-sm-2 control-label">部門名稱:</label> -->
								<div class="col-sm-6">
									<input type="hidden" class="form-control" id="up_name"
										placeholder="">
								</div>
							</div>
							<div class="container col-sm-12">
					                    <div class="tab-content">
					                    	<ul class="nav nav-pills">
    											<li class="active"><a data-toggle="pill" href="#tab-3">人員列表</a></li>
    											<li><a data-toggle="pill" href="#tab-4">權限列表</a></li>
  											</ul>
					                        <div id="tab-3" class="tab-pane active">
					                                <div class="form-group"> 
														<div style="overflow: auto;height: 450px; border: 1px silver solid">	
														<table class="table table-striped">
							                                <thead>
							                                    <tr>
							                                        <th class="no-sort" style="width:20px"><input type="checkbox"
																	id="HavePersonCheckBox" ischecked=false ></th>
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
													<button class="btn btn-default" onclick="closeEditMembergroup()">取消</button>         
					                        </div>
					                        <div id="tab-4" class="tab-pane">
					                            	<div class="form-group"> 
																<div style="overflow: auto;height: 450px; border: 1px silver solid">
																	<table  class="table table-striped">
										                                <thead>
										                                    <tr>
										                                        <th class="no-sort" style="width:20px"><input type="checkbox"
																				id="HaveAuthorityCheckBox" ischecked=false ></th>
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
													<button class="btn btn-default" onclick="closeEditMembergroup()">取消</button>  	
					                        </div>
					                    </div>
                				</div>						

						</div>
					</div>
					<!-- 更新END -->

				</div>
				<!-- 設定頁面內容頁 End-->
			</div>
		</div>
		
		<!-- InsertPerson -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#InsertPerson" id="InsertPersonButton" style="display: none;" ></button>
<div id="InsertPerson" class="modal fade" role="dialog">
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
												id="insertPersonCheckBox" ischecked=false ></th>
							          <th>姓名</th>
							          <th>帳號</th>
							          <th>員工編號</th>
							       </tr>
							    </thead>
							      <tbody id="DeletePerson">
							                                    
							     </tbody>
						</table>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="BackInsertPerson()">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>	
<!-- InsertPersonEND -->
<!-- InsertAuthority -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#InsertAuthority" id="InsertAuthorityButton" style="display: none;" ></button>
<div id="InsertAuthority" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
			<h3 class="btn btn-w-m btn-primary">權限列表</h3><p>
					<div>
					
						<table class="table table-striped" style="border:3px #cccccc solid;" cellpadding="10" border='1'>
							    <thead>
							        <tr>
										<th class="no-sort" style="width:20px"><input type="checkbox"
												id="insertAuthorityCheckBox" ischecked=false ></th>
										<th>權限名稱</th>
										<th>權限描述</th>
							       </tr>
							    </thead>
							      <tbody id="DeleteAuthority">
							                                    
							     </tbody>
						</table>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="BackInsertAuthority()">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>		
<!-- InsertAuthorityEND -->
			
			
			
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#addPersonView" id="addPersonButton" style="display: none;" ></button>
<div id="addPersonView" class="modal fade" role="dialog">
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
					onclick="addUpdatePerson()">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>

<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#addAuthorityView" id="addAuthorityButton" style="display: none;" ></button>
<div id="addAuthorityView" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3 class="btn btn-w-m btn-primary">權限列表</h3><p>
					<div >
						<table  class="table table-striped" style="border:3px #cccccc solid;" cellpadding="10" border='1'>
							<thead>
									<tr>
										<th class="no-sort" style="width:20px"><input type="checkbox"
												id="NotHaveAuthorityAll" ischecked=false ></th>
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
					onclick="addUpdateAuthority()">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>	
<!-- 鉛筆符號BUTTON -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#ChangeGroupName" style="display: none;"
	id="changeGroupNameButton">banDialog</button>
<div id="ChangeGroupName" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				
				<h3 class="col-sm-4 control-label">編輯名稱</h3>
				
				<input class="form-control" type="text" value="" id="changeName">

			</div>
			<div class="modal-footer">
				<div class="form-group col-sm-6">
					<div class="col-sm-3">
						<input type="hidden" class="form-control"
							id="deletedbid_GroupDelete" placeholder="">
					</div>
				</div>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="editGroupName('更新成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>

	</div>
</div>
<!-- 鉛筆桶符號BUTTON END -->


		<!-- GROUP 結束 --><!-- ========================================================================================== -->
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
									<input type="hidden" class="form-control" id="Update_id" >
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
		<!-- AgentReason 結束 --><!-- ========================================================================================== -->
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
											<td>路徑</td>
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
								<input type="hidden" class="form-control" id="nodeUSERu"
									placeholder="" >
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
		<!-- Commlink  END --><!-- ============================================================================================== -->
		
		<!-- Activity開始 -->
		<div class="col-lg-10 col-sm-9" id="ADContent" style="display: none;">
			<div class="panel panel-success" style="height: 780px;">
				<!-- 服務代碼管理切換頁籤Start -->
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
							<div class="col-lg-4 col-md-4">
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

							<div class="col-lg-6 col-md-6" id="showActivityTable" style="display: none;">
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
											<td id="inputColorTD" style="display: none;"><input id="Color" value="" placeholder="Ex:black blue yellow red"></td>
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
								<input type="text" class="form-control" id="addColor" value="" placeholder="Ex:black blue yellow red" >
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
		</div>
		<!-- Activity結束 -->
	</div>
</body>

<!-- 彈跳對話視窗-->
<!-- Modal -->
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
<!-- GROUP 結束-->
<!-- ====================================================================================================-->
<!-- Agentreason 開始 -->
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
				<button type="button" class="btn btn-success" data-dismiss="modal"
					onclick="AgentreasonDelete('停用成功')">確定</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>

	</div>
</div>
<!-- 禁止符號BUTTON END -->

<!-- 鎖符號BUTTON -->
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
<!-- AgentTrashBUTTON END --><!-- ================================================================================== -->
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

<!-- Activity 開始-->
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
<!-- Activity END-->
<!-- 全局js -->
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


<!-- =====================================Person================================================================= -->
<script>
$(document).ready(function() {
	person();
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
// 	$("#Box1").empty();
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
//													{
//														className : "label label-danger",
//														"data" : "state"
//													} 
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
//											document
//											.getElementById('updatePassword').value = table
//											.row(this).data().password;

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
				url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Query_Person_STATE_old",
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
	$("#NotHaveGroupAll").click(function() {
		   if($("#NotHaveGroupAll").prop("checked")) {
		     $("input[name='NotHaveGroupTitle']").each(function() {
		         $(this).prop("checked", true);
		     });
		   } else {
		     $("input[name='NotHaveGroupTitle']").each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
		});
	$("#HaveGroupAll").click(function() {
		   if($("#HaveGroupAll").prop("checked")) {
		     $("input[name='HaveGroupTitle']").each(function() {
		         $(this).prop("checked", true);
		     });
		   } else {
		     $("input[name='HaveGroupTitle']").each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
		});
	$("#addHaveGroupAll").click(function() {
		   if($("#addHaveGroupAll").prop("checked")) {
		     $("input[name='addHaveGroupTitle']").each(function() {
		         $(this).prop("checked", true);
		     });
		   } else {
		     $("input[name='addHaveGroupTitle']").each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
		});
	$("#addNotHaveGroupAll").click(function() {
		   if($("#addNotHaveGroupAll").prop("checked")) {
		     $("input[name='addNotHaveGroupTitle']").each(function() {
		         $(this).prop("checked", true);
		     });
		   } else {
		     $("input[name='addNotHaveGroupTitle']").each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
		});
}
	
function showManage() {
	closeAllHrContent();
	$("#person").show();
	$("#manageContent").show();
	$("#persondiv").show();
	$("#personul").show();
	$("button.manage").removeClass("btn-success");
	$("button.manage").addClass("btn-primary");
}
function showBan() {
	closeAllHrContent();
	$("#person").show();
	$("#banContent").show();
	$("#persondiv").show();
	$("#personul").show();
	$("button.ban").removeClass("btn-success");
	$("button.ban").addClass("btn-primary");
}

function showAddMember() {
	
	$("#addHaveGroup").empty();

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
		        var addGroup = "<tr id='removeAddHaveGroup"+data.group[i].dbid+"'><td><input type='checkbox' name='addHaveGroupTitle' class='i-checks' value='"+data.group[i].dbid+"'></td><td>"+data.group[i].name+"</td><input type='hidden' id='1addHaveGroup"+data.group[i].dbid+"' value='"+data.group[i].dbid+"'><input type='hidden' id='2addHaveGroup"+data.group[i].dbid+"' value='"+data.group[i].name+"'></tr>"
		        document.getElementById("addHaveGroup").insertAdjacentHTML("BeforeEnd",addGroup);
		    }
			aa();
		}
	});

	document.getElementById('inputFirstName').value = "";
	document.getElementById('inputLastName').value = "";
	document.getElementById('inputName').value = "";
	document.getElementById('inputEmail').value = "";
	document.getElementById('inputPassword').value = "";
	document.getElementById('inputEmployNumber').value = "";
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
//更新畫面
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
//返回更新畫面
function backShowEditMember() {

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
	 	var in_first_name = document.getElementById('inputFirstName').value;
		var in_last_name = document.getElementById('inputLastName').value;
		var in_user_name = document.getElementById('inputName').value;
		var in_emailaddress = document.getElementById('inputEmail').value;
		var in_password = document.getElementById('inputPassword').value;
		var hash = md5(in_password);
		var in_employee_id = document.getElementById('inputEmployNumber').value;
		var in_account = document.getElementById('inputAccount').value;
		var in_dn = document.getElementById('inputPhoneNumber').value;
		var in_maxcount = document.getElementById('inputMaxcount').value;
	 
	 
	var HaveGroup=[];
		$("[name=addHaveGroupTitle]").each(function(){
		HaveGroup.push($(this).val());
 	});
 	var HaveGroupList = HaveGroup.join();
 	if(HaveGroupList==""){
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
				group_dbid :"",
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
				toastr.success("新增成功");
			}
		});
 	}else{
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
				group_dbid : HaveGroupList,
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
				toastr.success("新增成功");
			}
		});
 	}
 	closeAddMember();
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
    
    var HaveGroup=[];
		$("[name=addHaveGroupTitle]").each(function(){
		HaveGroup.push($(this).val());
  	});
  	var HaveGroupList = HaveGroup.join();
  	
    
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
    
    if(HaveGroupList==""){
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
//	            if (!validatePersonUP()) {
//	                return;
//	            }
	
	var HaveGroup=[];
	$("[name=HaveGroupTitle]").each(function(){
	HaveGroup.push($(this).val());
	});
	var HaveGroupList = HaveGroup.join();
	
var up_first_name = $('#updateFirstName').val();
var up_last_name = $('#updateLastName').val();
var up_user_name = $('#updateName').val();
var up_emailaddress = $('#updateEmail').val();
var up_password = $('#updatePassword').val();
var hash = md5(up_password);
var up_employee_id = $('#updateEmployNumber').val();
var up_account = $('#updateAccount').val();
var up_dn = $('#updatePhoneNumber').val();
var up_updateMaxcount = $('#updateMaxcount').val();
	
if(up_password==""&& HaveGroupList==""){
	$
	.ajax({
	url : '${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/updatePersonNotHavePassWordByAccount',
	data : {
		max_count :up_updateMaxcount,
		first_name : up_first_name,
		last_name : up_last_name,
		user_name : up_user_name,
		emailaddress : up_emailaddress,
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
}else if(up_password==""&& HaveGroupList!=""){
	$
	.ajax({
	url : '${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/updatePersonNotHavePassWordByAccount',
	data : {
		max_count :up_updateMaxcount,
		first_name : up_first_name,
		last_name : up_last_name,
		user_name : up_user_name,
		emailaddress : up_emailaddress,
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
}else if(up_password!=""&&HaveGroupList==""){
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
//	          var DT = $("#Box1").val();
	         
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
//	          if(arr.length==0){
//	   			toastr.error("請選擇部門");
//	   			 return false;
//	   		}

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
	//新增部門對話視窗
	 function insertGroupButton() {
	 	$("#insertGroupButton").trigger("click");
	 	insertGroup();
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
						state : 2,
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
	
	
	function insertGroup() {
		var addHaveGroup=[];
	    $("[name=addHaveGroupTitle]:checkbox:checked").each(function(){
	    	addHaveGroup.push($(this).val());
	      });
	 
		var addHaveGroupList = addHaveGroup.join();
		var List = addHaveGroupList.split(',');
		if(addHaveGroupList==""){
		}else{
			for (var i in List ) {
				var arrDbid = document.getElementById("1addHaveGroup"+List[i]).value;
				var arrName = document.getElementById("2addHaveGroup"+List[i]).value;
	
				var addNotHaveGroup = "<tr id='removeAddNotHaveGroup"+arrDbid+"'><td><input type='checkbox' name='addNotHaveGroupTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><input type='hidden' id='1addNotHaveGroup"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2addNotHaveGroup"+arrDbid+"' value='"+arrName+"'></tr>"

				document.getElementById("addNotHaveGroup").insertAdjacentHTML("BeforeEnd",addNotHaveGroup);	
				$('#removeAddHaveGroup'+List[i]).remove();
			}
		}
	}
	function backInsertGroup() {
		var addNotHaveGroup=[];
	    $("[name=addNotHaveGroupTitle]:checkbox:checked").each(function(){
	    	addNotHaveGroup.push($(this).val());
	      });
	 
		var addNotHaveGroupList = addNotHaveGroup.join();
		var List = addNotHaveGroupList.split(',');
		if(addNotHaveGroupList==""){
		}else{
			for (var i in List ) {
				var arrDbid = document.getElementById("1addNotHaveGroup"+List[i]).value;
				var arrName = document.getElementById("2addNotHaveGroup"+List[i]).value;
				var addHaveGroup = "<tr id='removeAddHaveGroup"+arrDbid+"'><td><input type='checkbox' name='addHaveGroupTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><input type='hidden' id='1addHaveGroup"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2addHaveGroup"+arrDbid+"' value='"+arrName+"'></tr>"	
				document.getElementById("addHaveGroup").insertAdjacentHTML("BeforeEnd",addHaveGroup);	
				$('#removeAddNotHaveGroup'+List[i]).remove();
			}
		}
	}
	
	function addGroup() {
		var NotHaveGroup=[];
	    $("[name=NotHaveGroupTitle]:checkbox:checked").each(function(){
	    	NotHaveGroup.push($(this).val());
	      });
	 
		var NotHaveGroupList = NotHaveGroup.join();
		var List = NotHaveGroupList.split(',');
		if(NotHaveGroupList==""){
		}else{
			for (var i in List ) {
				var arrDbid = document.getElementById("1NotHaveGroup"+List[i]).value;
				var arrName = document.getElementById("2NotHaveGroup"+List[i]).value;
	
				var HaveGroup = "<tr id='removeHaveGroup"+arrDbid+"'><td><input type='checkbox' name='HaveGroupTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><input type='hidden' id='1HaveGroup"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2HaveGroup"+arrDbid+"' value='"+arrName+"'></tr>"

				document.getElementById("HaveGroup").insertAdjacentHTML("BeforeEnd",HaveGroup);	
				$('#removeGroup'+List[i]).remove();
			}
		}
		sendEditMember();
	}
	
	function backGroup() {
		var HaveGroup=[];
	    $("[name=HaveGroupTitle]:checkbox:checked").each(function(){
	    	HaveGroup.push($(this).val());
	      });
	 
		var HaveGroupList = HaveGroup.join();
		var List = HaveGroupList.split(',');
		if(HaveGroupList==""){
		}else{
			for (var i in List ) {
				var arrDbid = document.getElementById("1HaveGroup"+List[i]).value;
				var arrName = document.getElementById("2HaveGroup"+List[i]).value;
				var NotHaveGroup = "<tr id='removeGroup"+arrDbid+"'><td><input type='checkbox' name='NotHaveGroupTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><input type='hidden' id='1NotHaveGroup"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2NotHaveGroup"+arrDbid+"' value='"+arrName+"'></tr>"	
				document.getElementById("NotHaveGroup").insertAdjacentHTML("BeforeEnd",NotHaveGroup);	
				$('#removeHaveGroup'+List[i]).remove();
			}
		}
		sendEditMember();

	}
	
</script>
<!-- =======================================Person=END============================================================================ -->
<!-- =======================================Group============================================================================== -->
<script>
var insertPerson = "";
var insertAuthority = "";
var addPerson=""
var addAuthority=""

	function showGroup() {
		$("button.editMember").hide();
		closeAllHrContent();
		$("#groupContent").show();
		$("#managegroupContent").show();
		$("button.group").removeClass("btn-success");
		$("button.group").addClass("btn-primary");
		select();
	}

function select() {
	$("#groupLoading").show();
	$("#group0").hide();
	$("#groupul").hide();
	$("#group0All").prop("checked", false);

	
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
									             return '<input type="checkbox" name="group0" value='+full.dbid+","+full.name+' ' + $('<div/>').text(data).html() + '">';
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
														
							document.getElementById('deletedbid_GroupDelete').value = table.row(this).data().dbid;
							document.getElementById('up_dbid').value = table.row(this).data().dbid;
							document.getElementById('UPgroup').innerHTML = table.row(this).data().name;
							document.getElementById('up_name').value = table.row(this).data().name;
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
		
		$("#insertAuthorityCheckBox").click(function() {
			   if($("#insertAuthorityCheckBox").prop("checked")) {
			     $("input[name='deleteAuthorityTitle']").each(function() {
			         $(this).prop("checked", true);
			     });
			   } else {
			     $("input[name='deleteAuthorityTitle']").each(function() {
			         $(this).prop("checked", false);
			     });           
			   }
			});
		$("#insertPersonCheckBox").click(function() {
			   if($("#insertPersonCheckBox").prop("checked")) {
			     $("input[name='deletePersonTitle']").each(function() {
			         $(this).prop("checked", true);
			     });
			   } else {
			     $("input[name='deletePersonTitle']").each(function() {
			         $(this).prop("checked", false);
			     });           
			   }
			});
		
		$("#addAuthorityCheckBox").click(function() {
			   if($("#addAuthorityCheckBox").prop("checked")) {
			     $("input[name='addAuthorityTitle']").each(function() {
			         $(this).prop("checked", true);
			     });
			   } else {
			     $("input[name='addAuthorityTitle']").each(function() {
			         $(this).prop("checked", false);
			     });           
			   }
			});
		$("#addPersonCheckBox").click(function() {
			   if($("#addPersonCheckBox").prop("checked")) {
			     $("input[name='addPersonTitle']").each(function() {
			         $(this).prop("checked", true);
			     });
			   } else {
			     $("input[name='addPersonTitle']").each(function() {
			         $(this).prop("checked", false);
			     });           
			   }
			});

		$("#NotHaveAuthorityAll").click(function() {
			   if($("#NotHaveAuthorityAll").prop("checked")) {
			     $("input[name='NotHaveAuthorityTitle']").each(function() {
			         $(this).prop("checked", true);
			     });
			   } else {
			     $("input[name='NotHaveAuthorityTitle']").each(function() {
			         $(this).prop("checked", false);
			     });           
			   }
			});
		$("#NotHavePersonAll").click(function() {
			   if($("#NotHavePersonAll").prop("checked")) {
			     $("input[name='NotHavePersonTitle']").each(function() {
			         $(this).prop("checked", true);
			     });
			   } else {
			     $("input[name='NotHavePersonTitle']").each(function() {
			         $(this).prop("checked", false);
			     });           
			   }
			});
		$("#HavePersonCheckBox").click(function() {
			   if($("#HavePersonCheckBox").prop("checked")) {
			     $("input[name='HavePersonTitle']").each(function() {
			         $(this).prop("checked", true);
			     });
			   } else {
			     $("input[name='HavePersonTitle']").each(function() {
			         $(this).prop("checked", false);
			     });           
			   }
			});
		$("#HaveAuthorityCheckBox").click(function() {
			   if($("#HaveAuthorityCheckBox").prop("checked")) {
			     $("input[name='HaveAuthorityTitle']").each(function() {
			         $(this).prop("checked", true);
			     });
			   } else {
			     $("input[name='HaveAuthorityTitle']").each(function() {
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
		
		$("#DeletePerson").empty();
		$("#DeleteAuthority").empty();
		$("#addPerson").empty();
		$("#addAuthority").empty();

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
						var addPerson = "<tr id='addPerson"+data.ALLperson[i].dbid+"'><td><input type='checkbox' name='addPersonTitle' class='i-checks' value='"+data.ALLperson[i].dbid+"'></td><td>"+data.ALLperson[i].user_name+"</td><td>"+data.ALLperson[i].account+"</td><td>"+data.ALLperson[i].employee_id+"</td><input type='hidden' id='1addPerson"+data.ALLperson[i].dbid+"' value='"+data.ALLperson[i].dbid+"'><input type='hidden' id='2addPerson"+data.ALLperson[i].dbid+"' value='"+data.ALLperson[i].user_name+"'><input type='hidden' id='3addPerson"+data.ALLperson[i].dbid+"' value='"+data.ALLperson[i].account+"'><input type='hidden' id='4addPerson"+data.ALLperson[i].dbid+"' value='"+data.ALLperson[i].employee_id+"'></tr>"
						document.getElementById("addPerson").insertAdjacentHTML("BeforeEnd",addPerson);
					}
					
					for(var a=0; a<data.ALLfunction.length; a++){
				        var addAuthority = "<tr id='addAuthority"+data.ALLfunction[a].dbid+"'><td><input type='checkbox' name='addAuthorityTitle' value='"+data.ALLfunction[a].dbid+"'></td><td>"+data.ALLfunction[a].name+"</td><td>"+data.ALLfunction[a].description+"</td><input type='hidden' id='1addAuthority"+data.ALLfunction[a].dbid+"' value='"+data.ALLfunction[a].dbid+"'><input type='hidden' id='2addAuthority"+data.ALLfunction[a].dbid+"' value='"+data.ALLfunction[a].name+"'><input type='hidden' id='3addAuthority"+data.ALLfunction[a].dbid+"' value='"+data.ALLfunction[a].description+"'></tr>"
				        document.getElementById("addAuthority").insertAdjacentHTML("BeforeEnd",addAuthority);
					}	
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
	
	var in_name = document.getElementById('in_name').value;
	
	var HavePerson=[];
		$("[name=addPersonTitle]").each(function(){
	    HavePerson.push($(this).val());
  	});
  	var HavePersonList = HavePerson.join();
  	
  	var HaveAuthority=[];
		$("[name=addAuthorityTitle]").each(function(){
		HaveAuthority.push($(this).val());
  	});
  	var HaveAuthorityList = HaveAuthority.join();

	$
			.ajax({
				url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_GroupInfo",
				data : {
					state : 0,
					name : in_name,
					person_dbid:HavePersonList,
					function_dbid:HaveAuthorityList
					
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

	
	closeAddMembergroup();
}
	function validateGroupN() {
	    var IN = $("#in_name").val();
	    
		var HaveAuthority=[];
		$("[name=addAuthorityTitle]").each(function(){
		HaveAuthority.push($(this).val());
		});
	  	var HaveAuthorityList = HaveAuthority.join();

	    if (!IN || IN == '' ) {
	        toastr.error("請輸入部門名稱");
	        return false;
	    }
	    if (IN !='' && isValidNumber(IN)) {
	        toastr.error("名稱請輸入中文或英文");
	        return false;
	    }
	    
	    if (HaveAuthorityList=="") {
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

		jump(data,tabledata);

		closeAllHrContent();
		$("#groupContent").show();
		$("#editMembergroupContent").show();

		$("button.editMember").show();
		$("button.editMember").removeClass("btn-success");
		$("button.editMember").addClass("btn-primary");
	}


	//更新返回頁面
	function backUpdateView() {
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
//	 	   if (!validateGroupU()) {
//	            return;
//	        }
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
	    var HaveAuthority=[];
		$("[name=addAuthorityTitle]").each(function(){
		HaveAuthority.push($(this).val());
		});
	  	var HaveAuthorityList = HaveAuthority.join();

	    if (!IN || IN == '' ) {
	        toastr.error("請輸入部門名稱");
	        return false;
	    }
	    if (IN !='' && isValidNumber(IN)) {
	        toastr.error("名稱請輸入中文或英文");
	        return false;
	    }
	    if (HaveAuthorityList=="") {
	        toastr.error("請選擇權限");
	        return false;
	    }
		   return true;
	}
	function isValidNumber(IN) {
		var re = /^[0-9]*$/;		
		return re.test(IN);
	}
	
	//Insert人員對話視窗
	function InsertPersonButton() {
		$("#InsertPersonButton").trigger("click");
		InsertPerson();

	}
	function InsertAuthorityButton() {
		$("#InsertAuthorityButton").trigger("click");
		InsertAuthority();
	}

	//Update人員對話視窗
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
	//編輯部門名稱視窗
	function changeGroupNameButton() {
		var selected=[];
		  $("[name=group0]:checkbox:checked").each(function(){
		    selected.push($(this).val());
		    });
			  var groupDBID_list = selected.join();
			  var List = groupDBID_list.split(',');
			  document.getElementById('changeName').value = List[1];
			  
			  var count = List.length/2;
			  if(count==1){
				  $("#changeGroupNameButton").trigger("click");
			  }else if(count==0.5){
				  toastr.error("請選擇更新名稱的項目");
			  }else{
				  toastr.error("只能選擇一項更新名稱");
			  }
	}


	//編輯更名
	function editGroupName() {
		
		var selected=[];
	  $("[name=group0]:checkbox:checked").each(function(){
	    selected.push($(this).val());
	    });
		  var groupDBID_list = selected.join();
		  var List = groupDBID_list.split(',');

		var changeDbid = List[0];
		var changeName = document.getElementById('changeName').value;

		$
				.ajax({
					url :"${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_GroupInfoByName",
					data : {
						name:changeName,
						dbid:changeDbid
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



	//停用對話視窗
	function confirmBangroup() {
		$("#confirmBanButtongroup").trigger("click");
	}

	function GroupDelete(message) {
//			var deletedbid = document.getElementById('deletedbid_GroupDelete').value;
		var DbidList = ""
		var selected=[];
	    $("[name=group0]:checkbox:checked").each(function(){
	      selected.push($(this).val());
	      });
		  var checkBox_list = selected.join();
		  var List = checkBox_list.split(',');
		  
		  var deleteDbid="";
		  for (var i=0;i< List.length;i++ ) {
			  if(i%2==0   ){
				  deleteDbid+=List[i]+",";
			  }
		  }
		  var groupDBID_list = deleteDbid.slice(0,-1);
// 		  alert(groupDBID_list);

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



	//新增使用
	function InsertPerson() {
		var DeletePerson=[];
	    $("[name=addPersonTitle]:checkbox:checked").each(function(){
	    	DeletePerson.push($(this).val());
	      });
	 
		var DeletePersonList = DeletePerson.join();

		var List = DeletePersonList.split(',');
		if(DeletePersonList==""){
		}else{
			for (var i in List ) {
				var arrDbid = document.getElementById("1addPerson"+List[i]).value;
				var arrName = document.getElementById("2addPerson"+List[i]).value;
				var arrAccount = document.getElementById("3addPerson"+List[i]).value;
				var arrEmployeeId = document.getElementById("4addPerson"+List[i]).value;
				var HavePerson = "<tr id='deleteHavePerson"+arrDbid+"'><td><input type='checkbox' name='deletePersonTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><td>"+arrAccount+"</td><td>"+arrEmployeeId+"</td><input type='hidden' id='1deleteHavePerson"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2deleteHavePerson"+arrDbid+"' value='"+arrName+"'><input type='hidden' id='3deleteHavePerson"+arrDbid+"' value='"+arrAccount+"'><input type='hidden' id='4deleteHavePerson"+arrDbid+"' value='"+arrEmployeeId+"'></tr>"
				document.getElementById("DeletePerson").insertAdjacentHTML("BeforeEnd",HavePerson);	
				$('#addPerson'+List[i]).remove();
			}
		}
	}

	function BackInsertPerson() {
		var BackInsertPerson=[];
	    $("[name=deletePersonTitle]:checkbox:checked").each(function(){
	    	BackInsertPerson.push($(this).val());
	      });
	 
		var BackInsertPersonList = BackInsertPerson.join();
		var List = BackInsertPersonList.split(',');
		if(BackInsertPersonList==""){
		}else{
		for (var i in List ) {
				var arrDbid = document.getElementById("1deleteHavePerson"+List[i]).value;
				var arrName = document.getElementById("2deleteHavePerson"+List[i]).value;
				var arrAccount = document.getElementById("3deleteHavePerson"+List[i]).value;
				var arrEmployeeId = document.getElementById("4deleteHavePerson"+List[i]).value;
				var HavePerson = "<tr id='addPerson"+arrDbid+"'><td><input type='checkbox' name='addPersonTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><td>"+arrAccount+"</td><td>"+arrEmployeeId+"</td><input type='hidden' id='1addPerson"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2addPerson"+arrDbid+"' value='"+arrName+"'><input type='hidden' id='3addPerson"+arrDbid+"' value='"+arrAccount+"'><input type='hidden' id='4addPerson"+arrDbid+"' value='"+arrEmployeeId+"'></tr>"
				document.getElementById("addPerson").insertAdjacentHTML("BeforeEnd",HavePerson);	
				$('#deleteHavePerson'+List[i]).remove();
			}
		}
	}


	function InsertAuthority() {
		var InsertAuthority=[];
	    $("[name=addAuthorityTitle]:checkbox:checked").each(function(){
	    	InsertAuthority.push($(this).val());
	      });
	 
		var InsertAuthorityList = InsertAuthority.join();
		var List = InsertAuthorityList.split(',');
		if(InsertAuthorityList==""){
		}else{
		for (var i in List ) {
				var arrDbid = document.getElementById("1addAuthority"+List[i]).value;
				var arrName = document.getElementById("2addAuthority"+List[i]).value;
				var arrDescription = document.getElementById("3addAuthority"+List[i]).value;
				var HaveAuthority = "<tr id='deleteHaveAuthority"+arrDbid+"'><td><input type='checkbox' name='deleteAuthorityTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><td>"+arrDescription+"</td><input type='hidden' id='1deleteHaveAuthority"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2deleteHaveAuthority"+arrDbid+"' value='"+arrName+"'><input type='hidden' id='3deleteHaveAuthority"+arrDbid+"' value='"+arrDescription+"'></tr>"
				document.getElementById("DeleteAuthority").insertAdjacentHTML("BeforeEnd",HaveAuthority);	
				$('#addAuthority'+List[i]).remove();
			}
		}
	}

	function BackInsertAuthority() {
		var BackInsertAuthority=[];
	    $("[name=deleteAuthorityTitle]:checkbox:checked").each(function(){
	    	BackInsertAuthority.push($(this).val());
	      });
	 
		var BackInsertAuthorityList = BackInsertAuthority.join();
		var List = BackInsertAuthorityList.split(',');
		if(BackInsertAuthorityList==""){
		}else{
		for (var i in List ) {
			var arrDbid = document.getElementById("1deleteHaveAuthority"+List[i]).value;
			var arrName = document.getElementById("2deleteHaveAuthority"+List[i]).value;
			var arrDescription = document.getElementById("3deleteHaveAuthority"+List[i]).value;
			var HaveAuthority = "<tr id='addAuthority"+arrDbid+"'><td><input type='checkbox' name='addAuthorityTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><td>"+arrDescription+"</td><input type='hidden' id='1addAuthority"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2addAuthority"+arrDbid+"' value='"+arrName+"'><input type='hidden' id='3addAuthority"+arrDbid+"' value='"+arrDescription+"'></tr>"

			document.getElementById("addAuthority").insertAdjacentHTML("BeforeEnd",HaveAuthority);	
			$('#deleteHaveAuthority'+List[i]).remove();
			}
		}
	}




	//更新使用
	function addUpdatePerson() {
		var NotHavePerson=[];
	    $("[name=NotHavePersonTitle]:checkbox:checked").each(function(){
	    	NotHavePerson.push($(this).val());
	      });
	 
		var NotHavePersonList = NotHavePerson.join();
		var List = NotHavePersonList.split(',');
		if(NotHavePersonList==""){
		}else{
		for (var i in List ) {
				var arrDbid = document.getElementById("1NotHavePerson"+List[i]).value;
				var arrName = document.getElementById("2NotHavePerson"+List[i]).value;
				var arrAccount = document.getElementById("3NotHavePerson"+List[i]).value;
				var arrEmployeeId = document.getElementById("4NotHavePerson"+List[i]).value;		

				var HavePerson = "<tr id='removeHavePerson"+arrDbid+"'><td><input type='checkbox' name='HavePersonTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><td>"+arrAccount+"</td><td>"+arrEmployeeId+"</td><input type='hidden' id='1HavePerson"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2HavePerson"+arrDbid+"' value='"+arrName+"'><input type='hidden' id='3HavePerson"+arrDbid+"' value='"+arrAccount+"'><input type='hidden' id='4HavePerson"+arrDbid+"' value='"+arrEmployeeId+"'></tr>"
				document.getElementById("HavePerson").insertAdjacentHTML("BeforeEnd",HavePerson);	
				$('#removePerson'+List[i]).remove();
			}
		}
		sendEditMembergroup();
		
	}

	function addUpdateAuthority() {
		var NotHaveAuthority=[];
	    $("[name=NotHaveAuthorityTitle]:checkbox:checked").each(function(){
	    	NotHaveAuthority.push($(this).val());
	      });
	 
		var NotHaveAuthorityList = NotHaveAuthority.join();
		var List = NotHaveAuthorityList.split(',');
		if(NotHaveAuthorityList==""){
		}else{
		for (var i in List ) {
				var arrDbid = document.getElementById("1NotHaveAuthority"+List[i]).value;
				var arrName = document.getElementById("2NotHaveAuthority"+List[i]).value;
				var arrDescription = document.getElementById("3NotHaveAuthority"+List[i]).value;

				var HaveAuthority = "<tr id='removeHaveAuthority"+arrDbid+"'><td><input type='checkbox' name='HaveAuthorityTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><td>"+arrDescription+"</td><input type='hidden' id='1HaveAuthority"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2HaveAuthority"+arrDbid+"' value='"+arrName+"'><input type='hidden' id='3HaveAuthority"+arrDbid+"' value='"+arrDescription+"'></tr>"

				document.getElementById("HaveAuthority").insertAdjacentHTML("BeforeEnd",HaveAuthority);	
				$('#removeAuthority'+List[i]).remove();
			}
		}
		sendEditMembergroup();
	}

	function backPerson() {
		var HavePerson=[];
	    $("[name=HavePersonTitle]:checkbox:checked").each(function(){
	    	HavePerson.push($(this).val());
	      });
	 
		var HavePersonList = HavePerson.join();
		var List = HavePersonList.split(',');
		if(HavePersonList==""){
		}else{
		for (var i in List ) {
				var arrDbid = document.getElementById("1HavePerson"+List[i]).value;
				var arrName = document.getElementById("2HavePerson"+List[i]).value;
				var arrAccount = document.getElementById("3HavePerson"+List[i]).value;
				var arrEmployeeId = document.getElementById("4HavePerson"+List[i]).value;		

				var NotHavePerson = "<tr id='removePerson"+arrDbid+"'><td><input type='checkbox' name='NotHavePersonTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><td>"+arrAccount+"</td><td>"+arrEmployeeId+"</td><input type='hidden' id='1NotHavePerson"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2NotHavePerson"+arrDbid+"' value='"+arrName+"'><input type='hidden' id='3NotHavePerson"+arrDbid+"' value='"+arrAccount+"'><input type='hidden' id='4NotHavePerson"+arrDbid+"' value='"+arrEmployeeId+"'></tr>"

				document.getElementById("NotHavePerson").insertAdjacentHTML("BeforeEnd",NotHavePerson);	
				$('#removeHavePerson'+List[i]).remove();
			}
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
		if(HaveAuthorityList==""){
		}else{
		for (var i in List ) {
				var arrDbid = document.getElementById("1HaveAuthority"+List[i]).value;
				var arrName = document.getElementById("2HaveAuthority"+List[i]).value;
				var arrDescription = document.getElementById("3HaveAuthority"+List[i]).value;

				var NotHaveAuthority = "<tr id='removeAuthority"+arrDbid+"' ><td><input type='checkbox' name='NotHaveAuthorityTitle' class='i-checks' value='"+arrDbid+"'></td><td>"+arrName+"</td><td>"+arrDescription+"</td><input type='hidden' id='1NotHaveAuthority"+arrDbid+"' value='"+arrDbid+"'><input type='hidden' id='2NotHaveAuthority"+arrDbid+"' value='"+arrName+"'><input type='hidden' id='3NotHaveAuthority"+arrDbid+"' value='"+arrDescription+"'></tr>"
				document.getElementById("NotHaveAuthority").insertAdjacentHTML("BeforeEnd",NotHaveAuthority);	
				$('#removeHaveAuthority'+List[i]).remove();
			}
		}
		sendEditMembergroup();
	}
</script>
<!-- =====================================Group END================================================================= -->

<!-- =====================================Commonlink================================================================= -->
<script>
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
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Select_commonlink",
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
// 			var nodeUSER = document.getElementById('nodeUSER').value;
			var color = document.getElementById('insert_color').value;
			var myMap = new Map();
			$
					.ajax({
						url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_commonlink",
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
// 			var nodeUSER = document.getElementById('nodeUSER').value;
			var color = document.getElementById('insert_color').value;
			var myMap = new Map();
			$
					.ajax({
						url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_commonlink",
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
			url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Select_commonlink",
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
						//.insertAdjacentHTML("BeforeEnd", str);
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
// 			var nodeUSERu = document.getElementById('nodeUSERu').value;
			var color = document.getElementById('update_color').value;
			var myMap = new Map();
			$
					.ajax({
						url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_commonlink",
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
	//
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
<!-- 
	Commonlink=END 
					-->
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
		$("#ARLoading").show();
		$("#agentreason0").hide();
		$("#ARul").hide();
		
		
		$("#agentreason0All").prop("checked", false);
		$("#agentreason1All").prop("checked", false);
		
		
		$("#manageAgentreasonTable tbody tr").empty();
		$("#banAgentreasonTable tboby tr").empty();
		$
				.ajax({
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Select_agentreason",
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
		$
				.ajax({
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Insert_agentreason",
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
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Update_agentreason",
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
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_agentreason",
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
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_agentreason",
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
// 		var dbid = document.getElementById('AgentReasondbid').value;
		$
				.ajax({
					url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/LogicDelete_agentreason",
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
<!-- 
		Agentreason END
							-->
<!--=====================Activity開始===========================-->
<script>

var chechbox = "";
var moveActivityPaerntId="";
var moveActivityParents = "";
var moveActivityId="";

//一開始載入Activity
function showActivity() {
	$("button.editMember").hide();
	closeAllHrContent();
	$("#ADContent").show();
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
	$("#ADContent").show();
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

// 					OnClickTdActivity();
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

// function OnClickTdActivity() {
// 	$("#ActivityTable tbody tr td").on("click", function() {
// 		var text = $(this).text();
// 		if (text && text != "") {
// 			showEditMembercomm();
// 		}
// 	});
// }



//新增Root畫面
function showAddRoot() {
	$('#addRootName').empty();
	$('#ActivityView').hide();

	closeAllHrContent();
	$("#ADContent").show();
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
			$("#ADContent").show();
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
	$("#showAddRoot").hide();
	
	$("#ADContent").show();
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
	$("#addActivity").hide();
	
	$("#ADContent").show();
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
	$("#ADContent").show();

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
	$("#ADContent").show();

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
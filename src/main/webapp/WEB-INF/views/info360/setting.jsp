<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <title>「人員設定」頁面</title>
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
        <style>
            label.required:after {content: " *"; color: red;}
            .red { color:#FF5511 !important; }
       		.yellow { color:#FFBB00 !important; }
       		.blue { color:#0000CC !important; }
       		.black { color:#666666 !important; }
        </style>
    </head>
    <body class="gray-bg">
        <div class="widget">
            <div class="col-lg-2 col-sm-3">
                <div class="panel panel-success" style="height:780px;">
                    <div class="panel-heading">
                        <h3><i class="fa fa-angle-double-right"></i>  設定</h3>
                    </div>
                    <div class="panel-body">
                        <div class="ibox">
                            <div class="fa-tree-list">
                                <ul style="list-style-type:none;margin-left:0px;">
                                    <li>
                                        <span>
                                            <i class="fa fa-fw fa-folder-open"></i>
                                            使用者管理
                                        </span>
                                        <ul style="list-style-type:none;margin-left:20px;">
                                            <li onclick=""><i class="fa fa-fw fa-file-text-o"></i><a onclick="showPerson()">人員管理</a></li>
                                            <li onclick=""><i class="fa fa-fw fa-file-text-o"></i><a onclick="showGroup()">部門權限管理</a></li>
                                            <li onclick=""><i class="fa fa-fw fa-file-text-o"></i><a onclick="showAgentreason()">值機狀態管理</a></li>
                                        </ul>
                                    </li>
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
                                    <li>
                                        <span>
                                            <i class="fa fa-fw fa-folder-open"></i>
                                            案件管理
                                        </span>

                                         <ul style="list-style-type:none;margin-left:20px;">
                                            <li><i class="fa fa-fw fa-file-text-o"></i><a onclick="showCommonlink()">常用連結管理</a></li>
                                            <li><i class="fa fa-fw fa-file-text-o"></i><a onclick="showActivityMenu()">服務代碼清單管理</a></li>
                                            <li><i class="fa fa-fw fa-file-text-o"></i><a onclick="showActivityGroup()">服務代碼群組管理</a></li>
                                            <li><i class="fa fa-fw fa-file-text-o"></i><a onclick="showActivityData()">服務代碼管理</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-10 col-sm-9" id="person">
                <div class="panel panel-success" style="height:780px;">
                    <!-- 人員管理切換頁籤Start -->
                    <div id="hrTabControlButton" style="margin:1px 0px 0px 1px;">
                        <button class="btn-sm btn-primary manage" onclick="showManage()"><i class="fa fa-fw fa-user"></i>人員管理</button>
                        <button class="btn-sm btn-success ban" onclick="showBan()"><i class="fa fa-fw fa-user"></i>停用列表</button>
                        <button class="btn-sm btn-success addMember" style="display:none;"><span onclick="showAddMember()">新增人員</span> <i class="fa fa-times" onclick="closeAddMember()"></i></button>
                        <button class="btn-sm btn-success editMember" style="display:none;"><span onclick="showEditMember()">更新人員</span> <i class="fa fa-times" onclick="closeEditMember()"></i></button>
                    </div>
                    <!-- 人員管理切換頁籤End -->

                    <!-- 設定頁面內容頁 Start-->
                    <div class="panel-body" id="settingContent">
                     
                        <div id="manageContent" >
                            <div>
                                <ul class="pagination">
                                    <li onclick="showAddMember()"><a href="#"><i class="fa fa-fw fa-plus"></i></a></li>
                                    <li onclick="unlockAccount()"><a href="#"><i class="fa fa-fw fa-unlock-alt"></i></a></li>
                                    <li onclick="confirmBan()"><a href="#"><i class="fa fa-fw fa-ban"></i></a></li>
                                </ul>

<!--                                 <ul class="pagination" style="float:right;" > -->
<!--                                     <li> -->
<!--                                         <input type="text" id="manageSearch" placeholder="搜索" -->
<!--                                                style="background-color: #FFFFFF; -->
<!-- /*                                                       border: 1px solid #DDDDDD; */ -->
<!-- /*                                                       color: inherit; */ -->
<!-- /*                                                       float: left; */ -->
<!-- /*                                                       line-height: 1.42857; */ -->
<!-- /*                                                       margin-left: -1px; */ -->
<!-- /*                                                       padding: 4px 10px; */ -->
<!-- /*                                                       position: relative; */ -->
<!--                                                       text-decoration: none;"> -->
<!--                                     </li> -->

<!--                                     <li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li> -->
<!--                                 </ul> -->
                            </div>

                            <div class="row ibox" id="person00">
                                <div class="col-lg-12 col-md-12" id="person0">
                                    <table class="table table-bordered table-hover" id="manageTable_person"
                                   	data-pagination="true"
									data-page-list="[5, 10, 20, 50, 100, 200]"
									data-search="true"
									data-url="x" >
                                        <thead>
                                           <tr >
					 							<th id="user_name" data-sortable="true"></th>		 	
			 		 							<th id="emailaddress" data-sortable="true"></th>
			 		 							<th id="state" data-sortable="true"></th>
			 		 							<th id="account" data-sortable="true"></th>
			 		 							<th id="employee_id" data-sortable="true"></th>
			 		 							<th id="dn" data-sortable="true"></th>
			 		 							<th id="dbid" data-sortable="true"></th>
											</tr>
                                        </thead>
                                        <tbody>
                                        
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div id="banContent" style="display:none;">
                            <div>
                                <ul class="pagination">
                                    <li onclick="showAddMember()"><a href="#"><i class="fa fa-fw fa-plus"></i></a></li>
                                    <li onclick="unlockAccount()"><a href="#"><i class="fa fa-fw fa-unlock-alt"></i></a></li>
                                    <li onclick="confirmBan()"><a href="#"><i class="fa fa-fw fa-ban"></i></a></li>
                                </ul>

<!--                                 <ul class="pagination" style="float:right;" > -->
<!--                                     <li> -->
<!--                                         <input type="text" id="banSearch" placeholder="搜索" -->
<!--                                                style="background-color: #FFFFFF; -->
<!-- /*                                                       border: 1px solid #DDDDDD; */ -->
<!-- /*                                                       color: inherit; */ -->
<!-- /*                                                       float: left; */ -->
<!-- /*                                                       line-height: 1.42857; */ -->
<!-- /*                                                       margin-left: -1px; */ -->
<!-- /*                                                       padding: 4px 10px; */ -->
<!-- /*                                                       position: relative; */ -->
<!--                                                       text-decoration: none;"> -->
<!--                                     </li> -->

<!--                                     <li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li> -->
<!--                                 </ul> -->
                            </div>

                            <div class="row ibox" id="person11">
                                <div class="col-lg-12 col-md-12" id="person1">
                                    <table class="table table-bordered table-hover" id="banTable_person"
                                    data-pagination="true"
                                    data-search="true"
									data-page-list="[5, 10, 20, 50, 100, 200]" 
									data-url="x"
                                    >
                                        <thead>
                                            <tr>
                                                <th class="no-sort"><input type="checkbox" id="banCheck"></th>
                                                <th>帳號</th>
                                                <th>姓名</th>
                                                <th>員工編號</th>
                                                <th>分機號碼</th>
                                                <th>Email</th>
                                                <th>狀態</th>
                                                <th>編號</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                 
<!-- 新增  -->
                         <div id="addMemberContent" style="display:none;">
                            <div class="widget">
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label ">帳號</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="inputAccount" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputName" class="col-sm-2 control-label ">姓名</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="inputName" placeholder="">
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label for="inputLastName" class="col-sm-2 control-label">姓氏</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="inputLastName" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputFirstName" class="col-sm-2 control-label">名字</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="inputFirstName" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputEmployNumber" class="col-sm-2 control-label">員工編號</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="inputEmployNumber" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputPhoneNumber" class="col-sm-2 control-label">分機號碼</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="inputPhoneNumber" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputPassword" class="col-sm-2 control-label ">密碼</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="inputPassword" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputConfirmPassword" class="col-sm-2 control-label ">確認密碼</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="inputConfirmPassword" placeholder="">
                                        </div>
                                    </div>


                                    <div class="form-group col-sm-12">
                                        <label for="inputEmail" class="col-sm-1 control-label">Email</label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" id="inputEmail" placeholder="">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group col-sm-12">
                                        <label for="inputDepartment" class="col-sm-1 control-label">部門</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="inputDepartment" placeholder="">
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
                        <div id="editMemberContent" style="display:none;">
                            <div class="widget">
<!--                                 <form class="form-horizontal"> -->
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label  ">帳號</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="updateAccount"  disabled>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputName" class="col-sm-2 control-label ">姓名</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="updateName" placeholder="">
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label for="inputLastName" class="col-sm-2 control-label">姓氏</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="updateLastName" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputFirstName" class="col-sm-2 control-label">名字</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="updateFirstName" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputEmployNumber" class="col-sm-2 control-label">員工編號</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="updateEmployNumber" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputPhoneNumber" class="col-sm-2 control-label">分機號碼</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="updatePhoneNumber" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputPassword" class="col-sm-2 control-label ">密碼</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="updatePassword" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputConfirmPassword" class="col-sm-2 control-label ">確認密碼</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="updateConfirmPassword" placeholder="">
                                        </div>
                                    </div>


                                    <div class="form-group col-sm-12">
                                        <label for="inputEmail" class="col-sm-1 control-label">Email</label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" id="updateEmail" placeholder="">
                                        </div>
                                    </div>
                                   
                                    <div class="form-group col-sm-6">
                                        <label for="inputDepartment" class="col-sm-2 control-label">部門</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="updateDepartment" placeholder="">
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
          <div class="col-lg-10 col-sm-9"  id="groupContent" style="display:none;">
                <div class="panel panel-success" style="height:780px;">
                    <!-- 部門管理切換頁籤Start -->
                    <div id="hrTabControlButton" style="margin:1px 0px 0px 1px;">
                        <button class="btn-sm btn-primary manage" onclick="showManage_group()"><i class="fa fa-fw fa-user"></i>部門管理</button>
                        <button class="btn-sm btn-success ban" onclick="showBan_group()"><i class="fa fa-fw fa-user"></i>停用列表</button>
                        <button class="btn-sm btn-success addMember" style="display:none;"><span onclick="showAddMembergroup()">新增部門</span> <i class="fa fa-times" onclick="closeAddMembergroup()"></i></button>
                        <button class="btn-sm btn-success editMember" style="display:none;"><span onclick="showEditMembergroup()">更新部門</span> <i class="fa fa-times" onclick="closeEditMembergroup()"></i></button>
                    </div>
                    <!-- 部門管理切換頁籤End -->

                    <!-- 設定頁面內容頁 Start-->
                    <div class="panel-body" id="settingContent">
                        <div id="managegroupContent" style="display:none;">
                            <div>
                                <ul class="pagination">
                                    <li onclick="showAddMembergroup()"><a href="#"><i class="fa fa-fw fa-plus"></i></a></li>
                                    <li onclick="unlockAccountgroup()"><a href="#"><i class="fa fa-fw fa-unlock-alt"></i></a></li>
                                    <li onclick="confirmBangroup()"><a href="#"><i class="fa fa-fw fa-ban"></i></a></li>
                                </ul>

<!--                                 <ul class="pagination" style="float:right;" > -->
<!--                                     <li> -->
<!--                                         <input type="text" id="manageSearch" placeholder="搜索" -->
<!--                                                style="background-color: #FFFFFF; -->
<!-- /*                                                       border: 1px solid #DDDDDD; */ -->
<!-- /*                                                       color: inherit; */ -->
<!-- /*                                                       float: left; */ -->
<!-- /*                                                       line-height: 1.42857; */ -->
<!-- /*                                                       margin-left: -1px; */ -->
<!-- /*                                                       padding: 4px 10px; */ -->
<!-- /*                                                       position: relative; */ -->
<!--                                                       text-decoration: none;"> -->
<!--                                     </li> -->

<!--                                     <li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li> -->
<!--                                 </ul> -->
                            </div>

                            <div class="row ibox" id="group00">
                                <div class="col-lg-12 col-md-12" id="group0">
                                    <table class="table table-bordered table-hover" id="managegroupTable">
                                        <thead>
                                         	<tr >
												<th id="name" data-sortable="true"></th>
												<th id="state" data-sortable="true"></th>
												<th id="dbid" data-sortable="true"></th>
											</tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div id="bangroupContent" style="display:none;">
                            <div>
                                <ul class="pagination">
                                    <li onclick="showAddMembergroup()"><a href="#"><i class="fa fa-fw fa-plus"></i></a></li>
                                    <li onclick="unlockAccountgroup()"><a href="#"><i class="fa fa-fw fa-unlock-alt"></i></a></li>
                                    <li onclick="confirmBangroup()"><a href="#"><i class="fa fa-fw fa-ban"></i></a></li>
                                </ul>

<!--                                 <ul class="pagination" style="float:right;" > -->
<!--                                     <li> -->
<!--                                         <input type="text" id="banSearch" placeholder="搜索" -->
<!--                                                style="background-color: #FFFFFF; -->
<!-- /*                                                       border: 1px solid #DDDDDD; */ -->
<!-- /*                                                       color: inherit; */ -->
<!-- /*                                                       float: left; */ -->
<!-- /*                                                       line-height: 1.42857; */ -->
<!-- /*                                                       margin-left: -1px; */ -->
<!-- /*                                                       padding: 4px 10px; */ -->
<!-- /*                                                       position: relative; */ -->
<!--                                                       text-decoration: none;"> -->
<!--                                     </li> -->

<!--                                     <li><a href="#"><i class="fa fa-fw fa-refresh"></i></a></li> -->
<!--                                 </ul> -->
                            </div>

                            <div class="row ibox" id="group11">
                                <div class="col-lg-12 col-md-12" id="group1">
                                    <table class="table table-bordered table-hover" id="bangroupTable">
                                        <thead>
                                            <tr >
												<th id="name" data-sortable="true"></th>
												<th id="state" data-sortable="true"></th>
												<th id="dbid" data-sortable="true"></th>
											</tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
<!-- 新增  -->
                         <div id="addMembergroupContent" style="display:none;">
                            <div class="widget">
                                    <div class="form-group col-sm-12">
                                        <label for="inputAccount" class="col-sm-2 control-label required">部門名稱:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="in_name" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-12">
                                        <label for="" class="col-sm-2 control-label">相關人員ID:</label>
                                        <div class="col-sm-8">
                                            <input type="" class="form-control" id="in_person_dbid" placeholder="">
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
                        <div id="editMembergroupContent" style="display:none;">
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
                                            <input type="text" class="form-control" id="up_name" placeholder="">
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
                                            <button class="btn btn-default" onclick="closeEditMembergroup()">取消</button>
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
   <div class="col-lg-10 col-sm-9" id="AgentreasonContent" style="display:none;">
                <div class="panel panel-success" style="height:780px;">
                    <!-- 值機管理切換頁籤Start -->
                    <div id="hrTabControlButton" style="margin:1px 0px 0px 1px;">
                        <button class="btn-sm btn-primary manage" onclick="showManage_Agentreason()"><i class="fa fa-fw fa-user"></i>值機管理</button>
                        <button class="btn-sm btn-success ban" onclick="showBan_Agentreason()"><i class="fa fa-fw fa-user"></i>停用列表</button>
                        <button class="btn-sm btn-success addMember" style="display:none;"><span onclick="showAddMemberAGR()">新增值機狀態</span> <i class="fa fa-times" onclick="closeAddMemberAGR()"></i></button>
                        <button class="btn-sm btn-success editMember" style="display:none;"><span onclick="showEditMemberAgentreason()">更新值機狀態</span> <i class="fa fa-times" onclick="closeEditMemberAgentreason()"></i></button>
                    </div>
                    <!-- 值機管理切換頁籤End -->

                    <!-- 設定頁面內容頁 Start-->
                    <div class="panel-body" id="settingContent">
                        <div id="manageAgentreasonContent" style="display:none;">
                            <div>
                                <ul class="pagination">
                                    <li onclick="showAddMemberAGR()"><a href="#"><i class="fa fa-fw fa-plus"></i></a></li>
                                    <li onclick="unlockAccountAgentreason()"><a href="#"><i class="fa fa-fw fa-unlock-alt"></i></a></li>
                                    <li onclick="confirmBanAgentreason()"><a href="#"><i class="fa fa-fw fa-ban"></i></a></li>
                                </ul>

                            </div>

                            <div class="row ibox" id="agentreason00">
                                <div class="col-lg-12 col-md-12" id="agentreason0">
                                    <table class="table table-bordered table-hover" id="manageAgentreasonTable">
                                       
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div id="banAgentreasonContent" style="display:none;">
                            <div>
                                <ul class="pagination">
                                    <li onclick="showAddMember()"><a href="#"><i class="fa fa-fw fa-plus"></i></a></li>
                                    <li onclick="unlockAccount()"><a href="#"><i class="fa fa-fw fa-unlock-alt"></i></a></li>
                                    <li onclick="confirmBan()"><a href="#"><i class="fa fa-fw fa-ban"></i></a></li>
                                </ul>

                            </div>

                            <div class="row ibox" id="agentreason11">
                                <div class="col-lg-12 col-md-12" id="agentreason1">
                                    <table class="table table-bordered table-hover" id="banAgentreasonTable">
                                      
                                    </table>
                                </div>
                            </div>
                        </div>
<!-- 新增  -->
                         <div id="addMemberAGRContent" style="display:none;">
                            <div class="widget">
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label">狀態名:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="Insert_statusname" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label">狀態名_CN:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="Insert_statusname_cn" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label">狀態名_EN:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="Insert_statusname_en" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label">狀態名_TW:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="Insert_statusname_tw" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label">告警顏色:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="Insert_alarmcolor" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label">告警時間:</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="Insert_alarmduration" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label">註解:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="Insert_description" placeholder="">
                                        </div>
                                    </div>
                                     <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label">建立者:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="Insert_createuserid" placeholder="">
                                        </div>
                                    </div>
                             
                                    <div class="form-group">
                                        <div class="col-sm-offset-9 col-sm-3">
                                            <button class="btn btn-primary" onclick="sendAddMemberAgentreason()">儲存</button>
                                            <button class="btn btn-default" onclick="closeAddMemberAgentreason()" >取消</button>
                                        </div>
                                    </div>
                            </div>
                        </div>
           <!-- 新增 END -->
			<!-- 更新  -->
                        <div id="editMemberAGRContent" style="display:none;">
                            <div class="widget">
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label required">編碼:</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="Update_id" >
                                        </div>
                                    </div>			
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label">告警顏色:</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="alarmcolor" >
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputName" class="col-sm-2 control-label">告警時間:</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="alarmduration" placeholder="">
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label for="inputLastName" class="col-sm-2 control-label">註解:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="description" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputFirstName" class="col-sm-2 control-label">狀態名:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="statusname" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputEmployNumber" class="col-sm-2 control-label">狀態名_CN:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="statusname_cn" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputPhoneNumber" class="col-sm-2 control-label">狀態名_EN:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="statusname_en" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputPassword" class="col-sm-2 control-label">狀態名_TW:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="statusname_tw" placeholder="">
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
                                            <button class="btn btn-primary" onclick="sendEditMemberAgentreason()">更新</button>
                                            <button class="btn btn-default" onclick="closeEditMemberAgentreason()">取消</button>
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
            <div class="col-lg-10 col-sm-9" id="CommonlinkContent" style="display:none;">
                <div class="panel panel-success" style="height:780px;">
                    <!-- 常用連結管理切換頁籤Start -->
                    <div id="hrTabControlButton" style="margin:1px 0px 0px 1px;">
                        <button class="btn-sm btn-primary manage" onclick="showCommonlink()"><i class="fa fa-fw fa-user"></i>常用連結管理</button>
<!--                         <button class="btn-sm btn-success ban" onclick="showBan()"><i class="fa fa-fw fa-user"></i>停用列表</button> -->
                        <button class="btn-sm btn-success addMember" style="display:none;"><span onclick="showAddMembercomm()">新增常用連結</span> <i class="fa fa-times" onclick="closeAddMembercomm()"></i></button>
                        <button class="btn-sm btn-success editMember" style="display:none;"><span onclick="showEditMember()">更新常用連結</span> <i class="fa fa-times" onclick="closeEditMembercomm()"></i></button>
                    </div>
                    <!-- 常用連結管理切換頁籤End -->

                    <!-- 設定頁面內容頁 Start-->
                    <div class="panel-body" id="settingContent">
                        <div id="0Commonlink" style="display:none;">
                            <div>
                                <ul class="pagination">
                                    <li onclick="showAddMembercomm()"><a href="#"><i class="fa fa-fw fa-plus"></i></a></li>
                                    <li onclick="unlockAccountcomm()"><a href="#"><i class="fa fa-fw fa-unlock-alt"></i></a></li>
                                    <li onclick="confirmBancomm()"><a href="#"><i class="fa fa-fw fa-ban"></i></a></li>
                                </ul>
                            </div>

                            <div class="row ibox">
                            <div class="col-lg-3 col-md-3">                          
								<div id="tree" ></div>
								</div>
                            
                                <div class="col-lg-8 col-md-8" id="manageTable_div" style="display:none;">
                                
      	 							<table class="table table-bordered table-hover" id="manageTablecomm">
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
                         <div id="addMemberContentcomm" style="display:none;">
                            <div class="widget">
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-3 control-label">常用連結名稱:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="nodeNAME" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputName" class="col-sm-3 control-label">連結URL:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="nodeURL" placeholder="">
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label for="inputLastName" class="col-sm-3 control-label">建立者名稱:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="nodeUSER" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputFirstName" class="col-sm-3 control-label">上層節點:</label>
                                        <div class="col-sm-8">
                                            <select  id="nodeLINKlist">	
      										</select><br>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputEmployNumber" class="col-sm-3 control-label">顏色:</label>
                                        <div class="col-sm-8">
                                            <select  id="insert_color">
      													</select>
                                        </div>
                                    </div>
                                   
                                    <div class="form-group">
                                        <div class="col-sm-offset-9 col-sm-3">
                                            <button class="btn btn-primary" onclick="sendAddMembercomm()">儲存</button>
                                            <button class="btn btn-default"onclick="closeAddMembercomm()">取消</button>
                                        </div>
                                    </div>
                            </div>
                        </div>
           <!-- 新增 END -->
			<!-- 更新  -->
                        <div id="editMemberContentcomm" style="display:none;">
                            <div class="widget">
<!--                                 <form class="form-horizontal"> -->
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-3 control-label">常用連結名稱:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="nodeNAMEu" >
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputName" class="col-sm-3 control-label">連結URL:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="nodeURLu" placeholder="">
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label for="inputLastName" class="col-sm-3 control-label">建立者名稱:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="nodeUSERu" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputFirstName" class="col-sm-3 control-label">上層節點:</label>
                                        <div class="col-sm-8">
                                          <select  id="nodeLINKlistU">
      									  </select><br>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputEmployNumber" class="col-sm-3 control-label">節點顏色:</label>
                                        <div class="col-sm-8">
                                            <select  id="update_color">
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

 			<div class="col-lg-10 col-sm-9" id="AMContent" style="display:none;">
                <div class="panel panel-success" style="height:780px;">
                    <!-- 服務代碼清單管理切換頁籤Start -->
                    <div id="hrTabControlButton" style="margin:1px 0px 0px 1px;">
                        <button class="btn-sm btn-primary manage" onclick="showManage_AM()"><i class="fa fa-fw fa-user"></i>清單管理</button>
                        <button class="btn-sm btn-success ban" onclick="showBan_AM()"><i class="fa fa-fw fa-user"></i>停用列表</button>
                        <button class="btn-sm btn-success addMember" style="display:none;"><span onclick="showAddMember()">新增清單</span> <i class="fa fa-times" onclick="closeAddMemberAM()"></i></button>
                        <button class="btn-sm btn-success editMember" style="display:none;"><span onclick="showEditMember()">更新清單</span> <i class="fa fa-times" onclick="closeEditMemberAM()"></i></button>
                    </div>
                    <!-- 服務代碼清單管理切換頁籤End -->

                    <!-- 設定頁面內容頁 Start-->
                    <div class="panel-body" id="settingContent">
                        <div id="manageAMContent" style="display:none;">
                            <div>
                                <ul class="pagination">
                                    <li onclick="showAddMemberAM()"><a href="#"><i class="fa fa-fw fa-plus"></i></a></li>
                                    <li onclick="unlockAccountAM()"><a href="#"><i class="fa fa-fw fa-unlock-alt"></i></a></li>
                                </ul>
                              
                            </div>

                            <div class="row ibox" id="AM00">
                                <div class="col-lg-12 col-md-12" id="AM0">
                                    <table class="table table-bordered table-hover" id="manageTableAM">
                                      
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div id="banAMContent" style="display:none;">
                            <div>
                                <ul class="pagination">
                                    <li onclick="showAddMemberAM()"><a href="#"><i class="fa fa-fw fa-plus"></i></a></li>
                                    <li onclick="unlockAccountAM()"><a href="#"><i class="fa fa-fw fa-unlock-alt"></i></a></li>
                                </ul>

                            </div>

                            <div class="row ibox" id="AM11">
                                <div class="col-lg-12 col-md-12" id="AM1">
                                    <table class="table table-bordered table-hover" id="banTableAM">
                                   
                                    </table>
                                </div>
                            </div>
                        </div>
<!-- 新增  -->
                         <div id="addMemberAMContent" style="display:none;">
                            <div class="widget">
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-3 control-label">清單名稱:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="insert_menuname" placeholder="">
                                        </div>
                                    </div>
                         
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label">sort:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="insert_sort" placeholder="">
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
                        <div id="editMemberAMContent" style="display:none;">
                            <div class="widget">
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label required">編號:</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="up_dbidam" disabled>
                                        </div>
                                    </div>		
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-3 control-label">清單名稱:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="up_menunameam" >
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label for="inputName" class="col-sm-2 control-label">sort:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="up_sortam" placeholder="">
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

 <div class="col-lg-10 col-sm-9" id="AGContent" style="display:none;">
                <div class="panel panel-success" style="height:780px;">
                    <!-- 服務代碼清單管理切換頁籤Start -->
                    <div id="hrTabControlButton" style="margin:1px 0px 0px 1px;">
                        <button class="btn-sm btn-primary manage" onclick="showManage_AG()"><i class="fa fa-fw fa-user"></i>群組管理</button>
                        <button class="btn-sm btn-success ban" onclick="showBan_AG()"><i class="fa fa-fw fa-user"></i>停用列表</button>
                        <button class="btn-sm btn-success addMember" style="display:none;"><span onclick="showAddMemberAG()">新增群組</span> <i class="fa fa-times" onclick="closeAddMemberAG()"></i></button>
                        <button class="btn-sm btn-success editMember" style="display:none;"><span onclick="showEditMemberAG()">更新群組</span> <i class="fa fa-times" onclick="closeEditMemberAG()"></i></button>
                        <select class="selectpicker" style="width:127px;" id="menu" onchange="group()">
						</select>
						
                    </div>
                    <!-- 服務代碼清單管理切換頁籤End -->

                    <!-- 設定頁面內容頁 Start-->
                    <div class="panel-body" id="settingContent">
                        <div id="manageAGContent">
                            <div>
                                <ul class="pagination">
                                    <li onclick="showAddMemberAG()"><a href="#"><i class="fa fa-fw fa-plus"></i></a></li>
                                    <li onclick="unlockAccountAG()"><a href="#"><i class="fa fa-fw fa-unlock-alt"></i></a></li>
                                </ul>
                            </div>

                            <div class="row ibox" id="AG00">
                                <div class="col-lg-12 col-md-12" id="AG0">
                                    <table class="table table-bordered table-hover" id="manageTableAG">
                                       
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div id="banAGContent" style="display:none;">
                            <div>
                                <ul class="pagination">
                                    <li onclick="showAddMemberAG()"><a href="#"><i class="fa fa-fw fa-plus"></i></a></li>
                                    <li onclick="unlockAccountAG()"><a href="#"><i class="fa fa-fw fa-unlock-alt"></i></a></li>
                                </ul>
                            </div>

                            <div class="row ibox" id="AG11">
                                <div class="col-lg-12 col-md-12" id="AG1">
                                    <table class="table table-bordered table-hover" id="banTableAG">
                                       
                                    </table>
                                </div>
                            </div>
                        </div>
<!-- 新增  -->
                         <div id="addMemberAGContent" style="display:none;">
                            <div class="widget">
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label">群組名:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="in_groupname" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-2 control-label">sort:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="in_sort" placeholder="">
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
                        <div id="editMemberAGContent" style="display:none;">
                            <div class="widget">
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-3 control-label">群主名稱:</label>
                                        <div class="col-sm-8">
                                            <input type="" class="form-control" id="up_groupnameAG" >
                                        </div>
                                    </div>			
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-3 control-label">編號:</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="up_dbidAG" disabled >
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputName" class="col-sm-3 control-label">sort:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="up_sortAG" placeholder="">
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
 <div class="col-lg-10 col-sm-9" id="ADContent" style="display:none;"
 >
                <div class="panel panel-success" style="height:780px;">
                    <!-- 服務代碼管理切換頁籤Start -->
                    <div id="hrTabControlButton" style="margin:1px 0px 0px 1px;">
                        <button class="btn-sm btn-primary manage" onclick="showManage_AD()"><i class="fa fa-fw fa-user"></i>代碼管理</button>
                        <button class="btn-sm btn-success ban" onclick="showBan_AD()"><i class="fa fa-fw fa-user"></i>停用列表</button>
                        <button class="btn-sm btn-success addMember" style="display:none;"><span onclick="showAddMemberAD()">新增代碼</span> <i class="fa fa-times" onclick="closeAddMemberAD()"></i></button>
                        <button class="btn-sm btn-success editMember" style="display:none;"><span onclick="showEditMemberAD()">更新代碼</span> <i class="fa fa-times" onclick="closeEditMemberAD()"></i></button>
                        <select class="selectpicker" style="width:127px;" id="menuAD" onchange="groupAD()">
						</select>
                    </div>
                    <!-- 服務代碼管理切換頁籤End -->

                    <!-- 設定頁面內容頁 Start-->
                    <div class="panel-body" id="settingContent">
                        <div id="manageADContent" style="display:none;"
                        >
                            <div>
                                <ul class="pagination">
                                    <li onclick="showAddMemberAD()"><a href="#"><i class="fa fa-fw fa-plus"></i></a></li>
                                    <li onclick="unlockAccountAD()"><a href="#"><i class="fa fa-fw fa-unlock-alt"></i></a></li>
                                </ul>

                            </div>

                            <div class="row ibox" id="AD00">
                                <div class="col-lg-12 col-md-12" id="AD0">
                                    <table class="table table-bordered table-hover" id="manageTableAD">
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div id="banADContent" style="display:none;">
                            <div>
                                <ul class="pagination">
                                    <li onclick="showAddMember()"><a href="#"><i class="fa fa-fw fa-plus"></i></a></li>
                                    <li onclick="unlockAccount()"><a href="#"><i class="fa fa-fw fa-unlock-alt"></i></a></li>
                                </ul>

                            </div>

                            <div class="row ibox" id=AD11>
                                <div class="col-lg-12 col-md-12" id="AD1">
                                    <table class="table table-bordered table-hover" id="banTableAD">
                                       
                                    </table>
                                </div>
                            </div>
                        </div>
<!-- 新增  -->
                         <div id="addMemberADContent" style="display:none;">
                            <div class="widget">
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-3 control-label">代碼名稱:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="in_codename" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-3 control-label">顏色代碼</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="in_color" placeholder="">
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
                                            <input type="text" class="form-control" id="in_sort" placeholder="">
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
                        <div id="editMemberADContent" style="display:none;">
                            <div class="widget">
                                    <div class="form-group col-sm-6">
                                        <label for="inputAccount" class="col-sm-3 control-label">代碼名稱:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="up_codenameAD" >
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputName" class="col-sm-3 control-label">顏色代碼:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="up_colorAD" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputPassword" class="col-sm-3 control-label" disabled>編號:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="up_dbidAD" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputPassword" class="col-sm-3 control-label">sort:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="up_sortAD" placeholder="">
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
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#confirmBan" style="display:none;" id="confirmBanButton">banDialog</button>

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
                                          <input type="text" class="form-control" id="deletedbid" placeholder="">
                                       </div>
                            </div>			
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="showToastSuccess('刪除成功')">確定</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                </div>
            </div>

        </div>
    </div>
<!-- 禁止符號BUTTON END -->

<!-- 鎖符號BUTTON -->
    <!-- Trigger the modal with a button -->
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#unlockModal" style="display:none;" id="unlockButton">unlockDialog</button>
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
                                       <input type="text" class="form-control" id="state_account" placeholder="">
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
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="showToastError('鎖定/解鎖')">確定</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
<!-- 鎖符號BUTTON END -->

<!-- ========================================================================================================= --> 
<!-- GROUP 開始-->  

    <!-- Trigger the modal with a button -->
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#confirmBangroup" style="display:none;" id="confirmBanButtongroup">banDialog</button>

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
                                            <input type="text" class="form-control" id="deletedbid_GroupDelete" placeholder="">
                                        </div>
                            </div>		
                    		<button type="button" class="btn btn-success" data-dismiss="modal" onclick="GroupDelete('刪除成功')">確定</button>
                    		<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                </div>
            </div>

        </div>
    </div>
<!-- 禁止符號BUTTON END -->

<!-- 鎖符號BUTTON -->
    <!-- Trigger the modal with a button -->
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#unlockModalgroup" style="display:none;" id="unlockButtongroup">unlockDialog</button>
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
                                 <input type="text" class="form-control" id="state_account_Groupluck" placeholder="">
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
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="GroupLuck('鎖定/解鎖')">確定</button>
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
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#confirmBanAGR" style="display:none;" id="confirmBanButtonAGR">banDialog</button>

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
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="AgentreasonDelete('刪除成功')">確定</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                </div>
            </div>

        </div>
    </div>
<!-- 禁止符號BUTTON END -->

<!-- 鎖符號BUTTON -->
    <!-- Trigger the modal with a button -->
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#unlockModalAGR" style="display:none;" id="unlockButtonAGR">unlockDialog</button>
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
                    				<input type="text" class="form-control" id="Delete_id" placeholder="">
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
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="AgentreasonLuck('鎖定/解鎖成功')">確定</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
<!-- 鎖符號BUTTON END -->
<!-- ================================================================================== -->
<!-- Commonlink 開始-->
    <!-- Trigger the modal with a button -->
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#confirmBancomm" style="display:none;" id="confirmBanButtoncomm">banDialog</button>

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
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="deletefunctioncomm('刪除成功')">確定</button>
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
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#unlockModalAM" style="display:none;" id="unlockButtonAM">unlockDialog</button>
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
                    		<input type="text" class="form-control" id="Delete_idAM" placeholder="">
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
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="AMLuck('鎖定/解鎖成功')">確定</button>
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
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#unlockModalAG" style="display:none;" id="unlockButtonAG">unlockDialog</button>
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
                    				<input type="text" class="form-control" id="Delete_idAG" placeholder="">
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
                    	<button type="button" class="btn btn-success" data-dismiss="modal" onclick="AGLuck('鎖定/解鎖成功')">確定</button>
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
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#unlockModalAD" style="display:none;" id="unlockButtonAD">unlockDialog</button>
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
                    					<input type="text" class="form-control" id="Delete_idAD" placeholder="">
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
                    		<button type="button" class="btn btn-success" data-dismiss="modal" onclick="ADLuck('鎖定/解鎖成功')">確定</button>
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
    <script src="resources/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="resources/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script src="resources/js/demo/bootstrap-table-demo.js"></script>
	
	<script src="resources/js/setting/group.js"></script>
	<script src="resources/js/setting/agentreason.js"></script>
	<script src="resources/js/setting/commonlink.js"></script>
	<script src="resources/js/setting/activitymenu.js"></script>
	<script src="resources/js/setting/activitygroup.js"></script>
	<script src="resources/js/setting/activitydata.js"></script>
	<script src="resources/js/setting/person.js"></script>
    <script>
   
    function play(callback) {
    	
      	 function state(){
      		  $.ajax({                              
      	          url:"http://ws.crm.com.tw:8080/Info360_Setting/RESTful/Query_Person_STATE",
      	          
      		         data:{
      		        	state:0
      		        	 },
      		         type : "POST",                                                                    
      		         dataType:'json',
      		         
      		         error:function(e){                                                                 
      		         alert("失敗");
      		         callback(data);
      		         },
      		         success:function(data){
      		        	 $('#person0').remove();
//  							var str= "<option value='"+data.Tree[i].id+"'>"+data.Tree[i].text+"</option>"; 
// 		        	 		document.getElementById("nodeLINKlist").insertAdjacentHTML("BeforeEnd",str);
					var person00 = "<div class='col-lg-12 col-md-12' id='person0'></div>"
						document.getElementById("person00").insertAdjacentHTML("BeforeEnd",person00);
					
					var person0 =  "<table class='table table-bordered table-hover' id='manageTable_person' data-pagination='true' data-page-list='[5, 10, 20, 50, 100, 200]'data-search='true' data-url='x'><thead><tr><th id='user_name' data-sortable='true'></th><th id='emailaddress'data-sortable='true'></th><th id='state' data-sortable='true'></th><th id='account' data-sortable='true'></th><th id='employee_id' data-sortable='true'></th><th id='dn' data-sortable='true'></th><th id='dbid' data-sortable='true'></th></tr></thead><tbody></tbody></table>"
						document.getElementById("person0").insertAdjacentHTML("BeforeEnd",person0);

      		        	$('#manageTable_person').bootstrapTable({
      		        		 columns: [{
      		        		        field: 'account',
      		        		        title: '帳號'
      		        		    },{
      		        		        field: 'user_name',
      		        		        title: '姓名'
      		        		    },{
      		        		        field: 'employee_id',
      		        		        title: '員工編號'
      		        		    },{
      		        		        field: 'dn',
      		        		        title: '分機號碼'
      		        		    },{
      		        		        field: 'emailaddress',
      		        		        title: '信箱'
      		        		    },{
      		        		    	field: 'state',
      		        		        title: '狀態'
      		        		    },{
      		        		    	field: 'dbid',
      		        		        title: '編號'
      		        		    }],
      		        		    
      		     	data:data.person,
      		     	onClickRow : function(row, $element) {
						//alert(JSON.stringify(row));
						document.getElementById("updateAccount").value=row.account;
						document.getElementById("updateEmail").value=row.emailaddress;
						document.getElementById("updatePhoneNumber").value=row.dn;
						document.getElementById("updateName").value=row.user_name;
						document.getElementById("updateEmployNumber").value=row.employee_id;
						 
					},
      		     	});"json"
      		     	
      	     		console.log("正常用戶",data);	
      		     	
      	     	 $.ajax({                              
      	          url:"http://ws.crm.com.tw:8080/Info360_Setting/RESTful/Query_Person_STATE",
      	   
      		         data:{
      		        	state:1
      		        	 },
      		         type : "POST",                                                                    
      		         dataType:'json',
      		         
      		         error:function(e){                                                                 
      		         alert("失敗");
      		         callback(data);
      		         },
      		         success:function(data){
      		        	 $('#person1').empty();

					var person11 = "<div class='col-lg-12 col-md-12' id='person0'></div>"
						document.getElementById("person11").insertAdjacentHTML("BeforeEnd",person11);
					
					var person1 =  "<table class='table table-bordered table-hover' id='banTable_person' data-pagination='true' data-page-list='[5, 10, 20, 50, 100, 200]'data-search='true' data-url='x'><thead><tr><th id='user_name' data-sortable='true'></th><th id='emailaddress'data-sortable='true'></th><th id='state' data-sortable='true'></th><th id='account' data-sortable='true'></th><th id='employee_id' data-sortable='true'></th><th id='dn' data-sortable='true'></th><th id='dbid' data-sortable='true'></th></tr></thead><tbody></tbody></table>"
						document.getElementById("person1").insertAdjacentHTML("BeforeEnd",person1);
      		        	$('#banTable_person').bootstrapTable({
      		        		 columns: [{
      		        		        field: 'account',
      		        		        title: '帳號'
      		        		    },{
      		        		        field: 'user_name',
      		        		        title: '姓名'
      		        		    },{
      		        		        field: 'employee_id',
      		        		        title: '員工編號'
      		        		    },{
      		        		        field: 'dn',
      		        		        title: '分機號碼'
      		        		    },{
      		        		        field: 'emailaddress',
      		        		        title: '信箱'
      		        		    },{
      		        		    	field: 'state',
      		        		        title: '狀態'
      		        		    },{
      		        		    	field: 'dbid',
      		        		        title: '編號'
      		        		    }],
      		        		    
      		     	data:data.person,
      		     	onClickRow : function(row, $element) {
						//alert(JSON.stringify(row));
						document.getElementById("updateAccount").value=row.account;
						document.getElementById("updateEmail").value=row.emailaddress;
						document.getElementById("updatePhoneNumber").value=row.dn;
						document.getElementById("updateName").value=row.user_name;
						document.getElementById("updateEmployNumber").value=row.employee_id;
						 
					},
      		     	});"json"
      		     	
      	     		console.log("停用用戶",data);	
      	     	callback();
      		     }
      		     });		  
      	     		
      		     }
      		     });	
      		  
      	 		}; 
      	 	state();
       	}
       	function play2() {
       	  $("#manageTable_person tbody tr,#banTable_person tbody tr").on("click",function(){
                 var text = $(this).text();
                 if (text && text != "") {
                     showEditMember();
                 }
             });
       	}
       	play(play2);
        $(document).ready(function(){
            //init datatable
            $("#manageTable").DataTable({
                "columnDefs": [ {
                    "targets": 'no-sort',
                    "orderable": false,
                }]});

            $("#manageTable").css("width","100%");
            $("#manageTable_filter").prop("style","float:right;");
            $("#manageTable_wrapper > div:nth-child(1)").hide();

            $("#manageSearch").keyup(function(){
                var searchText = $("#manageSearch").val();

                $("input[aria-controls='manageTable']").val(searchText);
                $("input[aria-controls='manageTable']").trigger("keyup");
            });


            $("#banTable").DataTable({
                "columnDefs": [ {
                    "targets": 'no-sort',
                    "orderable": false,
                }]});
            $("#banTable").css("width","100%");
            $("#banTable_filter").prop("style","float:right;");
            $("#banTable_wrapper > div:nth-child(1)").hide();

            $("#banSearch").keyup(function(){

                var searchText = $("#banSearch").val();

                $("input[aria-controls='banTable']").val(searchText);
                $("input[aria-controls='banTable']").trigger("keyup");
            });
        });

//         $("#manageTable tbody tr td,#banTable tbody tr td").on("click",function(){
//             var text = $(this).text();
// 			alert("abc");
//             if (text && text != "") {
//                 showEditMember();
//             }
//         });


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

    		$.ajax({                              
    	          url:"http://ws.crm.com.tw:8080/Info360_Setting/RESTful/Insert_PersonInfo",
    		         data:{
    		        	 first_name:in_first_name,
    		        	 last_name:in_last_name,
    		        	 user_name:in_user_name,
    		        	 emailaddress:in_emailaddress,
    		        	 password:in_password,
    		        	 employee_id:in_employee_id,
    		        	 group_dbid:in_group_dbid,
    		        	 account:in_account,
    		        	 state:0,
    		        	 dn:in_dn

    		        	 },
    		         type : "POST",                                                                    
    		         dataType:'json',
    		         
    		         error:function(e){                                                                 
    		         alert("失敗");
    		         callback(data);
    		         },
    		         success:function(data){
    		        	 play(play2);
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


        	$.ajax({                              
                url:"http://ws.crm.com.tw:8080/Info360_Setting/RESTful/Update_PersonInfo",
      	         data:{
      	        	 first_name:up_first_name,
      	        	 last_name:up_last_name,
      	        	 user_name:up_user_name,
      	        	 emailaddress:up_emailaddress,
      	        	 password:up_password,
      	        	 employee_id:up_employee_id,
      	        	 group_dbid:up_group_dbid,
      	        	 account:up_account,
      	        	 state:up_state,
      	        	 dn:up_dn

      	        	 },
      	         type : "POST",                                                                    
      	         dataType:'json',
      	         
      	         error:function(e){                                                                 
      	         alert("失敗");
      	         callback(data);
      	         },
      	         success:function(data){
      	        	play(play2);
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
            $("#manageTable_div").hide();
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
            "closeButton": false,
            "debug": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "onclick": null,
            "showDuration": "2000",
            "timeOut": "2000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }

        function showToastSuccess(message) {
        	var deletedbid = document.getElementById('deletedbid').value;
        	
            $.ajax({                              
                url:"http://ws.crm.com.tw:8080/Info360_Setting/RESTful/Delete_PersonInfo",
        	         data:{
        	        	
        	        	 dbid:deletedbid
        	        
        	        	 },
        	         type : "POST",                                                                    
        	         dataType:'json',
        	         
        	         error:function(e){                                                                 
        	         alert("失敗");
        	         callback(data);
        	         },
        	         success:function(data){
        	        	play(play2);
        	     }
        	         
            });
            toastr.success(message);
        }

        function showToastError(message) {
        	var state = document.getElementById('state_list').value;
            var account = document.getElementById('state_account').value;
            $.ajax({                              
                url:"http://ws.crm.com.tw:8080/Info360_Setting/RESTful/Person_logicdelete",
        	         data:{
        	        	
        	        	 state:state,
        	        	 account:account
        	        
        	        	 },
        	         type : "POST",                                                                    
        	         dataType:'json',
        	         
        	         error:function(e){                                                                 
        	         alert("失敗");
        	         callback(data);
        	         },
        	         success:function(data){
        	        	play(play2);
        	     }
        	         
            });
            toastr.error(message);
        }

        function isValidEmail(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

            return re.test(email);
        }

        /* 表格全選控制 */
        $("#manageCheck").on("change",function () {
            if ($("#manageCheck").prop("ischecked") == false) {
                $("#manageCheck").prop("ischecked", true);
                $("#manageTable tbody tr td:first-child input").prop("checked", false);
            } else {
                $("#manageCheck").prop("ischecked", false);
                $("#manageTable tbody tr td:first-child input").prop("checked", true);
            }
        });

        $("#banCheck").on("change",function () {
            if ($("#banCheck").prop("ischecked") == false) {
                $("#banCheck").prop("ischecked", true);
                $("#banTable tbody tr td:first-child input").prop("checked", false);
            } else {
                $("#banCheck").prop("ischecked", false);
                $("#banTable tbody tr td:first-child input").prop("checked", true);
            }
        });

    </script>
   
</html>


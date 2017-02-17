<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="../../common/init.jsp"></jsp:include>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <title>Chat頁面-02</title>

        <link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
        <link href="resources/css/font-awesome.css?v=4.4.0" rel="stylesheet">
        <link href="resources/css/animate.css" rel="stylesheet">
        <link href="resources/css/style.css?v=4.1.0" rel="stylesheet">
        <link href="resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">

    </head>
    <body class="gray-bg">
        <div class="widget">
            <!-- 左側資訊區 Start-->
            <div id="leftTab" style="width:220px;float:left;margin-left:5px;">
                <div class="panel panel-success" style="height:780px;">
                    <div class="panel panel-heading">
                        <h3><i class="fa fa-angle-double-right"></i>客戶資料</h3>
                    </div>

                    <ul class="nav nav-pills default" id="rightTab">
                        <li class="active"><a href="#leftTab_1_1" data-toggle="tab">基本資料</a></li>
                        <li>
                            <a href="#leftTab_1_2" data-toggle="tab">常用連結

                            </a>
                        </li>
                        <li>
                            <a href="#leftTab_1_3" data-toggle="tab">案件資訊

                            </a>
                        </li>
                    </ul>

                    <div class="tab-content rightTab">
                        <div class="tab-pane fade active in" id="leftTab_1_1">
                            <div class="portlet">
                                <div class="list-group customerInfo">
                                    <a href="#" class="list-group-item gray-bg">
                                        <h4>INFORMATION</h4>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <h4>姓名</h4>
                                        <h4>林小智</h4>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <h4>住址</h4>
                                        <h4>新北市</h4>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <h4>專屬人員</h4>
                                        <h4>Alex</h4>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <h4>註冊地</h4>
                                        <h4>台北分公司</h4>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <h4>帳號狀態</h4>
                                        <h4>啟用</h4>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <h4>身份證字號</h4>
                                        <h4>A123456789</h4>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <h4>性別</h4>
                                        <h4>男</h4>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="leftTab_1_2">
                            <div class="portlet">
                                <div class="portlet-body" >
                                    <div class="widget">
                                        <div class="fa-tree-list">
                                            <span>
                                                <i class="fa fa-fw fa-folder-open"></i>
                                                特別提示
                                            </span>

                                            <ul style="list-style-type:none;margin-left:-20px;">
                                                <li>
                                                    <span>
                                                        <i class="fa fa-fw fa-folder-open"></i>
                                                        最新專案
                                                    </span>
                                                    <ul style="list-style-type:none;margin-left:-20px;">
                                                        <li onclick="clickLink1()"><i class="fa fa-fw fa-file-text-o"></i>優惠方案</li>
                                                        <li onclick="clickLink2()"><i class="fa fa-fw fa-file-text-o"></i>週年慶大放送</li>
                                                    </ul>
                                                </li>
                                                <li class="active">
                                                    <span>
                                                        <i class="fa fa-fw fa-folder-open"></i>
                                                        軟體操作
                                                    </span>
                                                    <ul style="list-style-type:none;margin-left:-20px;">
                                                        <li><i class="fa fa-fw fa-file-text-o"></i>知識管理</li>
                                                        <li><i class="fa fa-fw fa-file-text-o"></i>考試系統</li>
                                                        <li><i class="fa fa-fw fa-file-text-o"></i>客服代表應用</li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <span>
                                                        <i class="fa fa-fw fa-folder"></i>
                                                        硬體故障簡易處理
                                                    </span>

                                                    <ul style="list-style-type:none;display:none;margin-left:-20px;">
                                                        <li><i class="fa fa-fw fa-file-text-o"></i>個人電腦</li>
                                                        <li><i class="fa fa-fw fa-file-text-o"></i>交換機</li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="leftTab_1_3">
                            <div class="portlet">
                                <div class="portlet-body" >
                                    <div class="input-group">
                                        <div class="col-xs-12">案件編號</div>
                                        <div class="col-xs-12"><input type="text" value="C_201506041009"></div></div>
                                    <div class="input-group">
                                        <div class="col-xs-12">處理人</div>
                                        <div class="col-xs-12"><input type="text" value="HolyLin"></div>
                                    </div>
                                    <div class="input-group">
                                        <div class="col-xs-12">案件類別</div>
                                        <div class="col-xs-12">
                                            <select class="selectpicker" style="width:127px;    padding:2px 0px 2px 0px;">
                                                <option>帳務問題</option>
                                                <option>選項二</option>
                                                <option>選項三</option>
                                            </select>

                                            <button class="btn-success" onclick="showCaseInfo()">註記</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 左側資訊區 End-->

            <!-- 右側主要功能區 Start-->
            <div class="row" id="rightContentTab" style="margin-left:235px;margin-right:5px;">

                <div class="col-sm-12 col-lg-12 col-md-12 panel panel-success" style="height:780px;min-width:500px;overflow-x:scroll;">
                    <div style="margin:1px 0px 0px 1px;">
                        <button class="btn-sm btn-warning" style="float:left;margin-left:-5px;margin-right:5px;"  onclick="leftTabToggle()" id="tabToggleButton">
                            <i class="fa fa-lg fa-arrow-left" id="leftTabToggleButton"></i>
                        </button>
                        <button class="btn-sm btn-success" onclick="showHistoryQuery()" id="queryButton">
                            <i class="fa fa-lg fa-user"></i>
                            <span>歷史資料</span>
                        </button>
                        <button class="btn-sm btn-success" style="display:none;" id="caseInfoButton">
                            <span onclick="showCaseInfo()">服務代碼</span>
                            <i class="fa fa-times" onclick="closeCaseInfo()"></i>
                        </button>
                        <button class="btn-sm btn-success" style="display:none;" id="linkButton1" >
                            <span onclick="showLink1()">優惠方案</span>
                            <i class="fa fa-times" onclick="closeLink(1)"></i>
                        </button>

                        <button class="btn-sm btn-success" style="display:none;" id="linkButton2">
                            <span onclick="showLink2()">週年慶大放送</span>
                            <i class="fa fa-times" onclick="closeLink(2)"></i>
                        </button>
                    </div>

                    <div class="panel-body" id="historyQuery">
                        <!-- 客戶資料Start -->
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-xs-12" style="margin-bottom:2px;">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1">日期</span>
                                    <div class="input-daterange input-group" id="datepicker">
                                        <input type="text" class="input-sm form-control" name="start" value="2014-11-11">
                                        <span class="input-group-addon">到</span>
                                        <input type="text" class="input-sm form-control" name="end" value="2014-11-17">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-xs-6" style="margin-bottom:2px;">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1">處理人</span>
                                    <input type="text" class="form-control" placeholder="請輸入處理人" aria-describedby="basic-addon1">
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-xs-6">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1">客戶ID</span>
                                    <input type="text" class="form-control" placeholder="請輸入ID" aria-describedby="basic-addon1">
                                </div>
                            </div>

                            <div class="col-lg-9 col-md-9 col-xs-8" style="margin-bottom:2px;">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1">主旨</span>
                                    <input type="text" class="form-control" placeholder="請輸入" aria-describedby="basic-addon1">
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-xs-4" style="margin-bottom:2px;">
                                <button class="btn-sm btn-success">搜尋</button>
                                <button class="btn-sm btn-danger">取消</button>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <table class="table table-striped table-bordered table-hover" id="queryTable">
                                    <thead>
                                        <tr>
                                            <td>欄位1</td>
                                            <td>欄位2</td>
                                            <td>欄位3</td>
                                            <td>欄位4</td>
                                            <td>欄位5</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Chrome</td>
                                            <td>IE</td>
                                            <td>FireFox</td>
                                            <td>Safari</td>
                                            <td>Netscape</td>
                                        </tr>
                                        <tr>
                                            <td>Chrome</td>
                                            <td>IE</td>
                                            <td>FireFox</td>
                                            <td>Safari</td>
                                            <td>Netscape</td>
                                        </tr>
                                        <tr>
                                            <td>Chrome</td>
                                            <td>IE</td>
                                            <td>FireFox</td>
                                            <td>Safari</td>
                                            <td>Netscape</td>
                                        </tr>
                                        <tr>
                                            <td>Chrome</td>
                                            <td>IE</td>
                                            <td>FireFox</td>
                                            <td>Safari</td>
                                            <td>Netscape</td>
                                        </tr>
                                        <tr>
                                            <td>Chrome</td>
                                            <td>IE</td>
                                            <td>FireFox</td>
                                            <td>Safari</td>
                                            <td>Netscape</td>
                                        </tr>
                                        <tr>
                                            <td>Chrome</td>
                                            <td>IE</td>
                                            <td>FireFox</td>
                                            <td>Safari</td>
                                            <td>Netscape</td>
                                        </tr>
                                        <tr>
                                            <td>Chrome</td>
                                            <td>IE</td>
                                            <td>FireFox</td>
                                            <td>Safari</td>
                                            <td>Netscape</td>
                                        </tr>
                                        <tr>
                                            <td>Chrome</td>
                                            <td>IE</td>
                                            <td>FireFox</td>
                                            <td>Safari</td>
                                            <td>Netscape</td>
                                        </tr>
                                        <tr>
                                            <td>Chrome</td>
                                            <td>IE</td>
                                            <td>FireFox</td>
                                            <td>Safari</td>
                                            <td>Netscape</td>
                                        </tr>
                                        <tr>
                                            <td>Chrome</td>
                                            <td>IE</td>
                                            <td>FireFox</td>
                                            <td>Safari</td>
                                            <td>Netscape</td>
                                        </tr>
                                        <tr>
                                            <td>Chrome</td>
                                            <td>IE</td>
                                            <td>FireFox</td>
                                            <td>Safari</td>
                                            <td>Netscape</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- 客戶資料End -->

                    <!-- 常用連結專區 Start-->
                    <div class="panel-body" id="link1" style="display:none;">
                        <iframe src="http://www.crm.com.tw/" style="width:100%;min-height:400px;"></iframe>
                    </div>

                    <div class="panel-body" id="link2" style="display:none;">
                        <iframe src="http://www.pchome.com" style="width:100%;min-height:400px;"></iframe>
                    </div>
                    <!-- 常用連結專區 End-->

                    <!-- 案件資訊專區 Start -->
                    <div class="panel-body panel-success" id="caseInfo" style="display:none;">
                        <div id="exTab1" class="tab-container">	
                            <ul  class="nav nav-tabs">
                                <li class="active">
                                    <a  href="#caseInfo1" data-toggle="tab">CKTDH（一）</a>
                                </li>
                                <li><a href="#caseInfo2" data-toggle="tab">BEFRLP（二）</a>
                                </li>
                                <li><a href="#caseInfo3" data-toggle="tab">其它類（三）</a>
                                </li>
                                <li><a href="#caseInfo4" data-toggle="tab">伴隨行銷（四）</a>
                                </li>
                                <li><a href="#caseInfo5" data-toggle="tab">通話紀錄（五）</a>
                                </li>
                            </ul>

                            <div class="tab-content clearfix">
                                <div class="tab-pane active" id="caseInfo1">
                                    <div style="height:600px;overflow-y:scroll;">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr><td colspan="5"><b class="text-success">權益贏家策略王</b></td></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox">C1.無法登入</td>
                                                    <td><input type="checkbox">C2.無法登入</td>
                                                    <td><input type="checkbox">C3.無法登入</td>
                                                    <td><input type="checkbox">C4.無法登入</td>
                                                    <td><input type="checkbox">C5.無法登入</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox">C6.無法登入</td>
                                                    <td><input type="checkbox">C7.無法登入</td>
                                                    <td><input type="checkbox">C8.無法登入</td>
                                                    <td><input type="checkbox">C9.無法登入</td>
                                                    <td><input type="checkbox">C10.無法登入</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr><td colspan="5"><b class="text-success">權益贏家策略王</b></td></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox">C1.無法登入</td>
                                                    <td><input type="checkbox">C2.無法登入</td>
                                                    <td><input type="checkbox">C3.無法登入</td>
                                                    <td><input type="checkbox">C4.無法登入</td>
                                                    <td><input type="checkbox">C5.無法登入</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox">C6.無法登入</td>
                                                    <td><input type="checkbox">C7.無法登入</td>
                                                    <td><input type="checkbox">C8.無法登入</td>
                                                    <td><input type="checkbox">C9.無法登入</td>
                                                    <td><input type="checkbox">C10.無法登入</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr><td colspan="5"><b class="text-success">權益贏家策略王</b></td></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox">C1.無法登入</td>
                                                    <td><input type="checkbox">C2.無法登入</td>
                                                    <td><input type="checkbox">C3.無法登入</td>
                                                    <td><input type="checkbox">C4.無法登入</td>
                                                    <td><input type="checkbox">C5.無法登入</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox">C6.無法登入</td>
                                                    <td><input type="checkbox">C7.無法登入</td>
                                                    <td><input type="checkbox">C8.無法登入</td>
                                                    <td><input type="checkbox">C9.無法登入</td>
                                                    <td><input type="checkbox">C10.無法登入</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr><td colspan="5"><b class="text-success">權益贏家策略王</b></td></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox">C1.無法登入</td>
                                                    <td><input type="checkbox">C2.無法登入</td>
                                                    <td><input type="checkbox">C3.無法登入</td>
                                                    <td><input type="checkbox">C4.無法登入</td>
                                                    <td><input type="checkbox">C5.無法登入</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox">C6.無法登入</td>
                                                    <td><input type="checkbox">C7.無法登入</td>
                                                    <td><input type="checkbox">C8.無法登入</td>
                                                    <td><input type="checkbox">C9.無法登入</td>
                                                    <td><input type="checkbox">C10.無法登入</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr><td colspan="5"><b class="text-success">權益贏家策略王</b></td></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox">C1.無法登入</td>
                                                    <td><input type="checkbox">C2.無法登入</td>
                                                    <td><input type="checkbox">C3.無法登入</td>
                                                    <td><input type="checkbox">C4.無法登入</td>
                                                    <td><input type="checkbox">C5.無法登入</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox">C6.無法登入</td>
                                                    <td><input type="checkbox">C7.無法登入</td>
                                                    <td><input type="checkbox">C8.無法登入</td>
                                                    <td><input type="checkbox">C9.無法登入</td>
                                                    <td><input type="checkbox">C10.無法登入</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr><td colspan="5"><b class="text-success">權益贏家策略王</b></td></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox">C1.無法登入</td>
                                                    <td><input type="checkbox">C2.無法登入</td>
                                                    <td><input type="checkbox">C3.無法登入</td>
                                                    <td><input type="checkbox">C4.無法登入</td>
                                                    <td><input type="checkbox">C5.無法登入</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox">C6.無法登入</td>
                                                    <td><input type="checkbox">C7.無法登入</td>
                                                    <td><input type="checkbox">C8.無法登入</td>
                                                    <td><input type="checkbox">C9.無法登入</td>
                                                    <td><input type="checkbox">C10.無法登入</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr><td colspan="5"><b class="text-success">權益贏家策略王</b></td></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox">C1.無法登入</td>
                                                    <td><input type="checkbox">C2.無法登入</td>
                                                    <td><input type="checkbox">C3.無法登入</td>
                                                    <td><input type="checkbox">C4.無法登入</td>
                                                    <td><input type="checkbox">C5.無法登入</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox">C6.無法登入</td>
                                                    <td><input type="checkbox">C7.無法登入</td>
                                                    <td><input type="checkbox">C8.無法登入</td>
                                                    <td><input type="checkbox">C9.無法登入</td>
                                                    <td><input type="checkbox">C10.無法登入</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div class="tab-pane" id="caseInfo2">
                                    <div style="height:600px;overflow-y:scroll;">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr><td colspan="5"><b class="text-success">權益贏家策略王</b></td></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox">C1.無法登入</td>
                                                    <td><input type="checkbox">C2.無法登入</td>
                                                    <td><input type="checkbox">C3.無法登入</td>
                                                    <td><input type="checkbox">C4.無法登入</td>
                                                    <td><input type="checkbox">C5.無法登入</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox">C6.無法登入</td>
                                                    <td><input type="checkbox">C7.無法登入</td>
                                                    <td><input type="checkbox">C8.無法登入</td>
                                                    <td><input type="checkbox">C9.無法登入</td>
                                                    <td><input type="checkbox">C10.無法登入</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr><td colspan="5"><b class="text-success">權益贏家策略王</b></td></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox">C1.無法登入</td>
                                                    <td><input type="checkbox">C2.無法登入</td>
                                                    <td><input type="checkbox">C3.無法登入</td>
                                                    <td><input type="checkbox">C4.無法登入</td>
                                                    <td><input type="checkbox">C5.無法登入</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox">C6.無法登入</td>
                                                    <td><input type="checkbox">C7.無法登入</td>
                                                    <td><input type="checkbox">C8.無法登入</td>
                                                    <td><input type="checkbox">C9.無法登入</td>
                                                    <td><input type="checkbox">C10.無法登入</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane" id="caseInfo3">
                                    <div style="height:600px;overflow-y:scroll;">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr><td colspan="5"><b class="text-success">權益贏家策略王</b></td></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox">C1.無法登入</td>
                                                    <td><input type="checkbox">C2.無法登入</td>
                                                    <td><input type="checkbox">C3.無法登入</td>
                                                    <td><input type="checkbox">C4.無法登入</td>
                                                    <td><input type="checkbox">C5.無法登入</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox">C6.無法登入</td>
                                                    <td><input type="checkbox">C7.無法登入</td>
                                                    <td><input type="checkbox">C8.無法登入</td>
                                                    <td><input type="checkbox">C9.無法登入</td>
                                                    <td><input type="checkbox">C10.無法登入</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr><td colspan="5"><b class="text-success">權益贏家策略王</b></td></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox">C1.無法登入</td>
                                                    <td><input type="checkbox">C2.無法登入</td>
                                                    <td><input type="checkbox">C3.無法登入</td>
                                                    <td><input type="checkbox">C4.無法登入</td>
                                                    <td><input type="checkbox">C5.無法登入</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox">C6.無法登入</td>
                                                    <td><input type="checkbox">C7.無法登入</td>
                                                    <td><input type="checkbox">C8.無法登入</td>
                                                    <td><input type="checkbox">C9.無法登入</td>
                                                    <td><input type="checkbox">C10.無法登入</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane" id="caseInfo4">
                                    <div style="height:600px;overflow-y:scroll;">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr><td colspan="5"><b class="text-success">權益贏家策略王</b></td></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox">C1.無法登入</td>
                                                    <td><input type="checkbox">C2.無法登入</td>
                                                    <td><input type="checkbox">C3.無法登入</td>
                                                    <td><input type="checkbox">C4.無法登入</td>
                                                    <td><input type="checkbox">C5.無法登入</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox">C6.無法登入</td>
                                                    <td><input type="checkbox">C7.無法登入</td>
                                                    <td><input type="checkbox">C8.無法登入</td>
                                                    <td><input type="checkbox">C9.無法登入</td>
                                                    <td><input type="checkbox">C10.無法登入</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr><td colspan="5"><b class="text-success">權益贏家策略王</b></td></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox">C1.無法登入</td>
                                                    <td><input type="checkbox">C2.無法登入</td>
                                                    <td><input type="checkbox">C3.無法登入</td>
                                                    <td><input type="checkbox">C4.無法登入</td>
                                                    <td><input type="checkbox">C5.無法登入</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox">C6.無法登入</td>
                                                    <td><input type="checkbox">C7.無法登入</td>
                                                    <td><input type="checkbox">C8.無法登入</td>
                                                    <td><input type="checkbox">C9.無法登入</td>
                                                    <td><input type="checkbox">C10.無法登入</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane" id="caseInfo5">
                                    <div id="chatRecord" class="widget"  style="height:600px;overflow-y:scroll;">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <div style="margin:10px;">
                                                    <span class="tag label label-default" style="padding:5px;">
                                                        <span>C1.無法登入</span>
                                                        <a><i class="fa fa-times"></i></a> 
                                                    </span>
                                                </div>
                                                <div style="margin:10px;">
                                                    <span class="tag label label-default" style="padding:5px;">
                                                        <span>帳務問題</span>
                                                        <a><i class="fa fa-times"></i></a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-xs-9">
                                                <textarea style="height:560px;width:100%;"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="panel gray-bg">
                            <div style="font-size:14px;padding:5px;text-align:right;">
                                <span style="margin:0px 10px 0px 10px;">
                                    <input type="checkbox"> 離席外撥
                                </span>
                                <span style="margin:0px 10px 0px 10px;">
                                    <input type="checkbox"> 來電提示
                                </span>
                                <span style="margin:0px 10px 0px 10px;">
                                    <input type="checkbox"> 抱怨
                                </span>
                                <span style="margin:0px 10px 0px 10px;">
                                    <input type="checkbox"> 離席
                                </span>
                                <span style="margin:0px 10px 0px 10px;">
                                    <input type="checkbox"> 黑名單
                                </span>
                                <span style="margin:0px 10px 0px 10px;">
                                    <button class="btn btn-sm btn-success" onclick="closeCaseInfo()">服務完成</button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <!-- 案件資訊專區 End-->

                </div>
            </div>
        </div>

    </body>



    <!-- 全局js -->
    <script src="resources/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- Data Tables -->
    <script src="resources/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resources/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- DataPicker -->
    <script src="resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>

    <!-- bootstrap_treeview -->
    <script src="resources/js/plugins/treeview/bootstrap-treeview.js"></script>

    <script>

        $(document).ready(function(){
            // init datepicker
            $("#datepicker" ).datepicker();
            // init datatable
            $("#queryTable").DataTable();
            $("#queryTable").css("width","100%");
        });

        function clickLink1() {
            $("#linkButton1").show();
            showLink1();
        }

        function clickLink2() {
            $("#linkButton2").show();
            showLink2();
        }


        function showHistoryQuery() {
            hideAll();
            $("#historyQuery").show();

            clearLinkStyle();
            $("#queryButton").removeClass("btn-success");
            $("#queryButton").addClass("btn-primary");
        }

        function showLink1() {
            hideAll();
            $("#link1").show();

            clearLinkStyle();
            $("#linkButton1").removeClass("btn-success");
            $("#linkButton1").addClass("btn-primary");
        }

        function showLink2() {
            hideAll();
            $("#link2").show();

            clearLinkStyle();
            $("#linkButton2").removeClass("btn-success");
            $("#linkButton2").addClass("btn-primary");
        }

        function showCaseInfo() {
            hideAll();
            $("#caseInfoButton").show();
            $("#caseInfo").show();

            clearLinkStyle();
            $("#caseInfoButton").removeClass("btn-success");
            $("#caseInfoButton").addClass("btn-primary");
        }

        function clearLinkStyle() {
            $("#queryButton").removeClass("btn-primary");
            $("#queryButton").addClass("btn-success");
            $("#linkButton1").removeClass("btn-primary");
            $("#linkButton1").addClass("btn-success");
            $("#linkButton2").removeClass("btn-primary");
            $("#linkButton2").addClass("btn-success");
            $("#caseInfoButton").removeClass("btn-primary");
            $("#caseInfoButton").addClass("btn-success");
        }

        function closeLink(number) {
            if(number == '1') {
                $("#linkButton1").hide();
                $("#link1").hide();
            } else if(number == '2') {
                $("#linkButton2").hide();
                $("#link2").hide();
            }

            clearLinkStyle();
            $("#historyQuery").show();
        }

        function closeCaseInfo() {
            $("#caseInfoButton").hide();
            $("#caseInfo").hide();

            clearLinkStyle();
            $("#historyQuery").show();
        }

        function hideAll() {
            $("#historyQuery").hide();
            $("#link1").hide();
            $("#link2").hide();
            $("#caseInfo").hide();
        }

        /* tree list controll */
        $(".fa-tree-list>span").on("click",function(){
            if ( $(".fa-tree-list>span>i").hasClass("fa-folder-open")) {
                // toggle icon
                $(".fa-tree-list>span>i").removeClass("fa-folder-open");
                $(".fa-tree-list>span>i").addClass("fa-folder");

                $(".fa-tree-list ul").hide();
            } else if ($(".fa-tree-list>span>i").hasClass("fa-folder")){
                // toggle icon
                $(".fa-tree-list>span>i").removeClass("fa-folder");
                $(".fa-tree-list>span>i").addClass("fa-folder-open");

                $(".fa-tree-list ul").show();
                $(".fa-tree-list>ul>li>span").find("i").removeClass("fa-folder-open");
                $(".fa-tree-list>ul>li>span").find("i").addClass("fa-folder");
                $(".fa-tree-list ul li").find("ul").hide();
            }
        });

        $(".fa-tree-list>ul>li>span").on("click",function(){
            //console.log($(this));
            if ( $(this).find("i").hasClass("fa-folder-open")) {
                // toggle icon
                $(this).find("i").removeClass("fa-folder-open");
                $(this).find("i").addClass("fa-folder");

                $(this).parent().find("ul").hide();

            } else if ($(this).find("i").hasClass("fa-folder")){
                // toggle icon
                $(this).find("i").removeClass("fa-folder");
                $(this).find("i").addClass("fa-folder-open");

                $(this).parent().find("ul").show();
            }

        });

        $(".customerInfo a").on("click",function(){
            var copyText = $(this).find(':nth-child(2)').text();
            var $temp = $("<input>");

            $("body").append($temp);
            $temp.val(copyText).select();
            document.execCommand("copy");
            $temp.remove();
        });

        $("#tabToggleButton").on("mouseover",function(){
            //leftTabToggle();
        });

        function leftTabToggle() {
            var isOpen = $("#leftTabToggleButton").hasClass("fa-arrow-left");

            if (isOpen) {
                $("#leftTabToggleButton").removeClass("fa-arrow-left");
                $("#leftTabToggleButton").addClass("fa-arrow-right");

                $("#rightContentTab").animate({"margin-left":'5px'});

                $("#leftTab").animate({"margin-left":'-230px'});
            } else {
                $("#leftTabToggleButton").removeClass("fa-arrow-right");
                $("#leftTabToggleButton").addClass("fa-arrow-left");

                $("#rightContentTab").animate({"margin-left":'235px'});

                $("#leftTab").animate({"margin-left":'5px'});
            }
        }
    </script>

</html>
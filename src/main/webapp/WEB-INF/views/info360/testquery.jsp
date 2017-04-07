<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>「儀表板」頁面</title>
<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<link href="resources/css/style.css?v=4.1.0" rel="stylesheet">

<link rel="stylesheet" href="resources/jstree/style.min.css" />

<link href="resources/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">

</head>
<style>
.dataTables_filter {
	display: none;
}
</style>
<body class="gray-bg">
	<div class="widget">
		<!-- 左側快速選取區Start -->
		<div class="col-lg-2 col-sm-3">
			<div class="panel panel-success" style="height: 780px;">
				<div class="panel-heading">
					<h3>
						<i class="fa fa-angle-double-right"></i>案件搜尋
					</h3>
				</div>
				<div class="panel-body">
					<input id="today" type="hidden"></input> <input id="week"
						type="hidden"></input>


					<table class="table table-bordered table-hover">
						<thead>
							<tr class="bg-primary">
								<td><b>快速篩選</b></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td type="button" onclick="quickSearchByTime(0)">今天</td>
							</tr>
							<tr>
								<td type="button" onclick="quickSearchByTime(7)">本週</td>
							</tr>
							<tr>
								<td type="button" onclick="quickSearchByTime(30)">一個月</td>
							</tr>
							<tr>
								<td type="button" onclick="quickSearchByTime(90)">三個月</td>
							</tr>
							<tr>
								<td type="button" onclick="quickSearchByTime(180)">半年</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 左側快速選取區End -->

		<!-- 右側搜尋面板Start -->
		<div class="col-lg-10 col-sm-9">
			<div class="panel panel-success" style="height: 780px;">
				<div style="margin: 1px 0px 0px 1px;" id="linkButton">
					<button class="btn-sm btn-primary" onclick="showHistoryQuery()"
						id="queryButton">
						<i class="fa fa-lg fa-user"></i> <span>案件列表</span>
					</button>
					<button class="btn-sm btn-success" style="display: none;"
						id="detailButton">
						<span onclick="showHistoryDetail()">currentDate</span> <i
							class="fa fa-times" onclick="closeDetail()"></i>
					</button>
				</div>

				<!-- 搜尋功能區 Start -->
				<div class="panel-body" id="historyQuery">
					<!-- 搜尋條件區 Start -->
					<div class="row ibox">
						<div class="col-lg-6 col-md-6">
							<div class="input-group">
								<span class="input-group-addon">日期</span>
								<div class="input-daterange input-group" id="datepicker">
									<input type="text" class="input-sm form-control" name="start"
										value=""> <span class="input-group-addon">到</span> <input
										type="text" class="input-sm form-control" name="end" value="">
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3">
							<div class="input-group">
								<span class="input-group-addon">處理人</span> 
								<input type="hidden" value="" id="contactid">
								<input type="hidden" value="" id="json">
								<select  id="allperson" style="height:30px">
								</select>
<!-- 								<input type="text" -->
<!-- 									class="form-control" placeholder="請輸入處理人" id="inputAgentId"> -->
							</div>
						</div>
						<!-- 
						<div class="col-lg-3 col-md-3">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">客戶ID</span> <input
									type="text" class="form-control" placeholder="請輸入ID"
									aria-describedby="basic-addon1">
							</div>
						</div>
						 -->
						<div class="col-lg-3 col-md-3">
							<button class="btn-sm btn-success" onclick="search()"
								id="searchButton" >搜尋</button>
							<button class="btn-sm btn-danger">取消</button>
						</div>
						
						
						<div id="mapping_div">
						</div>
						
					</div>
					<!-- 
					<div class="row ibox">
						
						<div class="col-lg-9 col-md-9">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">主旨</span> <input
									type="text" class="form-control" placeholder="請輸入"
									aria-describedby="basic-addon1">
							</div>
						</div>
						 
						<div class="col-lg-3 col-md-3">
							<button class="btn-sm btn-success">搜尋</button>
							<button class="btn-sm btn-danger">取消</button>
						</div>
						
					</div>
					-->
					<!-- 搜尋條件區 End -->

					<div class="row ibox" style="height: 630px; overflow-y: scroll;">
						<div class="col-lg-12 col-md-12">
						
						<div class="sk-spinner sk-spinner-fading-circle" id="queryTableLoading">
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
						
							<table class="table table-striped table-bordered table-hover"
								id="queryTable">
								<thead>
									<tr>
										<th>開始時間</th>
										<th>結束時間</th>
										<th>來源</th>
										<th>處理人</th>
										<th>服務代碼</th>
										<th>備註</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- 搜尋功能區 End -->

				<!-- 案件詳細區 Start -->
				<div class="panel-body" id="historyDetail" style="display: none;">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th colspan="6" style="background-color: #f9f9f9">客戶資料</th>
							</tr>
						</thead>
						<tbody id="detailCustomerInfo"></tbody>
					</table>

					<table class="table table-bordered">
						<thead>
							<tr>
								<th colspan="6" style="background-color: #f9f9f9">案件資訊</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>處理人</td>
								<td id="detailAgentName"></td>
								<td>開始處理時間</td>
								<td id="detailStartDate"></td>
								<td>結束處理時間</td>
								<td id="detailEndDate"></td>
							</tr>
							<tr>
								<td>服務代碼</td>
								<td colspan="5" id="detailCodeName">1234</td>
							</tr>
							<tr style="display: none;">
								<td id="ixnid"></td>
								<td id="ContactID"></td>
							</tr>
						</tbody>
					</table>

					<div class="tabs-container">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#detail_1"
								aria-expanded="true">案件資訊</a></li>
							<li class=""><a data-toggle="tab" href="#detail_2"
								aria-expanded="false">對談內容 </a></li>
						</ul>
						<div class="tab-content">
							<div id="detail_1" class="tab-pane active">
								<div class="panel-body">
									<div id="detailComments"
										style="width: 100%; height: 230px; padding: 10px; overflow-x: hidden; overflow-y: scroll;"></div>
									<textarea style="width: 100%; height: 100px;" id="inputComment"></textarea>

									<div style="text-align: right; margin-top: 5px;">
										<button class="btn btn-success text-right"
											onclick="insertComment()">送出</button>
										<button class="btn btn-danger text-right"
											onclick="closeDetail();">取消</button>
									</div>
								</div>
							</div>
							<div id="detail_2" class="tab-pane">
								<div class="panel-body">
									<div class="well" id="detailText"
										style="background-color: white; height: 330px; overflow-x: hidden; overflow-y: scroll;">
									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
				<!-- 案件詳細區 End -->
			</div>
		</div>
		<!-- 右側搜尋面板End -->
	</div>
</body>

<!-- 全局js -->
<script src="resources/js/jquery.min.js?v=2.1.4"></script>
<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>

<!-- Jstree -->
<script type="text/javascript" src="resources/jstree/jstree.min.js"></script>

<!-- Data Tables -->
<script src="resources/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="resources/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- DataPicker -->
<script src="resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>

<!-- toastStr -->
<script src="resources/js/plugins/toastr/toastr.min.js"></script>

<script type="text/javascript">
	var jj=false;
	var agentId = parent.UserID_g;

	$(document).ready(function() {
		// init datepicker
		$("#datepicker").datepicker({
			format : 'yyyy-mm-dd',
			endDate : '0d'
		});

		// default search and initdataTable
		var opt = {
			"bLengthChange" : false,
			"iDisplayLength" : 15
		};

		$('#queryTable').DataTable(opt);
		$("#queryTable").css("width", "100%");

		quickSearchByTime(7);
		addmapping();
		allperson();
		
	});

	// 案件搜尋
	function search() {
		var MappingValue = $('#mapping_div input');
		var arr = $.makeArray(MappingValue);
		if(arr.length>0){
		var text = '{' ;
		
		for(var i=0;i<arr.length;i++){
		var value = arr[i].value;
		var name = arr[i].id;

			if(arr.length==i+1){
		
				text +=  '"'+name+'"'+':'+'"'+value+'"'; 
			}else{
				text +=  '"'+name+'"'+':'+'"'+value+'"'+',';
			}
			
			}
		text += '}';
		alert(text);
		
		document.getElementById('json').value = text;
		}
	

		document.getElementById('searchButton').disabled=true;
		$('#queryTableLoading').show();
		$('#queryTable').hide();
		
		var start = $('#datepicker [name="start"]').val();
		var end = $('#datepicker [name="end"]').val();
		var id = $("#allperson").val();
		var inputcontactdata = document.getElementById('json').value;

		alert("sday  "+start);
		alert("eday  "+end);
		console.log("start : " + start + "; end : " + end + "; id :" + id );

		$('#queryTable').DataTable().destroy();
		$('#queryTable tbody').html("");

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query",
					data : {
						startdate : start,
						enddate : end,
						agentid : id,
						inputcontactdata:inputcontactdata
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						console.log("請重新整理");

					},
					success : function(data) {
						console.log(data);
						var queryData = data.data;

						for ( var index in queryData) {
							var agentName = queryData[index].Agentname;
							var codeName = queryData[index].Codename;
							var endd = queryData[index].Enddate;
							var startd = queryData[index].Startdate;
							var comment = queryData[index].Thecomment;
							var ixnId = queryData[index].ixnid;
							var src = queryData[index].src;

							if (codeName && codeName.length >= 20) {
								codeName = codeName.substr(0, 20) + "...";
							}

							if (comment && comment.length >= 20) {
								comment = comment.substr(0, 20) + "...";
							}

							var $tr = '<tr onclick="queryDetail(\'' + ixnId
									+ '\',\'' + startd + '\')">';
							$tr += '<td>' + startd + '</td>';
							$tr += '<td>' + endd + '</td>';
							$tr += '<td>' + src + '</td>';
							$tr += '<td>' + agentName + '</td>';
							$tr += '<td>' + codeName + '</td>';
							$tr += '<td>' + comment + '</td>';
							$tr += '</tr>';

							$('#queryTable tbody').append($tr);
						}

						var opt = {
							"bLengthChange" : false,
							"iDisplayLength" : 15,
							"columnDefs" : [ {
								"width" : "180px",
								"targets" : 0
							}, {
								"width" : "180px",
								"targets" : 1
							}, {
								"width" : "80px",
								"targets" : 2
							}, {
								"width" : "100px",
								"targets" : 3
							}, {
								"width" : "175px",
								"targets" : 4
							} ],
							"fixedColumns" : true,
						};
						$('#queryTable').DataTable(opt);
						$("#queryTable").css("width", "100%");
						$('#queryTable').show();
						document.getElementById('searchButton').disabled=false;
						$('#queryTableLoading').hide();
					}
				});
		

	}

	// 快速選取指定時間
	function quickSearchByTime(days) {
		var endDate = new Date();
		var year = endDate.getFullYear();
		var month = endDate.getMonth() + 1;
		var day = endDate.getDate();
		var endDateStr = addZeroLeft(year, 4) + "-" + addZeroLeft(month, 2)
				+ "-" + addZeroLeft(day, 2);

		if (0 == days) {
			var startDate = new Date(year, month - 1, day);
		} else if (7 == days) {
			var startDate = new Date(year, month - 1, day - 7);
		} else if (30 == days) {
			var startDate = new Date(year, month - 2, day);
		} else if (90 == days) {
			var startDate = new Date(year, month - 4, day);
		} else if (180 == days) {
			var startDate = new Date(year, month - 7, day);
		}

		year = startDate.getFullYear();
		month = startDate.getMonth() + 1;
		day = startDate.getDate();
		var startDateStr = addZeroLeft(year, 4) + "-" + addZeroLeft(month, 2)
				+ "-" + addZeroLeft(day, 2);

		$('#datepicker [name="start"]').datepicker("update", startDateStr);
		$('#datepicker [name="end"]').datepicker("update", endDateStr);

		search();
	}

	function queryDetail(id, date) {
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/detailQuery",
					data : {
						ixnid : id
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						console.log("請重新整理");

					},
					success : function(data) {
						console.log(data);

						generateDetailData(data);
						showHistoryDetail(date);
					}
				});
	}

	function generateDetailData(data) {
		// 清空動態生成區
		$('#detailCustomerInfo').html("");
		$('#detailComments').html("");
		$('#detailText').html("");
		$('#inputComment').val("");

		// Step 1  處理客戶資料
		var mapping = data.data[0].mapping.Message;
		var mappingSorted = {};
		mappingLength = 0;

		Object.keys(mapping).sort(function(a, b) {
			return mapping[a].sort - mapping[b].sort
		}).forEach(function(key) {
			mappingSorted[mapping[key].sort] = mapping[key];
			mappingSorted[mapping[key].sort].key = key;

			mappingLength++;
		});

		$customerData = '<tr>';
		dataCount = 1;

		for (key in mappingSorted) {
			$customerData += '<td>';
			$customerData += mappingSorted[key].chiname;
			$customerData += '</td><td id="detail'
					+ mappingSorted[key].key.toLowerCase() + '"></td>';

			if (dataCount % 3 == 0 || dataCount == mappingSorted.length) {
				$customerData += "</tr>";
			}

			if (dataCount == mappingLength) {
				while (mappingLength % 3 != 0) {
					$customerData += '<td></td><td></td>';
					mappingLength++;
				}
			}
			dataCount++;
		}

		$('#detailCustomerInfo').append($customerData);

		var basicInfo = data.data[0].BasicINF;

		for ( var key in basicInfo) {
			var id = key
			$('#detail' + key.toLowerCase()).html(basicInfo[key]);
		}

		// Step 2 處理案件資訊
		var detailAgentName = data.data[0].Agentname;
		var detailStartDate = data.data[0].Startdate;
		var detailEndDate = data.data[0].Enddate;
		var detailCodeName = data.data[0].Codename;

		$('#detailAgentName').html(detailAgentName);
		$('#detailStartDate').html(detailStartDate);
		$('#detailEndDate').html(detailEndDate);
		$('#detailCodeName').html(detailCodeName);

		var ixnid = data.data[0].ixnid;
		var ContactID = data.data[0].BasicINF.ContactID;
		$('#ixnid').html(ixnid);
		$('#ContactID').html(ContactID);

		// Step 3 處理備註
		var theComment = data.data[0].Thecomment;

		for (key in theComment) {
			var agent = theComment[key].agent;
			var comment = theComment[key].comment;
			var date = theComment[key].datetime;
			//theComment[key].statusname;

			var $comment = '<div class="row">';
			$comment += '<div class="col-xs-6 text-left"><b>' + agent
					+ '</b></div>';
			$comment += '<div class="col-xs-6 text-right">' + date + '</div>';
			$comment += '</div>';
			$comment += '<div class="well">' + comment + '</div>'

			$('#detailComments').append($comment);
		}

		// Step 4 處理對談文字
		var structuretext = data.data[0].Structuredtext;
		for (key in structuretext) {
			var userName = structuretext[key].UserName;
			var text = structuretext[key].text;

			var $text = '<div>';
			$text += '<b>' + userName + '：</b>';
			$text += '<span>' + text + '</span>';
			$text += '</div>';

			$('#detailText').append($text);
		}

	}

	function insertComment() {
		var ixnid = $('#ixnid').html();
		var ContactID = $('#ContactID').html();
		var comment = $('#inputComment').val();
		console.log("send insertComment :");
		console.log("ixnid:" + ixnid + ";ContactID:" + ContactID + ";comment:"
				+ comment);

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Insert_CaseComments",
					data : {
						ixnid : ixnid, //room id
						contactid : ContactID, //連絡人ID
						comment : comment, //註記內容
						status : 3, //暫時固定塞3 (代表結案)
						mediatype : 2, //暫時固定塞2(代表Chat)
						source : agentId, //Agent ID
						agentid : agentId
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						console.log("請重新整理");

					},
					success : function(data) {
						console.log(data);

						closeDetail();
					}
				});
	}

	/* ----------按鈕頁籤及主畫面顯示控制區 Start ----------*/
	function showHistoryQuery() {
		$('#queryButton').removeClass("btn-success");
		$('#detailButton').removeClass("btn-primary");

		$('#queryButton').addClass("btn-primary");
		$('#detailButton').addClass("btn-success");

		$('#historyQuery').show();
		$('#historyDetail').hide();
	}

	function showHistoryDetail(date) {
		$('#detailButton').removeClass("btn-success");
		$('#queryButton').removeClass("btn-primary");

		$('#detailButton').addClass("btn-primary");
		$('#queryButton').addClass("btn-success");

		$('#detailButton').show();
		$('#detailButton span').html(date);

		$('#historyQuery').hide();
		$('#historyDetail').show();
	}

	function closeDetail() {
		$('#detailButton').hide();

		// 清空動態生成區
		$('#detailCustomerInfo').html("");
		$('#detailComments').html("");
		$('#detailText').html("");
		$('#inputComment').val("");

		// 切換回搜尋區
		showHistoryQuery();
	}
	/* ----------按鈕頁籤及主畫面顯示控制區 End ----------*/

	/*
	 * 左邊補0，用於日期或時間
	 * str: 要被補0的字串
	 * length: 要補多少個0
	 */
	function addZeroLeft(str, length) {
		str = str + '';

		if (str.length >= length) {
			return str;
		} else {
			return addZeroLeft("0" + str, length);
		}
	}
	
	function addmapping(){
		$.ajax({
			url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query_Service_Mapping",
			data : {
				searchflag : 1,
				typeid:"A"
			},
			type : "POST",
			dataType : 'json',

			error : function(e) {
				toastr.error("請重新整理");
			},
			success : function(data) {
				console.log("mapping",data);
				for (var i = 0; i < data.mapping.length; i++) {
					var mapping = "<div class='col-lg-4 col-md-4'><div class='input-group'><span class='input-group-addon'>"+data.mapping[i].chiname+"</span> <input type='text' name='mappingval' class='form-control' placeholder="+data.mapping[i].chiname+" id="+data.mapping[i].engname+"></div></div>"
					document.getElementById("mapping_div").insertAdjacentHTML("BeforeEnd", mapping);
			
				}
			}
		});
	}
	
	function allperson(){
		$.ajax({
			url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query_Allperson",
			data : {
				state : 0
			},
			type : "POST",
			dataType : 'json',

			error : function(e) {
				toastr.error("請重新整理");
			},
			success : function(data) {
				console.log("allperson",data)
// 				var a ="";
				var first = "<option value=''>全部</option>"
					document.getElementById("allperson").insertAdjacentHTML("BeforeEnd", first);
				
				for (var i = 0; i < data.allperson.length; i++) {
					var allperson = "<option value="+data.allperson[i].dbid+">"+data.allperson[i].username+"</option>"
					document.getElementById("allperson").insertAdjacentHTML("BeforeEnd", allperson);
				}
				
			}
		});
	}
// 	function creatjson(){
// 			document.getElementById('json').value="";
// 			document.getElementById('contactid').value="";
		
// 		var jj = false;
// 		var MappingValue = $('#mapping_div input');
// 		var arr = $.makeArray(MappingValue);
// 		var text = '{' ;
		
// 		for(var i=0;i<arr.length;i++){
// 		var value = arr[i].value;
// 		var name = arr[i].id;
		
		
// 			if(arr.length==i+1){
		
// 				text +=  '"'+name+'"'+':'+'"'+value+'"'; 
// 				if(value!=""){
// 					jj = true;				
// 				}
// 			}else{
// 				text +=  '"'+name+'"'+':'+'"'+value+'"'+',';
// 				if(value!=""){
// 					jj = true;	
// 				}
// 			}
// 			text += '}';
		
// 			}
		
// //	 	alert(text);
// 		if(jj==true){
// 			console.log("text",text);
// 			document.getElementById('json').value=text;
			

// 			var text = document.getElementById('json').value
// 			$.ajax({
// 				url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query_contactdata",
// 				data : {
// 					contactid :0,
// 					inputcontactdata:text
// 				},
// 				type : "POST",
// 				dataType : 'json',

// 				error : function(e) {
// 					toastr.error("請確認輸入值");
// 				},
// 				success : function(data) {
// 					console.log("contactid",data);
// 					document.getElementById('contactid').value=data.contactid[0].contactid;
// 				}
// 			});
// 		}
		
// 	}
	
</script>

</html>
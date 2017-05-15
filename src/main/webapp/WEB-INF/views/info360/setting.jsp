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
						<div class="fa-tree-list" id="AuthorityTree">							
							<ul id="Authority">
							
							</ul>
						</div>
					</div>
					
					<div class="spiner-example" id="Loading">
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
				</div>
			</div>
		</div>
    <script>
	 $(function(){
            /* 点击事件会在超链接跳转前发生 */
            $("#div_test a").click(function(){
                var link = $(this).attr('href');
                $('#div_view').attr('src', link);
                var href = window.location.href;
                window.location.href = href.substr(0, href.indexOf('#')) + '#' + link;
                return false;
            });
        });
    </script>
    <div class="col-lg-10 col-sm-9" style="height: 780px">
    			<iframe id="div_view" width="100%" height="100%"></iframe>
	</div>	
	
	</div>
</body>

<!-- 彈跳對話視窗-->


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


<script>

$(document).ready(function() {
	$("#Loading").show();
	$("#Authority").hide();
	$.ajax({
		url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Authority_person",

		data : {
			dbid : parent.UserID_g
			},
		type : "POST",
		dataType : 'json',
		error : function(e) {
			toastr.error("請重新整理");
		},
		success : function(data) {
			console.log("AuthorityTree",data);
			$("#Loading").hide();
			$("#Authority").show();
			
			$('#AuthorityTree').jstree("destroy").empty();

			$('#AuthorityTree').jstree({
				'core' : {
					'data' : data.Function,
				},
				 "types" : {
		              "#" : {
		                  valid_children : ['root'],
		              },
		              "root" : {
		                  valid_children : ['default', 'file'],
		              	  "icon" : "fa fa-fw fa-folder-open"
		              },
		              "default" : {
		                  valid_children : ['default', 'file'],
		                  'icon': 'fa fa-fw fa-file-text-o'
		              },
		        	},
					"plugins" : [ "themes", "json_data", "ui","types" ,"wholerow"],
				});
			
			  $('#AuthorityTree').on('select_node.jstree', function (e, data) {
					console.log("AuthorityTree", data.node);
					if(data.node.original.parent!='#'){
		                var link = data.node.a_attr.href;
		                $('#div_view').attr('src', link);
		                var href = window.location.href;
			                window.location.href = href.substr(0, href.indexOf('#')) + '#' + link;
		                return false;
					}
				});

		}
	})
});
</script>


</html>


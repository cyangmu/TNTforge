<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>产品管理</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">

<script src="js/jquery-2.2.3.min.js"></script>
<script src="js/jquery.easyui.min.js"></script>
<script>
	var url;
	$(function() {
		$("#dg").datagrid({
			title : "产品管理",
			border : false,
			locale : "zh_CN",
			//iconCls: 'icon-save',
			striped : true,
			//sortOrder: "desc",
			collapsible : false,
			url : "ProductServlet?opt=list",
			queryParams : {
				searchText : ""
			},
			//                columns: [[
			//                    { field: 'proId', title: 'ID', width: '20%', algin: 'center' },
			//                    { field: 'proImg', title: 'ID', width: '20%', algin: 'center' },
			//                    { field: 'proName', title: '编号', width: '30%', align: 'center' },
			//                    { field: 'proPrice', title: '标题', width: '30%', align: 'center' },
			//
			//                ]],
			//                toolbar: [{
			//                    id: 'btnAdd',
			//                    text: "添加",
			//                    iconCls: 'icon-add',
			//                    handler: function () {
			//
			//                    }
			//                }, {
			//                    id: 'btnEdit',
			//                    text: "修改",
			//                    iconCls: 'icon-edit',
			//                    handler: function () {
			//
			//                    }
			//                }, {
			//                    id: 'btnDel',
			//                    text: "删除",
			//                    iconCls: 'icon-remove',
			//                    handler: function () {
			//
			//                    }
			//                }, {
			//                    id: 'searchText',
			//                    text: "产品名称： <input type='text' id='search'>",
			//                    handler: function () {
			//
			//                    }
			//                }, {
			//                    id: 'btnSearch',
			//                    text: "查询",
			//                    iconCls: 'icon-search',
			//                    handler: function () {
			//
			//
			//                    }
			//                }],
			toolbar : '#toolbar',
			pagination : true,//表示在datagrid设置分页
			rownumbers : false,
			singleSelect : true,
		});

		$('#dg').datagrid('getPager').pagination({
			pageSize : 10,
			pageNumber : 1,
			pageList : [ 10, 20, 30, 40, 50 ],
			beforePageText : '第',//页数文本框前显示的汉字
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		});

		$("#btnAdd").click(function() {
			$('#dlg').dialog('open').dialog('setTitle', 'New Product');
			$('#fm').form('clear');
			url = 'ProductServlet?opt=add';
		})

		$("#btnEdit").click(function() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$('#dlg').dialog('open').dialog('setTitle', 'Edit User');
				$('#fm').form('load', row);
				url = 'UpdateProduct?pid=' + row.pid;
			}
		})

		$("#btnDel").click(
				function() {
					var row = $('#dg').datagrid('getSelected');
					if (row) {
						$.messager.confirm('Confirm',
								'Are you sure you want to destroy this user?',
								function(r) {
									if (r) {
										$.post('ProductServlet', {
											"opt" : "del",
											"pid" : row.pid
										}, function(result) {
											if (result == true) {
												$('#dg').datagrid('reload'); // reload the user data
											} else {
												$.messager.show({ // show error message
													title : 'Error',
													msg : result.errorMsg
												});
											}
										}, 'json');
									}
								});
					}
				});

		$("#btnSearch").click(function() {
			var queryParameter = $('#dg').datagrid("options").queryParams;
			queryParameter.searchText = $("#searchText").val();
			$("#dg").datagrid("reload");
		});
	});
	function saveOrUpdateUser() {
		var price = 0;
		$('#submitInfo').click(function() {
			$.post(url, {
				"productname" : $("#name").prop("value"),
				"productprice" : $("#price").prop("value"),
				"productcount" : $("#count").prop("value"),
				"productimg" : $("#imgpath").prop("value"),
				"productdescribe" : $("#describe").prop("value"),
			}, function(result) {
				if (result == "true") {
					$('#dlg').dialog('close'); // close the dialog
					$('#dg').datagrid('reload');
				} else {
					alert("失败！");
				}

			});
		});
	}
</script>
<script>
	$(function() {
		$("#img")
				.change(
						function() {
							var img = event.target.files[0];

							// 判断是否图片
							if (!img) {
								return;
							}

							// 判断图片格式
							if (!(img.type.indexOf('image') == 0 && img.type && /\.(?:jpg|png|gif)$/
									.test(img.name))) {
								alert('图片只能是jpg,gif,png');
								return;
							}

							var reader = new FileReader();
							reader.readAsDataURL(img);

							reader.onload = function(e) {
								//显示图片
								$('#showimg')
										.html(
												'<img src="' +this.result + '" width="100;">');
								$("#loadimg").click(function() {
									// ajax 上传图片
									$.post("UploadServlet", {
										img : e.target.result
									}, function(ret) {
										alert(ret);
										$("#imgpath").prop("value", ret);
									});
								});
							}
						});
	});
</script>
</head>
<body>

	<div>
		<!-- 展示商品 -->
		<table id="dg" title="My Users" class="easyui-datagrid">
			<thead>
				<tr>
					<th field="pid" width="20%">id</th>
					<th field="pname" width="30%">Name</th>
					<th field="pprice" width="30%">price</th>
					<th field="pcount" width="30%">count</th>
					<th field="pimg" width="20%"
						data-options="formatter:function(v){return '<img src='+imgpath+' width=30/>'}">image
					</th>
					<th field="pdescript" width="30%">describe</th>

				</tr>
			</thead>
		</table>
		<div id="toolbar">
			<a href="#" id="btnAdd" class="easyui-linkbutton" iconCls="icon-add"
				plain="true">添加商品</a> <a href="#" id="btnEdit"
				class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑商品</a>
			<a href="#" id="btnDel" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除商品</a> <input type="text"
				id="searchText" class="easyui-validatebox" maxlength="10"
				style="height: 15px; margin: 0 5px 0 5px" /> <a href="#"
				id="btnSearch" class="easyui-linkbutton" iconCls="icon-search"
				plain="true">查询</a>
		</div>
		<!-- 添加商品 -->
		<div id="dlg" class="easyui-dialog"
			style="width: 400px; height: 280px; padding: 10px 20px" closed="true"
			buttons="#dlg-buttons">
			<div class="ftitle">商品信息</div>
			<!-- <form id="fm" method="post"> -->
			<div id="fm">
				<div class="fitem">
					<label>商品名称:</label> <input name="pname" id="name"
						class="easyui-validatebox">
				</div>
				<div class="fitem">
					<label>商品价格:</label> <input name="pprice" id="price"
						class="easyui-validatebox">
				</div>
				<div class="fitem">
					<label>商品数量:</label> <input name="pcount" id="count"
						class="easyui-validatebox">
				</div>

				<!-- </form> -->
				<div class="fitem">
					<label>图片路径:</label> <input id="imgpath" name="pimg"
						class="easyui-validatebox" type="text">
				</div>
				<div class="fitem">
					<label>商品描述:</label> <input name="pdescript" id="describe"
						class="easyui-validatebox">
				</div>
			</div>
			<div class="fitem">
				<label>上传图片:</label> <input type="file" id="img"
					class="easyui-validatebox">
				<p class="showimg" id="showimg"></p>
				<button id="loadimg">上传</button>
			</div>
		</div>
		<div id="dlg-buttons">
			<a href="#" id="submitInfo" class="easyui-linkbutton"
				iconCls="icon-ok" onclick="saveOrUpdateUser()">Save</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-cancel"
				onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
		</div>
	</div>
</body>
</html>
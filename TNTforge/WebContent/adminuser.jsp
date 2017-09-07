<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>产品管理</title>
<link rel="stylesheet" type="text/css" href="usereasyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="usereasyui/themes/icon.css">

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
			url : "UserListServlet?opt=list",
			queryParams : {
				searchText : ""
			},
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

		$("#btnEdit").click(function() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$('#dlg').dialog('open').dialog('setTitle', 'Edit User');
				$('#fm').form('load', row);
				url = 'UserServlet?uid=' + row.uid;
			}
		})
		
		$("#btnDel").click(
				function() {
					var row = $('#dg').datagrid('getSelected');
					if (row) {
						$.messager.confirm('Confirm',
								'你确定要锁定该账号吗?',
								function(r) {
									if (r) {
										$.post('LockUserServlet', {
											"uid": row.uid
										}, function(result) {
											if (result == true) {
												alert("账号锁定成功！");
												$('#dlg').dialog('close'); // close the dialog
												$('#dg').datagrid('reload');
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
		$('#submitInfo').click(function(){
			$.post(url,{
			},function(result) {
				if(result == "true"){
					alert("账号解锁成功！");
					$('#dlg').dialog('close'); // close the dialog
					$('#dg').datagrid('reload');
				}else{
					alert("失败！");
				}
				
			});
		});
	}
</script>
</head>
<body>

<div>
	<!-- 展示商品 -->
	<table id="dg" title="My Users" class="easyui-datagrid">
		<thead>
			<tr>
				<th field="uid" width="20%">id</th>
				<th field="uname" width="30%">Name</th>
				<th field="upassword" width="30%">password</th>
				<th field="uemail" width="30%">state</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="#" id="btnEdit"
			class="easyui-linkbutton" iconCls="icon-edit" plain="true">更改状态</a> <a
			href="#" id="btnDel" class="easyui-linkbutton" iconCls="icon-remove"
			plain="true">锁定账号</a> <input type="text" id="searchText"
			class="easyui-validatebox" maxlength="10"
			style="height: 15px; margin: 0 5px 0 5px" /> <a href="#"
			id="btnSearch" class="easyui-linkbutton" iconCls="icon-search"
			plain="true">查询</a>
	</div>
	<!-- 添加商品 -->
	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 280px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">账号信息</div>
		<!-- <form id="fm" method="post"> -->
		<div id="fm">
			<div class="fitem">
				<label>是否解除锁定？</label>
			</div>
			<!-- <div class="fitem">
				<label>商品价格:</label> <input name="pprice" id="price"
					class="easyui-validatebox">
			</div>
			<div class="fitem">
				<label>商品数量:</label>
				<input name="pcount" id="count"
					class="easyui-validatebox">
			</div> -->
		</div>
		<!-- </form> -->
			<!-- <div class="fitem">
				<label>图片路径:</label>
				<input id="imgpath" name="pimg"
					class="easyui-validatebox" type="text">
			</div>
			<div class="fitem">
				<label>商品描述:</label>
				<input name="pdescript" id="describe"
					class="easyui-validatebox">
			</div>
			<div class="fitem">
				<label>上传图片:</label> <input type="file" id="img"
					class="easyui-validatebox">
				<p class="showimg" id="showimg"></p>
				<button id="loadimg">上传</button>
			</div> -->
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
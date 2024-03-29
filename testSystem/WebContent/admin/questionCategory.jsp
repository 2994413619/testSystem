<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>testSystem</title>

		<!-- Bootstrap -->
		<link href="../css/bootstrap.css" rel="stylesheet">

		<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
		<script src="../js/jquery-3.3.1.js"></script>
		<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
		<script src="../js/bootstrap.js"></script>
		
		<link rel="stylesheet" href="css/admin.css" />
		<script type="text/jscript" src="js/admin.js"></script>
	</head>
	<body>
		<div class="container">
			<h1 style="text-align: center; font-family: '华文楷体';">分类管理</h1>
			<div class="table-responsive">
				<table class="table table-striped" id="myTable">
					<thead>
						<tr>
							<td nowrap="nowrap">分类编号</td>
							<td nowrap="nowrap">分类名称</td>
							<td nowrap="nowrap">修改</td>
							<td nowrap="nowrap">删除</td>
							<td nowrap="nowrap">多选</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>webpack</td>
							<td class="right"><a href="questionCategoryUpdate.html">修改</a></td>
							<td><a href="#" class="delete">删除</a></td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
						<tr>
							<td>2</td>
							<td>hibernate</td>
							<td class="right"><a href="questionCategoryUpdate.html">修改</a></td>
							<td><a href="#" class="delete">删除</a></td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
						<tr>
							<td>3</td>
							<td>gulp</td>
							<td class="right"><a href="questionCategoryUpdate.html">修改</a></td>
							<td><a href="#" class="delete">删除</a></td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
						<tr>
							<td>4</td>
							<td>node.js</td>
							<td class="right"><a href="questionCategoryUpdate.html">修改</a></td>
							<td><a href="#" class="delete">删除</a></td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
						<tr>
							<td>5</td>
							<td>spring</td>
							<td class="right"><a href="questionCategoryUpdate.html">修改</a></td>
							<td><a href="#" class="delete">删除</a></td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="pull-right" id="batchDeal">
				<button class="btn btn-default" onclick="allCheck(this)" style="width: 70px;">全选</button>
				<button type="button" class="btn btn-danger">删除</button>
			</div>
			
		</div>
	</body>
</html>

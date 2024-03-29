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
		<script type="text/javascript" src="js/admin.js" ></script>
		<script type="text/javascript" src="js/rootForAShortTime.js"></script>
	</head>
	<body>
		<div class="container-fluid">
			<h1 style="text-align: center;font-family:'华文楷体';">临时管理员管理</h1>
			<div class="row" style="margin-bottom: 10px;padding-right: 17px;">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModal">
				  	添加临时管理员
				</button>
			</div>
			
			<div class="table-responsive">
				<table class="table table-striped table-hover" id="myTable">
					<thead>
						<tr>
							<th nowrap="nowrap">编号</th>
							<th nowrap="nowrap">用户名</th>
							<th nowrap="nowrap">真实姓名</th>
							<th nowrap="nowrap">删除</th>
							<th nowrap="nowrap">多选</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>
								<button type="button" class="btn btn-danger">删除</button>
							</td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>
								<button type="button" class="btn btn-danger">删除</button>
							</td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>
								<button type="button" class="btn btn-danger">删除</button>
							</td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>
								<button type="button" class="btn btn-danger">删除</button>
							</td>
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
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">添加临时管理员</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label for="userName" class="col-sm-3 control-label">老师用户名：</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="userName" id="userName" placeholder="老师用户名" autocomplete="off">
								</div>
								<button type="button" class="col-sm-1 btn btn-default" onclick="addTeacherName()">添加</button>
							</div>
							<div class="form-group">
								<label for="oldPassword" class="col-sm-3 control-label">临时管理员列表：</label>
								<div class="col-sm-7">
									<textarea class="form-control" rows="5" placeholder="临时管理员列表" id="teacherList"></textarea>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" type="button" class="btn btn-primary">保存</button>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>

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
	</head>
	<body>
		<div class="container">
			<h1 style="text-align: center;font-family:'华文楷体';">root用户</h1>
			<div class="row" style="margin-bottom: 10px;padding-right: 17px;">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModal">
				  修改密码
				</button>
			</div>
			
			<div class="table-responsive">
				<table class="table table-hover" id="myTable">
					<thead>
						<tr>
							<th nowrap="nowrap">用户名</th>
							<th nowrap="nowrap">密码</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>root</td>
							<td>****</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">修改root信息</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal">
								<div class="form-group">
									<label for="oldPassword" class="col-sm-3 control-label">旧密码：</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="oldPassword" placeholder="旧密码">
									</div>
								</div>
								<div class="form-group">
									<label for="newPassword" class="col-sm-3 control-label">新密码：</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="newPassword" placeholder="新密码">
									</div>
								</div>
								<div class="form-group">
									<label for="reNewPassword" class="col-sm-3 control-label">确认新密码：</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="reNewPassword" placeholder="确认新密码">
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary">保存</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</body>
</html>

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
		
		<link rel="stylesheet" href="css/informationUpdate.css" />
	</head>
	<body>
		<div class="container">
			<div id="updateDiv" style="margin-top: 100px;">
				<form class="form-horizontal">
					<legend>分类修改</legend>
					<div class="form-group">
						<label for="questionCategoryID" class="col-sm-2 control-label hidden-xs">
							分类编号
						</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="questionCategoryID" name="questionCategoryID" placeholder="分类编号" autocomplete="off" disabled="disabled">
						</div>
					</div>
					<div class="form-group">
						<label for="questionCategoryName" class="col-sm-2 control-label hidden-xs">
							分类名称
						</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="questionCategoryName" name="questionCategoryName" placeholder="分类名称" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-8">
						  <button type="submit" class="btn btn-default">修改</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>

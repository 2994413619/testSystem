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
		<link rel="stylesheet" href="css/questionUpdate.css" />
		
		<script type="text/javascript" src="js/questionUpdate.js" ></script>
	</head>
	<body>
		<div class="container">
			<h1>主观题修改<small>——题目编号12546</small></h1>
			<div class="question">
				<form class="form-horizontal">
					<div class="form-group">
						<textarea class="form-control" placeholder="题干" oninput="changeRows(this)">Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs session，Cookie可以存放大量的文本数据。安全性低，效率低。</textarea>
					</div>
				</form>
			</div>
			
			<div class="question">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">难度：</label>
						<div class="col-sm-4">
							<select class="form-control">
								<option>★</option>
								<option>★★</option>
								<option>★★★</option>
								<option>★★★★</option>
								<option>★★★★★</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">内容：</label>
						<div class="col-sm-4">
							<select class="form-control">
								<option>java</option>
								<option>机器学习</option>
								<option>node.js</option>
								<option>redis</option>
								<option>汇编</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">分值：</label>
						<div class="col-sm-4">
							<input type="number" min="1" max="1000" class="form-control" value="10">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">正确答案：</label>
						<div class="col-sm-10">
							<textarea class="form-control" placeholder="题干" oninput="changeRows(this)">Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs session，Cookie可以存放大量的文本数据。安全性低，效率低。</textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">题目解析：</label>
						<div class="col-sm-10">
							<textarea class="form-control" placeholder="题干" oninput="changeRows(this)">Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs session，Cookie可以存放大量的文本数据。安全性低，效率低。</textarea>
						</div>

					</div>
				</form>
			</div>
			
			<button type="button" class="btn btn-primary btn-lg" id="saveUpdate">修改</button>
			
		</div>
	</body>
</html>

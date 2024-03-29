<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>testSystem login</title>
		<link rel="icon" href="../img/icon.png" />

		<link rel="stylesheet" href="../css/bootstrap.css" />
		<script type="text/javascript" src="../js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="../js/jquery.validate.js" ></script>
		<script type="text/javascript" src="../js/messages_zh.js" ></script>
		
		<link rel="stylesheet" href="css/login.css" />
		<script type="text/javascript" src="js/login.js" ></script>

	</head>

	<body>

		<div class="container">
		
			<form class="form-horizontal myform" id="register1">
				<legend style="text-align: center;">考试系统root用户登录</legend>
				<div class="form-group">
					<label for="user" class="col-sm-3 control-label">用户名<span style="color: red;">*</span></label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="user" id="user" placeholder="用户名" autocomplete="off">	
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-sm-3 control-label">密码<span style="color: red;">*</span></label>
					<div class="col-sm-6">
						<input type="password" class="form-control" name="password" id="password" placeholder="密码" autocomplete="off">
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-10">
						<button type="submit" class="btn btn-default">登录</button>
					</div>
				</div>
			</form>
		</div>
		

		<script type="text/javascript" src="js/bootstrap.js"></script>
	</body>

</html>
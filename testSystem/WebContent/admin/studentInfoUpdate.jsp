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
		
		<script type="text/javascript" src="js/studentInfoUpdate.js" ></script>
		
	</head>
	<body>
		<div class="container-fluid">
			<div id="updateDiv">
				<form class="form-horizontal">
					<legend>学生信息修改</legend>
					<div class="form-group">
						<label for="studentId" class="col-sm-2 control-label hidden-xs">
							用户编号
						</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="studentId" name="studentId" placeholder="用户id" autocomplete="off" disabled="disabled">
						</div>
					</div>
					<div class="form-group">
					  	<label for="headImage" class="col-sm-2 control-label">头像</label>
					  	<div class="col-sm-8">
					  		<div style="display:inline-block;position:relative;overflow: hidden;vertical-align:middle">
					  			<button type="button" class="btn btn-success">选择图片</button>
					  			<input type="file" id="headImage" onchange="loadFile(this.files[0])" style="position:absolute;top:0;left:0;font-size:34px; opacity:0">
					  		</div>
					  		<span id="fileName">未选择图片</span>
					  	</div>
					</div>
					<div class="form-group">
						<label for="userName" class="col-sm-2 control-label hidden-xs">
							用户名
						</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="userName" name="userName" placeholder="用户名" autocomplete="off" value="tom">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label hidden-xs">
							密码
						</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" id="password" name="password" placeholder="密码" autocomplete="off" value="1234568">
						</div>
					</div>
					<div class="form-group">
						<label for="realName" class="col-sm-2 control-label hidden-xs">
							真实姓名
						</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="realName" name="realName" placeholder="真实姓名" autocomplete="off" value="王麻子">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label hidden-xs">
							邮箱
						</label>
						<div class="col-sm-8">
							<input type="email" class="form-control" id="email" name="email" placeholder="邮箱" autocomplete="off" value="256987412qq.com">
						</div>
					</div>
					<div class="form-group">
						<label for="birthday" class="col-sm-2 control-label hidden-xs">生日&nbsp;&nbsp;</label>
						<div class="col-sm-8">
							<input type="date" class="form-control" id="birthday" name="birthday" value="1998-01-17">
						</div>
					</div>
					<div class="form-group">
						<label for="telephone" class="col-sm-2 control-label hidden-xs">电话&nbsp;&nbsp;</label>
						<div class="col-sm-8">
							<input type="tel" class="form-control" id="telephone" name="telephone" placeholder="电话" autocomplete="off" value="12579846321">
						</div>
					</div>
					<div class="form-group">
						<label for="myTeacher" class="col-sm-2 control-label hidden-xs">指导老师&nbsp;&nbsp;</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="myTeacher" name="myTeacher" placeholder="指导老师" autocomplete="off" value="jack">
						</div>
					</div>
					<div class="form-group">
						<label for="registerTime" class="col-sm-2 control-label hidden-xs">注册时间&nbsp;&nbsp;</label>
						<div class="col-sm-8">
							<input type="date" class="form-control" name="registerTime" id="registerTime" value="2018-11-01" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label hidden-xs">性别&nbsp;&nbsp;</label>
						<div class=" col-sm-8">
							<div class="radio">
								<label class="radio-inline">
						          <input type="radio" name="gender" value="man" checked="checked"> 男
						        </label>
						        <label class="radio-inline">
						          <input type="radio" name="gender" value="woman"> 女
						        </label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="signature" class="col-sm-2 control-label hidden-xs">个性签名&nbsp;&nbsp;</label>
						<div class="col-sm-8">
							<textarea class="form-control" placeholder="个性签名" style="resize: none;" rows="7">吾为所持剑之骨。&#10;钢铁为身，而火焰为血。&#10;手制之剑已达千余。&#10;不知死亡。&#10;亦不知生命。&#10;曾承受痛苦创造诸多武器。</textarea>
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

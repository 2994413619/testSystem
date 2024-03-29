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
	</head>
	<body>
		<div class="container-fluid">
			<h1 style="text-align: center; font-family: '华文楷体';">老师信息管理</h1>
			<div class="row" style="margin-bottom: 10px;padding-right: 17px;">
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>不论激活</option>
						<option>激活用户</option>
						<option>未激活用户</option>
					</select>
				</div>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>不论性别</option>
						<option>男</option>
						<option>女</option>
					</select>
				</div>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>不论注册时间</option>
						<option>一周内注册</option>
						<option>一月内注册</option>
						<option>一年内注册</option>
					</select>
				</div>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<span class="btn">一共200人</span>
				</div>
				<form class="form-inline" style="float: right;">
					<button type="button" class="btn btn-primary" style="margin-right: 30px;">导出信息</button>
					<div class="form-group">
						<input type="text" class="form-control" id="queryRequest" autocomplete="off" placeholder="输入查询内容">
					</div>
					<input type="image" class="btn btn-default" src="../img/query1.png" onmouseout="changeQuery1(this)" onmouseover="changeQuery2(this)" />
				</form>
			</div>
			
			<div class="table-responsive">
				<table class="table table-bordered table-hover" id="myTable">
					<thead>
						<tr>
							<td nowrap="nowrap">编号</td>
							<td nowrap="nowrap">用户名</td>
							<td nowrap="nowrap">头像</td>
							<td nowrap="nowrap">真实姓名</td>
							<td nowrap="nowrap">密码</td>
							<td nowrap="nowrap">邮箱</td>
							<td nowrap="nowrap">性别</td>
							<td nowrap="nowrap">生日</td>
							<td nowrap="nowrap">电话</td>
							<td nowrap="nowrap">注册日期</td>
							<td nowrap="nowrap">个性签名</td>
							<td nowrap="nowrap">激活状态</td>
							<td nowrap="nowrap">使用申请</td>
							<td nowrap="nowrap">操作</td>
							<td nowrap="nowrap">多选</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1234678</td>
							<td>tom</td>
							<td>
								<img src="../img/nologinHear.png">
							</td>
							<td>王麻子</td>
							<td>123456987AB</td>
							<td>123456789qq.com</td>
							<td>男</td>
							<td>1998-01-17</td>
							<td>15784236954</td>
							<td>1999-02-02</td>
							<td style="text-align: left;text-indent: 2em;">
								<p>吾为所持剑之骨。</p>
								<p>钢铁为身，而火焰为血。</p>
								<p>手制之剑已达千余。</p>
								<p>不知死亡。</p>
								<p>亦不知生命。</p>
								<p>曾承受痛苦创造诸多武器。</p>
							</td>
							<td>已激活</td>
							<td class="error">
								未通过
								<br />
								<br />
								<button class="btn btn-success">允许</button>
							</td>
							<td class="right">
								<a href="teacherInformationUpdate.html">修改</a>
								<br /><br />
								<a href="#" class="delete">删除</a>
							</td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<!--分页-->
			<nav aria-label="Page navigation" class="pull-left">
				<ul class="pagination">
					<li>
						<a href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<li class="active">
						<a href="#">1</a>
					</li>
					<li>
						<a href="#">2</a>
					</li>
					<li>
						<a href="#">3</a>
					</li>
					<li>
						<a href="#">4</a>
					</li>
					<li>
						<a>...</a>
					</li>
					<li>
						<a href="#">22</a>
					</li>
					<li>
						<a href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
				<input type="button" class="btn btn-default" id="dumpButton" value="跳转" />
				<input type="number" class="form-control" min="1" max="5" step="1" value="1" id="dumpNumber" onchange="controlNumber()" />
				<span style="float:right;margin-top:25px ;">&nbsp;&nbsp;&nbsp;&nbsp;共5页</span>
			</nav>
			
			<div class="pull-right" id="batchDeal">
				<button class="btn btn-default" onclick="allCheck(this)" style="width: 70px;">全选</button>
				<button class="btn btn-danger">删除</button>
			</div>
			
		</div>
		
	</body>
</html>

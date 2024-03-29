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
		<script type="text/javascript" src="js/examDataPublic.js"></script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row" style="min-height: 250px;">
				<div class="testInfoFather" style="margin-left: 50px;margin-right:150px;float: left;">
					<p style="font-size: 25px;">原题：</p>
					<p>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低</p>
				</div>
				<div class="testInfoFather" style="margin-left: 50px;float: left;">
					<p style="font-size: 25px;">正确答案：</p>
					<p><span class="glyphicon glyphicon-ok"></span></p>
				</div>
			</div>
			
			<h1 style="clear: all;">综合测试<small>——第1题数据</small></h1>
			<div class="row testInfoFather">
				<div class="testInfo">题型：判断</div>
				<div class="testInfo">答题人数：48</div>
				<div class="testInfo">正确人数：24</div>
				<div class="testInfo">正确率：50%</div>
				<div class="testInfo">题目分值：10</div>
				<div class="testInfo">平均分：5</div>
				<button class="btn btn-primary pull-right" style="margin-right: 17px;">导出数据</button>
			</div>	
			
			<div class="table-responsive">
				<table class="table table-bordered table-hover" id="myTable">
					<thead>
						<tr>
							<th nowrap="nowrap">学生编号</th>
							<th nowrap="nowrap">姓名</th>
							<th nowrap="nowrap">正确否</th>
							<th nowrap="nowrap">学生答案</th>
							<th nowrap="nowrap">学生得分</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">
								<span class="glyphicon glyphicon-ok"></span>
							</td>
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">
								<span class="glyphicon glyphicon-ok"></span>
							</td>
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">
								<span class="glyphicon glyphicon-ok"></span>
							</td>
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">
								<span class="glyphicon glyphicon-ok"></span>
							</td>
							<td>10</td>
						</tr>
						<tr>
							<td>2</td>
							<td>jack</td>
							<td class="error">错误</td>
							<td class="error">
								<span class="glyphicon glyphicon-remove"></span>
							</td>
							<td>0</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">
								<span class="glyphicon glyphicon-ok"></span>
							</td>
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">
								<span class="glyphicon glyphicon-ok"></span>
							</td>
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">
								<span class="glyphicon glyphicon-ok"></span>
							</td>
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">
								<span class="glyphicon glyphicon-ok"></span>
							</td>
							<td>10</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</body>
</html>

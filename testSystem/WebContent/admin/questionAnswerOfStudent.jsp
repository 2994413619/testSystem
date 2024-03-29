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
			<h1>学生答题<small>——第1题数据</small></h1>
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
				<table class="table table-bordered" id="myTable">
					<thead>
						<tr>
							<th nowrap="nowrap">学生编号</th>
							<th nowrap="nowrap">姓名</th>
							<th nowrap="nowrap">学生答案</th>
							<th nowrap="nowrap">是否正确</th>
							<th nowrap="nowrap">学生得分</th>
							<th nowrap="nowrap">答题日期</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td>
								<p>1、测试数据</p>
								<p>2、测试数据</p>
								<p>3、测试数据</p>
								<p>4、测试数据</p>
							</td>
							<td class="right">正确</td>
							<td>10</td>
							<td>2018-10-26</td>
						</tr>
						
					</tbody>
				</table>
			</div>
			
		</div>
	</body>
</html>

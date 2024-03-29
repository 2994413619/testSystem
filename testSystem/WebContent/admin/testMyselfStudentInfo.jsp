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
			<h1>学生自我测试详情<small>——tom</small></h1>
			<div class="row testInfoFather">
				<div class="testInfo">测试总数：50</div>
				<div class="testInfo">随机测试数：25</div>
				<div class="testInfo">自我编辑数：25</div>
				<button class="btn btn-primary pull-right" style="margin-right: 17px;">导出数据</button>
			</div>
			
			
			<div class="table-responsive">
				<table class="table table-hover table-bordered" id="myTable">
					<thead>
						<tr>
							<td nowrap="nowrap">编号</td>
							<td nowrap="nowrap">测试类型</td>
							<td nowrap="nowrap">难度/测试名</td>
							<td nowrap="nowrap">单选数</td>
							<td nowrap="nowrap">多选数</td>
							<td nowrap="nowrap">判断数</td>
							<td nowrap="nowrap">填空数</td>
							<td nowrap="nowrap">主观数</td>
							<td nowrap="nowrap">总分</td>
							<td nowrap="nowrap">得分</td>
							<td nowrap="nowrap">测试详情</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>01235872</td>
							<td>随机测试</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>5</td>
							<td>5</td>
							<td>10</td>
							<td>3</td>
							<td>3</td>
							<td>100</td>
							<td>80</td>
							<td><a href="testMyselfTestInfoRandom.html">测试详情</a></td>
						</tr>
						<tr>
							<td>01235872</td>
							<td>编辑测试</td>
							<td>考前测试</td>
							<td>5</td>
							<td>5</td>
							<td>10</td>
							<td>3</td>
							<td>3</td>
							<td>100</td>
							<td>80</td>
							<td><a href="testMyselfTestInfoEdit.html">测试详情</a></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<!--分页-->
			<nav aria-label="Page navigation" class="pull-right">
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
			
		</div>
	</body>
</html>

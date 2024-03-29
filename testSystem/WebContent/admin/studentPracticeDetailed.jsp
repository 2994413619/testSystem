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
		<div class="container-fluid">
			<h1>学生答题详情<small>——tom</small></h1>
			<div class="row testInfoFather">
				<div class="testInfo">单选：10</div>
				<div class="testInfo">多选：10</div>
				<div class="testInfo">判断：10</div>
				<div class="testInfo">填空：10%</div>
				<div class="testInfo">主观：10</div>
				<div class="testInfo">总答题数：50</div>
				<div class="testInfo">总正确数：25</div>
				<div class="testInfo">正确率：50%</div>
				<button class="btn btn-primary pull-right" style="margin-right: 17px;">导出数据</button>
			</div>
			
			<div class="table-responsive">
				<table class="table table-bordered table-hover" id="myTable">
					<thead>
						<tr>
							<td nowrap="nowrap">题目编号</td>
							<td nowrap="nowrap">题目类型</td>
							<td nowrap="nowrap">题目难度</td>
							<td nowrap="nowrap">题目内容</td>
							<td nowrap="nowrap">分值</td>
							<td nowrap="nowrap">得分</td>
							<td nowrap="nowrap">正确答案</td>
							<td nowrap="nowrap">学生答案</td>
							<td nowrap="nowrap">正确否</td>
							<td nowrap="nowrap">答题时间</td>
							<td nowrap="nowrap">题目详情</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>15482</td>
							<td>单选题</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>javase</td>
							<td>10</td>
							<td>10</td>
							<td>A</td>
							<td>A</td>
							<td class="right">正确</td>
							<td>2018-02-05</td>
							<td><a href="../../question1.html" target="_blank" target="_blank">题目详情</a></td>
						</tr>
						<tr>
							<td>15482</td>
							<td>多选题</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>javase</td>
							<td>10</td>
							<td>0</td>
							<td>A、C、D</td>
							<td>C、D</td>
							<td class="error">错误</td>
							<td>2018-02-05</td>
							<td><a href="../question2.html" target="_blank">题目详情</a></td>
						</tr>
						<tr>
							<td>15482</td>
							<td>判断题</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>javase</td>
							<td>10</td>
							<td>10</td>
							<td>对</td>
							<td>对</td>
							<td class="right">正确</td>
							<td>2018-02-05</td>
							<td><a href="../question3.html" target="_blank">题目详情</a></td>
						</tr>
						<tr>
							<td>15482</td>
							<td>主观题</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>javase</td>
							<td>10</td>
							<td>主观不打分</td>
							<td>主观不打分</td>
							<td>主观不打分</td>
							<td>主观不打分</td>
							<td>2018-02-05</td>
							<td><a href="../question3.html" target="_blank">题目详情</a></td>
						</tr>
						<tr>
							<td>15482</td>
							<td>填空题</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>javase</td>
							<td>10</td>
							<td>10</td>
							<td>1、javase<br/>2、jsp<br/>3、servlet</td>
							<td>1、javase<br/>2、jsp<br/>3、servlet</td>
							<td class="right">正确</td>
							<td>2018-02-05</td>
							<td><a href="../question5.html" target="_blank">题目详情</a></td>
						</tr>
						<tr>
							<td>15482</td>
							<td>单选题</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>javase</td>
							<td>10</td>
							<td>10</td>
							<td>A</td>
							<td>A</td>
							<td class="right">正确</td>
							<td>2018-02-05</td>
							<td><a href="../question1.html" target="_blank">题目详情</a></td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</body>
</html>

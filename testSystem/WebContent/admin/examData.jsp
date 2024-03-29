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
			<h1>综合测试数据<small>——以题目为单位</small></h1>
			
			<div class="row testInfoFather">
				<div class="testInfo">考试时间：2018-10-05 17:00</div>
				<div class="testInfo">考试时长：120分</div>
				<div class="testInfo">试卷总分：100</div>
				<div class="testInfo">平均分：80</div>
				<button class="btn btn-primary pull-right" style="margin-right: 17px;">导出数据</button>
			</div>	
			
			<div class="table-responsive">
				<table class="table table-bordered table-hover table-striped" id="myTable" style="margin-bottom: 50px;">
					<thead>
						<tr>
							<th nowrap="nowrap">题号</th>
							<th nowrap="nowrap">题型</th>
							<th nowrap="nowrap">题干</th>
							<th nowrap="nowrap">正确答案</th>
							<th nowrap="nowrap">题目分值</th>
							<th nowrap="nowrap">平均分</th>
							<th nowrap="nowrap" class="right">正确人数</th>
							<th nowrap="nowrap" class="error">错误人数</th>
							<th nowrap="nowrap">正确率</th>
							<th nowrap="nowrap">本题答题详情</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td nowrap="nowrap">1</td>
							<td nowrap="nowrap">单选题</td>
							<td>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低</td>
							<td nowrap="nowrap">C、InterruptedException</td>
							<td nowrap="nowrap">5</td>
							<td nowrap="nowrap">2.5</td>
							<td nowrap="nowrap" class="right">24</td>
							<td nowrap="nowrap" class="error">24</td>
							<td nowrap="nowrap">50%</td>
							<td nowrap="nowrap">
								<a href="examDataChoose.html">本题详情</a>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">2</td>
							<td nowrap="nowrap">多选题</td>
							<td>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低</td>
							<td nowrap="nowrap">C、InterruptedException</td>
							<td nowrap="nowrap">5</td>
							<td nowrap="nowrap">2.5</td>
							<td nowrap="nowrap" class="right">24</td>
							<td nowrap="nowrap" class="error">24</td>
							<td nowrap="nowrap">50%</td>
							<td nowrap="nowrap">
								<a href="examDataMultiChoose.html">本题详情</a>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">3</td>
							<td nowrap="nowrap">判断题</td>
							<td>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低</td>
							<td nowrap="nowrap">C、InterruptedException</td>
							<td nowrap="nowrap">5</td>
							<td nowrap="nowrap">2.5</td>
							<td nowrap="nowrap" class="right">24</td>
							<td nowrap="nowrap" class="error">24</td>
							<td nowrap="nowrap">50%</td>
							<td nowrap="nowrap">
								<a href="examDataJudge.html">本题详情</a>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">4</td>
							<td nowrap="nowrap">填空题</td>
							<td>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低</td>
							<td nowrap="nowrap">C、InterruptedException</td>
							<td nowrap="nowrap">5</td>
							<td nowrap="nowrap">2.5</td>
							<td nowrap="nowrap" class="right">24</td>
							<td nowrap="nowrap" class="error">24</td>
							<td nowrap="nowrap">50%</td>
							<td nowrap="nowrap">
								<a href="examDataGapFilling.html">本题详情</a>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">5</td>
							<td nowrap="nowrap">主观题</td>
							<td>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低</td>
							<td nowrap="nowrap">C、InterruptedException</td>
							<td nowrap="nowrap">5</td>
							<td nowrap="nowrap">2.5</td>
							<td nowrap="nowrap" class="right">24</td>
							<td nowrap="nowrap" class="error">24</td>
							<td nowrap="nowrap">50%</td>
							<td nowrap="nowrap">
								<a href="examDataSubjective.html">本题详情</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
				
			<h1>学生数据<small>——以学生为单位</small></h1>
			<div class="row testInfoFather">
				<button class="btn btn-primary pull-right" style="margin-right: 17px;">导出数据</button>
			</div>
			<div class="table-responsive">
				<table class="table table-bordered table-hover table-striped" style="margin-bottom: 50px;">
					<thead>
						<tr>
							<th nowrap="nowrap">名次</th>
							<th nowrap="nowrap">姓名</th>
							<th nowrap="nowrap">编号</th>
							<th nowrap="nowrap">性别</th>
							<th nowrap="nowrap">单选得分（30）</th>
							<th nowrap="nowrap">多选得分（10）</th>
							<th nowrap="nowrap">填空得分（20）</th>
							<th nowrap="nowrap">判断得分（10）</th>
							<th nowrap="nowrap">其他得分（30）</th>
							<th nowrap="nowrap">总分（100）</th>
							<th nowrap="nowrap">学生答题详情</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td nowrap="nowrap">1</td>
							<td nowrap="nowrap">tom</td>
							<td nowrap="nowrap">2015786</td>
							<td nowrap="nowrap">男</td>
							<td nowrap="nowrap">20</td>
							<td nowrap="nowrap">10</td>
							<td nowrap="nowrap">15</td>
							<td nowrap="nowrap">10</td>
							<td nowrap="nowrap">25</td>
							<td nowrap="nowrap">80</td>
							<td nowrap="nowrap">
								<a href="examDataStudent.html">答题详情</a>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">2</td>
							<td nowrap="nowrap">tom</td>
							<td nowrap="nowrap">2015786</td>
							<td nowrap="nowrap">男</td>
							<td nowrap="nowrap">20</td>
							<td nowrap="nowrap">10</td>
							<td nowrap="nowrap">15</td>
							<td nowrap="nowrap">10</td>
							<td nowrap="nowrap">25</td>
							<td nowrap="nowrap">80</td>
							<td nowrap="nowrap">
								<a href="examDataStudent.html">答题详情</a>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">3</td>
							<td nowrap="nowrap">tom</td>
							<td nowrap="nowrap">2015786</td>
							<td nowrap="nowrap">男</td>
							<td nowrap="nowrap">20</td>
							<td nowrap="nowrap">10</td>
							<td nowrap="nowrap">15</td>
							<td nowrap="nowrap">10</td>
							<td nowrap="nowrap">25</td>
							<td nowrap="nowrap">80</td>
							<td nowrap="nowrap">
								<a href="examDataStudent.html">答题详情</a>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">4</td>
							<td nowrap="nowrap">tom</td>
							<td nowrap="nowrap">2015786</td>
							<td nowrap="nowrap">男</td>
							<td nowrap="nowrap">20</td>
							<td nowrap="nowrap">10</td>
							<td nowrap="nowrap">15</td>
							<td nowrap="nowrap">10</td>
							<td nowrap="nowrap">25</td>
							<td nowrap="nowrap">80</td>
							<td nowrap="nowrap">
								<a href="examDataStudent.html">答题详情</a>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">5</td>
							<td nowrap="nowrap">tom</td>
							<td nowrap="nowrap">2015786</td>
							<td nowrap="nowrap">男</td>
							<td nowrap="nowrap">20</td>
							<td nowrap="nowrap">10</td>
							<td nowrap="nowrap">15</td>
							<td nowrap="nowrap">10</td>
							<td nowrap="nowrap">25</td>
							<td nowrap="nowrap">80</td>
							<td nowrap="nowrap">
								<a href="examDataStudent.html">答题详情</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>

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
			<h1 style="text-align: center; font-family: '华文楷体';">学生题库练习</h1>
			<div class="row" style="margin-bottom: 10px;padding-right: 17px;">
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>默认排序</option>
						<option>答题数升序</option>
						<option>答题数降序</option>
						<option>正确率升序</option>
						<option>正确率降序</option>
					</select>
				</div>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>不论性别</option>
						<option>男</option>
						<option>女</option>
					</select>
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
				<table class="table table-striped table-hover" id="myTable">
					<thead>
						<tr>
							<th nowrap="nowrap">编号</th>
							<th nowrap="nowrap">用户名</th>
							<th nowrap="nowrap">真实姓名</th>
							<th nowrap="nowrap">单选答题数</th>
							<th nowrap="nowrap">多选答题数</th>
							<th nowrap="nowrap">判断答题数</th>
							<th nowrap="nowrap">填空答题数</th>
							<th nowrap="nowrap">主观答题数</th>
							<th nowrap="nowrap">总答题数</th>
							<th nowrap="nowrap">答题正确数</th>
							<th nowrap="nowrap">正确率</th>
							<th nowrap="nowrap">练习详情</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>50</td>
							<td>25</td>
							<td>50%</td>
							<td><a href="studentPracticeDetailed.html">练习详情</a></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>50</td>
							<td>25</td>
							<td>50%</td>
							<td><a href="studentPracticeDetailed.html">练习详情</a></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>50</td>
							<td>25</td>
							<td>50%</td>
							<td><a href="studentPracticeDetailed.html">练习详情</a></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>50</td>
							<td>25</td>
							<td>50%</td>
							<td><a href="studentPracticeDetailed.html">练习详情</a></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>50</td>
							<td>25</td>
							<td>50%</td>
							<td><a href="studentPracticeDetailed.html">练习详情</a></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>50</td>
							<td>25</td>
							<td>50%</td>
							<td><a href="studentPracticeDetailed.html">练习详情</a></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>50</td>
							<td>25</td>
							<td>50%</td>
							<td><a href="studentPracticeDetailed.html">练习详情</a></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>50</td>
							<td>25</td>
							<td>50%</td>
							<td><a href="studentPracticeDetailed.html">练习详情</a></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>50</td>
							<td>25</td>
							<td>50%</td>
							<td><a href="studentPracticeDetailed.html">练习详情</a></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>50</td>
							<td>25</td>
							<td>50%</td>
							<td><a href="studentPracticeDetailed.html">练习详情</a></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>50</td>
							<td>25</td>
							<td>50%</td>
							<td><a href="studentPracticeDetailed.html">练习详情</a></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>50</td>
							<td>25</td>
							<td>50%</td>
							<td><a href="studentPracticeDetailed.html">练习详情</a></td>
						</tr>
						<tr>
							<td>01542367</td>
							<td>tom</td>
							<td>王麻子</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>10</td>
							<td>50</td>
							<td>25</td>
							<td>50%</td>
							<td><a href="studentPracticeDetailed.html">练习详情</a></td>
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

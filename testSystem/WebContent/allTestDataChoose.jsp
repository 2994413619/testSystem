<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
		<!--allTestDataChoose.css-->
		<link rel="stylesheet" href="myCss/allTestDataChoose.css" />

		<div class="container-fluid">
			<div class="row" style="min-height: 250px;">
				<div class="testInfoFather" style="margin-left: 50px;margin-right:150px;float: left;">
					<p style="font-size: 25px;">原题：</p>
					<p>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低</p>
					<p>A、测试文字</p>
					<p>B、测试文字</p>
					<p>C、测试文字</p>
					<p>D、测试文字</p>
				</div>
				<div class="testInfoFather" style="margin-left: 50px;float: left;">
					<p style="font-size: 25px;">正确答案：</p>
					<p>A、测试文字</p>
				</div>
			</div>
			
			<h1 style="clear: all;">综合测试<small>——第1题数据</small></h1>
			<div class="row testInfoFather">
				<div class="testInfo">题型：单选</div>
				<div class="testInfo">答题人数：48</div>
				<div class="testInfo">正确人数：24</div>
				<div class="testInfo">正确率：50%</div>
				<div class="testInfo">题目分值：10</div>
				<div class="testInfo">平均分：5</div>
				<button class="btn btn-primary pull-right" style="margin-right: 17px;">导出数据</button>
			</div>	
			
			<div class="table-responsive">
				<table class="table table-bordered table-hover" id="questionData">
					<thead>
						<tr>
							<th nowrap="nowrap">学生编号</th>
							<th nowrap="nowrap">姓名</th>
							<th nowrap="nowrap">打分人</th>
							<th nowrap="nowrap">学生答案</th>
							<th nowrap="nowrap">学生得分</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">A</td>
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">A</td>
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">A</td>
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">A</td>
							<td>10</td>
						</tr>
						<tr>
							<td>2</td>
							<td>jack</td>
							<td class="error">错误</td>
							<td class="error">B</td>
							<td>0</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">A</td>
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">A</td>
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">A</td>
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td class="right">正确</td>
							<td class="right">A</td>
							<td>10</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
<%@ include file="footer.jsp" %>
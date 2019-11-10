<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!--allTestDataChoose.css-->
		<link rel="stylesheet" href="myCss/allTestDataChoose.css" />
		
		<!--allTestDataSubjective.js-->
		<script type="text/javascript" src="myjs/allTestDataSubjective.js" ></script>

		<div class="container-fluid">
			<div class="row" style="min-height: 250px;">
				<div class="testInfoFather" style="margin-left: 50px;margin-right:150px;float: left;">
					<p style="font-size: 25px;">原题：</p>
					<p>Cookie是由浏览器管理，cookie是可以被禁用的。______1______Cookie	vs	session，______2______Cookie可以存放大量的______3______文本数据。安全性低，效率低</p>
				</div>
				<div class="testInfoFather" style="margin-left: 50px;float: left;">
					<p style="font-size: 25px;">正确答案：</p>
					<p>1、测试数据</p>
					<p>2、测试数据</p>
					<p>3、测试数据</p>
					<p>4、测试数据</p>
				</div>
			</div>
			
			<h1 style="clear: all;">综合测试<small>——第1题数据</small></h1>
			<div class="row testInfoFather">
				<div class="testInfo">题型：填空</div>
				<div class="testInfo">答题人数：48</div>
				<div class="testInfo">题目分值：10</div>
				<div class="testInfo">平均分：5</div>
				<button class="btn btn-primary pull-right" style="margin-right: 17px;">导出数据</button>
			</div>	
			
			<div class="table-responsive">
				<table class="table table-bordered table-hover table-striped" id="questionData">
					<thead>
						<tr>
							<th nowrap="nowrap">学生编号</th>
							<th nowrap="nowrap">姓名</th>
							<th nowrap="nowrap">打分人</th>
							<th nowrap="nowrap">正确否</th>
							<th nowrap="nowrap">学生答案</th>
							<th nowrap="nowrap">学生得分</th>
							<th nowrap="nowrap">改卷</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td>jak</td>
							<td class="right">正确</td>
							<td>
								1、测试数据；2、测试数据、3、测试数据
							</td>
							<td id="tomid1">
								<input type="number" min="0" class="form-control" onblur="setScore(this)">
							</td>
							<td>
								<button class="btn btn-primary" onclick="starSetScore(this)" forId="tomid1">打分</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>tom</td>
							<td>jak</td>
							<td class="error">错误</td>
							<td>
								1、测试数据；2、测试数据、3、测试数据
							</td>
							<td id="tomid2">10</td>
							<td>
								<button class="btn btn-primary" onclick="starSetScore(this)" forId="tomid2">打分</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>

<%@ include file="footer.jsp" %>
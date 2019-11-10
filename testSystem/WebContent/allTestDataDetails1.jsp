<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
		<!--allTestData.css-->
		<link rel="stylesheet" href="myCss/allTestDataDetails.css" />

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
				<table class="table table-bordered table-hover table-striped" style="margin-bottom: 50px;">
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
								<a href="allTestDataChoose.jsp">本题详情</a>
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
								<a href="allTestDataMultiChoose.jsp">本题详情</a>
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
								<a href="allTestDataJudge.jsp">本题详情</a>
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
								<a href="allTestDataGapFilling.jsp">本题详情</a>
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
								<a href="allTestDataSubjective.jsp">本题详情</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
				
		</div>
<%@ include file="footer.jsp" %>
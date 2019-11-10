<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!--allTestDataChoose.css-->
		<link rel="stylesheet" href="myCss/questionAnswerOfStudent.css" />

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
				<table class="table table-bordered table-hover" id="questionData">
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
<%@ include file="footer.jsp" %>
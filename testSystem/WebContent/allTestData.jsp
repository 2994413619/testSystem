<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!--publish.css-->
		<link rel="stylesheet" href="myCss/allTestData.css" />
		
		<script type="text/javascript" src="myjs/allTestData.js" ></script>
		
		<div class="container form-horizontal" id="fatherDiv">
			<h1 style="text-align: center;">期末模拟测试数据</h1>
			<div class="shareDiv">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">总分：</label>
						<div class="col-sm-10">
							<label class="control-label">100分</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">试卷数：</label>
						<div class="col-sm-10">
							<label class="control-label">1000份</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">平均分：</label>
						<div class="col-sm-10">
							<label class="control-label">80分</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">第4题（填空选）：</label>
						<div class="col-sm-6">
							<div class="progress" style="margin-top:10px">
							  	<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="min-width: 6em; width:60%;">
							   	 已改50份
							 	</div>
							</div>
						</div>
						<div class="col-sm-2">
							<a href="markGapFilling.jsp" class="btn btn-primary">改卷</a>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">第4题（填空选）：</label>
						<div class="col-sm-6">
							<div class="progress" style="margin-top:5px">
							  	<div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="min-width: 6em; width:100%;">
							   	 已改1000份
							 	</div>
							</div>
						</div>
						<div class="col-sm-2">
							<a href="markGapFilling.jsp" class="btn btn-primary">改卷</a>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><a href="allTestDataDetails1.jsp">各题详细数据</a></label>
						<label class="col-sm-2 control-label"><a href="allTestDataDetails2.jsp">学生详细数据</a></label>
						
					</div>
				</form>
			</div>
			<p style="font-size: 20px;margin-top: 50px;">添加改卷人</p>
			<div class="shareDiv">
				<form class="form-horizontal">
					<div class="form-group">
						<label for="userName" class="col-sm-2 control-label">老师用户名：</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="userName" id="userName" placeholder="老师用户名" autocomplete="off">
						</div>
						<button type="button" class="col-sm-1 btn btn-default" onclick="addTeacherName()">添加</button>
					</div>
					<div class="form-group">
						<label for="oldPassword" class="col-sm-2 control-label">改卷人：</label>
						<div class="col-sm-5">
							<div id="markTeacher">
								<div class="markTeacherItem">
									tom（王麻子）
									<span class="glyphicon glyphicon-remove myRemove"></span>
								</div>
								<div class="markTeacherItem">
									jack（顾慎之）
									<span class="glyphicon glyphicon-remove myRemove"></span>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

<%@ include file="footer.jsp" %>
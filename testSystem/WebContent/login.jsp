<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${!empty user }">
	<%response.sendRedirect(request.getContextPath()+"/Index?method=index"); %>
</c:if>

<%@ include file="header.jsp" %>
		<!--loginCss-->
		<link rel="stylesheet" href="myCss/login.css" />
		
		<!-- loginScript -->
		<script type="text/javascript" src="myjs/login.js" ></script>
		
		<!--login-->
		<div class="container-fluid loginHtml">
			<div class="divForm col-lg-4 col-md-6 col-sm-8 col-xs-10 col-lg-offset-4 col-md-offset-3 col-sm-offset-2 col-xs-offset-1">
				<form class="form-horizontal">
					<legend>用户登录</legend>
					<div class="form-group">
						<label for="userType" class="col-sm-3 control-label">用户类型</label>
						<div class="col-sm-6">
							<select class="form-control" name="userTypeId" id="userType">
								<option value="0">学生</option>
								<option value="1">教师</option>
							</select>
						</div>
					</div>
					<div class="form-group" id="userNameDiv">
						<label for="userName" class="col-sm-3 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="userName" id="userName" placeholder="用户名" autocomplete="off">
						</div>
					</div>
					<div class="form-group" id="passwordDiv">
						<label for="password" class="col-sm-3 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" name="password" id="password" placeholder="密码">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-6">
							<div class="checkbox">
								<label>
						          <input type="checkbox" id="autoLogin" name="autoLogin" value="autoLogin"> 一周之内自动登录
						        </label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-6">
							<input type="button" class="btn btn-default" id="login" value="登录" onclick="userLogin()"/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-xs-6 col-sm-6">
							<a href="teacherRegister.jsp" style="color:white;font-size: 20px;">教师注册</a>
						</div>
						<a href="studentRegister.jsp" style="color:white;font-size: 20px;">学生注册</a>
					</div>
				</form>
			</div>
		</div>
<%@ include file="footer.jsp" %>
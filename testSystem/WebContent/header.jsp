<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>testSystem</title>

		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">

		<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
		<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
		<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
		<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>

		<link rel="icon" href="${pageContext.request.contextPath }/img/icon.png" />
		
		<!--header样式-->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/myCss/header.css" />
		
	</head>

	<body>
		<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
					<a class="navbar-brand" href="${pageContext.request.contextPath }/Index?method=index">首页</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							<a href="${pageContext.request.contextPath }/student/question?method=getQuestions">题库练习</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/allTest.jsp">所有考试</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/testMyself.jsp">自我测试</a>
						</li>
						<!-- 老师用户显示 -->
						<c:if test="${!empty user.teacher }">
							<li>
								<a href="${pageContext.request.contextPath }/studentManage.jsp">学生管理</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath }/teacher/question?method=getQuestions">题库管理</a>
							</li>
						</c:if>
					</ul>
					
					<ul class="nav navbar-nav navbar-right">
				        <li>
				        	<!-- 未登录 -->
				        	<c:if test="${empty user }">
				        		<a href="${pageContext.request.contextPath }/login.jsp">
					        		<img src="${pageContext.request.contextPath }/img/noLogin.jpg" id="headImage"/>
					        		&nbsp;登录/注册
					        	</a>
				        	</c:if>
				        	<!-- 老师登录 -->
				        	<c:if test="${!empty user.teacher }">
				        		<a href="${pageContext.request.contextPath }/userInformation.jsp">
				        			<!-- 没有像 -->
					        		<c:if test="${empty user.teacher.headImage }">
					        			<img src="${pageContext.request.contextPath }/img/noLogin.jpg" id="headImage"/>
					        		</c:if>
					        		<!-- 有头像 -->
						        	<c:if test="${!empty user.teacher.headImage }">
					        			<img src="${pageContext.request.contextPath }/${user.teacher.headImage }" id="headImage"/>
					        		</c:if>	
						        	${user.teacher.userName }
					        	</a>
				        	</c:if>
				        	<!-- 学生登录 -->
				        	<c:if test="${!empty user.student}">
				        		<a href="${pageContext.request.contextPath }/userInformation.jsp">
				        			<!-- 没头像 -->
					        		<c:if test="${empty user.student.headImage }">
					        			<img src="${pageContext.request.contextPath }/img/noLogin.jpg" id="headImage"/>
					        		</c:if>
					        		<!-- 有头像 -->
						        	<c:if test="${!empty user.student.headImage }">
					        			<img src="${pageContext.request.contextPath }/${user.student.headImage }" id="headImage"/>
					        		</c:if>	
						        	${user.student.userName }
					        	</a>
				        	</c:if>
				        </li>
				        <!-- 老师注销 -->
				        <c:if test="${!empty user.teacher}">
				        	<li>
					        	<a href="${pageContext.request.contextPath }/User?method=logoutTeacher">
					        		注销
					        	</a>
					        </li>
				        </c:if>
				        <!-- 学生注销 -->
				        <c:if test="${!empty user.student}">
				        	<li>
					        	<a href="${pageContext.request.contextPath }/User?method=logoutStudent">
					        		注销
					        	</a>
					        </li>
				        </c:if>
				        
				        <!--<li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">dropdown <span class="caret"></span></a>
				          <ul class="dropdown-menu">
				            <li><a href="#">Action</a></li>
				            <li><a href="#">Another action</a></li>
				            <li><a href="#">Something else here</a></li>
				            <li role="separator" class="divider"></li>
				            <li><a href="#">Separated link</a></li>
				          </ul>
				        </li>-->
				      </ul>
					
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		
		<input type="hidden" id="contextPath" name="contextPath" value="${pageContext.request.contextPath }" />

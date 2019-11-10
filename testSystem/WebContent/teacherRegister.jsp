<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${!empty user }">
	<%response.sendRedirect(request.getContextPath()+"/Index?method=index"); %>
</c:if>
    
    
<%@ include file="header.jsp" %>
<!--registerCss-->
		<link rel="stylesheet" href="myCss/register.css" />
		
		<!--studentJavascript-->
		<script type="text/javascript" src="js/jquery.validate.js" ></script>
		<script type="text/javascript" src="messages_zh.js" ></script>
		<script type="text/javascript" src="myjs/teacherRegister.js" ></script>

		<!--register-->
		<div class="container-fluid registerHtml">
			<div class="divForm col-lg-4 col-md-6 col-sm-8 col-xs-10 col-lg-offset-4 col-md-offset-3 col-sm-offset-2 col-xs-offset-1">
				<form action="${pageContext.request.contextPath }/User" method="post" class="form-horizontal" id="register">
					<input type="hidden" name="method" value="teacherRegister" />
					<legend>教师注册</legend>
					<div class="form-group">
						<label for="userName" class="col-sm-3 control-label hidden-xs">
							用户名
							<span style="color: red;">*</span>
						</label>
						
						<div class="col-sm-6">
							<input type="text" class="form-control" id="userName" name="userName" placeholder="用户名*" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-3 control-label hidden-xs">
							密码
							<span style="color: red;">*</span>
						</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="password" name="password" placeholder="密码*" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label for="repassword" class="col-sm-3 control-label hidden-xs">
							确认密码
							<span style="color: red;">*</span>
						</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="repassword" name="repassword" placeholder="确认密码*" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label for="realName" class="col-sm-3 control-label hidden-xs">
							真实姓名
							<span style="color: red;">*</span>
						</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="realName" name="realName" placeholder="真实姓名*" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-3 control-label hidden-xs">
							邮箱
							<span style="color: red;">*</span>
						</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="email" name="email" placeholder="邮箱*" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label for="birthday" class="col-sm-3 control-label hidden-xs">生日&nbsp;&nbsp;</label>
						<div class="col-sm-6">
							<input type="date" class="form-control" id="birthday" name="birthday" placeholder="1998-01-01">
						</div>
					</div>
					<div class="form-group">
						<label for="telephone" class="col-sm-3 control-label hidden-xs">电话&nbsp;&nbsp;</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="telephone" name="telephone" placeholder="电话" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label hidden-xs">性别&nbsp;&nbsp;</label>
						<div class=" col-sm-6">
							<div class="radio">
								<label class="radio-inline">
						          <input type="radio" name="gender" value="1"> 男
						        </label>
						        <label class="radio-inline">
						          <input type="radio" name="gender" value="0"> 女
						        </label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="signature" class="col-sm-3 control-label hidden-xs">个性签名&nbsp;&nbsp;</label>
						<div class="col-sm-6">
							<textarea class="form-control" name="signature" id="signature" placeholder="个性签名" style="resize: none;"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="vCode" class="col-sm-3 control-label hidden-xs">
							验证码
							<span style="color: red;">*</span>
						</label>
						<div class="col-sm-3 col-xs-6">
							<input type="text" class="form-control" id="vCode" name="vCode" placeholder="验证码*" autocomplete="off">
						</div>
						<img src="${pageContext.request.contextPath }/checkImgServlet" id="checkImg"/>
						<a href="javaScript:;" 
						onclick="javascript:document.getElementById('checkImg').src='${pageContext.request.contextPath }/checkImgServlet?a='+Math.random()">看不清？点这里</a>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-6">
							<input type="submit" class="btn btn-default" value="注册" />
						</div>
					</div>
				</form>
			</div>
		</div>
<%@ include file="footer.jsp" %>
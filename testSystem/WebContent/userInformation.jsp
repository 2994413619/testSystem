<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:if test="${empty user }">
	<%response.sendRedirect(request.getContextPath()+"/Index?method=index"); %>
</c:if>

<%@ include file="header.jsp" %>
<!--userInformationCss-->
		<link rel="stylesheet" href="myCss/userInformation.css" />
		
		<!--userInformationJs-->
		<script type="text/javascript" src="myjs/userInformation.js" ></script>

		<!--userInformation-->
		<div class="container-fluid" id="father">
			<div class="container"id="informationBox" >
				<div class="row">
					<div class="col-sm-6 informationItem">
						<span>头像：</span>
						<c:if test="${empty user }">
							<img src="${pageContext.request.contextPath }/img/nologinHear.png">
						</c:if>
						<c:if test="${!empty user }">
							<c:if test="${!empty user.teacher }">
								<c:if test="${!empty user.teacher.headImage }">
									<img src="${pageContext.request.contextPath }/${user.teacher.headImage }">
								</c:if>
								<c:if test="${empty user.teacher.headImage }">
									<img src="img/nologinHear.png">
								</c:if>
							</c:if>
							<c:if test="${empty user.teacher }">
								<c:if test="${!empty user.student.headImage }">
									<img src="${pageContext.request.contextPath }/${user.student.headImage }">
								</c:if>
								<c:if test="${empty user.student.headImage }">
									<img src="img/nologinHear.png">
								</c:if>
							</c:if>
						</c:if>
					</div>
					<div class="col-sm-6 informationItem">
						<span>生日：</span>
						<c:if test="${!empty user.teacher }">
							<fmt:formatDate value="${user.teacher.birthday }" pattern="yyyy-MM-dd"/>
						</c:if>
						<c:if test="${empty user.teacher }">
							<fmt:formatDate value="${user.student.birthday }" pattern="yyyy-MM-dd"/>
						</c:if>
					</div>
					<div class="col-sm-6 informationItem">
						<span>密码：</span>
						<c:if test="${!empty user.teacher }">
							${user.teacher.password }
						</c:if>
						<c:if test="${empty user.teacher }">
							${user.student.password }
						</c:if>
					</div>
					<div class="col-sm-6 informationItem">
						<span>邮箱：</span>
						<c:if test="${!empty user.teacher }">
							${user.teacher.email }
						</c:if>
						<c:if test="${empty user.teacher }">
							${user.student.email }
						</c:if>
					</div>
					<div class="col-sm-6 informationItem">
						<span>用户名：</span>
						<c:if test="${!empty user.teacher }">
							${user.teacher.userName }
						</c:if>
						<c:if test="${empty user.teacher }">
							${user.student.userName }
						</c:if>
					</div>
					<div class="col-sm-6 informationItem">
						<span>电话：</span>
						<c:if test="${!empty user.teacher }">
							${user.teacher.telephone }
						</c:if>
						<c:if test="${empty user.teacher }">
							${user.student.telephone }
						</c:if>
					</div>
					<div class="col-sm-6 informationItem">
						<span>性别：</span>
						<c:if test="${!empty user.teacher }">
							${1 == user.teacher.gender ? "男" : "女" }
						</c:if>
						<c:if test="${empty user.teacher }">
							${1 == user.student.gender ? "男" : "女" }
						</c:if>
					</div>
					<div class="col-sm-6 informationItem">
						<span>注册时间：</span>
						<c:if test="${!empty user.teacher }">
							<fmt:formatDate value="${user.teacher.registerTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</c:if>
						<c:if test="${empty user.teacher }">
							<fmt:formatDate value="${user.student.registerTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</c:if>
					</div>
					<div class="col-sm-6 informationItem">
						<span>真实姓名：</span>
						<c:if test="${!empty user.teacher }">
							${user.teacher.realName }
						</c:if>
						<c:if test="${empty user.teacher }">
							${user.student.realName }
						</c:if>
					</div>
					<div class="col-sm-6 informationItem">
						<span>个性签名：</span>
						<c:if test="${!empty user.teacher }">
							${user.teacher.signature }
						</c:if>
						<c:if test="${empty user.teacher }">
							${user.student.signature }
						</c:if>
						<!--<label class="col-sm-3 control-label" style="margin-left:-17px ;font-weight:800;font-size: 20px;">个性签名：</label>
						<div class="col-sm-9">
					    	<textarea class="form-control" style="background-color: white;display: inline;" disabled>“尔康,你现在幸福吗？”“紫薇,你忘了？我一直就姓福啊。”</textarea>
					    </div>-->
					</div>
					
					<button class="btn btn-primary btn-lg pull-left">修改密码</button>					
					
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary btn-lg pull-right" data-toggle="modal" data-target="#myModal">
					  	修改信息
					</button>
					
					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
						    <div class="modal-header">
						       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						       <h4 class="modal-title" id="myModalLabel">修改信息</h4>
						    </div>
						    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/student/userInfo" enctype="multipart/form-data">
						    	<c:if test="${!empty user.teacher }">
									<input type="hidden" name="userType" value="1"/>
									<input type="hidden" name="userId" value="${user.teacher.teacherId}" />
								</c:if>
								<c:if test="${empty user.teacher }">
									<input type="hidden" name="userType" value="0"/>
									<input type="hidden" name="userId" value="${user.student.studentId}" />
								</c:if>
							    <div class="modal-body">
							    	
							    	<div class="form-group">
									  	<label for="headImage" class="col-sm-2 control-label">头像</label>
									  	<div class="col-sm-10">
									  		<div style="display:inline-block;position:relative;overflow: hidden;vertical-align:middle">
									  			<button type="button" class="btn btn-success">选择图片</button>
									  			<input type="file" id="headImage" name="headImage" onchange="loadFile(this.files[0])" style="width:100%;height:100%;position:absolute;top:0;left:0;font-size:34px; opacity:0">
									  		</div>
									  		<span id="fileName">未选择图片</span>
									    	<!--<div class="file-container" style="display:inline-block;position:relative;overflow: hidden;vertical-align:middle">
										        <button class="btn btn-success fileinput-button" type="button">上传</button>
										        <input type="file" id="jobData" style="position:absolute;top:0;left:0;font-size:34px; opacity:0">
										    </div>-->
									  	</div>
									</div>
									<div class="form-group">
									  	<label for="realName" class="col-sm-2 control-label">真实姓名</label>
									  	<div class="col-sm-10">
									  		<c:if test="${!empty user.teacher }">
												<input type="text" class="form-control" id="realName" placeholder="真实姓名" autocomplete="off" name="realName" value="${user.teacher.realName }" required="required">
											</c:if>
											<c:if test="${empty user.teacher }">
												<input type="text" class="form-control" id="realName" placeholder="真实姓名" autocomplete="off" name="realName" value="${user.student.realName }" required="required">
											</c:if>
									  	</div>
									</div>
									<div class="form-group">
									  	<label for="birthday" class="col-sm-2 control-label">出生日期</label>
									  	<div class="col-sm-10">
									  		<c:if test="${!empty user.teacher }">
												<fmt:formatDate value="${user.teacher.birthday }" pattern="yyyy-MM-dd" var="birthday"/>
											</c:if>
											<c:if test="${empty user.teacher }">
												<fmt:formatDate value="${user.student.birthday }" pattern="yyyy-MM-dd" var="birthday"/>
											</c:if>
											<input type="date" class="form-control" id="birthday" name="birthday" value="${birthday }" required="required">
									  	</div>
									</div>
									<div class="form-group">
									  	<label for="telephone" class="col-sm-2 control-label">电话</label>
									  	<div class="col-sm-10">
									  		<c:if test="${!empty user.teacher }">
												<input type="tel" class="form-control" id="telephone" autocomplete="off" name="telephone" value="${user.teacher.telephone }" required="required">
											</c:if>
											<c:if test="${empty user.teacher }">
												<input type="tel" class="form-control" id="telephone" autocomplete="off" name="telephone" value="${user.student.telephone }" required="required">
											</c:if>
									  	</div>
									</div>
									<div class="form-group">
									  	<label for="telephone" class="col-sm-2 control-label">性别</label>
									  	<div class="col-sm-10">
									  		<c:if test="${!empty user.teacher }">
												<label class="radio-inline">
												  	<input type="radio" name="gender" id="man" value="1" ${"1" eq user.teacher.gender ? "checked='checked'" : "" }> 男
												</label>
												<label class="radio-inline">
												  	<input type="radio" name="gender" id="woman" value="0" ${"0" eq user.teacher.gender ? "checked='checked'" : "" }> 女
												</label>
											</c:if>
											<c:if test="${empty user.teacher }">
												<label class="radio-inline">
												  	<input type="radio" name="gender" id="man" value="1" ${"1" eq user.student.gender ? "checked='checked'" : "" }> 男
												</label>
												<label class="radio-inline">
												  	<input type="radio" name="gender" id="woman" value="0" ${"0" eq user.student.gender ? "checked='checked'" : "" }> 女
												</label>
											</c:if>
									  	</div>
									</div>
									<div class="form-group">
									  	<label for="signature" class="col-sm-2 control-label">个性签名</label>
									  	<div class="col-sm-10">
									  		<c:if test="${!empty user.teacher }">
												<textarea class="form-control" rows="7" id="signature" style="resize: none;" name="signature" >${user.teacher.signature }</textarea>
											</c:if>
											<c:if test="${empty user.teacher }">
												<textarea class="form-control" rows="7" id="signature" style="resize: none;" name="signature" >${user.student.signature }</textarea>
											</c:if>
									  	</div>
									</div>
									  
							    </div>
							    <div class="modal-footer">
							       <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							       <button type="submit" class="btn btn-primary">提交</button>
							    </div>
						    </form>
					    </div>
					  </div>
					</div>
					
				</div>
			</div>
		</div>

<%@ include file="footer.jsp" %>
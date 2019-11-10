<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
<%@ include file="header.jsp" %>

		<!--questionCss-->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/myCss/addQuestionAll.css" />
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/myjs/addQuestionAll.js" ></script>
		
		<div class="container">
			<h1>主观题添加</h1>
			<form action="${pageContext.request.contextPath }/teacher/question" method="post" class="form-horizontal" id="addQuestion">
				<input type="hidden" name="method" value="addQuestionSubjective" />
				<div class="question">
					<div class="form-group">
						<div class="col-sm-10">
							<div>
								<textarea class="form-control" placeholder="题干" name="questionContent" id="questionContent"></textarea>
							</div>
						</div>
					</div>
				</div>
				
				<div class="question">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="level">难度：</label>
						<div class="col-sm-4">
							<select class="form-control" name="level" id="level">
								<option value="1">★</option>
								<option value="2">★★</option>
								<option value="3">★★★</option>
								<option value="4">★★★★</option>
								<option value="5">★★★★★</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="questionCategoryID">内容：</label>
						<div class="col-sm-4">
							<select class="form-control" name="questionCategoryID" id="questionCategoryID">
								<c:forEach items="${questionCategoryList }" var="questionCategory" >
									<option value="${questionCategory.questionCategoryID }">${questionCategory.questionCategoryName }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="score">分值：</label>
						<div class="col-sm-4">
							<div>
								<input type="number" min="1" max="1000" class="form-control" value="10" name="score" id="score">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="answer">正确答案：</label>
						<div class="col-sm-8">
							<div>
								<textarea class="form-control" placeholder="正确答案" name="answer" id="answer"></textarea>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="questionExplain">题目解析：</label>
						<div class="col-sm-8">
							<textarea class="form-control" placeholder="题目解析" name="questionExplain" id="questionExplain"></textarea>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-primary btn-lg" id="saveUpdate">添加</button>
			</form>
			
		</div>

<%@ include file="footer.jsp" %>
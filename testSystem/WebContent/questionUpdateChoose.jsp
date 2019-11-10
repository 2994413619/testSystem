<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
		<!--questionCss-->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/myCss/questionUpdate.css" />
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/myjs/questionUpdateAll.js" ></script>

		<div class="container">
			<h1>单选题修改<small>——题目编号${question.questionId }</small></h1>
			<form action="${pageContext.request.contextPath }/teacher/question" method="post" class="form-horizontal" id="addQuestion">
				<input type="hidden" name="method" value="updateChoose" />
				<input type="hidden" name="questionId" value="${question.questionId }" />
				<input type="hidden" name="currentPage" value="${currentPage }" />
				<div class="question">
					<div class="form-group">
						<div class="col-sm-10">
							<div>
								<textarea class="form-control" placeholder="题干" name="questionContent" id="questionContent">${question.questionContent }</textarea>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-8">
							<div class="input-group">
								<div class="input-group-addon">A</div>
								<input type="text" class="form-control" autocomplete="off" placeholder="题目选项" name="A" value="${question.questionOptions[0].optionContent }">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-8">
							<div class="input-group">
								<div class="input-group-addon">B</div>
								<input type="text" class="form-control" autocomplete="off" placeholder="题目选项" name="B" value="${question.questionOptions[1].optionContent }">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-8">
							<div class="input-group">
								<div class="input-group-addon">C</div>
								<input type="text" class="form-control" autocomplete="off" placeholder="题目选项"  name="C" value="${question.questionOptions[2].optionContent }">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-8">
							<div class="input-group">
								<div class="input-group-addon">D</div>
								<input type="text" class="form-control" autocomplete="off" placeholder="题目选项"  name="D" value="${question.questionOptions[3].optionContent }">
							</div>
						</div>
					</div>
				</div>
				
				<div class="question">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="level">难度：</label>
						<div class="col-sm-4">
							<select class="form-control" name="level" id="level">
								<option value="1" ${question.level == 1 ? "selected='selected'" : "" }>★</option>
								<option value="2" ${question.level == 2 ? "selected='selected'" : "" }>★★</option>
								<option value="3" ${question.level == 3 ? "selected='selected'" : "" }>★★★</option>
								<option value="4" ${question.level == 4 ? "selected='selected'" : "" }>★★★★</option>
								<option value="5" ${question.level == 5 ? "selected='selected'" : "" }>★★★★★</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="questionCategoryID">内容：</label>
						<div class="col-sm-4">
							<select class="form-control" name="questionCategoryID" id="questionCategoryID">
								<c:forEach items="${questionCategoryList }" var="questionCategory" >
									<option value="${questionCategory.questionCategoryID }"  ${question.category.questionCategoryID == questionCategory.questionCategoryID ? "selected='selected'" : "" }>${questionCategory.questionCategoryName }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="score">分值：</label>
						<div class="col-sm-4">
							<div>
								<input type="number" min="1" max="1000" class="form-control" value="${question.score }" name="score" id="score">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="answer">正确答案：</label>
						<div class="col-sm-4">
							<div>
								<select class="form-control" name="answer" id="answer">
									<option value="A" ${question.answer eq 'A' ? "selected='selected'" : "" }>A</option>
									<option value="B" ${question.answer eq 'B' ? "selected='selected'" : "" }>B</option>
									<option value="C" ${question.answer eq 'C' ? "selected='selected'" : "" }>C</option>
									<option value="D" ${question.answer eq 'D' ? "selected='selected'" : "" }>D</option>
								</select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="questionExplain">题目解析：</label>
						<div class="col-sm-10">
							<textarea class="form-control" placeholder="题干" name="questionExplain" id="questionExplain">${question.questionExplain }</textarea>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-primary btn-lg" id="saveUpdate">修改</button>
			</form>
			
		</div>
<%@ include file="footer.jsp" %>
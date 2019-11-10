<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="header.jsp" %>
		<!--questionCss-->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/myCss/questionUpdate.css" />
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/myjs/questionUpdateAll.js" ></script>
		
		<!--questionUpdateMultiChoose.js-->
		<script type="text/javascript" src="${pageContext.request.contextPath }/myjs/questionUpdateMultiChoose.js" ></script>

		<div class="container">
			<h1>多选题修改<small>——题目编号${question.questionId }</small></h1>
			<form action="${pageContext.request.contextPath }/teacher/question" method="post" class="form-horizontal" id="addQuestion">
				<input type="hidden" name="method" value="updateMultiChoose" />
				<input type="hidden" name="optionCount" value="${fn:length(question.questionOptions) }" id="optionCount" />
				<input type="hidden" name="questionId" value="${question.questionId }" />
				<input type="hidden" name="currentPage" value="${currentPage }" />
				<div class="question">
					<div class="row">
						<div class="col-sm-10" id="QuestionStep">
							<div class="form-group">
								<textarea class="form-control" placeholder="题干" oninput="changeRows(this)" name="questionContent">${question.questionContent }</textarea>
							</div>
							<c:forEach items="${question.questionOptions }" var="option">
								<div class="form-group" id="choose${option.optionIndex }">
									<div class="col-sm-8">
										<div class="input-group">
											<div class="input-group-addon">${option.optionIndex }</div>
											<input type="text" class="form-control" autocomplete="off" placeholder="题目选项" name="${option.optionIndex }" value="${option.optionContent }">
										</div>
									</div>
									<img src="${pageContext.request.contextPath }/img/delete_1.png" onmouseover="deleteChooseImgOver(this)" onmouseout="deleteChooseImgOut(this)" onclick="deletechoose(this)" forDivId="choose${option.optionIndex }" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;"/>
								</div>
							</c:forEach>
						</div>
						<div class="col-sm-2" style="padding-top:15px ;">
							<p class="addChoose" onmouseover="addChooseImgOver(this)" onmouseout="addChooseImgOut(this)" onclick="addChoose(this)">
								<img src="${pageContext.request.contextPath }/img/add_small1.png" style="width: 24px;" />添加选项
							</p>
						</div>
					</div>
				</div>
				
				<div class="question">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="level">难度：</label>
						<div class="col-sm-4">
							<div>
								<select class="form-control" name="level" id="level">
									<option value="1" ${question.level == 1 ? "selected='selected'" : "" }>★</option>
									<option value="2" ${question.level == 2 ? "selected='selected'" : "" }>★★</option>
									<option value="3" ${question.level == 3 ? "selected='selected'" : "" }>★★★</option>
									<option value="4" ${question.level == 4 ? "selected='selected'" : "" }>★★★★</option>
									<option value="5" ${question.level == 5 ? "selected='selected'" : "" }>★★★★★</option>
								</select>
							</div>
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
					<div class="form-group" id="rightChoose">
						<label class="col-sm-2 control-label">正确答案：</label>
						<div class="col-sm-8">
							<c:forEach items="${question.questionOptions }" var="option">
								<label class="checkbox-inline" id="rightchoose${option.optionIndex }">
								  	<input type="checkbox" name="rightChoose" value="${option.optionIndex }"
										<c:if test="${fn:contains(question.answer, option.optionIndex) }">checked="checked"</c:if>
									> ${option.optionIndex }
								</label>
							</c:forEach>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="questionExplain">题目解析：</label>
						<div class="col-sm-10">
							<textarea class="form-control" placeholder="题目解析" oninput="changeRows(this)" name="questionExplain" id="questionExplain">${question.questionExplain }</textarea>
						</div>
					</div>
					
				</div>
				
				<button type="submit" class="btn btn-primary btn-lg" id="saveUpdate">修改</button>
			</form>
		</div>

<%@ include file="footer.jsp" %>
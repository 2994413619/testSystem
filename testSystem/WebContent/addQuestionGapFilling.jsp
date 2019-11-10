<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
<%@ include file="header.jsp" %>

		<!--questionCss-->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/myCss/addQuestionAll.css" />
		
		<!--questionUpdateMultiChoose.js-->
		<script type="text/javascript" src="${pageContext.request.contextPath }/myjs/addQuestionGapFilling.js" ></script>
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/myjs/addQuestionAll.js" ></script>

		<div class="container">
			<h1>填空题添加</h1>
			<form action="${pageContext.request.contextPath }/teacher/question" method="post" class="form-horizontal" id="addQuestion">
				<input type="hidden" name="method" value="addQuestionGapFilling" />
				<input type="hidden" name="optionCount" value="2" id="optionCount" />
				<div class="question">
					<div class="row">
						<div class="col-sm-10" id="QuestionStep">
							<div class="form-group">
								<textarea class="form-control" name="questionStep0" placeholder="题干" oninput="changeRows(this)"></textarea>
							</div>
							<div class="form-group" id="choose1">
								<div class="col-sm-8">
									<div class="input-group">
										<div class="input-group-addon">1</div>
										<input type="text" class="form-control" placeholder="题目选项" value="正确答案" disabled="disabled">
									</div>
								</div>
								<img src="${pageContext.request.contextPath }/img/delete_1.png" onmouseover="deleteChooseImgOver(this)" onmouseout="deleteChooseImgOut(this)" onclick="deletechoose(this)" forDivId="choose1" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;"/>
								<textarea class="form-control" name="questionStep1" placeholder="题干" style="margin-top: 20px;" oninput="changeRows(this)"></textarea>
							</div>
							<div class="form-group" id="choose2">
								<div class="col-sm-8">
									<div class="input-group">
										<div class="input-group-addon">2</div>
										<input type="text" class="form-control" placeholder="题目选项" value="正确答案" disabled="disabled">
									</div>
								</div>
								<img src="${pageContext.request.contextPath }/img/delete_1.png" onmouseover="deleteChooseImgOver(this)" onmouseout="deleteChooseImgOut(this)" onclick="deletechoose(this)" forDivId="choose2" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;"/>
								<textarea class="form-control" name="questionStep2" placeholder="题干" style="margin-top: 20px;" oninput="changeRows(this)"></textarea>
							</div>
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
					<div class="form-group" id="rightChoose">
						<label class="col-sm-2 control-label">正确答案：</label>
						<div class="col-sm-10">
							<div class="form-group" id="rightchoose1">
								<div class="col-sm-8">
									<div class="input-group">
										<div class="input-group-addon">1</div>
										<input type="text" class="form-control" autocomplete="off" placeholder="题目选项" name="1">
									</div>
								</div>
							</div>
							<div class="form-group" id="rightchoose2">
								<div class="col-sm-8">
									<div class="input-group">
										<div class="input-group-addon">2</div>
										<input type="text" class="form-control" autocomplete="off" placeholder="题目选项" name="2">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="questionExplain">题目解析：</label>
						<div class="col-sm-10">
							<textarea class="form-control" placeholder="题干" oninput="changeRows(this)" name="questionExplain" id="questionExplain"></textarea>
						</div>

					</div>
					
				</div>
				
				<button type="submit" class="btn btn-primary btn-lg" id="saveUpdate">添加</button>
			</form>
		</div>

<%@ include file="footer.jsp" %>
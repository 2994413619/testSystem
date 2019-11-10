<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<!--questionCss-->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/myCss/question.css" />

		<div class="container">
			<div class="mylabel">
				<h3>
					<span class="label label-info">${question.category.questionCategoryName }</span>
					<span class="label label-success">${question.score }分题</span>
					<span class="label label-danger">正确率：${question.averageScore }%</span>
					<span class="label label-primary">单选题</span>
					<span class="star">难度系数：
						<c:forEach begin="1" end="${question.level }" step="1">
							<span class="glyphicon glyphicon-star"></span>
						</c:forEach>
						<c:forEach begin="1" end="${5 - question.level }" step="1">
							<span class="glyphicon glyphicon-star-empty"></span>
						</c:forEach>
					</span>
				</h3>
			</div>
			<div class="question">
				<h4>
					${question.questionId }、${question.questionContent }
					<c:if test="${empty answerOfUser }">
						（<span style="color: red;">未作答</span>）
					</c:if>
					<c:if test="${!empty answerOfUser }">
						（<span style="color: #00E0B0;">已作答</span>）
					</c:if>
					
				</h4>
				<form action="${pageContext.request.contextPath }/student/question" method="post">
					<input type="hidden" name="method" value="checkAnswerChoose" />
					<input type="hidden" name="questionId" value="${question.questionId }" />
					<input type="hidden" name="type" value="1" />
					<c:forEach items="${question.questionOptions }" var="option" varStatus="status">
						<p>
							<div class="radio checkDiv">
								<label>
								    <input type="radio" name="answer" id="optionsRadios${status.count }" value="${option.optionIndex }" required="required">
								    ${option.optionIndex }、${option.optionContent }
								</label>
							</div>
						</p>
					</c:forEach>
					<input type="submit" value="提交" class="btn btn-default" style="display: block;float: right;" ${empty answerOfUser ? "" : "disabled='disabled'" } />
				</form>
				
				<br/><br/><hr style="width: 100%;" />
				<c:if test="${!empty answerOfUser }">
					<div>
						<span>正确答案：${question.answer }</span>
						<span style="display:inline-block;float: right;color:${answerOfUser.isRight == 0 ? 'red' : 'green;' } ">你的答案：${answerOfUser.userAnswer }</span>
					</div>
					<hr style="width: 100%;" />
				</c:if>
				
				
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" ${!empty answerOfUser ? "" : "disabled='disabled'" } title="作答后可看">
				  查看解析
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel" style="color: #00E0B0;">正确答案：${question.answer }</h4>
							</div>
							<div class="modal-body">
								<p>${empty question.questionExplain ? '暂无解析' : question.questionExplain }</p>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			
			
			<nav aria-label="..." style="padding-left:28px;padding-right: 28px;">
				<ul class="pager">
					<li class="previous">
						<a href="${pageContext.request.contextPath }/student/question?method=previousQuestion&currentQuestionId=${question.questionId }"><span aria-hidden="true">&larr;</span> 上一题</a>
					</li>
					<li class="next">
						<a href="${pageContext.request.contextPath }/student/question?method=nextQuestion&currentQuestionId=${question.questionId }">下一题 <span aria-hidden="true">&rarr;</span></a>
					</li>
				</ul>
			</nav>
			
		</div>

<%@ include file="footer.jsp" %>
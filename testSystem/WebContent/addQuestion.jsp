<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

		<!--testMyselfType.css-->
		<link rel="stylesheet" href="myCss/addQuestion.css" />
		
		<div class="container" id="testMyselfTypeDiv">
			<div class="row first">
				<a href="${pageContext.request.contextPath }/teacher/question?method=getQuestionCategory&type=1">
					<div class="createDiv">
						<div>
							<img src="img/newTest.png" />
							<p>单选题</p>
						</div>
					</div>
				</a>
				<a href="${pageContext.request.contextPath }/teacher/question?method=getQuestionCategory&type=2">
					<div class="createDiv">
						<div>
							<img src="img/newTest.png" />
							<p>多选题</p>
						</div>
					</div>
				</a>
				<a href="${pageContext.request.contextPath }/teacher/question?method=getQuestionCategory&type=3">
					<div class="createDiv">
						<div>
							<img src="img/newTest.png" />
							<p>判断题</p>
						</div>
					</div>
				</a>
				<a href="${pageContext.request.contextPath }/teacher/question?method=getQuestionCategory&type=4">
					<div class="createDiv">
						<div>
							<img src="img/newTest.png" />
							<p>填空题</p>
						</div>
					</div>
				</a>
				<a href="${pageContext.request.contextPath }/teacher/question?method=getQuestionCategory&type=5">
					<div class="createDiv">
						<div>
							<img src="img/newTest.png" />
							<p>主观题</p>
						</div>
					</div>
				</a>
			</div>
			<div class="row second"></div>
		</div>

<%@ include file="footer.jsp" %>
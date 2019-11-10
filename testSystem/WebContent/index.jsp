<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
    
<%@ include file="header.jsp" %>
		<!--index样式-->
		<link rel="stylesheet" href="myCss/index.css" />
		
		<!--轮播图-->
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-top: -9px;">
		  	<!-- Indicators -->
		  	<ol class="carousel-indicators">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			    
			  </ol>
			
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
			      <a href="new_file.html">
			      	<img src="img/carousel1.jpg" alt="...">
				      <div class="carousel-caption">
				        
				      </div>
				   </a>
			    </div>
			    <div class="item">
			      <img src="img/carousel2.jpg" alt="...">
			      <div class="carousel-caption">
			        
			      </div>
			    </div>
			</div>
			
			  <!-- Controls -->
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" ></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" ></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		
		<!--难题解决-->
		<div class="container-fluid difficultRequest">
			  <h2>经典练习<small>——正确率最低</small></h2>
			
			<div class="row">
				<c:forEach items="${accuracyList }" var="question">
					<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 requestDiv">
						<h4>内容：${question.category.questionCategoryName }</h4>
						<p class="smallContext">
							<c:if test="${question.type==1 }">单选题</c:if>
							<c:if test="${question.type==2 }">多选题</c:if>
							<c:if test="${question.type==3 }">判断题</c:if>
							<c:if test="${question.type==4 }">填空题</c:if>
							<c:if test="${question.type==5 }">主观题</c:if>
						</p>
						<p class="smallContext">分值：${question.score }</p>
						<p class="smallContext">平均分:${question.averageScore }</p>
						<p class="smallContext">
							难度：
							<c:forEach begin="1" end="${question.level }" step="1">
								<span class="glyphicon glyphicon-star"></span>
							</c:forEach>
							<c:forEach begin="1" end="${5 - question.level }" step="1">
								<span class="glyphicon glyphicon-star-empty"></span>
							</c:forEach>
						</p>
						<p>
							<span style="color: red;">正确率：${question.accuracy }%</span>
							<a href="question1.jsp" class="requestImgage"></a>
						</p>
					</div>
				</c:forEach>
				
			</div>
		</div>



		<!--第二板块-->
		<div class="container-fluid difficultRequest">
			  <h2>经典练习<small>——最新加入</small></h2>
			
			<div class="row">
				<c:forEach items="${addDateList }" var="question">
						<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 requestDiv">
							<h4>内容：${question.category.questionCategoryName }</h4>
							<p class="smallContext">
								<c:if test="${question.type==1 }">单选题</c:if>
								<c:if test="${question.type==2 }">多选题</c:if>
								<c:if test="${question.type==3 }">判断题</c:if>
								<c:if test="${question.type==4 }">填空题</c:if>
								<c:if test="${question.type==5 }">主观题</c:if>
							</p>
							<p class="smallContext">分值：${question.score }</p>
							<p class="smallContext">平均分:${question.averageScore }</p>
							<p class="smallContext">
								难度：
								<c:forEach begin="1" end="${question.level }" step="1">
									<span class="glyphicon glyphicon-star"></span>
								</c:forEach>
								<c:forEach begin="1" end="${5 - question.level }" step="1">
									<span class="glyphicon glyphicon-star-empty"></span>
								</c:forEach>
							</p>
							<p class="smallContext">
								<span>正确率：${question.accuracy }%</span>
								<a href="question1.jsp" class="requestImgage"></a>
							</p>
						</div>
					</c:forEach>
				<!-- <div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 requestDiv">
					<h4>内容：javaSE</h4>
					<p class="smallContext">填空题</p>
					<p class="smallContext">分值：20</p>
					<p class="smallContext">平均分:10.30</p>
					<p class="smallContext">
						难度：
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
					</p>
					<p>
						<span style="color: red;">正确率：35%</span>
						<a href="question5.html" class="requestImgage"></a>
					</p>
				</div> -->
			</div>
		</div>
<%@ include file="footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<!--requestBankCss-->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/myCss/questionBank.css" />

		<script type="text/javascript" src="${pageContext.request.contextPath }/myjs/questionBank.js" ></script>

		<div class="container-fluid table-striped table-responsive" style="margin-top:40px">
			<div style="margin-bottom: 65px;">
				<form action="${pageContext.request.contextPath }/student/question" method="post" id="condition">
					<input type="hidden" name="method" value="getQuestions" />
					<div class="form-group col-lg-1 col-sm-2 col-xs-5">
						<select name="isDo" class="form-control">
							<option value="2" ${'2' eq isDo ? "selected='selected'" : "" }>不限是否做</option>
							<option value="1" ${'1' eq isDo ? "selected='selected'" : "" }>已做</option>
							<option value="0" ${'0' eq isDo ? "selected='selected'" : "" }>未做</option>
						</select>
					</div>
					<div class="form-group col-lg-1 col-sm-2 col-xs-5">
						<select name="pageSize" class="form-control">
							<option value="10" ${'10' eq pageSize ? "selected='selected'" : "" }>一页10道</option>
							<option value="15" ${'15' eq pageSize ? "selected='selected'" : "" }>一页15道</option>
							<option value="20" ${'20' eq pageSize ? "selected='selected'" : "" }>一页20道</option>
							<option value="25" ${'25' eq pageSize ? "selected='selected'" : "" }>一页25道</option>
						</select>
					</div>
					<div class="form-group col-lg-1 col-sm-2 col-xs-5">
						<button type="submit" class="btn btn-default">查询</button>
					</div>
				</form>
				<form class="form-inline" style="float: right;">
					<div class="form-group">
						<input type="text" class="form-control" id="queryRequest" autocomplete="off" placeholder="输入查询的内容">
					</div>
					<input type="image" class="btn btn-default" src="${pageContext.request.contextPath }/img/query1.png" onmouseout="changeQuery1(this)" onmouseover="changeQuery2(this)" />
				</form>
			</div>
			
			<div class="table-responsive">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<td nowrap="nowrap">题号</td>
							<td nowrap="nowrap">题干</td>
							<td nowrap="nowrap">难度系数</td>
							<td nowrap="nowrap">所属内容</td>
							<td nowrap="nowrap">题目分值</td>
							<td nowrap="nowrap">题目平均分</td>
							<td nowrap="nowrap">题目分类</td>
							<td nowrap="nowrap">是否答题</td>
							<td nowrap="nowrap">答题</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${questionAndIsDo.questionList }" var="question" varStatus="i">
							<tr>
								<td>${question.questionId }</td>
								<td>${question.questionContent }......</td>
								<td>
									<c:forEach begin="1" end="${question.level }" step="1">
										<span class="glyphicon glyphicon-star"></span>
									</c:forEach>
									<c:forEach begin="1" end="${5 - question.level }" step="1">
										<span class="glyphicon glyphicon-star-empty"></span>
									</c:forEach>
								</td>
								<td>${question.category.questionCategoryName }</td>
								<td>${question.score }</td>
								<td>${question.averageScore }</td>
								<td>
									<c:if test="${question.type==1 }">单选题</c:if>
									<c:if test="${question.type==2 }">多选题</c:if>
									<c:if test="${question.type==3 }">判断题</c:if>
									<c:if test="${question.type==4 }">填空题</c:if>
									<c:if test="${question.type==5 }">主观题</c:if>
								</td>
								<td>
									<c:if test="${questionAndIsDo.isDo[i.index] == 0 }">
										未做
									</c:if>
									<c:if test="${questionAndIsDo.isDo[i.index] == 1 }">
										<span class="right">正确</span>
									</c:if>
									<c:if test="${questionAndIsDo.isDo[i.index] == 2 }">
										<span class="error">错误</span>
									</c:if>
								</td>
								<td>
									<a href="${pageContext.request.contextPath }/student/question?method=getQuestion&questionId=${question.questionId }" id="edit"></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
				
			
			<!--分页-->
			<nav aria-label="Page navigation" style="float: right;">
				<ul class="pagination">
					<li>
						<a aria-label="Previous" onclick="changePage(this)" currentPage="${pageBean.currentPage - 1 }">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<c:forEach begin="1" end="${pageBean.totalPage }" var="i" step="1">
						<li ${pageBean.currentPage==i ? "class='active'" : "" }>
							<a onclick="changePage(this)" currentPage="${i }">${i }</a>
						</li>
					</c:forEach>
					<li>
						<a aria-label="Next" onclick="changePage(this)" currentPage="${pageBean.currentPage + 1 }" totalPage="${pageBean.totalPage }">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
				<input type="button" class="btn btn-default" id="dumpButton" value="跳转" />
				<input type="number" class="form-control" min="1" max="5" step="1" value="1" id="dumpNumber" onchange="controlNumber()" />
				<span style="float:right;margin-top:25px ;">&nbsp;&nbsp;&nbsp;&nbsp;共${pageBean.totalPage }页</span>
			</nav>
			
			
			
		</div>
<%@ include file="footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<%@ include file="header.jsp" %>
		<!--questionBankManage.css-->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/myCss/questionBankManage.css" />
		
		<!--questionBankManage.js-->
		<script type="text/javascript" src="${pageContext.request.contextPath }/myjs/questionBankManage.js" ></script>
		
		<div class="container-fluid table-striped table-responsive" style="margin-top:40px">
			<div class="row" style="margin-bottom: 10px;padding-right: 17px;">
				<form action="${pageContext.request.contextPath }/teacher/question" method="post" id="condition">
					<input type="hidden" name="method" value="getQuestions" />
					<div class="form-group col-lg-1 col-sm-2 col-xs-5">
						<select class="form-control" name="order">
							<option value="order by addDate asc" ${order eq "order by addDate asc" ? "selected='selected'" : "" }>时间升序</option>
							<option value="order by addDate desc" ${order eq "order by addDate desc" ? "selected='selected'" : "" }>时间降序</option>
							<option value="order by level desc" ${order eq "order by level desc" ? "selected='selected'" : "" }>难度降序</option>
							<option value="order by level asc" ${order eq "order by level asc" ? "selected='selected'" : "" }>难度升序</option>
							<option value="order by accuracy desc" ${order eq "order by accuracy desc" ? "selected='selected'" : "" }>正确率升序</option>
							<option value="order by accuracy asc" ${order eq "order by accuracy asc" ? "selected='selected'" : "" }>正确率降序</option>
						</select>
					</div>
					<div class="form-group col-lg-1 col-sm-2 col-xs-5">
						<select class="form-control" name="questionCategoryID" id="questionCategoryID">
							<option value="0">全部分类</option>
							<c:forEach items="${questionCategoryList }" var="questionCategory" >
								<option value="${questionCategory.questionCategoryID }" ${questionCategory.questionCategoryID == questionCategoryID ? "selected='selected'" : "" }>${questionCategory.questionCategoryName }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group col-lg-1 col-sm-2 col-xs-5">
						<select class="form-control" name="type">
							<option value="0" ${type eq "0" ? "selected='selected'" : "" }>全部题型</option>
							<option value="1" ${type eq "1" ? "selected='selected'" : "" }>单选题</option>
							<option value="2" ${type eq "2" ? "selected='selected'" : "" }>多选题</option>
							<option value="3" ${type eq "3" ? "selected='selected'" : "" }>判断题</option>
							<option value="4" ${type eq "4" ? "selected='selected'" : "" }>填空题</option>
							<option value="5" ${type eq "5" ? "selected='selected'" : "" }>主观题</option>
						</select>
					</div>
					<div class="form-group col-lg-1 col-sm-2 col-xs-5">
						<button type="submit" class="btn btn-default">查询</button>
					</div>
				</form>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<span class="btn">一共${pageBean.totalCount }题</span>
				</div>
				<form class="form-inline" style="float: right;">
					<a href="${pageContext.request.contextPath }/addQuestion.jsp" type="button" class="btn btn-primary">
						<span class="glyphicon glyphicon-plus"></span>
						添加题目
					</a>
					<button type="button" class="btn btn-success">批量导入</button>
					<button type="button" class="btn btn-info" style="margin-right: 30px;">导出题库</button>
					<div class="form-group">
						<input type="text" class="form-control" id="queryRequest" autocomplete="off" placeholder="输入查询的内容">
					</div>
					<input type="image" class="btn btn-default" src="${pageContext.request.contextPath }/img/query1.png" onmouseout="changeQuery1(this)" onmouseover="changeQuery2(this)" />
				</form>
			</div>
			<div class="table-responsive">
				<table class="table table-hover table-bordered" id="studentInfo">
					<thead>
						<tr>
							<td nowrap="nowrap">编号</td>
							<td nowrap="nowrap">题型</td>
							<td nowrap="nowrap">内容</td>
							<td nowrap="nowrap">题目</td>
							<td nowrap="nowrap">答案</td>
							<td nowrap="nowrap" style="max-width: 450px;">题目解析</td>
							<td nowrap="nowrap">题目公布</td>
							<td nowrap="nowrap">分值</td>
							<td nowrap="nowrap">正确率</td>
							<td nowrap="nowrap">平均分</td>
							<td nowrap="nowrap">难度</td>
							<td nowrap="nowrap">导入时间</td>
							<td nowrap="nowrap">答题人数</td>
							<td nowrap="nowrap">操作/答题情况</td>
							<td nowrap="nowrap">多选</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${questionList }" var="question">
							<tr>
								<td>${question.questionId }</td>
								<td>
									<c:if test="${question.type==1 }">单选题</c:if>
									<c:if test="${question.type==2 }">多选题</c:if>
									<c:if test="${question.type==3 }">判断题</c:if>
									<c:if test="${question.type==4 }">填空题</c:if>
									<c:if test="${question.type==5 }">主观题</c:if>
								</td>
								<td>${question.category.questionCategoryName }</td>
								<td>
									<p>${question.questionContent }</p>
									<!-- 单选、多选选项 -->
									<c:if test="${question.type eq '1' || question.type eq '2' }">
										<c:forEach items="${question.questionOptions }" var="option">
											<p>${option.optionIndex }、${option.optionContent }</p>
										</c:forEach>
									</c:if>
								</td>
								<td style="max-width: 450px;">
								
									<!-- 单选、多选、主观答案 -->
									<c:if test="${question.type==1 || question.type==2 || question.type==5 }">
										<p>${question.answer }</p>
									</c:if>
									
									<!-- 判断答案 -->
									<c:if test="${question.type==3}">
										<c:if test="${question.answer==1 }">
											<span class="glyphicon glyphicon-ok"></span>
										</c:if>
										<c:if test="${question.answer==0 }">
											<span class="glyphicon glyphicon-remove"></span>
										</c:if>
									</c:if>
									
									<!-- 填空答案 -->
									<c:if test="${question.type==4}">
										<c:forEach items="${question.questionOptions }" var="option">
											<p>${option.optionIndex }、${option.optionContent }</p>
										</c:forEach>
									</c:if>
								</td>
								<td style="text-align: left;max-width: 450px;">
									<pre width="90" style="background: #ffffff;border: 0px;font-family: '微软雅黑';font-size: 10px;">${empty question.questionExplain ? "暂无" : question.questionExplain }</pre>
								</td>
								<c:if test="${question.isPublic==0}">
									<td class="right">
										已公布<br /><br />
										<a questionId=${question.questionId } class="btn btn-warning" onclick="hiddenQuestion(this)">隐藏</a>
									</td>
								</c:if>
								<c:if test="${question.isPublic==1}">
									<td class="error">
										未公布<br /><br />
										<a questionId=${question.questionId } class="btn btn-success" onclick="publicQuestion(this)">公布</a>
									</td>
								</c:if>
								<td>${question.score }</td>
								<td>${question.accuracy }%</td>
								<td>${question.averageScore }</td>
								<td>
									<c:forEach begin="1" end="${question.level }" step="1">
										<span class="glyphicon glyphicon-star"></span>
									</c:forEach>
									<c:forEach begin="1" end="${5 - question.level }" step="1">
										<span class="glyphicon glyphicon-star-empty"></span>
									</c:forEach>
								</td>
								
								<td>
								<fmt:formatDate value="${question.addDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td>${question.answerPeople }</td>
								<td>
									<a href="${pageContext.request.contextPath }/questionAnswerOfStudent.jsp">答题情况</a>
									<br />
									<br />
									<a href="${pageContext.request.contextPath }/teacher/question?method=getQuestionById&questionId=${question.questionId }&currentPage=${pageBean.currentPage }">修改</a>
									<br />
									<br />
									<a onclick="deleteQuestion(this)" questionId=${question.questionId }>删除</a>
								</td>
								<td><input type="checkbox" name="batchDeal" value="${question.questionId }"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<!--分页-->
			<nav aria-label="Page navigation" class="pull-left">
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
				<input type="button" class="btn btn-default" id="dumpButton" value="跳转" onclick="changePage2()" />
				<input type="number" class="form-control" min="1" max="${pageBean.totalPage }" step="1" value="${pageBean.currentPage }" id="dumpNumber" onchange="controlNumber()" />
				<span style="float:right;margin-top:25px ;">&nbsp;&nbsp;&nbsp;&nbsp;共${pageBean.totalPage }页</span>
			</nav>
			
			<div class="pull-right" id="batchDeal">
				<button class="btn btn-default" onclick="allCheck(this)" style="width: 70px;">全选</button>
				<button class="btn btn-success" onclick="batchPublic()">公布</button>
				<button class="btn btn-warning" onclick="batchHidden()">隐藏</button>
				<button class="btn btn-danger" onclick="batchDelete()">删除</button>
			</div>
			
		</div>
		
<%@ include file="footer.jsp" %>
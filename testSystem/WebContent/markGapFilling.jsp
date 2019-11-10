<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
		<!--mark.css-->
		<link rel="stylesheet" href="myCss/mark.css" />
		
		<script type="text/javascript" src="myjs/mark.js" ></script>
		
		<div class="container form-horizontal" id="fatherDiv">
			<p style="font-size: 20px;margin-top: 50px;">原题（10分）</p>
			<div class="shareDiv">
				<p>Cookie是由浏览器管理，cookie是可以被禁用的。______1______Cookie	vs	session，______2______Cookie可以存放大量的______3______文本数据。安全性低，效率低</p>
			</div>
			<p style="font-size: 20px;margin-top: 50px;">答案</p>
			<div class="row shareDiv">
				<div class="col-sm-6">
					<h4>正确答案：</h4>
					<hr />
					<p>1、测试数据</p>
					<p>2、测试数据</p>
					<p>3、测试数据</p>
					<p>4、测试数据</p>
				</div>
				<div class="col-sm-6" style="border-left:solid #EEEEEE 1px ;">
					<h4>学生答案：</h4>
					<hr />
					<p>1、测试数据</p>
					<p>2、测试数据</p>
					<p>3、测试数据</p>
					<p>4、测试数据</p>
				</div>
			</div>
			<p style="font-size: 20px;margin-top: 50px;">改卷</p>
			<div class="shareDiv">
				<div class="form-group">
					<label class="col-sm-2 control-label">老师打分：</label>
					<div class="col-sm-2">
						<input type="number" class="form-control" placeholder="打分" autocomplete="off" onblur="setScore(this)">
					</div>
					<button type="button" class="btn btn-default">打分</button>
				</div>
			</div>
			<div style="margin-top: 50px;">
				<span style="font-size: 20px;margin-top: 50px;">改卷历史——100份（只显示最近10份）</span>
				<button type="button" class="btn btn-primary pull-right">显示全部历史</button>
			</div>
			<div class="shareDiv">
				<table class="table table-bordered" id="myTable">
					<thead>
						<tr>
							<th nowrap="nowrap">改卷时间</th>
							<th nowrap="nowrap">学生答案</th>
							<th nowrap="nowrap">老师分数</th>
							<th nowrap="nowrap">修改</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2018-11-27 00:22</td>
							<td>
								<p>1、测试数据</p>
								<p>2、测试数据</p>
								<p>3、测试数据</p>
								<p>4、测试数据</p>
							</td>
							<td>5</td>
							<td><a href="#">修改</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
<%@ include file="footer.jsp" %>
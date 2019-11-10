<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
		<!--allTestCss-->
		<link rel="stylesheet" href="myCss/allTest.css" />
		<!--allTestJs-->
		<script type="text/javascript" src="myjs/allTest.js" ></script>
		
		<!--testMyself-->
		<div class="container-fluid testFatherDiv">
			
			<div class="row" style="padding-left:30px ;">
				<div style="float: left;">
					<img src="img/list1.png" style="margin-right: 15px;" onclick="changeToblock(this)" id="img1" />
					<img src="img/list22.png" style="margin-right: 15px;" onclick="changeToList(this)" id="img2" />
				</div>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>时间不限</option>
						<option>一周内</option>
						<option>一月内</option>
						<option>一年内</option>
					</select>
				</div>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>状态不限</option>
						<option>未开始</option>
						<option>可答题</option>
						<option>已结束</option>
					</select>
				</div>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>所有考试</option>
						<option>未答卷</option>
						<option>已答卷</option>
					</select>
				</div>
				
				<div id="createTestByList" style="display: none;">
					<!-- Button trigger modal -->
					<a href="createTest.jsp" type="button" class="btn btn-primary">
					  <span class="glyphicon glyphicon-plus"></span>&nbsp;新建测试
					</a>
				</div>
				
			</div>
			
			<div class="row" id="block">
				<a href="createTest.jsp">
					<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv" style="display:table;height: 200px;" >
						<div id="createTestByBlock">
							<img src="img/newTest.png" />
							<br/>
							新建测试
						</div>
					</div>
				</a>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
						/
						<span style="color: #00F0B0;">得分：94</span>
						/
						<span style="color: #F0AD4E;">未发布</span>
						/
						<a href="publish.jsp" style="color: #00F0B0;">发布中</a>
					</p>
					<p class="smallContext">
						未开始
						/
						可答题
						/
						已结束
					</p>
					<p class="smallContext">2018-02-15 20:08</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="updateTest.jsp">
							<div class="edit edit1">
								编辑
							</div>
						</a>
						<a href="allTestData.jsp">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
						<a href="#">
							<div class="edit edit4">
								发布
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
					</p>
					<p class="smallContext">
						未开始
					</p>
					<p class="smallContext">2018-02-15 20:08</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="updateTest.jsp">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="allTestData.jsp">
							<div class="edit edit2">
								数据
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						可答题
					</p>
					<p class="smallContext">2018-02-15 20:08</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="updateTest.jsp">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="allTestData.jsp">
							<div class="edit edit2">
								数据
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">
						<span style="color: #F0AD4E;">未发布</span>
					</p>
					<p class="smallContext">
						已结束
					</p>
					<p class="smallContext">2018-02-15 20:08</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="updateTest.jsp">
							<div class="edit edit1">
								编辑
							</div>
						</a>
						<a href="allTestData.jsp">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
						<a href="#">
							<div class="edit edit4">
								发布
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">
						<a href="publish.jsp" style="color: #00F0B0;">发布中</a>
					</p>
					<p class="smallContext">
						已结束
					</p>
					<p class="smallContext">2018-02-15 20:08</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="updateTest.jsp">
							<div class="edit edit1">
								编辑
							</div>
						</a>
						<a href="allTestData.jsp">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
						<a href="#">
							<div class="edit edit4">
								发布
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
					</p>
					<p class="smallContext">
						未开始
					</p>
					<p class="smallContext">2018-02-15 20:08</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="updateTest.jsp">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="allTestData.jsp">
							<div class="edit edit2">
								数据
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						可答题
					</p>
					<p class="smallContext">2018-02-15 20:08</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="updateTest.jsp">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="allTestData.jsp">
							<div class="edit edit2">
								数据
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">
						<span style="color: #F0AD4E;">未发布</span>
					</p>
					<p class="smallContext">
						已结束
					</p>
					<p class="smallContext">2018-02-15 20:08</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="updateTest.jsp">
							<div class="edit edit1">
								编辑
							</div>
						</a>
						<a href="allTestData.jsp">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
						<a href="#">
							<div class="edit edit4">
								发布
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">
						<a href="publish.jsp" style="color: #00F0B0;">发布中</a>
					</p>
					<p class="smallContext">
						已结束
					</p>
					<p class="smallContext">2018-02-15 20:08</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="updateTest.jsp">
							<div class="edit edit1">
								编辑
							</div>
						</a>
						<a href="allTestData.jsp">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
						<a href="#">
							<div class="edit edit4">
								发布
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
					</p>
					<p class="smallContext">
						未开始
					</p>
					<p class="smallContext">2018-02-15 20:08</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="updateTest.jsp">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="allTestData.jsp">
							<div class="edit edit2">
								数据
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						可答题
					</p>
					<p class="smallContext">2018-02-15 20:08</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="updateTest.jsp">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="allTestData.jsp">
							<div class="edit edit2">
								数据
							</div>
						</a>
					</div>
				</div>
				
				
			</div><!--row-->
			
			<div class="row table-responsive" style="padding:30px ;display: none;" id="list">
				<table class="table table-hover" id="table">
					<thead>
						<tr>
							<td nowrap="nowrap">试卷名</td>
							<td nowrap="nowrap">开考时间</td>
							<td nowrap="nowrap">试卷状态</td>
							<td nowrap="nowrap">考试时长</td>
							<td nowrap="nowrap">所用时长</td>
							<td nowrap="nowrap">是否已做/发布状态</td>
							<td nowrap="nowrap">得分</td>
							<td nowrap="nowrap">答题</td>
							<td nowrap="nowrap">数据</td>
							<td nowrap="nowrap">删除</td>
							<td nowrap="nowrap">发布</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16 20:08</td>
							<td>
								<span style="color:rgb(255,150,100);">未开始</span>
								/
								<span style="color: #00F0B0;">可答题</span>
								/
								<span style="color: #F0AD4E;">已结束</span>
							</td>
							<td>120分钟</td>
							<td>69分钟</td>
							<td>
								<span style="color:rgb(255,150,100);">未做</span>
								/
								<span style="color: #00F0B0;">已做</span>
								/
								<span style="color: #F0AD4E;">未发布</span>
								/
								<a href="publish.jsp" style="color: #00F0B0;">发布中</a>
							</td>
							<td>86</td>
							<td>
								<a href="updateTest.jsp">
									<div class="edit edit1">
										编辑/答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="allTestData.jsp">
									<div class="edit edit2">
										数据
									</div>
								</a>
						
							</td>
							<td>
								<a href="#">
									<div class="edit  edit3">
										删除
									</div>
								</a>
							</td>
							<td>
								<a href="#">
									<div class="edit  edit4">
										发布
									</div>
								</a>
							</td>
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16 20:08</td>
							<td>
								<span style="color:rgb(255,150,100);">未开始</span>
							</td>
							<td>120分钟</td>
							<td>69分钟</td>
							<td>
								<span style="color:rgb(255,150,100);">未做</span>
							</td>
							<td>86</td>
							<td>
								<a href="updateTest.jsp">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="allTestData.jsp">
									<div class="edit edit2">
										数据
									</div>
								</a>
						
							</td>
							<td>
								<a href="#">
									<div class="edit  edit3">
										删除
									</div>
								</a>
							</td>
							<td>
								<a href="#">
									<div class="edit  edit4">
										发布
									</div>
								</a>
							</td>
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16 20:08</td>
							<td>
								<span style="color: #00F0B0;">可答题</span>
							</td>
							<td>120分钟</td>
							<td>69分钟</td>
							<td>
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="updateTest.jsp">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="allTestData.jsp">
									<div class="edit edit2">
										数据
									</div>
								</a>
						
							</td>
							<td>
								<a href="#">
									<div class="edit  edit3">
										删除
									</div>
								</a>
							</td>
							<td>
								<a href="#">
									<div class="edit  edit4">
										发布
									</div>
								</a>
							</td>
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16 20:08</td>
							<td>
								<span style="color: #00F0B0;">可答题</span>
							</td>
							<td>120分钟</td>
							<td>69分钟</td>
							<td>
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="updateTest.jsp">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="allTestData.jsp">
									<div class="edit edit2">
										数据
									</div>
								</a>
						
							</td>
							<td>
								<a href="#">
									<div class="edit  edit3">
										删除
									</div>
								</a>
							</td>
							<td>
								<a href="#">
									<div class="edit  edit4">
										发布
									</div>
								</a>
							</td>
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16 20:08</td>
							<td>
								<span style="color: #00F0B0;">可答题</span>
							</td>
							<td>120分钟</td>
							<td>69分钟</td>
							<td>
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="updateTest.jsp">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="allTestData.jsp">
									<div class="edit edit2">
										数据
									</div>
								</a>
						
							</td>
							<td>
								<a href="#">
									<div class="edit  edit3">
										删除
									</div>
								</a>
							</td>
							<td>
								<a href="#">
									<div class="edit  edit4">
										发布
									</div>
								</a>
							</td>
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16 20:08</td>
							<td>
								<span style="color: #00F0B0;">可答题</span>
							</td>
							<td>120分钟</td>
							<td>69分钟</td>
							<td>
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="updateTest.jsp">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="allTestData.jsp">
									<div class="edit edit2">
										数据
									</div>
								</a>
						
							</td>
							<td>
								<a href="#">
									<div class="edit  edit3">
										删除
									</div>
								</a>
							</td>
							<td>
								<a href="#">
									<div class="edit  edit4">
										发布
									</div>
								</a>
							</td>
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16 20:08</td>
							<td>
								<span style="color: #00F0B0;">可答题</span>
							</td>
							<td>120分钟</td>
							<td>69分钟</td>
							<td>
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="updateTest.jsp">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="allTestData.jsp">
									<div class="edit edit2">
										数据
									</div>
								</a>
						
							</td>
							<td>
								<a href="#">
									<div class="edit  edit3">
										删除
									</div>
								</a>
							</td>
							<td>
								<a href="#">
									<div class="edit  edit4">
										发布
									</div>
								</a>
							</td>
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16 20:08</td>
							<td>
								<span style="color: #00F0B0;">可答题</span>
							</td>
							<td>120分钟</td>
							<td>69分钟</td>
							<td>
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="updateTest.jsp">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="allTestData.jsp">
									<div class="edit edit2">
										数据
									</div>
								</a>
						
							</td>
							<td>
								<a href="#">
									<div class="edit  edit3">
										删除
									</div>
								</a>
							</td>
							<td>
								<a href="#">
									<div class="edit  edit4">
										发布
									</div>
								</a>
							</td>
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16 20:08</td>
							<td>
								<span style="color: #00F0B0;">可答题</span>
							</td>
							<td>120分钟</td>
							<td>69分钟</td>
							<td>
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="updateTest.jsp">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="allTestData.jsp">
									<div class="edit edit2">
										数据
									</div>
								</a>
						
							</td>
							<td>
								<a href="#">
									<div class="edit  edit3">
										删除
									</div>
								</a>
							</td>
							<td>
								<a href="#">
									<div class="edit  edit4">
										发布
									</div>
								</a>
							</td>
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16 20:08</td>
							<td>
								<span style="color: #00F0B0;">可答题</span>
							</td>
							<td>120分钟</td>
							<td>69分钟</td>
							<td>
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="updateTest.jsp">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="allTestData.jsp">
									<div class="edit edit2">
										数据
									</div>
								</a>
						
							</td>
							<td>
								<a href="#">
									<div class="edit  edit3">
										删除
									</div>
								</a>
							</td>
							<td>
								<a href="#">
									<div class="edit  edit4">
										发布
									</div>
								</a>
							</td>
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16 20:08</td>
							<td>
								<span style="color: #00F0B0;">可答题</span>
							</td>
							<td>120分钟</td>
							<td>69分钟</td>
							<td>
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="updateTest.jsp">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="allTestData.jsp">
									<div class="edit edit2">
										数据
									</div>
								</a>
						
							</td>
							<td>
								<a href="#">
									<div class="edit  edit3">
										删除
									</div>
								</a>
							</td>
							<td>
								<a href="#">
									<div class="edit  edit4">
										发布
									</div>
								</a>
							</td>
						</tr>
						
					</tbody>
				</table>
			</div>
			
			<!--分页-->
			<div class="container-fluid">
				<nav aria-label="Page navigation" class="pull-right">
					<ul class="pagination">
						<li>
							<a href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<li class="active">
							<a href="#">1</a>
						</li>
						<li>
							<a href="#">2</a>
						</li>
						<li>
							<a href="#">3</a>
						</li>
						<li>
							<a href="#">4</a>
						</li>
						<li>
							<a>...</a>
						</li>
						<li>
							<a href="#">22</a>
						</li>
						<li>
							<a href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
					<input type="button" class="btn btn-default" id="dumpButton" value="跳转" />
					<input type="number" class="form-control" min="1" max="5" step="1" value="1" id="dumpNumber" onchange="controlNumber()" />
					<span style="float:right;margin-top:25px ;">&nbsp;&nbsp;&nbsp;&nbsp;共5页</span>
				</nav>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">新建测试</h4>
						</div>
						<form class="form-horizontal" id="newTestSubmit">
							<div class="modal-body">
								<div class="form-group">
									<label for="level" class="col-sm-2 control-label">难度选择</label>
									<div class="col-sm-10">
										<select class="form-control" id="level" name="level" style="font-family: glyphicons;">
											<option value="1">★</option>
											<option value="2">★★</option>
											<option value="3">★★★</option>
											<option value="4">★★★★</option>
											<option value="5">★★★★★</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="level" class="col-sm-2 control-label">试卷规模</label>
									<div class="col-sm-10">
										<select class="form-control" id="level" name="scale" style="font-family: glyphicons;">
											<option value="1">单选10；多选5</option>
											<option value="2">单选20；多选5</option>
											<option value="3">单选40；多选50</option>
											<option value="4">单选10；多选5；填空10；判断10</option>
											<option value="5">单选10；多选5；填空10；判断10；主观3</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="level" class="col-sm-2 control-label">题目范围</label>
									<div class="col-sm-10">
										<div id="requestTypeUp">
											
										</div>
										<div id="requestTypeDown">
											<button class="btn requestLabel" type="button">
											  servlet<span class="glyphicon glyphicon-remove" ></span>
											</button>
											<button class="btn requestLabel" type="button">
											  beanUtils<span class="glyphicon glyphicon-remove" ></span>
											</button>
											<button class="btn requestLabel" type="button">
											  jsp<span class="glyphicon glyphicon-remove" ></span>
											</button>
											<button class="btn requestLabel" type="button">
											  validate<span class="glyphicon glyphicon-remove" ></span>
											</button>
											<button class="btn requestLabel" type="button">
											  gson<span class="glyphicon glyphicon-remove" ></span>
											</button>
											<button class="btn requestLabel" type="button">
											  redis数据库<span class="glyphicon glyphicon-remove" ></span>
											</button>
											<button class="btn requestLabel" type="button">
											  dbutils<span class="glyphicon glyphicon-remove" ></span>
											</button>
											<button class="btn requestLabel" type="button">
											  bootstrap<span class="glyphicon glyphicon-remove" ></span>
											</button>
											<button class="btn requestLabel" type="button">
											  el表达式<span class="glyphicon glyphicon-remove" ></span>
											</button>
											<button class="btn requestLabel" type="button">
											  jstl<span class="glyphicon glyphicon-remove" ></span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" onclick="newTestSubmit()">创建</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
		</div>
<%@ include file="footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!--testMyselfCss-->
		<link rel="stylesheet" href="myCss/testMyself.css" />
		<!--testMyselfJs-->
		<script type="text/javascript" src="myjs/testMyself.js" ></script>
		
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
				
				<div id="createTestByList" style="display: none;">
					<a href="testMyselfType.html" type="button" class="btn btn-primary">
					  <span class="glyphicon glyphicon-plus"></span>&nbsp;新建自我测试
					</a>
				</div>
				
			</div>
			
			<div class="row" id="block">
				<a href="testMyselfType.html">
					<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv" style="display:table;height: 200px;" >
						<div id="createTestByBlock">
							<img src="img/newTest.png" />
							<br/>
							新建自我测试
						</div>
					</div>
				</a>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">2018-02-15</p>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
						/
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						难度：
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
					</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="testStart.html">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="testData.html">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">2018-02-15</p>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
						/
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						难度：
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
					</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="testStart.html">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="testData.html">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">2018-02-15</p>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
						/
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						难度：
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
					</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="testStart.html">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="testData.html">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">2018-02-15</p>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
						/
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						难度：
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
					</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="testStart.html">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="testData.html">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">2018-02-15</p>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
						/
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						难度：
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
					</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="testStart.html">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="testData.html">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">2018-02-15</p>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
						/
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						难度：
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
					</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="testStart.html">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="testData.html">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">2018-02-15</p>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
						/
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						难度：
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
					</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="testStart.html">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="testData.html">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">2018-02-15</p>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
						/
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						难度：
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
					</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="testStart.html">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="testData.html">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">2018-02-15</p>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
						/
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						难度：
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
					</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="testStart.html">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="testData.html">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">2018-02-15</p>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
						/
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						难度：
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
					</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="testStart.html">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="testData.html">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-9 testDiv">
					<h4>考前测试</h4>
					<p class="smallContext">2018-02-15</p>
					<p class="smallContext">
						<span style="color:rgb(255,150,100);">未做</span>
						/
						<span style="color: #00F0B0;">得分：94</span>
					</p>
					<p class="smallContext">
						难度：
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star-empty"></span>
					</p>
					<div style="margin-top:20px ;margin-bottom:10px ;">
						<a href="testStart.html">
							<div class="edit edit1">
								答题
							</div>
						</a>
						<a href="testData.html">
							<div class="edit edit2">
								数据
							</div>
						</a>
						<a href="#">
							<div class="edit  edit3">
								删除
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
							<td nowrap="nowrap">创建日期</td>
							<td nowrap="nowrap">难度</td>
							<td nowrap="nowrap">所用时长</td>
							<td nowrap="nowrap">是否已做</td>
							<td nowrap="nowrap">得分</td>
							<td nowrap="nowrap">答题</td>
							<td nowrap="nowrap">数据</td>
							<td nowrap="nowrap">删除</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>69分钟</td>
							<td>
								<span style="color:rgb(255,150,100);">未做</span>
								/
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="testStart.html">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="testData.html">
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
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>69分钟</td>
							<td>
								<span style="color:rgb(255,150,100);">未做</span>
								/
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="testStart.html">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="testData.html">
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
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>69分钟</td>
							<td>
								<span style="color:rgb(255,150,100);">未做</span>
								/
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="testStart.html">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="testData.html">
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
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>69分钟</td>
							<td>
								<span style="color:rgb(255,150,100);">未做</span>
								/
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="testStart.html">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="testData.html">
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
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>69分钟</td>
							<td>
								<span style="color:rgb(255,150,100);">未做</span>
								/
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="testStart.html">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="testData.html">
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
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>69分钟</td>
							<td>
								<span style="color:rgb(255,150,100);">未做</span>
								/
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="testStart.html">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="testData.html">
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
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>69分钟</td>
							<td>
								<span style="color:rgb(255,150,100);">未做</span>
								/
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="testStart.html">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="testData.html">
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
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>69分钟</td>
							<td>
								<span style="color:rgb(255,150,100);">未做</span>
								/
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="testStart.html">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="testData.html">
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
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>69分钟</td>
							<td>
								<span style="color:rgb(255,150,100);">未做</span>
								/
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="testStart.html">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="testData.html">
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
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>69分钟</td>
							<td>
								<span style="color:rgb(255,150,100);">未做</span>
								/
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="testStart.html">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="testData.html">
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
						</tr>
						<tr>
							<td>考前测试</td>
							<td>2018-02-16</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>69分钟</td>
							<td>
								<span style="color:rgb(255,150,100);">未做</span>
								/
								<span style="color: #00F0B0;">已做</span>
							</td>
							<td>86</td>
							<td>
								<a href="testStart.html">
									<div class="edit edit1">
										答题
									</div>
								</a>
						
							</td>
							<td>
								<a href="testData.html">
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
			
		</div>

<%@ include file="footer.jsp" %>
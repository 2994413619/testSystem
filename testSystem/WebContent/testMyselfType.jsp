<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!--testMyselfType.css-->
		<link rel="stylesheet" href="myCss/testMyselfType.css" />
		
		<!--testMyselfType.js-->
		<script type="text/javascript" src="myjs/testMyselfType.js" ></script>
		
		<div class="container" id="testMyselfTypeDiv">
			<!-- Button trigger modal -->
			<a href="#" data-toggle="modal" data-target="#myModal">
				<div class="createDiv" id="randomDiv">
					<div>
						<img src="img/newTest.png" />
						<p>随机创建测试</p>
						<p class="prompt">随机测试：根据条件自动从题库中随机生成试卷。自我测试只能自己作答，其他用户不能访问。</p>
					</div>
				</div>
			</a>
			<a href="createTest.html">
				<div class="createDiv" id="editDiv">
					<div>
						<img src="img/newTest.png" />
						<p>自我编辑测试</p>
						<p class="prompt">编辑测试：试卷所有题目和信息由用户自己编辑。自我测试只能自己作答，其他用户不能访问。</p>
						
					</div>
				</div>
			</a>
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
											<div class="btn requestLabel">
											  hibernate<span class="glyphicon glyphicon-remove"></span>
											</div>
											<div class="btn requestLabel">
											  Maven<span class="glyphicon glyphicon-remove" ></span>
											</div>
											<div class="btn requestLabel">
											  mybatis<span class="glyphicon glyphicon-remove" ></span>
											</div>
											<div class="btn requestLabel">
											  struts2<span class="glyphicon glyphicon-remove" ></span>
											</div>
											<div class="btn requestLabel">
											  node.js<span class="glyphicon glyphicon-remove" ></span>
											</div>
											<div class="btn requestLabel">
											  redis<span class="glyphicon glyphicon-remove" ></span>
											</div>
											<div class="btn requestLabel">
											  oracle<span class="glyphicon glyphicon-remove" ></span>
											</div>
											<div class="btn requestLabel">
											  webpack<span class="glyphicon glyphicon-remove" ></span>
											</div>
											<div class="btn requestLabel">
											  gulp<span class="glyphicon glyphicon-remove" ></span>
											</div>
											<div class="btn requestLabel">
											  vue<span class="glyphicon glyphicon-remove" ></span>
											</div>
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
<%@ include file="footer.jsp" %>
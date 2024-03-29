<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>testSystem</title>

		<!-- Bootstrap -->
		<link href="../css/bootstrap.css" rel="stylesheet">

		<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
		<script src="../js/jquery-3.3.1.js"></script>
		<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
		<script src="../js/bootstrap.js"></script>

		<link rel="stylesheet" href="css/admin.css" />
		<script type="text/javascript" src="js/admin.js" ></script>
	</head>
	<body>
		<div class="container-fluid">
			<h1 style="text-align: center; font-family: '华文楷体';">所有题目管理</h1>
			<div class="row" style="margin-bottom: 10px;padding-right: 17px;">
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>时间降序</option>
						<option>时间升序</option>
						<option>难度降序</option>
						<option>难度升序</option>
						<option>正确率升序</option>
						<option>正确率降序</option>
					</select>
				</div>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>全部类别</option>
						<option>Javase</option>
						<option>大数据</option>
						<option>机器学习</option>
						<option>人工智能</option>
						<option>javaEE</option>
						<option>web前端</option>
					</select>
				</div>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>全部题型</option>
						<option>单选题</option>
						<option>多选题</option>
						<option>判断题</option>
						<option>填空题</option>
						<option>主观题</option>
					</select>
				</div>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>所有老师</option>
						<option>tom</option>
						<option>jack</option>
						<option>王麻子</option>
						<option>李四</option>
						<option>张三</option>
					</select>
				</div>
				
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<span class="btn">一共2000题</span>
				</div>
				<form class="form-inline" style="float: right;">
					<button type="button" class="btn btn-primary">
						<span class="glyphicon glyphicon-plus"></span>
						导入题目
					</button>
					<button type="button" class="btn btn-primary" style="margin-right: 30px;">导出信息</button>
					<div class="form-group">
						<input type="text" class="form-control" id="queryRequest" autocomplete="off" placeholder="输入查询内容">
					</div>
					<input type="image" class="btn btn-default" src="../img/query1.png" onmouseout="changeQuery1(this)" onmouseover="changeQuery2(this)" />
				</form>
			</div>
			
			<div class="table-responsive">
				<table class="table table-hover table-bordered" id="myTable">
					<thead>
						<tr>
							<td nowrap="nowrap">编号</td>
							<td nowrap="nowrap">题型</td>
							<td nowrap="nowrap">内容</td>
							<td nowrap="nowrap">题目</td>
							<td nowrap="nowrap">答案</td>
							<td nowrap="nowrap">题目解析</td>
							<td nowrap="nowrap">题目公布</td>
							<td nowrap="nowrap">分值</td>
							<td nowrap="nowrap">正确率</td>
							<td nowrap="nowrap">平均分</td>
							<td nowrap="nowrap">难度</td>
							<td nowrap="nowrap">导入时间</td>
							<td nowrap="nowrap">导入人</td>
							<td nowrap="nowrap">答题人数</td>
							<td nowrap="nowrap">操作/答题情况</td>
							<td nowrap="nowrap">多选</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>181026131</td>
							<td>单选</td>
							<td>javase</td>
							<td>
								<p>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低。</p>
								<p>A、测试文字</p>
								<p>B、测试文字</p>
								<p>C、测试文字</p>
								<p>D、测试文字</p>
							</td>
							<td>A</td>
							<td>
								<p>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低。</p>
							</td>
							<td class="right">
								已公布<br /><br />
								<button class="btn btn-warning">隐藏</button>
							</td>
							
							<td>10</td>
							<td>50%</td>
							<td>7.5</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							
							<td>1999-02-02</td>
							<td>jack</td>
							<td>10</td>
							<td>
								<a href="questionAnswerOfStudent.html">答题情况</a>
								<br />
								<br />
								<a href="questionUpdateChoose.html">修改</a>
								<br />
								<br />
								<a href="#" class="delete">删除</a>
							</td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
						<tr>
							<td>181026132</td>
							<td>多选</td>
							<td>机器学习</td>
							<td>
								<p>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低。</p>
								<p>A、测试文字</p>
								<p>B、测试文字</p>
								<p>C、测试文字</p>
								<p>D、测试文字</p>
								<p>E、测试文字</p>
								<p>F、测试文字</p>
							</td>
							<td>ABC</td>
							<td>
								<p>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低。</p>
							</td>
							<td class="right">
								已公布<br /><br />
								<button class="btn btn-warning">隐藏</button>
							</td>
							
							<td>10</td>
							<td>50%</td>
							<td>7.5</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							
							<td>1999-02-02</td>
							<td>jack</td>
							<td>10</td>
							<td>
								<a href="questionAnswerOfStudent.html">答题情况</a>
								<br />
								<br />
								<a href="questionUpdateMultiChoose.html">修改</a>
								<br />
								<br />
								<a href="#" class="delete">删除</a>
							</td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
						<tr>
							<td>181026132</td>
							<td>判断</td>
							<td>机器学习</td>
							<td>
								<p>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低。</p>
							</td>
							<td><span class="glyphicon glyphicon-ok"></span></td>
							<td>
								<p>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低。</p>
							</td>
							<td class="right">
								已公布<br /><br />
								<button class="btn btn-warning">隐藏</button>
							</td>
							
							<td>10</td>
							<td>50%</td>
							<td>7.5</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>1999-02-02</td>
							<td>jack</td>
							<td>10</td>
							<td>
								<a href="questionAnswerOfStudent.html">答题情况</a>
								<br />
								<br />
								<a href="questionUpdateJudge.html">修改</a>
								<br />
								<br />
								<a href="#" class="delete">删除</a>
							</td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
						<tr>
							<td>181026132</td>
							<td>填空</td>
							<td>机器学习</td>
							<td>
								<p>Cookie是由浏览器管理，______1______cookie是可以被禁用的。______2______Cookie	vs	session，Cookie______3______可以存放大量的文本数据。安全性低，效率低。</p>
							</td>
							<td>
								<p>1、测试数据</p>
								<p>2、测试数据</p>
								<p>3、测试数据</p>
							</td>
							<td>
								<p>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低。</p>
							</td>
							<td class="right">
								已公布<br /><br />
								<button class="btn btn-warning">隐藏</button>
							</td>
							
							<td>10</td>
							<td>50%</td>
							<td>7.5</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>1999-02-02</td>
							<td>jack</td>
							<td>10</td>
							<td>
								<a href="questionAnswerOfStudent.html">答题情况</a>
								<br />
								<br />
								<a href="questionUpdateGapFilling.html">修改</a>
								<br />
								<br />
								<a href="#" class="delete">删除</a>
							</td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
						<tr>
							<td>181026132</td>
							<td>主观</td>
							<td>机器学习</td>
							<td>
								<p>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低。</p>
							</td>
							<td>
								<p>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低。</p>
							</td>
							<td>
								<p>Cookie是由浏览器管理，cookie是可以被禁用的。Cookie	vs	session，Cookie可以存放大量的文本数据。安全性低，效率低。</p>
							</td>
							<td class="right">
								已公布<br /><br />
								<button class="btn btn-warning">隐藏</button>
							</td>
							
							<td>10</td>
							<td>50%</td>
							<td>7.5</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</td>
							<td>1999-02-02</td>
							<td>jack</td>
							<td>10</td>
							<td>
								<a href="questionAnswerOfStudent.html">答题情况</a>
								<br />
								<br />
								<a href="questionUpdateSubjective.html">修改</a>
								<br />
								<br />
								<a href="#" class="delete">删除</a>
							</td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<!--分页-->
			<nav aria-label="Page navigation" class="pull-left">
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
			
			<div class="pull-right" id="batchDeal">
				<button class="btn btn-default" onclick="allCheck(this)" style="width: 70px;">全选</button>
				<button class="btn btn-success">公布题目</button>
				<button class="btn btn-warning">隐藏题目</button>
				<button class="btn btn-danger">删除</button>
			</div>
			
		</div>
	</body>
</html>

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
		
		<link rel="stylesheet" href="../myCss/testfStart.css" />
		
	</head>
	<body>
		<div class="container-fluid">
			<div class="row col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">
				<h1 style="text-align: center;">综合测试</h1>
				<div id="testInfo">
					<span style="float: right;">考试时长：120分钟</span>
					<span style="float: left;">试卷总分：100</span>
					<span style="display:block;text-align: center;">开始考试时间：2018-10-5 10:00</span>
				</div>
				<!--单选-->
				<a name="1"></a>
				<div class="question">
					<h4>
						1、Cookie是带有domain（域名）的，每个web应用只能读取自己的cookie,cookie和浏览器有关，不同浏览器cookie是不能共享的。
						（<span style="color: #00E0B0;">单选</span>）
					</h4>
					<p>
						<div class="radio checkDiv">
							<label>
							    <input type="radio" name="asd" id="optionsRadios1" value="">
							    A、测试文字
							</label>
						</div>
					</p>
					<p>
						<div class="radio checkDiv">
							<label>
							    <input type="radio" name="asd" id="optionsRadios2" value="">
							    B、测试文字
							</label>
						</div>
					</p>
					<p>
						<div class="radio checkDiv">
							<label>
							    <input type="radio" name="asd" id="optionsRadios3" value="">
							    C、测试文字
							 </label>
						</div>
					</p>
					<p>
						<div class="radio checkDiv">
							<label>
							    <input type="radio" name="asd" id="optionsRadios3" value="">
							    D、测试文字
							 </label>
						</div>
					</p>
				</div> 
				<!--多选-->
				<a name="2"></a>
				<div class="question">
					<h4>
						2、Cookie是带有domain（域名）的，每个web应用只能读取自己的cookie,cookie和浏览器有关，不同浏览器cookie是不能共享的。
						（<span style="color: #00E0B0;">多选</span>）
					</h4>
					<p>
						<div class="checkbox checkDiv">
							<label>
							    <input type="checkbox" name="optionsRadios" id="optionsRadios1" value="">
							    A、测试文字
							</label>
						</div>
					</p>
					<p>
						<div class="checkbox checkDiv">
							<label>
							    <input type="checkbox" name="optionsRadios" id="optionsRadios2" value="">
							    B、测试文字
							</label>
						</div>
					</p>
					<p>
						<div class="checkbox checkDiv">
							<label>
							    <input type="checkbox" name="optionsRadios" id="optionsRadios3" value="">
							    C、测试文字
							 </label>
						</div>
					</p>
					<p>
						<div class="checkbox checkDiv">
							<label>
							    <input type="checkbox" name="optionsRadios" id="optionsRadios3" value="">
							    D、测试文字
							 </label>
						</div>
					</p>
					<p>
						<div class="checkbox checkDiv">
							<label>
							    <input type="checkbox" name="optionsRadios" id="optionsRadios3" value="">
							    E、测试文字
							 </label>
						</div>
					</p>
				</div>
				<!--判断-->
				<a name="3"></a>
				<div class="question">
					<h4>
						3、Cookie是带有domain（域名）的，每个web应用只能读取自己的cookie,cookie和浏览器有关，不同浏览器cookie是不能共享的。
					</h4>
					<label class="radio-inline">
						<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 
						<span class="glyphicon glyphicon-ok"></span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
						<span class="glyphicon glyphicon-remove"></span>
					</label>
				</div>
				<!--填空题-->
				<a name="4"></a>
				<div class="question">
					<h4>
						<div class="form-inline">
							<div class="form-group">
							    4、Cookie是带有domain（域名）的，每个
							    <input type="text" class="form-control" id="exampleInputEmail3" autocomplete="off">
							    只能读取自己的cookie,cookie和浏览器有关，
							    <input type="text" class="form-control" id="exampleInputEmail3" autocomplete="off">
							    不同浏览器cookie是不能共享的。
							</div>
						</div>
					</h4>
				</div>
				<!--主观题-->
				<a name="5"></a>
				<div class="question">
					<h4>
						5、Cookie是带有domain（域名）的，每个web应用只能读取自己的cookie,cookie和浏览器有关，不同浏览器cookie是不能共享的。
					</h4>
					<textarea class="form-control" rows="6" placeholder="请写入你的答案" style="resize: none;"></textarea>
				</div>
				
				<button class="btn btn-lg btn-primary" style="display: block;margin:30px auto;"> 交卷</button>
			</div>
		</div>
	</body>
</html>

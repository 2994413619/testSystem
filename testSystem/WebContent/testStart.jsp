<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!--testMyselfStartCss-->
		<link rel="stylesheet" href="myCss/testfStart.css" />
		
		<!--testMyselfStartJs-->
		<script type="text/javascript" src="myjs/testfStart.js" ></script>
		
		<!--testMyselfStart-->
		<div class="container-fluid">
			
			<div class="row col-lg-2 col-lg-offset-1 col-md-3 hidden-sm hidden-sm hidden-xs myindex">
				<a href="#1" class="btn btn-primary mybtn">1</a>
				<a href="#2" class="btn btn-primary mybtn">2</a>
				<a href="#3" class="btn btn-primary mybtn">3</a>
				<a href="#4" class="btn btn-primary mybtn">4</a>
				<a href="#5" class="btn btn-primary mybtn">5</a>
				<a href="#6" class="btn btn-primary mybtn">6</a>
				<a href="#7" class="btn btn-primary mybtn">7</a>
				<a href="#8" class="btn btn-primary mybtn">8</a>
				<a href="#9" class="btn btn-primary mybtn">9</a>
				<a href="#10" class="btn btn-default mybtn">10</a>
				<a href="#11" class="btn btn-default mybtn">11</a>
				<a href="#12" class="btn btn-default mybtn">12</a>
				<a href="#13" class="btn btn-default mybtn">13</a>
				<a href="#14" class="btn btn-default mybtn">14</a>
				<a href="#15" class="btn btn-default mybtn">15</a>
				<a href="#16" class="btn btn-default mybtn">16</a>
				<a href="#17" class="btn btn-default mybtn">17</a>
				<a href="#18" class="btn btn-default mybtn">18</a>
				<a href="#19" class="btn btn-default mybtn">19</a>
				<a href="#20" class="btn btn-default mybtn">20</a>
				
			</div>
			
			<div class="row col-lg-2 col-lg-offset-1 col-md-3 col-sm-4 hidden-xs countDown">
				倒计时:
				<span id="countDown"></span>
			</div>
			
			<div class="row col-lg-8 col-lg-offset-3 col-md-9 col-md-offset-3">
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
<%@ include file="footer.jsp" %>
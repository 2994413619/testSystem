<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
		<!--publish.css-->
		<link rel="stylesheet" href="myCss/publish.css" />
		
		<!--publish.js-->
		<script type="text/javascript" src="myjs/publish.js" ></script>
		
		<div class="container form-horizontal" id="fatherDiv">
			<p style="font-size: 20px;margin-top: 50px;">链接分享</p>
			<div class="shareDiv">
				<div class="form-group">
				    <label class="col-sm-2 control-label">
				    	<button class="btn btn-primary" onclick="copyUrl()">复制链接</button>
				    </label>
				    <div class="col-sm-7">
				      	<input type="text" class="form-control input-lg" id="testUrl" placeholder="考试地址" autocomplete="off" value="www.ityuchao.club/testSystem/testStart.html">
				    </div>
				    
				</div>
			</div>
			<p style="font-size: 20px;margin-top: 50px;">二维码分享</p>
			<div class="shareDiv">
				<div class="form-group">
				    <label class="col-sm-2 control-label" style="margin-top: 50px;">
				    	<button class="btn btn-primary" onclick="copyUrl()">下载二维码</button>
				    </label>
				    <div class="col-sm-7">
				      	<img src="img/myservice.jpg" />
				    </div>
				</div>
			</div>
		</div>

<%@ include file="footer.jsp" %>
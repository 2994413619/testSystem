$(function() {
	//获得contextPath
	contextPath = $("#contextPath").val();
});

$(function(){
	//提示用户名是否为空
	$("#userName").change(function() {
		if($(this).val()==""){
			$("#userNameDiv").append("<label id='userNameLabel' class='error'>用户名不可为空</label>");
		} else {
			$("#userNameLabel").remove();
		}
	});
	
	//提示密码不可为空
	$("#password").change(function() {
		if($(this).val()==""){
			$("#passwordDiv").append("<label id='passwordLabel' class='error'>密码不可为空</label>");
		} else {
			$("#passwordLabel").remove();
		}
	});
});

//注册表单提交
function userLogin(){
	if($("#userName").val()==""){
		alert("用户名不可为空！");
	} else if($("#password").val()==""){
		alert("密码不可为空！");
	} else {
		//当密码和用户名都不为空时候
		var userName = $("#userName").val();
		var password = $("#password").val();
		var autoLogin = $("#autoLogin").val();
		if($("#userType").val()=='1'){
			//老师登录
			$.ajax({
				"async":false,
				"url":"User",
				"data":{"method":"teacherLogin","userName":userName,"password":password,"autoLogin":autoLogin},
				"type":"POST",
				"dataType":"text",
				"success":function(data){
					//0可登录，1用户不存在，2密码错误
					if("0"==data){
						location.href = contextPath + "/Index?method=index";
					} else if("1"==data){
						alert("用户不存在!");
					} else if("2"==data){
						alert("密码错误!");
					}
				}
			});
		} else if($("#userType").val()=='0'){
			//学生登录
			$.ajax({
				"async":false,
				"url":"User",
				"data":{"method":"studentLogin","userName":userName,"password":password,"autoLogin":autoLogin},
				"type":"POST",
				"dataType":"text",
				"success":function(data){
					//0可登录，1用户不存在，2用户名或密码错误
					if("0"==data){
						location.href = contextPath + "/Index?method=index";
					} else if("1"==data){
						alert("用户不存在!");
					} else if("2"==data){
						alert("密码错误!");
					}
				}
			});
		}
	}
	
	
}
$(function(){
	
	$.validator.addMethod(
		"usernameCheck",
		function(value,element,params){
			var pattern = /^\w+$/;
			return pattern.test(value);
		}
	);
	
	//检验验证码
	$.validator.addMethod(
			"checkVcode",
			function(value,element,params){
				var flag = false;
				$.ajax({
					"async":false,
					"url":"User",
					"data":{"method":"getVcode"},
					"type":"POST",
					"dataType":"text",
					"success":function(data){
						if(value==data)
							flag = true;
					}
				});
				return flag;
			}
	);
	
	//检测老师编号是否存在
	$.validator.addMethod(
			"existTeacherId",
			function(value,element,params){
				var flag = false;
				$.ajax({
					"async":false,
					"url":"User",
					"data":{"method":"existTeacherId","teacherId":value},
					"type":"POST",
					"dataType":"text",
					"success":function(data){
						if("true"==data)
							flag = true;
					}
				});
				return flag;
			}
	);
	
	//学生用户名是否存在
	$.validator.addMethod(
			"existStudentUsername",
			function(value,element,params){
				var flag = false;
				$.ajax({
					"async":false,
					"url":"User",
					"data":{"method":"existStudentUsername","userName":value},
					"type":"POST",
					"dataType":"text",
					"success":function(data){
						if("true"==data)
							flag = true;
					}
				});
				return flag;
			}
	);
	
	$("#register").validate({
		rules:{
			myTeacherId:{
				required:true,
				existTeacherId:true
			},
			userName:{
				required:true,
				rangelength:[3,20],
				usernameCheck:true,
				existStudentUsername:true
			},
			password:{
				required:true,
				rangelength:[6,20]
			},
			repassword:{
				required:true,
				equalTo:"[name=password]"
			},
			realName:{
				required:true
			},
			email:{
				required:true,
				email:true
			},
			vCode:{
				required:true,
				checkVcode:true
			}
		},
		messages:{
			myTeacherId:{
				required:"老师编号必填",
				existTeacherId:"编号不存在"
			},
			userName:{
				required:"用户名必填",
				rangelength:"长度必须3~20",
				usernameCheck:"仅数字字母_",
				existStudentUsername:"用户名已存在"
			},
			password:{
				required:"密码必填",
				rangelength:"必须6~20位"
			},
			repassword:{
				required:"请确认密码",
				equalTo:"两次不一致"
			},
			realName:{
				required:"姓名必填"
			},
			email:{
				required:"邮箱必填",
				email:"格式错误"
			},
			vCode:{
				required:"验证码必填",
				checkVcode:"验证码错误"
			}
		},
		success:function(succ,element){
			succ.addClass("success");
		},
		//单条校验失败，后会调用此方法，在此方法中，编写错误消息如何显示 及  校验失败回调方法
		showErrors: function(errorMap, errorList) {
				// 遍历错误列表
				for(var obj in errorMap) {
					// 自定义错误提示效果
					$('#' + obj+"-error").removeClass("success");
				}
				// 此处注意，一定要调用默认方法，这样保证提示消息的默认效果
				this.defaultShowErrors();
			},
			errorPlacement: function(err, element) {
				err.appendTo(element.parent().parent());
			}
	});
	
	
});

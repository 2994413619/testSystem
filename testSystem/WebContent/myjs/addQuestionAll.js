$(function(){
	
	$("#addQuestion").validate({
		rules:{
			questionContent:{
				required:true
			},
			A:{
				required:true
			},
			B:{
				required:true
			},
			C:{
				required:true
			},
			D:{
				required:true
			},
			E:{
				required:true
			},
			F:{
				required:true
			},
			G:{
				required:true
			},
			H:{
				required:true
			},
			I:{
				required:true
			},
			J:{
				required:true
			},
			K:{
				required:true
			},
			L:{
				required:true
			},
			M:{
				required:true
			},
			N:{
				required:true
			},
			O:{
				required:true
			},
			P:{
				required:true
			},
			Q:{
				required:true
			},
			R:{
				required:true
			},
			S:{
				required:true
			},
			T:{
				required:true
			},
			U:{
				required:true
			},
			B:{
				required:true
			},
			W:{
				required:true
			},
			X:{
				required:true
			},
			Y:{
				required:true
			},
			Z:{
				required:true
			},
			score:{
				required:true
			},
			answer:{
				required:true
			},
			rightChoose:{
				required:true
			},
			1:{
				required:true
			},
			2:{
				required:true
			},
			3:{
				required:true
			},
			4:{
				required:true
			},
			5:{
				required:true
			},
			6:{
				required:true
			},
			7:{
				required:true
			},
			8:{
				required:true
			},
			9:{
				required:true
			},
			10:{
				required:true
			},
			11:{
				required:true
			},
			12:{
				required:true
			},
			13:{
				required:true
			},
			14:{
				required:true
			},
			15:{
				required:true
			},
			16:{
				required:true
			},
			17:{
				required:true
			},
			18:{
				required:true
			},
			19:{
				required:true
			},
			20:{
				required:true
			},
			21:{
				required:true
			},
			22:{
				required:true
			},
			23:{
				required:true
			},
			24:{
				required:true
			},
			25:{
				required:true
			},
			26:{
				required:true
			},
			questionStep0:{
				required:true
			}
		},
		messages:{
			questionContent:{
				required:"题干必填"
			},
			A:{
				required:"选项必填"
			},
			B:{
				required:"选项必填"
			},
			C:{
				required:"选项必填"
			},
			D:{
				required:"选项必填"
			},
			E:{
				required:"选项必填"
			},
			F:{
				required:"选项必填"
			},
			G:{
				required:"选项必填"
			},
			H:{
				required:"选项必填"
			},
			I:{
				required:"选项必填"
			},
			J:{
				required:"选项必填"
			},
			K:{
				required:"选项必填"
			},
			L:{
				required:"选项必填"
			},
			M:{
				required:"选项必填"
			},
			N:{
				required:"选项必填"
			},
			O:{
				required:"选项必填"
			},
			P:{
				required:"选项必填"
			},
			Q:{
				required:"选项必填"
			},
			R:{
				required:"选项必填"
			},
			S:{
				required:"选项必填"
			},
			T:{
				required:"选项必填"
			},
			U:{
				required:"选项必填"
			},
			V:{
				required:"选项必填"
			},
			W:{
				required:"选项必填"
			},
			X:{
				required:"选项必填"
			},
			Y:{
				required:"选项必填"
			},
			Z:{
				required:"选项必填"
			},
			score:{
				required:"分数必填"
			},
			answer:{
				required:"答案必填"
			},
			rightChoose:{
				required:"答案必填"
			},
			1:{
				required:"答案必填"
			},
			2:{
				required:"答案必填"
			},
			3:{
				required:"答案必填"
			},
			4:{
				required:"答案必填"
			},
			5:{
				required:"答案必填"
			},
			6:{
				required:"答案必填"
			},
			7:{
				required:"答案必填"
			},
			8:{
				required:"答案必填"
			},
			9:{
				required:"答案必填"
			},
			10:{
				required:"答案必填"
			},
			11:{
				required:"答案必填"
			},
			12:{
				required:"答案必填"
			},
			13:{
				required:"答案必填"
			},
			14:{
				required:"答案必填"
			},
			15:{
				required:"答案必填"
			},
			16:{
				required:"答案必填"
			},
			17:{
				required:"答案必填"
			},
			18:{
				required:"答案必填"
			},
			19:{
				required:"答案必填"
			},
			20:{
				required:"答案必填"
			},
			21:{
				required:"答案必填"
			},
			22:{
				required:"答案必填"
			},
			23:{
				required:"答案必填"
			},
			24:{
				required:"答案必填"
			},
			25:{
				required:"答案必填"
			},
			26:{
				required:"答案必填"
			},
			questionStep0:{
				required:"题干必填"
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
				err.appendTo(element.parent().parent().parent());
			}
	});
});

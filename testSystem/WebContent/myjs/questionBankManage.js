$(function() {
	//获得contextPath
	contextPath = $("#contextPath").val();
});

/*鼠标悬浮按钮更换图片*/
function changeQuery2(element){
	element.setAttribute("src",contextPath + "/img/query2.png")
}
function changeQuery1(element){
	element.setAttribute("src",contextPath + "/img/query1.png")
}
//控制跳转框输入数字的范围
function controlNumber(){
	var dumpNumber = Math.round(Number($("#dumpNumber").val()));
	var dumpNumberMax = Number($("#dumpNumber").attr("max"));
	if(dumpNumber<1){
		$("#dumpNumber").val(1);
	} else if(dumpNumber>dumpNumberMax){
		$("#dumpNumber").val(dumpNumberMax);
	} else {
		$("#dumpNumber").val(dumpNumber);
	}
}
//全选和全不选
function allCheck(element){
	if($(element).text()=="全选"){
		$("input[name=batchDeal]").attr("checked","true");
		$(element).text("全不选");
	} else if($(element).text()=="全不选"){
		$("input[name=batchDeal]").removeAttr("checked");
		$(element).text("全选");
	}
}

//分页提交
function changePage(element){
	//1、获得要跳转的页数
	var currentPage = $(element).attr("currentPage");
	var totalPage = $(element).attr("totalPage");
	if(currentPage == 0 || currentPage > totalPage){
		return;
	} else {
		$("#condition").append("<input type='hidden' name='currentPage' value='"+currentPage+"' />");
		$("#condition").submit();
	}
}

//输入框输入数字跳转页面
function changePage2(){
	var currentPage = $("#dumpNumber").val();
	$("#condition").append("<input type='hidden' name='currentPage' value='"+currentPage+"' />");
	$("#condition").submit();
}

//删除问题
function deleteQuestion(element){
	var questionId = $(element).attr("questionId");
	var flag = confirm("确认删除问题"+questionId+"？删除不可恢复");
	if(flag){
		$.ajax({
			"async":false,
			"url":contextPath + "/teacher/question",
			"data":{"method":"deleteQuestionById","questionId":questionId},
			"type":"POST",
			"dataType":"text",
			"success":function(data){
				if("true"==data){
					alert("删除成功！");
					location.reload();
					/*var str = location.href.split("?");
					location.href = str[0] + "?method=getQuestions";*/
				} else {
					alert("删除失败！请联系管理员");
				}
					
			}
		});
	}
}

//隐藏问题
function hiddenQuestion(element){
	var questionId = $(element).attr("questionId");
	var flag = confirm("确认隐藏问题"+questionId+"？隐藏后学生将看不到该题。");
	if(flag){
		$.ajax({
			"async":false,
			"url":contextPath + "/teacher/question",
			"data":{"method":"hiddenQuestion","questionId":questionId},
			"type":"POST",
			"dataType":"text",
			"success":function(data){
				if("true"==data){
					alert("隐藏成功！");
					location.reload();
				} else {
					alert("隐藏失败！请联系管理员");
				}
					
			}
		});
	}
}

//公开问题
function publicQuestion(element){
	var questionId = $(element).attr("questionId");
	var flag = confirm("确认公开问题"+questionId+"？公开后学生将可以看到该题。");
	if(flag){
		$.ajax({
			"async":false,
			"url":contextPath + "/teacher/question",
			"data":{"method":"publicQuestion","questionId":questionId},
			"type":"POST",
			"dataType":"text",
			"success":function(data){
				if("true"==data){
					alert("公开成功！");
					location.reload();
				} else {
					alert("公开失败！请联系管理员");
				}
					
			}
		});
	}
}

//批量公开
function batchPublic(){
	var questionIds = new Array();
	$("input[name=batchDeal]:checked").each(function(index,element){
		questionIds[index] = $(this).val();
	});
	if(questionIds.length == 0){
		alert("您未勾选，请勾选");
	} else {
		$.ajax({
			aysnc:false,
			url:contextPath + "/teacher/question",
			data:{"method":"batchPublic","questionIds":questionIds},
			type:"POST",
			dataType:"text",
			traditional:true,
			success:function(data){
				alert("您成功公开"+data+"个问题！")
				location.reload();
			}
		});
	}
}

//批量隐藏
function batchHidden(){
	var questionIds = new Array();
	$("input[name=batchDeal]:checked").each(function(index,element){
		questionIds[index] = $(this).val();
	});
	if(questionIds.length == 0){
		alert("您未勾选，请勾选！");
	} else {
		$.ajax({
			aysnc:false,
			url:contextPath + "/teacher/question",
			data:{"method":"batchHidden","questionIds":questionIds},
			type:"POST",
			dataType:"text",
			traditional:true,
			success:function(data){
				alert("您成功隐藏"+data+"个问题！")
				location.reload();
			}
		});
	}
}

//批量删除
function batchDelete(){
	var questionIds = new Array();
	$("input[name=batchDeal]:checked").each(function(index,element){
		questionIds[index] = $(this).val();
	});
	if(questionIds.length == 0){
		alert("您未勾选，请勾选！");
	} else {
		$.ajax({
			aysnc:false,
			url:contextPath + "/teacher/question",
			data:{"method":"batchDelete","questionIds":questionIds},
			type:"POST",
			dataType:"text",
			traditional:true,
			success:function(data){
				alert("您删除删除"+data+"个问题！")
				location.reload();
			}
		});
	}
}


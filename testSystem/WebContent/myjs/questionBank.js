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
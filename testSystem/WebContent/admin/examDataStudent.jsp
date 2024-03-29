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
		<script type="text/javascript" src="js/examDataPublic.js"></script>
	</head>
	<body>
		<div class="container-fluid">
			<h1 style="clear: all;">综合测试<small>——tom考试数据</small></h1>
			<div class="row testInfoFather">
				<div class="testInfo">单选：30</div>
				<div class="testInfo">多选：20</div>
				<div class="testInfo">判断：10</div>
				<div class="testInfo">填空：8</div>
				<div class="testInfo">主观：20</div>
				<div class="testInfo">总分：80</div>
				<button class="btn btn-primary pull-right" style="margin-right: 17px;">导出数据</button>
			</div>	
			
			<div class="table-responsive">
				<table class="table table-bordered table-hover table-striped" id="questionData">
					<thead>
						<tr>
							<th nowrap="nowrap">题号</th>
							<th nowrap="nowrap">题型</th>
							<th nowrap="nowrap">答案</th>
							<th nowrap="nowrap">学生答案</th>
							<th nowrap="nowrap">正确否</th>
							<th nowrap="nowrap">打分人</th>
							<th nowrap="nowrap">分值</th>
							<th nowrap="nowrap">学生得分</th>
							<th nowrap="nowrap">打分</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>单选</td>
							<td>A</td>
							<td>B</td>
							<td class="right">正确</td>
							<td>jack</td>
							<td>5</td>
							<td id="tomid1">
								<input type="number" min="0" class="form-control" onblur="setScore(this)">
							</td>
							<td>
								<button class="btn btn-primary" onclick="starSetScore(this)" forId="tomid1">打分</button>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>多选</td>
							<td>A、B</td>
							<td>B、C</td>
							<td class="error">错误</td>
							<td>jack</td>
							<td>5</td>
							<td id="tomid2">0</td>
							<td>
								<button class="btn btn-primary" onclick="starSetScore(this)" forId="tomid2">打分</button>
							</td>
						</tr>
						<tr>
							<td>3</td>
							<td>判断</td>
							<td><span class="glyphicon glyphicon-ok"></span></td>
							<td><span class="glyphicon glyphicon-remove"></span></td>
							<td class="error">错误</td>
							<td>jack</td>
							<td>5</td>
							<td id="tomid3">0</td>
							<td>
								<button class="btn btn-primary" onclick="starSetScore(this)" forId="tomid3">打分</button>
							</td>
						</tr>
						<tr>
							<td>4</td>
							<td>填空</td>
							<td>1、测试数据；2、测试数据；2、测试数据</td>
							<td>1、测试数据；2、测试数据；2、测试数据</td>
							<td class="right">正确</td>
							<td>jack</td>
							<td>5</td>
							<td id="tomid4">5</td>
							<td>
								<button class="btn btn-primary" onclick="starSetScore(this)" forId="tomid4">打分</button>
							</td>
						</tr>
						<tr>
							<td>5</td>
							<td>主观</td>
							<td>Throwable 类是 Java 语言中Error类和Exception类的父类。 当异常对象是Exception类(或其子类)的实例时，能通过 Java 虚拟机或者 throw 语句抛出该异常对象，并能通过try…catch…finally处理。 如果只用一个catch块捕捉多个异常对象，则catch 子句中的参数类型应是所有异常对象的父类。</td>
							<td>Throwable 类是 Java 语言中Error类和Exception类的父类。 当异常对象是Exception类(或其子类)的实例时，能通过 Java 虚拟机或者 throw 语句抛出该异常对象，并能通过try…catch…finally处理。 如果只用一个catch块捕捉多个异常对象，则catch 子句中的参数类型应是所有异常对象的父类。</td>
							<td class="right">正确</td>
							<td>jack</td>
							<td>15</td>
							<td id="tomid5">15</td>
							<td>
								<button class="btn btn-primary" onclick="starSetScore(this)" forId="tomid5">打分</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>

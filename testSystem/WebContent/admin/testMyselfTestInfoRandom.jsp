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
			<h1>自我测试：tom<small>——随机测试</small></h1>
			<div class="row testInfoFather">
				<div class="testInfo">总分：100</div>
				<div class="testInfo">得分：80</div>
				<div class="testInfo">
					难度：
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
				</div>
				<div class="testInfo">试卷规模：单选10；多选5；判断10；填空10；主观3；</div>
				<button class="btn btn-primary pull-right" style="margin-right: 17px;">导出数据</button>
				<a href="showTest.html" class="btn btn-primary pull-right" style="margin-right: 17px;">试卷题目</a>
			</div>
			
			<div class="table-responsive">
				<table class="table table-hover table-bordered" id="myTable">
					<thead>
						<tr>
							<td nowrap="nowrap">题号</td>
							<td nowrap="nowrap">题目类型</td>
							<td nowrap="nowrap">内容</td>
							<td nowrap="nowrap">答案</td>
							<td nowrap="nowrap">学生答案</td>
							<td nowrap="nowrap">分值</td>
							<td nowrap="nowrap">学生得分</td>
							<td nowrap="nowrap">是否正确</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>01235872</td>
							<td>单选</td>
							<td>node.js</td>
							<td>A</td>
							<td>A</td>
							<td>10</td>
							<td>10</td>
							<td class="right">正确</td>
						</tr>
						<tr>
							<td>01235872</td>
							<td>多选</td>
							<td>node.js</td>
							<td>ABC</td>
							<td>CD</td>
							<td>10</td>
							<td>0</td>
							<td class="error">错误</td>
						</tr>
						<tr>
							<td>01235872</td>
							<td>判断</td>
							<td>node.js</td>
							<td><span class="glyphicon glyphicon-remove"></span></td>
							<td><span class="glyphicon glyphicon-ok"></span></td>
							<td>5</td>
							<td>5</td>
							<td class="error">错误</td>
						</tr>
						<tr>
							<td>01235872</td>
							<td>填空</td>
							<td>node.js</td>
							<td>
								<p>1、测试数据</p>
								<p>2、测试数据</p>
								<p>3、测试数据</p>
								<p>4、测试数据</p>
							</td>
							<td>
								<p>1、测试数据</p>
								<p>2、测试数据</p>
								<p>3、测试数据</p>
								<p>4、测试数据</p>
							</td>
							<td>5</td>
							<td>5</td>
							<td class="right">正确</td>
						</tr>
						<tr>
							<td>01235872</td>
							<td>主观</td>
							<td>node.js</td>
							<td>
								<p>算法（Algorithm）是指解题方案的准确而完整的描述，是一系列解决问题的清晰指令，算法代表着用系统的方法描述解决问题的策略机制。
									也就是说，能够对一定规范的输入，在有限时间内获得所要求的输出。如果一个算法有缺陷，或不适合于某个问题，执行这个算法将不会解决这个问题。
									不同的算法可能用不同的时间、空间或效率来完成同样的任务。一个算法的优劣可以用空间复杂度与时间复杂度来衡量。</p>
							</td>
							<td>
								<p>算法（Algorithm）是指解题方案的准确而完整的描述，是一系列解决问题的清晰指令，算法代表着用系统的方法描述解决问题的策略机制。
									也就是说，能够对一定规范的输入，在有限时间内获得所要求的输出。如果一个算法有缺陷，或不适合于某个问题，执行这个算法将不会解决这个问题。
									不同的算法可能用不同的时间、空间或效率来完成同样的任务。一个算法的优劣可以用空间复杂度与时间复杂度来衡量。</p>
							</td>
							<td>20</td>
							<td>不打分</td>
							<td>不打分</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</body>
</html>

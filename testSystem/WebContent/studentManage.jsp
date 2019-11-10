<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!--requestBankCss-->
		<link rel="stylesheet" href="myCss/studentManage.css" />

		<script type="text/javascript" src="myjs/studentManage.js" ></script>

		<div class="container-fluid table-striped table-responsive" style="margin-top:40px">
			<div class="row" style="margin-bottom: 10px;padding-right: 17px;">
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>不论禁用</option>
						<option>禁用用户</option>
						<option>可用用户</option>
					</select>
				</div>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>不论性别</option>
						<option>男</option>
						<option>女</option>
					</select>
				</div>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<select class="form-control">
						<option>一页10条</option>
						<option>一页15条</option>
						<option>一页30条</option>
						<option>一页50条</option>
						<option>一页100条</option>
						<option>全部显示</option>
					</select>
				</div>
				<div class="form-group col-lg-1 col-sm-2 col-xs-5">
					<span class="btn">一共200人</span>
				</div>
				<form class="form-inline" style="float: right;">
					<button type="button" class="btn btn-primary" style="margin-right: 30px;">导出信息</button>
					<div class="form-group">
						<input type="text" class="form-control" id="queryRequest" autocomplete="off" placeholder="人名查询">
					</div>
					<input type="image" class="btn btn-default" src="img/query1.png" onmouseout="changeQuery1(this)" onmouseover="changeQuery2(this)" />
				</form>
			</div>
			<div class="table-responsive">
				<table class="table table-hover table-bordered" id="studentInfo">
					<thead>
						<tr>
							<td nowrap="nowrap">编号</td>
							<td nowrap="nowrap">用户名</td>
							<td nowrap="nowrap">头像</td>
							<td nowrap="nowrap">真实姓名</td>
							<td nowrap="nowrap">密码</td>
							<td nowrap="nowrap">邮箱</td>
							<td nowrap="nowrap">性别</td>
							<td nowrap="nowrap">生日</td>
							<td nowrap="nowrap">电话</td>
							<td nowrap="nowrap">注册日期</td>
							<td nowrap="nowrap">个性签名</td>
							<td nowrap="nowrap">激活状态</td>
							<td nowrap="nowrap">练习情况</td>
							<td nowrap="nowrap">操作</td>
							<td nowrap="nowrap">多选</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1234678</td>
							<td>tom</td>
							<td>
								<img src="img/nologinHear.png">
							</td>
							<td>王麻子</td>
							<td>123456987AB</td>
							<td>123456789qq.com</td>
							<td>男</td>
							<td>1998-01-17</td>
							<td>15784236954</td>
							<td>1999-02-02</td>
							<td style="text-align: left;text-indent: 2em;">
								<p>吾为所持剑之骨。</p>
								<p>钢铁为身，而火焰为血。</p>
								<p>手制之剑已达千余。</p>
								<p>不知死亡。</p>
								<p>亦不知生命。</p>
								<p>曾承受痛苦创造诸多武器。</p>
							</td>
							<td>已激活</td>
							<td><a href="studentPractice.html">练习情况</a></td>
							<td class="right">
								未禁用<br /><br />
								<button class="btn btn-warning">禁用</button>
								<br /><br />
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
								  	修改
								</button>
								<br /><br />
								<button class="btn btn-danger">删除</button>
							</td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
						<tr>
							<td>1234678</td>
							<td>tom</td>
							<td>
								<img src="img/nologinHear.png">
							</td>
							<td>王麻子</td>
							<td>123456987AB</td>
							<td>123456789qq.com</td>
							<td>男</td>
							<td>1998-01-17</td>
							<td>15784236954</td>
							<td>1999-02-02</td>
							<td style="text-align: left;text-indent: 2em;">
								<p>I am the bone of my sword.</p>
								<p>Steel is my body,and fire is my blood.</p>
								<p>I have created over a thousand blades.</p>
								<p>Unknown to Death.</p>
								<p>Nor known to Life.</p>
								<p>Have withstood pain to create many weapons.</p>
							</td>
							<td>已激活</td>
							<td><a href="studentPractice.html">练习情况</a></td>
							<td class="error">
								禁用中<br /><br />
								<button class="btn btn-success">启用</button>
								<br /><br />
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
								  	修改
								</button>
								<br /><br />
								<button class="btn btn-danger">删除</button>
							</td>
							<td><input type="checkbox" name="batchDeal"></td>
						</tr>
						
					</tbody>
				</table>
			</div>
			
			<!--分页-->
			<nav aria-label="Page navigation" class="pull-left">
				<ul class="pagination">
					<li>
						<a href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<li class="active">
						<a href="#">1</a>
					</li>
					<li>
						<a href="#">2</a>
					</li>
					<li>
						<a href="#">3</a>
					</li>
					<li>
						<a href="#">4</a>
					</li>
					<li>
						<a>...</a>
					</li>
					<li>
						<a href="#">22</a>
					</li>
					<li>
						<a href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
				<input type="button" class="btn btn-default" id="dumpButton" value="跳转" />
				<input type="number" class="form-control" min="1" max="5" step="1" value="1" id="dumpNumber" onchange="controlNumber()" />
				<span style="float:right;margin-top:25px ;">&nbsp;&nbsp;&nbsp;&nbsp;共5页</span>
			</nav>
			
			<div class="pull-right" id="batchDeal">
				<button class="btn btn-default" onclick="allCheck(this)" style="width: 70px;">全选</button>
				<button class="btn btn-success">启用</button>
				<button class="btn btn-warning">禁用</button>
				<button class="btn btn-danger">删除</button>
			</div>
			
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  	<div class="modal-dialog" role="document">
			    <div class="modal-content">
			      	<div class="modal-header">
			        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        	<h4 class="modal-title" id="myModalLabel">查看或修改详细信息</h4>
			      	</div>
			      	<div class="modal-body">
			       	
				       	<form class="form-horizontal" id="register">
				       		<div class="form-group">
								<label for="studentId" class="col-sm-3 control-label hidden-xs">
									用户编号
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="studentId" name="studentId" placeholder="用户id" autocomplete="off" disabled="disabled">
								</div>
							</div>
							<div class="form-group">
							  	<label for="headImage" class="col-sm-3 control-label">头像</label>
							  	<div class="col-sm-6">
							  		<div style="display:inline-block;position:relative;overflow: hidden;vertical-align:middle">
							  			<button type="button" class="btn btn-success">选择图片</button>
							  			<input type="file" id="headImage" onchange="loadFile(this.files[0])" style="position:absolute;top:0;left:0;font-size:34px; opacity:0">
							  		</div>
							  		<span id="fileName">未选择图片</span>
							  	</div>
							</div>
							<div class="form-group">
								<label for="userName" class="col-sm-3 control-label hidden-xs">
									用户名
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="userName" name="userName" placeholder="用户名" autocomplete="off" value="tom">
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-3 control-label hidden-xs">
									密码
								</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="password" name="password" placeholder="密码" autocomplete="off" value="1234568">
								</div>
							</div>
							<div class="form-group">
								<label for="realName" class="col-sm-3 control-label hidden-xs">
									真实姓名
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="realName" name="realName" placeholder="真实姓名" autocomplete="off" value="王麻子">
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-sm-3 control-label hidden-xs">
									邮箱
								</label>
								<div class="col-sm-6">
									<input type="email" class="form-control" id="email" name="email" placeholder="邮箱" autocomplete="off" value="256987412qq.com">
								</div>
							</div>
							<div class="form-group">
								<label for="birthday" class="col-sm-3 control-label hidden-xs">生日&nbsp;&nbsp;</label>
								<div class="col-sm-6">
									<input type="date" class="form-control" id="birthday" name="birthday" value="1998-01-17">
								</div>
							</div>
							<div class="form-group">
								<label for="telephone" class="col-sm-3 control-label hidden-xs">电话&nbsp;&nbsp;</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="telephone" name="telephone" placeholder="电话" autocomplete="off" value="12579846321">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label hidden-xs">性别&nbsp;&nbsp;</label>
								<div class=" col-sm-6">
									<div class="radio">
										<label class="radio-inline">
								          <input type="radio" name="gender" value="man" checked="checked"> 男
								        </label>
								        <label class="radio-inline">
								          <input type="radio" name="gender" value="woman"> 女
								        </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="signature" class="col-sm-3 control-label hidden-xs">个性签名&nbsp;&nbsp;</label>
								<div class="col-sm-6">
									<textarea class="form-control" placeholder="个性签名" style="resize: none;" rows="7">吾为所持剑之骨。&#10;钢铁为身，而火焰为血。&#10;手制之剑已达千余。&#10;不知死亡。&#10;亦不知生命。&#10;曾承受痛苦创造诸多武器。</textarea>
								</div>
							</div>
						</form>
			       	
			      	</div>
			      	<div class="modal-footer">
			        	 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        				<button type="button" class="btn btn-primary">修改</button>
			      	</div>
			    </div>
		  	</div>
		</div>

<%@ include file="footer.jsp" %>
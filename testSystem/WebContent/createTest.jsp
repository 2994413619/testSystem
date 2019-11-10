<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!--createTestCss-->
		<link rel="stylesheet" href="myCss/createTest.css" />
		
		<!--createTestJs-->
		<script type="text/javascript" src="myjs/createTest.js" ></script>
		
		<div class="container-fluid father">
			<div class="row col-lg-2 col-md-2 hidden-sm hidden-xs" id="addQuestion">
				<p style="font-size: 18px;">添加题目：</p>
				<button class="btn btn-default questionType" onclick="addRadio()">
					<img src="img/radio1.png" />
					单选题
				</button>
				<button class="btn btn-default questionType" onclick="addMultipleChoice()">
					<img src="img/multipleChoice1.png" />
					多选题
				</button>
				<button class="btn btn-default questionType" onclick="addJudge()">
					<img src="img/judge1.png" />
					判断题
				</button>
				<button class="btn btn-default questionType" onclick="addGapFilling()">
					<img src="img/gapFilling1.png" />
					填空题
				</button>
				<button class="btn btn-default questionType" onclick="addSubjective()">
					<img src="img/subjective1.png" />
					主观题
				</button>
				
				<form class="form-horizontal" id="scoreSet">
					<hr />
					<p style="font-size: 18px;">考试人群设置：</p>
					<div class="form-group">
					    <label for="forPeople" class="col-sm-3 control-label">人群</label>
					    <div class="col-sm-8">
					      	<select id="forPeople" name="forPeople" class="form-control">
					      		<option value="mine">我的学生</option>
					      		<option value="all">所有学生</option>
					      	</select>
					    </div>
					</div>
					<hr />
					<p style="font-size: 18px;">答题时间设置：</p>
					<div class="form-group">
					    <label for="timeSet" class="col-sm-3 control-label">时长</label>
					    <div class="col-sm-8">
					      	<input type="number" class="form-control" id="timeSet" name="time" placeholder="分钟" onchange="ControltimeSet(this)">
					    </div>
					</div>
					<div class="form-group">
					    <label for="startTimeSet" class="col-sm-3 control-label">开始</label>
					    <div class="col-sm-9">
					      	<input type="datetime-local" class="form-control" id="startTimeSet" name="startTime">
					    </div>
					</div>
					<hr />
					<p style="font-size: 18px;">分值设置：</p>
					<div class="form-group">
					    <label for="radioScore" class="col-sm-3 control-label">单选</label>
					    <div class="col-sm-8">
					      	<input type="number" class="form-control" id="radioScore" name="radioScore" placeholder="分值" onchange="controlScore(this)" disabled="disabled">
					    </div>
					</div>
					<div class="form-group">
					    <label for="multipleChoiceScore" class="col-sm-3 control-label">多选</label>
					    <div class="col-sm-8">
					      	<input type="number" class="form-control" id="multipleChoiceScore" name="multipleChoiceScore" placeholder="分值" onchange="controlScore(this)" disabled="disabled">
					    </div>
					</div>
					<div class="form-group">
					    <label for="judgeScore" class="col-sm-3 control-label">判断</label>
					    <div class="col-sm-8">
					      	<input type="number" class="form-control" id="judgeScore" name="judgeScore" placeholder="分值" onchange="controlScore(this)" disabled="disabled">
					    </div>
					</div>
					<div class="form-group">
					    <label for="gapFillingScore" class="col-sm-3 control-label">填空</label>
					    <div class="col-sm-8">
					      	<input type="number" class="form-control" id="gapFillingScore" name="gapFillingScore" placeholder="一题" onchange="controlScore(this)" disabled="disabled">
					    </div>
					</div>
					<hr />
					<p style="font-size: 18px;">主观分值设置：</p>
					<!--<div class="form-group" id="5ScoreDiv">
					    <label for="5Score" class="col-sm-3 control-label">15题</label>
					    <div class="col-sm-8">
					      	<input type="number" class="form-control" name="5Score" id="5Score" placeholder="分值" onchange="controlScore(this)">
					    </div>
					</div>-->
				</form>
			</div>
			<div class="row col-lg-8 col-lg-offset-3 col-md-8 col-md-offset-3" id="newTest">
				<form id="newTestForm">
					<div class="row">
						<input class="form-control" type="text" placeholder="请填写试卷标题" name="testTitle" id="testTitle">
					</div>
					
					<!--单选-->
					<!--<div class="row questionDiv" index="1" questionType="radio">
						<label class="col-lg-1 questionIndex" >1、</label>
						<div class="col-lg-9" questionContent="1">
							<textarea class="form-control questionStem" autocomplete="off" placeholder="请输入题干" name="1questionStem" oninput="changeRows(this)"></textarea>
							<div class="form-group checkItem" id="1chooseDivA">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项A" name="1chooseA">
							    </div>
							    <img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="1_A" onclick="deletechoose(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
							<div class="form-group checkItem"  id="1chooseDivB">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项B" name="1chooseB">
							    </div>
								<img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="1_B" onclick="deletechoose(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
							<div class="form-group checkItem" id="1chooseDivC">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项C" name="1chooseC">
							    </div>
								<img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="1_C" onclick="deletechoose(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
							<div class="form-group checkItem" id="1chooseDivD">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项D" name="1chooseD">
							    </div>
								<img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="1_D" onclick="deletechoose(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
						</div>
						<div class="col-lg-2">
							<p class="editQuestion" edit="deleteQuestionDiv" indexTarget="1" onclick="deleteQuestionDiv(this)" onmouseover="editQuestionOver(this)" onmouseout="editQuestionOut(this)">
								<img src="img/delete1.png" />删除题目
							</p>
							<p class="editQuestion" edit="addChoose" indexTarget="1" onmouseover="editQuestionOver(this)" onmouseout="editQuestionOut(this)" onclick="addChoose(this)">
								<img src="img/add_small1.png" style="width: 24px;" />添加选项
							</p>
							<div class="rightDiv" AnswerDiv="1">
								<p>正确答案选择：</p>
								<div class="radio" id="1rightChooseDivA">
								  <label>
								    <input type="radio" name="1rightChoose" value="A" checked="checked">
								    A
								  </label>
								</div>
								<div class="radio" id="1rightChooseDivB">
								  <label>
								    <input type="radio" name="1rightChoose" value="B">
								    B
								  </label>
								</div>
								<div class="radio" id="1rightChooseDivC">
								  <label>
								    <input type="radio" name="1rightChoose" value="C">
								    C
								  </label>
								</div>
								<div class="radio" id="1rightChooseDivD">
								  <label>
								    <input type="radio" name="1rightChoose" value="D">
								    D
								  </label>
								</div>
							</div>
						</div>
					</div>-->
					
					<!--多选-->
					<!--<div class="row questionDiv" index="2" questionType="multipleChoice">
						<label class="col-lg-1 questionIndex" >2、</label>
						<div class="col-lg-9" questionContent="2">
							<textarea class="form-control questionStem" autocomplete="off" placeholder="请输入题干" name="2questionStem" oninput="changeRows(this)"></textarea>
							<div class="form-group checkItem" id="2chooseDivA">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项A" name="2chooseA">
							    </div>
							    <img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="2_A" onclick="deletechooseCheckBox(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
							<div class="form-group checkItem"  id="2chooseDivB">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项B" name="2chooseB">
							    </div>
								<img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="2_B" onclick="deletechooseCheckBox(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
							<div class="form-group checkItem" id="2chooseDivC">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项C" name="2chooseC">
							    </div>
								<img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="2_C" onclick="deletechooseCheckBox(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
							<div class="form-group checkItem" id="2chooseDivD">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项D" name="2chooseD">
							    </div>
								<img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="2_D" onclick="deletechooseCheckBox(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
						</div>
						<div class="col-lg-2">
							<p class="editQuestion" edit="deleteQuestionDiv" indexTarget="2" onclick="deleteQuestionDiv(this)" onmouseover="editQuestionOver(this)" onmouseout="editQuestionOut(this)">
								<img src="img/delete1.png" />删除题目
							</p>
							<p class="editQuestion" edit="addChoose" indexTarget="2" onmouseover="editQuestionOver(this)" onmouseout="editQuestionOut(this)" onclick="addChooseCheckBox(this)">
								<img src="img/add_small1.png" style="width: 24px;" />添加选项
							</p>
							<div class="rightDiv" AnswerDiv="2">
								<p>正确答案选择：</p>
								<div class="checkbox" id="2rightChooseDivA">
								  <label>
								    <input type="checkbox" name="2rightChoose" value="A" checked="checked">
								    A
								  </label>
								</div>
								<div class="checkbox" id="2rightChooseDivB">
								  <label>
								    <input type="checkbox" name="2rightChoose" value="B">
								    B
								  </label>
								</div>
								<div class="checkbox" id="2rightChooseDivC">
								  <label>
								    <input type="checkbox" name="2rightChoose" value="C">
								    C
								  </label>
								</div>
								<div class="checkbox" id="2rightChooseDivD">
								  <label>
								    <input type="checkbox" name="2rightChoose" value="D">
								    D
								  </label>
								</div>
							</div>
						</div>
					</div>-->
					
					<!--判断-->
					<!--<div class="row questionDiv" index="3" questionType="judge">
						<label class="col-lg-1 questionIndex" >3、</label>
						<div class="col-lg-9" questionContent="3">
							<textarea class="form-control questionStem" autocomplete="off" placeholder="请输入题干" name="2questionStem" oninput="changeRows(this)"></textarea>
						</div>
						<div class="col-lg-2">
							<p class="editQuestion" edit="deleteQuestionDiv" indexTarget="3" onclick="deleteQuestionDiv(this)" onmouseover="editQuestionOver(this)" onmouseout="editQuestionOut(this)">
								<img src="img/delete1.png" />删除题目
							</p>
							<div class="rightDiv" AnswerDiv="3">
								<p>正确答案选择：</p>
								<div class="radio" id="3rightChooseDivA">
								  <label>
								    <input type="radio" name="3rightChoose" value="true" checked="checked">
								 	真确
								  </label>
								</div>
								<div class="radio" id="3rightChooseDivB">
								  <label>
								    <input type="radio" name="3rightChoose" value="false">
									错误
								  </label>
								</div>
							</div>
						</div>
					</div>-->
					
					<!--填空-->
					<!--<div class="row questionDiv" index="4" questionType="gapFilling">
						<label class="col-lg-1 questionIndex" >4、</label>
						<div class="col-lg-9" questionContent="4">
							<textarea class="form-control questionStem" autocomplete="off" placeholder="请输入题干" name="4questionStem" oninput="changeRows(this)"></textarea>
							<div class="form-group checkItem" id="4chooseDiv1">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="空1" name="4choose1" disabled="disabled">
							    </div>
							    <img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechooseGapFilling" chooseTarget="4_1" onclick="deletechooseGapFilling(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							    <textarea class="form-control questionStem" autocomplete="off" placeholder="请输入题干" name="4questionStem1" style="margin-top:20px;" oninput="changeRows(this)"></textarea>
							</div>
						</div>
						<div class="col-lg-2">
							<p class="editQuestion" edit="deleteQuestionDiv" indexTarget="4" onclick="deleteQuestionDiv(this)" onmouseover="editQuestionOver(this)" onmouseout="editQuestionOut(this)">
								<img src="img/delete1.png" />删除题目
							</p>
							<p class="editQuestion" edit="addChoose" indexTarget="4" onmouseover="editQuestionOver(this)" onmouseout="editQuestionOut(this)" onclick="addChooseGapFilling(this)">
								<img src="img/add_small1.png" style="width: 24px;" />添加选项
							</p>
							<div class="rightDiv" AnswerDiv="4">
								<p>正确答案：</p>
								<div class="form-group" id="4rightChooseDiv1">
								    <input type="text" class="form-control" autocomplete="off" placeholder="空1" name="4rightChoose1">
								</div>
							</div>
						</div>
					</div>-->
					
					<!--主观-->
					<!--<div class="row questionDiv" index="5" questionType="subjective">
						<label class="col-lg-1 questionIndex" >5、</label>
						<div class="col-lg-9" questionContent="5">
							<textarea class="form-control questionStem" autocomplete="off" placeholder="请输入题干" name="5questionStem" oninput="changeRows(this)"></textarea>
						</div>
						<div class="col-lg-2">
							<p class="editQuestion" edit="deleteQuestionDiv" indexTarget="5" onclick="deleteQuestionDiv(this)" onmouseover="editQuestionOver(this)" onmouseout="editQuestionOut(this)">
								<img src="img/delete1.png" />删除题目
							</p>
						</div>
					</div>-->
					
				</form>
				<button class="btn btn-primary btn-lg" id="saveBtn">保存</button>
			</div>
		</div>

		
	</body>

</html>
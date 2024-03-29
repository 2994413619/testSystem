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
					      	<input type="number" class="form-control" id="timeSet" name="time" placeholder="分钟" onchange="ControltimeSet(this)" value="120">
					    </div>
					</div>
					<div class="form-group">
					    <label for="startTimeSet" class="col-sm-3 control-label">开始</label>
					    <div class="col-sm-9">
					      	<input type="datetime" class="form-control" id="startTimeSet" name="startTime" value="2018-10-22 17:58" placeholder="格式2018-10-22 17:58">
					    </div>
					</div>
					<hr />
					<p style="font-size: 18px;">分值设置：</p>
					<div class="form-group">
					    <label for="radioScore" class="col-sm-3 control-label">单选</label>
					    <div class="col-sm-8">
					      	<input type="number" class="form-control" id="radioScore" name="radioScore" value="5" placeholder="分值" onchange="controlScore(this)" disabled="disabled">
					    </div>
					</div>
					<div class="form-group">
					    <label for="multipleChoiceScore" class="col-sm-3 control-label">多选</label>
					    <div class="col-sm-8">
					      	<input type="number" class="form-control" id="multipleChoiceScore" name="multipleChoiceScore" value="5" placeholder="分值" onchange="controlScore(this)" disabled="disabled">
					    </div>
					</div>
					<div class="form-group">
					    <label for="judgeScore" class="col-sm-3 control-label">判断</label>
					    <div class="col-sm-8">
					      	<input type="number" class="form-control" id="judgeScore" name="judgeScore" value="5" placeholder="分值" onchange="controlScore(this)" disabled="disabled">
					    </div>
					</div>
					<div class="form-group">
					    <label for="gapFillingScore" class="col-sm-3 control-label">填空</label>
					    <div class="col-sm-8">
					      	<input type="number" class="form-control" id="gapFillingScore" name="gapFillingScore" value="5" placeholder="一题" onchange="controlScore(this)" disabled="disabled">
					    </div>
					</div>
					<hr />
					<p style="font-size: 18px;">主观分值设置：</p>
					<div class="form-group" id="5ScoreDiv">
					    <label for="5Score" class="col-sm-3 control-label">5题</label>
					    <div class="col-sm-8">
					      	<input type="number" class="form-control" name="5Score" id="5Score" value="20" placeholder="分值" onchange="controlScore(this)">
					    </div>
					</div>
				</form>
			</div>
			<div class="row col-lg-8 col-lg-offset-3 col-md-8 col-md-offset-3" id="newTest">
				<form id="newTestForm">
					<div class="row">
						<input class="form-control" type="text" placeholder="请填写试卷标题" name="testTitle" id="testTitle">
					</div>
					
					<!--单选-->
					<div class="row questionDiv" index="1" questionType="radio">
						<label class="col-lg-1 questionIndex" >1、</label>
						<div class="col-lg-9" questionContent="1">
							<textarea rows="1" class="form-control questionStem" autocomplete="off" placeholder="请输入题干" name="1questionStem" oninput="changeRows(this)">对于import java.util包，以下那种说法是错误的？</textarea>
							<div class="form-group checkItem" id="1chooseDivA">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项A" name="1chooseA" value="Vector类是Sun公司的产品">
							    </div>
							    <img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="1_A" onclick="deletechoose(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
							<div class="form-group checkItem"  id="1chooseDivB">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项B" name="1chooseB" value="Vector类属于java.util包">
							    </div>
								<img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="1_B" onclick="deletechoose(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
							<div class="form-group checkItem" id="1chooseDivC">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项C" name="1chooseC" value="Vector类放在…／java/util/目录下">
							    </div>
								<img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="1_C" onclick="deletechoose(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
							<div class="form-group checkItem" id="1chooseDivD">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项D" name="1chooseD" value="Vector类放在java.util文件中">
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
								    <input type="radio" name="1rightChoose" value="A">
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
								    <input type="radio" name="1rightChoose" value="D" checked="checked">
								    D
								  </label>
								</div>
							</div>
						</div>
					</div>
					
					<!--多选-->
					<div class="row questionDiv" index="2" questionType="multipleChoice">
						<label class="col-lg-1 questionIndex" >2、</label>
						<div class="col-lg-9" questionContent="2">
							<textarea class="form-control questionStem" autocomplete="off" placeholder="请输入题干" name="2questionStem" oninput="changeRows(this)">下面说法错误的是</textarea>
							<div class="form-group checkItem" id="2chooseDivA">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项A" name="2chooseA" value="能被java.exe成功运行的java class文件必须有mian（）方法。">
							    </div>
							    <img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="2_A" onclick="deletechooseCheckBox(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
							<div class="form-group checkItem"  id="2chooseDivB">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项B" name="2chooseB" value="J2SDK就是Java API。">
							    </div>
								<img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="2_B" onclick="deletechooseCheckBox(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
							<div class="form-group checkItem" id="2chooseDivC">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项C" name="2chooseC" value="Appletviewer.exe可利用jar选项运行.jar文件。">
							    </div>
								<img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechoose" chooseTarget="2_C" onclick="deletechooseCheckBox(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							</div>
							<div class="form-group checkItem" id="2chooseDivD">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="选项D" name="2chooseD" value="能被Appletviewer成功运行的java class文件必须有main方法。">
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
								    <input type="checkbox" name="2rightChoose" value="A">
								    A
								  </label>
								</div>
								<div class="checkbox" id="2rightChooseDivB">
								  <label>
								    <input type="checkbox" name="2rightChoose" value="B" checked="checked">
								    B
								  </label>
								</div>
								<div class="checkbox" id="2rightChooseDivC">
								  <label>
								    <input type="checkbox" name="2rightChoose" value="C" checked="checked">
								    C
								  </label>
								</div>
								<div class="checkbox" id="2rightChooseDivD">
								  <label>
								    <input type="checkbox" name="2rightChoose" value="D" checked="checked">
								    D
								  </label>
								</div>
							</div>
						</div>
					</div>
					
					<!--判断-->
					<div class="row questionDiv" index="3" questionType="judge">
						<label class="col-lg-1 questionIndex" >3、</label>
						<div class="col-lg-9" questionContent="3">
							<textarea class="form-control questionStem" autocomplete="off" placeholder="请输入题干" name="2questionStem" oninput="changeRows(this)">在Java中，高优先级的可运行线程会抢占低优先级线程。</textarea>
						</div>
						<div class="col-lg-2">
							<p class="editQuestion" edit="deleteQuestionDiv" indexTarget="3" onclick="deleteQuestionDiv(this)" onmouseover="editQuestionOver(this)" onmouseout="editQuestionOut(this)">
								<img src="img/delete1.png" />删除题目
							</p>
							<div class="rightDiv" AnswerDiv="3">
								<p>正确答案选择：</p>
								<div class="radio" id="3rightChooseDivA">
								  <label>
								    <input type="radio" name="3rightChoose" value="true">
								 	真确
								  </label>
								</div>
								<div class="radio" id="3rightChooseDivB">
								  <label>
								    <input type="radio" name="3rightChoose" value="false" checked="checked">
									错误
								  </label>
								</div>
							</div>
						</div>
					</div>
					
					<!--填空-->
					<div class="row questionDiv" index="4" questionType="gapFilling">
						<label class="col-lg-1 questionIndex" >4、</label>
						<div class="col-lg-9" questionContent="4">
							<textarea class="form-control questionStem" autocomplete="off" placeholder="请输入题干" name="4questionStem" oninput="changeRows(this)">java语言中，</textarea>
							<div class="form-group checkItem" id="4chooseDiv1">
							    <div class="col-sm-7">
							    	<input type="text" class="form-control" placeholder="空1" name="4choose1" disabled="disabled">
							    </div>
							    <img src="img/delete_1.png" data-toggle="tooltip" data-placement="top" title="删除该选项" style="width: 34px;" edit="deletechooseGapFilling" chooseTarget="4_1" onclick="deletechooseGapFilling(this)" onmouseover="checkItemImgOver(this)" onmouseout="checkItemImgOut(this)"/>
							    <textarea class="form-control questionStem" autocomplete="off" placeholder="请输入题干" name="4questionStem1" style="margin-top:20px;" oninput="changeRows(this)">是所有类的根类</textarea>
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
								    <input type="text" class="form-control" autocomplete="off" placeholder="空1" name="4rightChoose1" value="Object">
								</div>
							</div>
						</div>
					</div>
					
					<!--主观-->
					<div class="row questionDiv" index="5" questionType="subjective">
						<label class="col-lg-1 questionIndex" >5、</label>
						<div class="col-lg-9" questionContent="5">
							<textarea class="form-control questionStem" autocomplete="off" placeholder="请输入题干" name="5questionStem" oninput="changeRows(this)">仔细阅读示例: EnumTest.java，运行它，分析运行结果？ 你能得到什么结论？你掌握了枚举类型的基本用法了吗？
public class EnumTest {

public static void main(String[] args) {
    Size s=Size.SMALL;
    Size t=Size.LARGE;
    //s和t引用同一个对象？
    System.out.println(s==t);  //
    //是原始数据类型吗？
    System.out.println(s.getClass().isPrimitive());//判断是否为类包的数据
    //从字符串中转换
    Size u=Size.valueOf("SMALL");
    System.out.println(s==u);  //true
    //列出它的所有值
    for(Size value:Size.values()){
        System.out.println(value);
    }
}

							</textarea>
						</div>
						<div class="col-lg-2">
							<p class="editQuestion" edit="deleteQuestionDiv" indexTarget="5" onclick="deleteQuestionDiv(this)" onmouseover="editQuestionOver(this)" onmouseout="editQuestionOut(this)">
								<img src="img/delete1.png" />删除题目
							</p>
						</div>
					</div>
					
				</form>
				<button class="btn btn-primary btn-lg" id="saveBtn">保存</button>
			</div>
		</div>

		
	</body>

</html>
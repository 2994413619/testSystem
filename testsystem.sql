/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : testsystem

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2019-04-06 00:03:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `questionId` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '题目类型——1单选、2多选、3判断、4填空、5主观回答',
  `questionCategoryID` int(11) DEFAULT NULL COMMENT '题目分类',
  `questionContent` text COMMENT '题干',
  `answerPeople` int(11) DEFAULT '0' COMMENT '答题人数',
  `answer` text COMMENT '题目答案：填空题答案不在这，在questionOption表中',
  `questionExplain` text COMMENT '题目解析',
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '该题写入系统的时间',
  `isPublic` tinyint(4) DEFAULT '0' COMMENT '是否公布题目：0公布，1不公布',
  `score` double DEFAULT NULL COMMENT '题目分值',
  `averageScore` double DEFAULT '0' COMMENT '平均分',
  `accuracy` double DEFAULT '0' COMMENT '正确率',
  `level` int(11) DEFAULT '1' COMMENT '题目难度：取值有1、2、3、4、5',
  `teacherID` int(11) DEFAULT NULL COMMENT '发布人ID（老师ID）',
  PRIMARY KEY (`questionId`),
  KEY `questionCategoryID_foreign` (`questionCategoryID`),
  KEY `teacherID_foreign` (`teacherID`),
  CONSTRAINT `questionCategoryID_foreign` FOREIGN KEY (`questionCategoryID`) REFERENCES `question_category` (`questionCategoryID`),
  CONSTRAINT `teacherID_foreign` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=1000025 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1000000', '1', '11', '一个完整的计算机系统包括', '1', 'C', '', '2018-12-04 21:08:52', '0', '5', '0', '0', '1', '1000020');
INSERT INTO `question` VALUES ('1000001', '2', '3', '下面说法错误的是', '0', 'BCD', 'A：数组是一个对象，其内存分配在堆内。基本类型内存分配在栈内。 \r\nB：所谓的原生类，也称基本数据类型或内置对象。显然数组属于引用数据类型。 \r\nC：写法错误。 \r\nD：数组的定义是：相同类型，固定长度的一组数据，一旦被初始化，长度不可更改。', '2018-12-30 15:25:07', '0', '10', '0', '0', '2', '1000020');
INSERT INTO `question` VALUES ('1000002', '3', '3', '在类方法中可用this来调用本类的类方法。', '0', '0', '所谓的类方法就是静态方法，super和this都指向的是父类和本类的对象，而在类方法中调用的时候，\r\n这些指代的对象有可能都还没有创建。静态方法是用类方法名.方法名称调用。', '2018-12-30 15:26:32', '0', '15', '0', '0', '3', '1000020');
INSERT INTO `question` VALUES ('1000003', '4', '3', 'java是面向____1____的编程语言', '0', '1', '', '2018-12-30 15:36:16', '0', '10', '0', '0', '2', '1000020');
INSERT INTO `question` VALUES ('1000004', '5', '1', '说出ArrayList,Vector, LinkedList的存储性能和特性', '0', 'ArrayList 和Vector都是使用数组方式存储数据，此数组元素数大于实际存储的数据以便增加和插入元素，它们都允许直接按序号索引元素，但是插入元素要涉及数组元素移动等内存操作，所以索引数据快而插入数据慢，Vector由于使用了synchronized方法（线程安全），通常性能上较ArrayList差，而LinkedList使用双向链表实现存储，按序号索引数据需要进行前向或后向遍历，但是插入数据时只需要记录本项的前后项即可，所以插入速度较快。', '', '2018-12-30 15:37:21', '0', '10', '0', '0', '1', '1000020');
INSERT INTO `question` VALUES ('1000005', '1', '6', '设一组初始记录关键字序列为(13，18，24，35，47，50，62，83，90，115，134),则利用二分法查找关键字90需要比较的关键字个数为（ ）。\r\n', '0', 'B', '', '2018-12-30 15:44:11', '0', '10', '0', '0', '2', '1000020');
INSERT INTO `question` VALUES ('1000006', '1', '6', '设指针变量top指向当前链式栈的栈顶，则删除栈顶元素的操作序列为（ ）。\r\n', '0', 'D', '', '2018-12-30 15:44:52', '0', '15', '0', '0', '3', '1000020');
INSERT INTO `question` VALUES ('1000007', '1', '6', '字符串的长度是指（ ）。', '0', 'C', '', '2018-12-30 15:45:24', '0', '5', '0', '0', '1', '1000020');
INSERT INTO `question` VALUES ('1000008', '1', '6', '两个字符串相等的充要条件是（ ）。\r\n', '0', 'C', '', '2018-12-30 15:45:59', '0', '5', '0', '0', '1', '1000020');
INSERT INTO `question` VALUES ('1000009', '1', '6', '设某散列表的长度为100，散列函数H(k)=k % P，则P通常情况下最好选择（ ）。', '0', 'B', '', '2018-12-30 15:46:27', '0', '5', '0', '0', '1', '1000020');
INSERT INTO `question` VALUES ('1000010', '1', '6', '设一个顺序有序表A[1:14]中有14个元素，则采用二分法查找元素A[4]的过程中比较元素的顺序为（ ）。', '0', 'C', '', '2018-12-30 15:46:56', '0', '20', '0', '0', '4', '1000020');
INSERT INTO `question` VALUES ('1000011', '1', '6', '设一棵完全二叉树中有65个结点，则该完全二叉树的深度为（ ）。\r\n', '0', 'B', '', '2018-12-30 15:47:28', '0', '10', '0', '0', '2', '1000020');
INSERT INTO `question` VALUES ('1000012', '1', '6', '设一棵三叉树中有2个度数为1的结点，2个度数为2的结点，2个度数为3的结点，则该三叉链权中有（ ）个度数为0的结点。', '0', 'C', '', '2018-12-30 15:47:51', '0', '10', '0', '0', '2', '1000020');
INSERT INTO `question` VALUES ('1000013', '1', '6', '设无向图G中的边的集合E={(a，b)，(a，e)，(a，c)，(b，e)，(e，d)，(d，f)，(f，c)}，则从顶点a出发进行深度优先遍历可以得到的一种顶点序列为（ ）。', '0', 'A', '', '2018-12-30 15:48:16', '0', '10', '0', '0', '2', '1000020');
INSERT INTO `question` VALUES ('1000014', '1', '6', '队列是一种（ ）的线性表。\r\n', '0', 'A', '', '2018-12-30 15:48:44', '0', '5', '0', '0', '1', '1000020');
INSERT INTO `question` VALUES ('1000015', '1', '6', '下列各种排序算法中平均时间复杂度为O(n<sup>2</sup>)是（ ）。', '0', 'D', '', '2018-12-30 15:49:10', '0', '10', '0', '0', '2', '1000020');
INSERT INTO `question` VALUES ('1000016', '2', '3', '下面说法错误的是', '0', 'BCD', 'A：main是主函数，是程序执行的起始点。没有main函数会报错不能编译执行。 \r\nB：J2SDK是java开发环境包，包括了JDK（开发工具包）和JRE（运行环境包）。而API是Application Programming Interface，是应用程序编程接口，两者不是一个东西。\r\nC：这个楼楼真的没搞懂，欢迎懂得大佬来踢馆。 \r\nD：Applet只要继承Applet类就行了,不需要main()方法。', '2018-12-30 15:51:59', '0', '15', '0', '0', '3', '1000020');
INSERT INTO `question` VALUES ('1000017', '2', '3', '下面说法正确的是', '0', 'BCD', 'A：环境变量不能再源编译的时候指定的，它的配置一般都是在系统环境变量中。 \r\nB：错误，可以设置classpath。 \r\nC：可以。 \r\nD：可以，在CDM中就能进行相应的操作。', '2018-12-30 15:53:18', '0', '10', '0', '0', '2', '1000020');
INSERT INTO `question` VALUES ('1000018', '2', '3', '不能用来修饰interface的有', '0', 'ACD', 'A：接口是为了让别人实现的，你私有化了，就和自身作用其冲突，所以错误。 \r\nB：正确。 \r\nC：接口为的是实现，所以你修饰protected了，别的类就无法实现了，错误。 \r\nD：interface是一个接口，也就是说它的方法全部都为空，只有方法名，没有方法体，如果定义成static，那么就能直接调用类来调用抽象方法，没有意义。故而规定interface不能用static修饰。', '2018-12-30 15:54:52', '0', '10', '0', '0', '2', '1000020');
INSERT INTO `question` VALUES ('1000019', '5', '3', 'sleep() 和 wait() 有什么区别?', '0', 'sleep()方法是使线程停止一段时间的方法。在sleep 时间间隔期满后，线程不一定立即恢复执行。这是因为在那个时刻，其它线程可能正在运行而且没有被调度为放弃执行，除非(a)“醒来”的线程具有更高的优先级；(b)正在运行的线程因为其它原因而阻塞。\r\nwait()是Object类的方法，线程交互时，如果线程对一个同步对象x发出一个wait()调用，该线程会暂停执行，被调对象进入等待状态，直到被唤醒或等待时间到。', '', '2018-12-30 15:55:31', '0', '25', '0', '0', '5', '1000020');
INSERT INTO `question` VALUES ('1000020', '5', '3', 'Overload和Override的区别。Overloaded的方法是否可以改变返回值的类型?', '0', '方法的重写Overriding和重载Overloading是Java多态性的不同表现。重写Overriding是父类与子类之间多态性的一种表现，重载Overloading是一个类中多态性的一种表现。如果在子类中定义某方法与其父类有相同的名称和参数，我们说该方法被重写 (Overriding)。子类的对象使用这个方法时，将调用子类中的定义，对它而言，父类中的定义如同被\"屏蔽\"了。如果在一个类中定义了多个同名的方法，它们或有不同的参数个数或有不同的参数类型，则称为方法的重载(Overloading)。Overloaded的方法是可以改变返回值的类型。', '', '2018-12-30 15:55:53', '0', '20', '0', '0', '4', '1000020');
INSERT INTO `question` VALUES ('1000021', '5', '3', 'String 和StringBuffer的区别', '0', 'JAVA平台提供了两个类：String和StringBuffer，它们可以储存和操作字符串，即包含多个字符的字符数据。这个String类提供了数值不可改变的字符串。而这个StringBuffer类提供的字符串进行修改。当你知道字符数据要改变的时候你就可以使用StringBuffer。典型地，你可以使用 StringBuffers来动态构造字符数据。', '', '2018-12-30 15:56:20', '0', '15', '0', '0', '3', '1000020');
INSERT INTO `question` VALUES ('1000022', '1', '11', '下列设备中，既可作为输入设备又可作为输出设备的是', '0', 'D', '', '2018-12-30 15:58:55', '0', '5', '0', '0', '1', '1000020');
INSERT INTO `question` VALUES ('1000023', '1', '11', '应用软件是指', '0', 'D', '', '2018-12-30 15:59:26', '0', '10', '0', '0', '2', '1000020');
INSERT INTO `question` VALUES ('1000024', '1', '11', '用晶体管作为电子器件制成的计算机属于', '0', 'B', '', '2018-12-30 15:59:53', '0', '10', '0', '0', '2', '1000020');

-- ----------------------------
-- Table structure for `question_answer_gapfilling_item`
-- ----------------------------
DROP TABLE IF EXISTS `question_answer_gapfilling_item`;
CREATE TABLE `question_answer_gapfilling_item` (
  `answerItemId` int(11) NOT NULL AUTO_INCREMENT,
  `userQuestionId` int(11) DEFAULT NULL,
  `itemIndex` int(11) DEFAULT NULL COMMENT '选项下标',
  `itemContent` text COMMENT '用户填空答题选项内容',
  `isRight` tinyint(4) DEFAULT '0' COMMENT '0错误，1正确',
  PRIMARY KEY (`answerItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_answer_gapfilling_item
-- ----------------------------

-- ----------------------------
-- Table structure for `question_answer_of_user`
-- ----------------------------
DROP TABLE IF EXISTS `question_answer_of_user`;
CREATE TABLE `question_answer_of_user` (
  `userQuestionIdstudentQuestionId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '答题用户Id：学生和老师',
  `userType` tinyint(4) DEFAULT '0' COMMENT '用户类型：0学生，1老师',
  `questionId` int(11) DEFAULT NULL COMMENT '问题Id',
  `userAnswer` text COMMENT '答案：填空题为所有答案拼串',
  `grade` double DEFAULT '0' COMMENT '用户得分',
  `isRight` tinyint(4) DEFAULT '0' COMMENT '是否正确：0错误，1正确',
  `answerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '答题时间',
  PRIMARY KEY (`userQuestionIdstudentQuestionId`),
  KEY `userQuestionAnswer_questionId_foreign` (`questionId`),
  CONSTRAINT `userQuestionAnswer_questionId_foreign` FOREIGN KEY (`questionId`) REFERENCES `question` (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_answer_of_user
-- ----------------------------
INSERT INTO `question_answer_of_user` VALUES ('1', '1000020', '1', '1000000', 'A', '0', '0', '2018-12-26 21:25:49');

-- ----------------------------
-- Table structure for `question_category`
-- ----------------------------
DROP TABLE IF EXISTS `question_category`;
CREATE TABLE `question_category` (
  `questionCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `questionCategoryName` varchar(50) DEFAULT NULL COMMENT '分类名',
  PRIMARY KEY (`questionCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_category
-- ----------------------------
INSERT INTO `question_category` VALUES ('1', 'C语言');
INSERT INTO `question_category` VALUES ('2', 'C++');
INSERT INTO `question_category` VALUES ('3', 'java');
INSERT INTO `question_category` VALUES ('4', 'VB');
INSERT INTO `question_category` VALUES ('5', 'VFB');
INSERT INTO `question_category` VALUES ('6', '数据结构');
INSERT INTO `question_category` VALUES ('7', '数据库原理');
INSERT INTO `question_category` VALUES ('8', '网络');
INSERT INTO `question_category` VALUES ('9', '软件工程');
INSERT INTO `question_category` VALUES ('10', '操作系统');
INSERT INTO `question_category` VALUES ('11', '应用基础');
INSERT INTO `question_category` VALUES ('12', '多媒体技术');
INSERT INTO `question_category` VALUES ('13', '硬件部分');
INSERT INTO `question_category` VALUES ('14', '移动互联应用');

-- ----------------------------
-- Table structure for `question_option`
-- ----------------------------
DROP TABLE IF EXISTS `question_option`;
CREATE TABLE `question_option` (
  `questionOptionId` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) DEFAULT NULL COMMENT '题目ID',
  `optionIndex` varchar(10) DEFAULT NULL COMMENT '选项脚标:选择题为：ABC（选项），填空题为！123（答案）',
  `optionContent` text COMMENT '选项内容',
  PRIMARY KEY (`questionOptionId`),
  KEY `questionId_foreign` (`questionId`),
  CONSTRAINT `questionId_foreign` FOREIGN KEY (`questionId`) REFERENCES `question` (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_option
-- ----------------------------
INSERT INTO `question_option` VALUES ('1', '1000000', 'A', '主机健盘与显示器');
INSERT INTO `question_option` VALUES ('2', '1000000', 'B', '计算机与外部设备');
INSERT INTO `question_option` VALUES ('3', '1000000', 'C', '硬件系统与软件系统');
INSERT INTO `question_option` VALUES ('4', '1000000', 'D', '系统软件与应用软件');
INSERT INTO `question_option` VALUES ('164', '1000001', 'A', '数组是一种对象。');
INSERT INTO `question_option` VALUES ('165', '1000001', 'B', '数组属于一种原生类。');
INSERT INTO `question_option` VALUES ('166', '1000001', 'C', 'int number=[]={31,23,33,43,35,63}。');
INSERT INTO `question_option` VALUES ('167', '1000001', 'D', '数组的大小可以任意改变。');
INSERT INTO `question_option` VALUES ('168', '1000003', '1', '对象');
INSERT INTO `question_option` VALUES ('169', '1000005', 'A', '1');
INSERT INTO `question_option` VALUES ('170', '1000005', 'B', '2');
INSERT INTO `question_option` VALUES ('171', '1000005', 'C', '3');
INSERT INTO `question_option` VALUES ('172', '1000005', 'D', '4');
INSERT INTO `question_option` VALUES ('173', '1000006', 'A', 'top=top+1');
INSERT INTO `question_option` VALUES ('174', '1000006', 'B', 'top=top-1');
INSERT INTO `question_option` VALUES ('175', '1000006', 'C', 'top->next=top');
INSERT INTO `question_option` VALUES ('176', '1000006', 'D', 'top=top->next');
INSERT INTO `question_option` VALUES ('177', '1000007', 'A', '串中不同字符的个数');
INSERT INTO `question_option` VALUES ('178', '1000007', 'B', '串中不同字母的个数');
INSERT INTO `question_option` VALUES ('179', '1000007', 'C', '串中所含字符的个数');
INSERT INTO `question_option` VALUES ('180', '1000007', 'D', '串中不同数字的个数');
INSERT INTO `question_option` VALUES ('181', '1000008', 'A', '两个字符串的长度相等');
INSERT INTO `question_option` VALUES ('182', '1000008', 'B', '两个字符串中对应位置上的字符相等');
INSERT INTO `question_option` VALUES ('183', '1000008', 'C', '同时具备(A)和(B)两个条件');
INSERT INTO `question_option` VALUES ('184', '1000008', 'D', '以上答案都不对');
INSERT INTO `question_option` VALUES ('185', '1000009', 'A', '99');
INSERT INTO `question_option` VALUES ('186', '1000009', 'B', '97');
INSERT INTO `question_option` VALUES ('187', '1000009', 'C', '91');
INSERT INTO `question_option` VALUES ('188', '1000009', 'D', '93');
INSERT INTO `question_option` VALUES ('189', '1000010', 'A', 'A[1]，A[2]，A[3]，A[4]');
INSERT INTO `question_option` VALUES ('190', '1000010', 'B', 'A[1]，A[14]，A[7]，A[4]');
INSERT INTO `question_option` VALUES ('191', '1000010', 'C', 'A[7]，A[3]，A[5]，A[4]');
INSERT INTO `question_option` VALUES ('192', '1000010', 'D', 'A[7]，A[5] ，A[3]，A[4]');
INSERT INTO `question_option` VALUES ('193', '1000011', 'A', '8');
INSERT INTO `question_option` VALUES ('194', '1000011', 'B', '7');
INSERT INTO `question_option` VALUES ('195', '1000011', 'C', '6');
INSERT INTO `question_option` VALUES ('196', '1000011', 'D', '5');
INSERT INTO `question_option` VALUES ('197', '1000012', 'A', '5');
INSERT INTO `question_option` VALUES ('198', '1000012', 'B', '6');
INSERT INTO `question_option` VALUES ('199', '1000012', 'C', '7');
INSERT INTO `question_option` VALUES ('200', '1000012', 'D', '8');
INSERT INTO `question_option` VALUES ('201', '1000013', 'A', 'aedfcb');
INSERT INTO `question_option` VALUES ('202', '1000013', 'B', 'acfebd');
INSERT INTO `question_option` VALUES ('203', '1000013', 'C', 'aebcfd');
INSERT INTO `question_option` VALUES ('204', '1000013', 'D', 'aedfbc');
INSERT INTO `question_option` VALUES ('205', '1000014', 'A', '先进先出');
INSERT INTO `question_option` VALUES ('206', '1000014', 'B', '先进后出');
INSERT INTO `question_option` VALUES ('207', '1000014', 'C', '只能插入');
INSERT INTO `question_option` VALUES ('208', '1000014', 'D', '只能删除');
INSERT INTO `question_option` VALUES ('209', '1000015', 'A', '快速排序');
INSERT INTO `question_option` VALUES ('210', '1000015', 'B', '堆排序');
INSERT INTO `question_option` VALUES ('211', '1000015', 'C', '归并排序');
INSERT INTO `question_option` VALUES ('212', '1000015', 'D', '冒泡排序');
INSERT INTO `question_option` VALUES ('213', '1000016', 'A', '能被java.exe成功运行的java class文件必须有mian（）方法。');
INSERT INTO `question_option` VALUES ('214', '1000016', 'B', 'J2SDK就是Java API。');
INSERT INTO `question_option` VALUES ('215', '1000016', 'C', 'Appletviewer.exe可利用jar选项运行.jar文件。');
INSERT INTO `question_option` VALUES ('216', '1000016', 'D', '能被Appletviewer成功运行的java class文件必须有main方法。');
INSERT INTO `question_option` VALUES ('217', '1000017', 'A', '环境变量可在编译source code（源编译）时指定。');
INSERT INTO `question_option` VALUES ('218', '1000017', 'B', '在编译程序时，所能指定的环境变量不包括classpath。');
INSERT INTO `question_option` VALUES ('219', '1000017', 'C', 'javac一次可同时编译数个Java源文件。');
INSERT INTO `question_option` VALUES ('220', '1000017', 'D', 'javac.exe能指定编译结果要置于哪个directory（目录）');
INSERT INTO `question_option` VALUES ('221', '1000018', 'A', 'private');
INSERT INTO `question_option` VALUES ('222', '1000018', 'B', 'public');
INSERT INTO `question_option` VALUES ('223', '1000018', 'C', 'protected');
INSERT INTO `question_option` VALUES ('224', '1000018', 'D', 'static');
INSERT INTO `question_option` VALUES ('225', '1000022', 'A', '鼠标器');
INSERT INTO `question_option` VALUES ('226', '1000022', 'B', '打印机');
INSERT INTO `question_option` VALUES ('227', '1000022', 'C', '键盘');
INSERT INTO `question_option` VALUES ('228', '1000022', 'D', '磁盘驱动器');
INSERT INTO `question_option` VALUES ('229', '1000023', 'A', '所有能够使用的软件');
INSERT INTO `question_option` VALUES ('230', '1000023', 'B', '能被各应用单位共同使用的某种软件');
INSERT INTO `question_option` VALUES ('231', '1000023', 'C', '所有微机上都应使用的基本软件');
INSERT INTO `question_option` VALUES ('232', '1000023', 'D', '专门为某一应用目的而编制的软件');
INSERT INTO `question_option` VALUES ('233', '1000024', 'A', '第一代');
INSERT INTO `question_option` VALUES ('234', '1000024', 'B', '第二代');
INSERT INTO `question_option` VALUES ('235', '1000024', 'C', '第三代');
INSERT INTO `question_option` VALUES ('236', '1000024', 'D', '第四代');

-- ----------------------------
-- Table structure for `rootuser`
-- ----------------------------
DROP TABLE IF EXISTS `rootuser`;
CREATE TABLE `rootuser` (
  `rootUserId` int(11) NOT NULL AUTO_INCREMENT,
  `rootUserName` varchar(50) DEFAULT NULL COMMENT 'root用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '用户密码',
  `status` tinyint(1) DEFAULT '1' COMMENT '0表示root用户，1表示临时管理员',
  PRIMARY KEY (`rootUserId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rootuser
-- ----------------------------
INSERT INTO `rootuser` VALUES ('1', 'root', 'root', '1');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentId` int(11) NOT NULL AUTO_INCREMENT,
  `userType` tinyint(1) DEFAULT '0' COMMENT '0学生 1老师',
  `userName` varchar(50) DEFAULT NULL COMMENT '用户名、登录名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `realName` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱：用于激活用户，修改密码',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `myTeacherId` int(11) DEFAULT NULL COMMENT '指导老师Id',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别：1男 0女',
  `signature` text COMMENT '个性签名',
  `headImage` varchar(100) DEFAULT NULL COMMENT '头像图片地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '用户是否通过邮箱激活，0未激活，1激活',
  `code` varchar(50) DEFAULT NULL COMMENT '激活状态码',
  `registerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册日期',
  `isLock` tinyint(1) DEFAULT '0' COMMENT '是否锁定 0未锁定 1锁定',
  PRIMARY KEY (`studentId`,`gender`),
  KEY `userType_foreign` (`userType`)
) ENGINE=InnoDB AUTO_INCREMENT=1000007 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1000000', '0', 'test', '123456', '汤唯', '154872654@qq.com', '2018-12-03', '15975345682', '1000020', '0', '失败是成功之母', null, '1', '02633116-654f-4922-b9f8-77e3735ce094', '2018-12-02 18:38:56', '0');
INSERT INTO `student` VALUES ('1000001', '0', 'lucy', '123456', '露西', 'guanyi6540628@163.com', '2011-01-04', '110120119117', '1000020', '0', '心声不能抵达怎么付出都是偏差', 'headImg/6e997191-5464-4aad-b583-6c931da9793c.jpg', '1', '7023dad3-092f-433f-8ae5-51cf731036d7', '2018-12-06 16:25:42', '0');
INSERT INTO `student` VALUES ('1000004', '0', 'lalala', '123456', '金三少', 'gdxhb3582@33sn.cc', '2018-12-08', '14785235742', '1000020', '1', '能力不在于你拥有什么，而在于你能给予什么。', null, '1', '034a3967-0b34-487a-ab92-5a62252b8b33', '2018-12-06 16:25:47', '0');
INSERT INTO `student` VALUES ('1000005', '0', 'nice', '123456', '方媛', 'cqjpw21512@33sn.cc', '1997-04-01', '11478532477', '1000020', '0', '无规矩，不成方圆', null, '1', '8bf58871-af7b-4ce8-a495-4fde54d8efab', '2018-12-13 23:50:09', '0');
INSERT INTO `student` VALUES ('1000006', '0', 'qwwe', '123456', 'asdsa', '2994413619@qq.com', '2018-12-01', '15975324589', '1000000', '1', 'sdfjksfjld', null, '1', '187cf709-7ec3-4fcf-86c0-fd8370cd7dc4', '2018-12-28 14:04:36', '0');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacherId` int(11) NOT NULL AUTO_INCREMENT,
  `userType` tinyint(1) DEFAULT '1' COMMENT '用户类型：0学生 1老师',
  `userName` varchar(50) DEFAULT NULL COMMENT '用户名、登录名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `realName` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱：用户激活用户和修改密码',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `gender` tinyint(1) DEFAULT '0' COMMENT '性别性别：1男 0女',
  `signature` text COMMENT '个性签名',
  `headImage` varchar(1000) DEFAULT NULL COMMENT '头像图片地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '用户是否通过邮箱激活，0未激活，1激活',
  `code` varchar(50) DEFAULT NULL COMMENT '激活状态码',
  `rootPermit` tinyint(1) DEFAULT '0' COMMENT 'root用户审核： 0未通过 1通过',
  `registerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册日期',
  `isLock` tinyint(1) DEFAULT '0' COMMENT '是否锁定 0未锁定 1锁定',
  PRIMARY KEY (`teacherId`),
  KEY `userTypeId_foreign` (`userType`)
) ENGINE=InnoDB AUTO_INCREMENT=1000022 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1000000', '1', 'tang', '123456', '唐', 'tang@tang.tang', '2000-01-04', '15479368412', '0', 'As time goes by ,you will grow to like him.\r\n随着时间的流逝，你会逐渐喜欢上他。', null, '1', 'asdfasdfas asdfassdf asdfasd', '0', '2018-12-19 00:08:29', '0');
INSERT INTO `teacher` VALUES ('1000009', '1', 'yanghuan', '123456', '杨欢', '159753@123.159', '2018-12-13', '15975345618', '0', '一生不喜与人抢', null, '1', '0c8cf1b3-db6b-46a4-a19b-1f9ebaa55f87', '0', '2018-12-02 00:06:54', '0');
INSERT INTO `teacher` VALUES ('1000010', '1', 'tom', '123456', '上官如', 'xi41634833n@163.com', '1984-01-03', '15975345615', '0', '一个人一生只有一次把自己全部信任给一个人，而我把这个机会给了你', null, '1', 'f78ba8e1-2dee-40d6-b2a5-7d77a5dc24d5', '0', '2018-12-02 14:11:52', '0');
INSERT INTO `teacher` VALUES ('1000016', '1', 'jack', '123456', '铁寒风', 'xi41634833n@163.com', '2018-12-01', '15974123655', '1', '海有舟可渡 山有路可行', null, '1', '960a9747-9672-49ee-b160-8bb420aad112', '0', '2018-12-02 15:28:24', '0');
INSERT INTO `teacher` VALUES ('1000017', '1', 'lucy', '123456', '铁寒风', 'xi41634833n@163.com', '2018-12-12', '15978454732', '1', '海有舟可渡 山有路可行', null, '1', '02633116-654f-4922-b9f8-77e3735ce094', '0', '2018-12-02 15:30:22', '0');
INSERT INTO `teacher` VALUES ('1000018', '1', 'aliang', '123456', '阿良', 'xi41634833n@163.com', '2018-12-22', '14753211475', '1', '“很遗憾吧，那么喜欢连张合影都没有” ​​​ “唯一的一张也只是毕业照 ”', null, '1', '6321feec-6e4d-47e8-b0b8-e3ca2f8af226', '0', '2018-12-02 15:42:29', '0');
INSERT INTO `teacher` VALUES ('1000019', '1', 'abc', '123456', '罗凤', 'xi41634833n@163.com', '2018-12-16', '15975345685', '0', '总不能还没有努力就向生活妥协', null, '1', 'c853e167-1445-4cc7-b269-766c96c55c7b', '0', '2018-12-02 17:13:48', '0');
INSERT INTO `teacher` VALUES ('1000020', '1', 'ddd', '123456', '李二', 'cqjpw21512@33sn.cc', '2016-02-10', '14524785361', '1', '我之所以逗比是为了逗我在乎的人开心！', 'headImg/8d2c8b85-23c6-4800-97d9-ceb8793ad1b3.jpg', '1', 'c9fe6db9-8ff1-4635-a967-c564febd7838', '0', '2018-12-06 15:09:26', '0');
INSERT INTO `teacher` VALUES ('1000021', '1', 'xxx', '123456', '汪琬', 'gdxhb3582@33sn.cc', '1998-05-11', '15975412847', '1', '我最美', null, '1', 'cf3c4466-cd3d-4ece-9396-df2290b6af20', '0', '2018-12-13 23:37:07', '0');

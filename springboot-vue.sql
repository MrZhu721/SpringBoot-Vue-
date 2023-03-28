/*
 Navicat Premium Data Transfer

 Source Server         : onlindb
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : springboot-vue

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 28/03/2023 13:51:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '出版日期',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '黑马程序员', 68.00, '传智播客', '2020-12-27 00:00:00', 'http://localhost:9090/files/cbd2e07f-149a-40ca-9798-412a270e49a0');
INSERT INTO `book` VALUES (2, '明朝那些事', 199.88, '刘墉', '2017-05-17 00:00:00', 'http://localhost:9090/files/55bf8edd-6967-49ec-8708-e0550c2ab00c');
INSERT INTO `book` VALUES (3, '中国政治五千年', 120.00, '吕思勉', '2017-02-09 00:00:00', 'http://localhost:9090/files/3d2051bd-67e2-4371-a9e5-4c2a1b02744c');
INSERT INTO `book` VALUES (4, '南怀瑾著作全集', 300.00, '南怀瑾', '2006-04-06 00:00:00', 'http://localhost:9090/files/bc49c35b-1942-4137-a9cc-7bd83ddf01a4');
INSERT INTO `book` VALUES (5, '汉朝那些事', 180.00, '飘雪楼主', '2016-02-11 00:00:00', 'http://localhost:9090/files/672dfe26-65c6-43b6-ae1d-42a7c8405816');
INSERT INTO `book` VALUES (6, '资治通鉴', 230.00, '司马光', '2004-06-01 00:00:00', 'http://localhost:9090/files/14a67383-9b2c-4a11-8df9-982d6e107439');
INSERT INTO `book` VALUES (7, '中国近代史', 20.70, '蒋廷黻', '2017-09-01 00:00:00', 'http://localhost:9090/files/a668befe-fb3e-41c5-9e6e-070ddef4ebce');
INSERT INTO `book` VALUES (8, '万历十五年', 52.70, '黄仁宇', '2007-07-16 00:00:00', 'http://localhost:9090/files/2fed1538-235e-44e2-b8a5-d98ff59e56f0');
INSERT INTO `book` VALUES (9, '人间草木', 15.40, '汪曾祺', '2018-06-28 00:00:00', 'http://localhost:9090/files/ea80f6af-f764-493f-933f-d39ec6f4106c');
INSERT INTO `book` VALUES (10, '茶馆', 11.80, '老舍', '2019-09-03 00:00:00', 'http://localhost:9090/files/1932eede-958f-49f7-9560-23c06b7af0a4');
INSERT INTO `book` VALUES (11, '浮生六记', 13.50, '沈复', '2019-07-02 00:00:00', 'http://localhost:9090/files/aca6499b-5e59-4a95-a44f-e9a1cb21a1ae');

-- ----------------------------
-- Table structure for bookshelf
-- ----------------------------
DROP TABLE IF EXISTS `bookshelf`;
CREATE TABLE `bookshelf`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `b_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '书名',
  `b_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `b_author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `b_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `u_id` int(10) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `u_id`(`u_id`) USING BTREE,
  CONSTRAINT `bookshelf_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookshelf
-- ----------------------------
INSERT INTO `bookshelf` VALUES (12, '中国政治五千年', 120.00, '吕思勉', 'http://localhost:9090/files/3d2051bd-67e2-4371-a9e5-4c2a1b02744c', 1);
INSERT INTO `bookshelf` VALUES (20, '黑马程序员', 68.00, '传智播客', 'http://localhost:9090/files/cbd2e07f-149a-40ca-9798-412a270e49a0', 1);
INSERT INTO `bookshelf` VALUES (21, '汉朝那些事', 180.00, '飘雪楼主', 'http://localhost:9090/files/672dfe26-65c6-43b6-ae1d-42a7c8405816', 1);
INSERT INTO `bookshelf` VALUES (22, '南怀瑾著作全集', 300.00, '南怀瑾', 'http://localhost:9090/files/bc49c35b-1942-4137-a9cc-7bd83ddf01a4', 1);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '车市连续11个月下滑：自主份额创新低，新能源增长刹车', '<p style=\"text-indent: 0px; text-align: start; line-height: 39px;\"><strong>新京报讯（记者&nbsp;王琳琳）</strong>日前，中国汽车工业协会（简称“中汽协”）披露的5月国内汽车市场的销量数据情况显示，5月国内汽车市场销量为191.3万辆，与去年同期相比下降16.4%，同比降幅与上月相比扩大1.8%。<br></p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">中汽协表示，前五个月汽车产销仍处于低位运行的状态，下半年随着符合国六标准的车型不断增加，以及减税降费等一系列政策措施效果的持续显现，将会对中国汽车市场的发展释放积极的信号。</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\"><span style=\"font-size: 19px;\"><strong>车市连续11个月下滑</strong></span></p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">中汽协公布的数据显示，5月国内汽车累计产量为184.83万辆，与去年同期相比下降21.2%，同比降幅比上月扩大6.7%；5月国内汽车市场的累计销量为191.3万辆，与去年同期相比下降16.4%，同比降幅与上月相比扩大1.8%，产销同比降幅都有所扩大。1-5月，国内汽车市场产销分别完成1023.7万辆和1026.6万辆，产销量比上年同期相比均下降13%，降幅比1-4月分别扩大2个百分点和0.8个百分点。</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\"><br></p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">根据中汽协公布的数据，乘用车市场的产销量降幅仍大于整体汽车市场产销量的降幅。5月乘用车市场的产销量分别为149.1万辆和156.1万辆，环比分别下降10.2%和0.9%，与去年同期相比分别下降23.7%和17.4%。2019年1-5月，乘用车市场的累计产销量分别为837.9万辆和839.9万辆，与去年同期相比分别下滑15.6%和15.2%。</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">从乘用车四类型车市场的产销情况来看，1-5月，轿车细分市场的产销比去年同期分别下降13.1%和13.4%；SUV产销比上年同期分别下降17.9%和15.7%；MPV产销比上年同期分别下降21.1%和23.9%；交叉型乘用车产销量比上年同期分别下降0.1%和13.1%。</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">全国乘用车市场信息联席会秘书长崔东树表示，“受国五、国六切换的影响，多数消费者处于观望状态，即便是车企的促销活动五花八门，但并没有起到相应的预期效果，潜在消费者变得更为谨慎。”</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\"><span style=\"font-size: 19px;\"><strong>自主品牌市场份额持续失守</strong></span></p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">截至目前，有12家车企公布了5月的产销数据。从各车企的销量情况来看，只有江淮汽车实现了11.46%的同比增长，5月销量为3.91万辆；上汽集团、广汽集团、长安汽车、吉利汽车、北汽新能源等其余11家车企5月销量均处于下滑态势。</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">合资板块中，除日系合资品牌外，其余合资品牌均呈现下滑趋势；其中法系合资品牌跌幅较大，神龙汽车5月销量仅为8698辆，同比下跌67%；东风雷诺5月的销量跌至1008辆。日系品牌中东风本田、广汽本田、广汽丰田和一汽丰田5月的销量实现了同比增长，虽然东风日产5月销量未实现同比增长，但跌幅较低，仅为0.84%。</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">在豪华车市场，二线豪华车品牌的销量高歌猛进，雷克萨斯、凯迪拉克和沃尔沃等品牌都实现了正增长，雷克萨斯5月销量更是猛增150%至1.7万辆。但也有豪华车品牌出现销量下滑，BBA阵营中奥迪品牌5月销量下滑7.4%。</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">另外，从自主品牌5月的表现来看，其市场份额持续失守，创3年以来新低。中汽协数据显示，5月自主品牌汽车的累计销量为56.5万辆，同比下滑28.1%，市场份额为36.2%，与去年同期相比下降5.4%。前五个月，自主品牌的累计销量为333.5万辆，同比下滑23.4%，市场份额为39.7%，较去年同期相比下降4.2%。</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">崔东树表示，“当国内汽车市场环境好的时候，自主品牌的表现也会跟着好；但车市下行的时候，车企比拼的是品质和核心竞争力，自主品牌的不足就暴露出来了。”</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\"><span style=\"font-size: 19px;\"><strong>新能源汽车销量增速放缓</strong></span></p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">5月在国内整体汽车市场下滑的大环境下，新能源汽车依旧呈现逆势增长。中汽协数据显示，新能源汽车产销分别为11.2万辆和10.4万辆，比上年同期分别增长16.9%和1.8%；2019年1-5月，新能源汽车产销分别为48.0万辆和46.4万辆，比上年同期分别增长46.0%和41.5%。</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">中国汽车协会副秘书长师建华分析称，“一方面是政策原因，补贴退坡导致消费者将购买力集中在前几个月，随着补贴退坡，部分车型出现涨价的情况，影响了消费者的购买决策；另一方面，当下处于国五国六的切换期，为清库存，车企和经销商对国五车型进行促销，国五车型价格走低，部分想要购买新能源汽车的消费者转而购买国五车型。”</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">不仅如此，也有业内人士认为，5月新能源汽车销量增速放缓也与新能源商用车的销量减少有关，由于补贴退坡，销量提前释放，导致5月的销量降低。</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\"><span style=\"font-size: 19px;\"><strong>刺激政策出台，疲势下半年有望舒缓</strong></span></p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">业内分析称，部分省市7月1日起将开始实施国六排放标准，6月国内汽车市场将处于深度调整期，车企和经销商会加速释放国五库存的压力，在此环境下6月的汽车市场销量或有所回暖。</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">不仅如此，为了挽救汽车市场颓势，国家层面也出台了相应的刺激政策。2月发改委联合十部委重启“汽车下乡”政策，以带动农村汽车市场的消费升级；但目前来看，由于乡镇市场10万元级别的市场相对饱和，“汽车下乡”的效果有限。</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">6月初，广州和深圳两市同时发布增加小汽车牌照限额的通知，在2019年6月-2020年12月期间，广州和深圳分别新增10万辆和8万辆。6月6日，发改委等三部委下发《推动重点消费品更新升级畅通资源循环利用实施方案（2019-2020年）》，要求破除乘用车消费障碍，严禁各地出台新的汽车限购规定，不再增加限购城市，从限制购买转向引导使用；此外要求各地不得对新能源汽车实行限行、限购，已实行的应当取消，为乘用车市场带来相对积极的作用，也将进一步促进新能源汽车产销增长。</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">&nbsp;</p><p style=\"text-indent: 0px; text-align: start; line-height: 39px;\">业内人士分析称，国家刺激政策的出台，或将改变汽车市场连续下滑的颓势，但回暖仍需要一段时日。</p>', NULL, '2022-06-19 11:58:17');
INSERT INTO `news` VALUES (2, '注意了！这类港澳通行证全部停止续签，你手上有吗？', '<p style=\"text-indent: 0px; text-align: center;\"><span style=\"font-size: 16px;\">注意了！注意了！</span></p><p style=\"text-indent: 0px; text-align: center;\"><span style=\"font-size: 16px;\">最近打算去香港、澳门的广州街坊，</span></p><p style=\"text-indent: 0px; text-align: center;\"><span style=\"font-size: 16px;\">赶紧检查一下手上的港澳通行证。</span></p><p style=\"text-indent: 0px; text-align: center;\"><span style=\"font-size: 16px;\">如果现在还使用“本式港澳通行证”的</span></p><p style=\"text-indent: 0px; text-align: center;\"><span style=\"font-size: 16px;\">就要注意了！</span></p><p style=\"text-indent: 0px; text-align: center;\"><span style=\"font-size: 16px;\">因为本式往来港澳通行证</span></p><p style=\"text-indent: 0px; text-align: center;\"><span style=\"font-size: 16px;\">办理续签已经全部到期了！</span></p><p style=\"text-indent: 0px; text-align: left;\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20190613/f24fa02c98504349acfd693411ae8894.jpeg\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-indent: 0px; text-align: left;\"><span style=\"font-size: 16px;\"><strong>本式通行证，还有3个月失效</strong></span></p><p style=\"text-indent: 0px; text-align: left;\"><span style=\"font-size: 16px;\">根据公安出入境部门消息，现用的本式往来港澳通行证将于2019年9月13日全部失效。办理港澳签注的时候，证件的有效期必须要有3个月20天以上。因此，现在市民手上持有的本式通行证，已经全部不能办理续签！</span></p><p style=\"text-indent: 0px; text-align: center;\"><span style=\"font-size: 16px;\">所以如果你的证件还是本式的，</span></p><p style=\"text-indent: 0px; text-align: center;\"><span style=\"font-size: 16px;\"><strong>请抓紧时间去换成</strong></span></p><p style=\"text-indent: 0px; text-align: center;\"><span style=\"font-size: 16px;\"><strong>“电子式往来港澳通行证（卡式）”</strong></span></p><p style=\"text-indent: 0px; text-align: center;\"><span style=\"font-size: 16px;\">以免影响行程啦！</span></p><p style=\"text-indent: 0px; text-align: left;\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20190613/494de1de78a844d991be539cf5460c4f.jpeg\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p>', '伴', '2022-06-19 11:59:09');
INSERT INTO `news` VALUES (3, '羽球名将李宗伟宣布退役 癌症痊愈仍难再回赛场', '<p>再见，李宗伟！</p><p>李宗伟宣布退役</p><p style=\"text-indent: 0px; text-align: start;\">　　北京时间6月13日消息，马来西亚羽毛球名将李宗伟在布城青年体育部召开新闻发布会，宣布自己正式退役，放弃冲击东京奥运会资格，结束职业生涯。</p><p style=\"text-indent: 0px; text-align: start;\">　　李宗伟在去年9月传出罹患鼻癌的消息，此后他一直接受治疗，11月8日，李宗伟召开新闻发布会，宣布不会因鼻咽癌而提前退役。经过超过三个月的治疗之后，他表示自己已经开始恢复训练，将会尽快回到赛场，但何时正式复出要看身体状况。</p><p style=\"text-indent: 0px; text-align: start;\">　　今年1月初，李宗伟在马来西亚羽毛球国家队训练基地进行训练，这是他自去年查出患有鼻癌后首次进行场地训练。此后他一直进行着康复+训练的模式，不过由于身体迟迟没能达到复出水准，他也一再推迟重回赛场的日程，先后缺席了马来西亚赛、苏迪曼杯。</p>', '伴', '2022-06-19 12:00:09');
INSERT INTO `news` VALUES (4, 'Uber准备用无人机在美国送外卖：今夏从圣迭戈开始', '<p style=\"text-indent: 0px; text-align: justify; line-height: 30px;\">北京时间6月13日上午消息，据美国科技媒体VentureBeat报道，美国联邦航空局（FAA）挑选10个城市测试商务无人机服务，而Uber积极参与，如果获得监管机构的批准，今年夏天它准备在圣迭戈（San&nbsp;Diego）投放无人机机群，给市民送餐饮外卖。</p><p style=\"text-indent: 0px; text-align: justify; line-height: 30px;\">整个项目由公司空中研发团队Uber&nbsp;Elevate负责。在年初的测试中，无人机将麦当劳快餐送到最远半英里的地方。5月份，圣迭戈餐馆Juniper&nbsp;&amp;&nbsp;Ivy加入项目，不过无人机目前还没有配送过它的餐食。</p><p style=\"text-indent: 0px; text-align: justify; line-height: 30px;\">Uber表示，无人机机群将会飞往指定降落区，所有食品存放在专门设计的容器内，投递员将会捡起包裹。另外，如果Uber汽车车顶绘有二维码，无人机可以通过识别二维码停在车顶，汽车再将餐食送到最终目的地。</p><p style=\"text-indent: 0px; text-align: justify; line-height: 30px;\">Uber透露，如果通过地面交通运输系统完成配送，1.5英里（约2.4公里）平均需要21分钟；用无人机配送只要大约7分钟。未来如果部署更强的无人机，时速最高可达70英里（约113公里），配送时间能进一步缩短。最开始时，用无人机配送食品的价格和Uber&nbsp;Eats服务差不多，在圣迭戈最高不超过8.5美元。</p>', '伴', '2022-07-05 01:03:40');
INSERT INTO `news` VALUES (5, '系统维护通知', '<p style=\"text-indent: 0px; text-align: start; line-height: 1.8;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">尊敬的各位书友：</span></p><p style=\"text-indent: 0px; text-align: start; line-height: 1.8;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">&nbsp;</span></p><p style=\"text-indent: 0px; text-align: start; line-height: 1.8;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为了提高系统稳定性，更好的优化您的用户体验，预计在2022年6月25日&nbsp;00:30--06:00进行系统升级维护，&nbsp;届时登录、书籍、购买等相关业务可能服务异常。待维护完成之后，即可正常办理此类业务。</span></p><p style=\"text-indent: 0px; text-align: start; line-height: 1.8;\"><br></p><p style=\"text-indent: 0px; text-align: start; line-height: 1.8;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请您避免在以上时间段办理此类业务，以免对您的生活造成不便。</span></p><p style=\"text-indent: 0px; text-align: start; line-height: 1.8;\"><br></p><p style=\"text-indent: 0px; text-align: start; line-height: 1.8;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;感谢您的理解，我们将一如既往地竭诚为您服务！</span></p>', '管理员', '2022-07-07 08:24:07');
INSERT INTO `news` VALUES (9, '系统维护升级', '<p style=\"text-indent: 0px; text-align: start; line-height: 1.8;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">尊敬的各位书友：</span></p><p style=\"text-indent: 0px; text-align: start; line-height: 1.8;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为了更好的优化您的用户体验，预计在2022年7月9日&nbsp;00:30--06:00进行系统升级维护，&nbsp;届时登录、书籍、购买等相关业务可能服务异常。待维护完成之后，即可正常办理此类业务，祝你使用愉快。</span></p><p style=\"text-indent: 0px; text-align: start; line-height: 1.8;\"><br></p><p style=\"text-indent: 0px; text-align: start; line-height: 1.8;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请您避免在以上时间段办理此类业务，以免对您的生活造成不便。</span></p><p style=\"text-indent: 0px; text-align: start; line-height: 1.8;\"><br></p><p style=\"text-indent: 0px; text-align: start; line-height: 1.8;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;感谢您的理解，我们将一如既往地竭诚为您服务！</span></p>', '管理员', '2022-07-13 00:56:21');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `role` int(11) NULL DEFAULT NULL COMMENT '权限管理 ：1.管理员，2.普通用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zhangsan', '123', '游客', 14, '女', '长沙市', 2);
INSERT INTO `user` VALUES (2, 'lucy', '123', '	\r\n游客', 16, '女', '长沙市', 2);
INSERT INTO `user` VALUES (3, '伴', '123456', '管理员', 20, '男', '长沙市', 1);
INSERT INTO `user` VALUES (4, 'admin', '123456', '管理员', 17, '男', '广州市', 1);
INSERT INTO `user` VALUES (5, 'wangwu', '123', '	\r\n游客', 43, '男', '上海市', 2);
INSERT INTO `user` VALUES (6, 'zhaoliu', '123', '	\r\n游客', 23, '男', '深圳市', 2);
INSERT INTO `user` VALUES (7, 'jiuqi', '12345', '游客', NULL, NULL, '长沙市', 2);
INSERT INTO `user` VALUES (8, 'lining', '12345', '游客', NULL, NULL, '长沙市', 2);

SET FOREIGN_KEY_CHECKS = 1;

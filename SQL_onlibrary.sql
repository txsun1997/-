
/********************************
一、创建数据库onlibrary
********************************/

USE master
GO
DROP DATABASE onlibrary
CREATE DATABASE onlibrary
ON 
( NAME = onlibrary_dat,
    FILENAME = 'E:\SE_work\database\onlibrarydat.mdf',
    SIZE = 2000,
    MAXSIZE = 4000,
    FILEGROWTH = 500 )
LOG ON
( NAME = onlibrary_log,
    FILENAME = 'E:\SE_work\database\onlibrarylog.ldf',
    SIZE = 50MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB ) ;
GO
USE onlibrary
GO

/********************************
二、创建表
********************************/

-- 创建用户信息表
CREATE TABLE users(
	user_id char(20) NOT NULL,
	pwd varchar(40) NOT NULL,
	user_name char(20),
	user_type char(20) NOT NULL,
	user_address char(50),
	user_tel char(20),
	msg int,
	PRIMARY KEY (user_id)
);

-- 创建图书信息表
CREATE TABLE books(
	book_id char(5) NOT NULL,
	book_name char(30) NOT NULL,
	book_price NUMERIC(4,2) NOT NULL,
	book_press char(30),
	writer char(20),
	Options char(20),
	score int check(score>=0),
	info  varchar(200),
	stock int,
	book_type char(20),
	PRIMARY KEY (book_id)
);


-- 创建订单信息表
CREATE TABLE orders(
	order_id int identity(1,1) NOT NULL,
	user_id char(20) NOT NULL,
	book_id char(5) NOT NULL,
	total_payment NUMERIC(8,2),
	order_time DATETIME,
	order_state char(10),
	number int,
	flag int,
	PRIMARY KEY (order_id),
	FOREIGN KEY (user_id)
		REFERENCES users(user_id),
	FOREIGN KEY (book_id)
		REFERENCES books(book_id)
);

-- 创建购物车表
CREATE TABLE shopcart(
	user_id char(20) NOT NULL,
	book_id char(5) NOT NULL,
	payment NUMERIC(8,2),
	s_number int,
	FOREIGN KEY (user_id)
		REFERENCES users(user_id),
	FOREIGN KEY (book_id)
		REFERENCES books(book_id)
);

-- 创建评分表
CREATE TABLE scores(
	book_id char(5) NOT NULL,
	user_id char(20),
	b_score int check(b_score>=0),
	comment char(50),
	FOREIGN KEY(book_id)
		REFERENCES books(book_id)
);

-- 创建历史记录表
CREATE TABLE history(
	user_id char(20) NOT NULL,
	book_id char(5) NOT NULL,
	l_score int,
	FOREIGN KEY(user_id)
		REFERENCES users(user_id),
	FOREIGN KEY(book_id)
		REFERENCES books(book_id)
);

-- 创建推荐表
CREATE TABLE recommend(
	book_id char(5),
	r_score NUMERIC(3,1),
	PRIMARY KEY (book_id),
	FOREIGN KEY(book_id)
		REFERENCES books(book_id)
);
GO

/********************************
三、添加数据
********************************/
select * from users
-- 添加用户信息表

select substring(sys.fn_VarBinToHexStr(hashbytes('MD5','123456')),3,32)

INSERT INTO users VALUES ('517590345@qq.com',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','stx15650')),3,32),'孙天祥','普通用户','丁香11#1-213','18292020841',0);
INSERT INTO users VALUES ('admin','admin','陈楷然','admin','丁香11#1-214','18292020841',0);
INSERT INTO users VALUES ('test1',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员1','普通用户','无','0',0);
INSERT INTO users VALUES ('test2',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员2','普通用户','无','0',0);
INSERT INTO users VALUES ('test3',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员3','普通用户','无','0',0);
INSERT INTO users VALUES ('test4',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员4','普通用户','无','0',0);
INSERT INTO users VALUES ('test5',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员5','普通用户','无','0',0);
INSERT INTO users VALUES ('test6',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员6','普通用户','无','0',0);
INSERT INTO users VALUES ('test7',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员7','普通用户','无','0',0);
INSERT INTO users VALUES ('test8',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员8','普通用户','无','0',0);
INSERT INTO users VALUES ('test9',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员9','普通用户','无','0',0);
INSERT INTO users VALUES ('test10',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员10','普通用户','无','0',0);
INSERT INTO users VALUES ('test11',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员11','普通用户','无','0',0);
INSERT INTO users VALUES ('test12',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员12','普通用户','无','0',0);
INSERT INTO users VALUES ('test13',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员13','普通用户','无','0',0);
INSERT INTO users VALUES ('test14',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员14','普通用户','无','0',0);
INSERT INTO users VALUES ('test15',substring(sys.fn_VarBinToHexStr(hashbytes('MD5','1')),3,32),'测试人员15','普通用户','无','0',0);

-- 添加书籍信息


INSERT INTO books VALUES ('001','数值计算方法',42.00,'清华大学出版社','吕同富','123',NULL,NULL,100,'textbook');
INSERT INTO books VALUES ('002','人类简史',58.50,'中信出版社','尤瓦尔 赫拉利','123',NULL,NULL,100,'Social Science');
INSERT INTO books VALUES ('004','数字电子技术',28.00,'西安电子科技大学出版社','江晓安','123',NULL,NULL,100,'textbook');
INSERT INTO books VALUES ('005','数字电子技术题解',21.00,'西安电子科技大学出版社','江晓安','123',NULL,NULL,100,'ttcj');
INSERT INTO books VALUES ('006','稻草人手记',22.00,'北京十月文艺出版社','三毛','123',NULL,'陈安迪送给孙天祥的生日礼物',1,'literature');
INSERT INTO books VALUES('007','白鹿原',27.30 ,'人民文学出版社','陈忠实','123',NULL,'《白鹿原》是作家陈忠实的代表作，这部长篇小说共50余万字，由陈忠实历时六年创作完成。',100 ,'literature');
INSERT INTO books VALUES('008','情人',30.90 ,'青岛出版社','渡边淳一','124',NULL,'情人【日本】渡边淳一 著 曲折、生动地演绎了当代都市社会中超越常规的情爱生活。',43 ,'literature');
INSERT INTO books VALUES('009','沉默的大多数',24.80 ,'中文在线','王小波','125',NULL,'《王小波:沉默的大多数》是王小波的杂文集，包括思想文化方面的文章。',34 ,'literature');
INSERT INTO books VALUES('010','白说',27.00 ,'长江文艺出版社','白岩松','126',NULL,'新闻人白岩松：言语中的心灵之路，与我和我们的未来有关，',26 ,'literature');
INSERT INTO books VALUES('011','爱你就像爱生命',30.10 ,'北京理工大学出版社','王小波、李银河','127',NULL,'此书系王小波生前从未发表过的与李银河的“两地书”，也是迄今他们夫妇最完整和独立的一本书信集。',84 ,'literature');
INSERT INTO books VALUES('012','苏东坡传',21.20 ,'湖南文艺出版社','林语堂','128',NULL,'被誉为20世纪四大传记之一 ',69 ,'literature');
INSERT INTO books VALUES('013','剑桥简明金庸武侠史',23.00 ,'长江文艺出版社','新垣平','129',NULL,'本书是关于中国武侠世界的一部虚拟历史研究。以金庸武侠是真实历史的一部分为前提展开演绎。',68 ,'literature');
INSERT INTO books VALUES('014','情人',19.50 ,'上海译文出版社','Marguerite Duras','130',NULL,'杜拉斯代表作 王道乾经典译著',50 ,'literature');
INSERT INTO books VALUES('015','人间词话',21.90 ,'中国华侨出版社','王国维','131',NULL,'该作是作者接受了西洋美学思想之洗礼后，以崭新的眼光对中国旧文学所作的评论。',7 ,'literature');

INSERT INTO books VALUES('016','黄金时代',26.60 ,'中文在线','王小波','132',NULL,'《黄金时代》是“时代三部曲”中的一部作品，该系列入选《亚洲周刊》“二十世纪中文小说一百强”。',5 ,'literature');
INSERT INTO books VALUES('017','我是猫',28.10 ,'浙江文艺出版社','夏目漱石','133',NULL,' 夏目漱石为发泄多年郁愤而写成的长篇小说《我是猫》，淋漓尽致地反映了二十世纪初，日本中小资产阶级的思想和生活。',77 ,'literature');
INSERT INTO books VALUES('018','我这一辈子',21.80 ,'长江文艺出版社','老舍','134',NULL,'《我这一辈子》是老舍先生创作于1937年抗战前夕的一部著名的中篇小说。描写了一个旧时代普通巡警的坎坷一生。',6 ,'literature');
INSERT INTO books VALUES('019','乌合之众：大众心理研究',13.22 ,'新世界出版社','古斯塔夫 勒庞','135',NULL,'《乌合之众:大众心理研究》是解析群体心理的经典名著，虽然是一部学术性著作，但语言生动流畅，分析鞭辟入里，入木三分。',50 ,'Social Science');
INSERT INTO books VALUES('020','丝绸之路：一部全新的世界史',76.30 ,'浙江大学出版社','彼得 弗兰科潘','136',NULL,'从建立伊始，丝绸之路就始终主宰着人类文明的进程。丝绸之路让中国的丝绸和文明风靡全球',54 ,'Social Science');
INSERT INTO books VALUES('021','人类简史',45.80 ,'中信出版社','Yuval Noah Harari','137',NULL,'《人类简史：从动物到上帝》是以色列新锐历史学家的一部重磅作品。从十万年前有生命迹象开始到21世纪资本、科技交织的人类发展史。',29 ,'Social Science');
INSERT INTO books VALUES('022','这么慢，那么美',24.60 ,'中国友谊出版公司','罗敷','138',NULL,'《这么慢，那么美》以慢博快，以简博繁，有舍方得的生活。',88 ,'Social Science');
INSERT INTO books VALUES('023','未来简史',51.00 ,'中信出版社','尤瓦尔 赫拉利','139',NULL,'进入21世纪后，曾经威胁人类生存的瘟疫、饥荒已经被攻克，智人面临着新的议题：永生不老、幸福快乐和成为具有“神性”的人类。',50 ,'Social Science');
INSERT INTO books VALUES('024','哈佛谈判心理学：哈佛大学权威的谈判指南',34.00 ,'中国友谊出版公司','Erica Ariel Fox','140',NULL,'这本书汇集了哈佛很好的实践与心理学家、诗人、神学家智慧。',61 ,'Social Science');
INSERT INTO books VALUES('025','所谓情商高，就是会说话',21.80 ,'北京联合出版公司','佐佐木圭一','141',NULL,'这不是一本无趣的说话励志书，这是一本有趣的口才教科书！',22 ,'Social Science');
INSERT INTO books VALUES('026','跟任何人都聊得来',22.30 ,'九州出版社','迈克 贝克特尔','142',NULL,'《跟任何人都聊得来》是美国金牌培训师迈克•贝克特尔多年沟通力培训课程',34 ,'Social Science');
INSERT INTO books VALUES('027','好好说话',24.50 ,'中信出版社','马东 马薇薇','143',NULL,'本书抛开常见的教授套路，通过新鲜、有趣的说话技巧，达到修正读者三观、激发读者思维、传输使用技巧的目的，从而综合提升说话之道。',26 ,'Social Science');
INSERT INTO books VALUES('028','自卑与超越',13.60 ,'沈阳出版社','阿弗雷德 阿德勒','144',NULL,'全书立足于个体心理学观点，从教育、家庭、婚姻、伦理、社交等多个领域，以大量的实例为论述基础，阐明了人生道路的方向和人生意义的真谛',1 ,'Social Science');
INSERT INTO books VALUES('029','一个人用英文去旅行',34.00 ,'化学工业出版社','曼曦','145',NULL,'这是本超实用英语口语书，也是本小清新旅行指南，带上它准备出发吧！',41 ,'Social Science');
INSERT INTO books VALUES('030','蔡康永的说话之道',44.30 ,'湖南文艺出版社','蔡康永','146',NULL,'《蔡康永的说话之道(套装共2册)》是知名主持人蔡康永好玩、最幽默的说话之道，本套书开端蔡康永便许下宏愿',9 ,'Social Science');
INSERT INTO books VALUES('031','经济学原理',89.60 ,'北京大学出版社','曼昆','147',NULL,'经济学原理教材',55 ,'textbook');
INSERT INTO books VALUES('032','西南联大英文课',57.70 ,'中国出版集团中译出版社','陈福田','148',NULL,'西南联大英语教材',75 ,'textbook');
INSERT INTO books VALUES('033','中医基础理论',23.80 ,'中国中医药出版社','孙广仁','149',NULL,'中医基础理论教材',0 ,'textbook');
INSERT INTO books VALUES('034','营销管理',68.60 ,'格致出版社','Philip Kotler','150',NULL,'营销管理教材',93 ,'textbook');
INSERT INTO books VALUES('035','新概念英语1',36.80 ,'外语教学与研究出版社','亚历山大','151',NULL,'新概念英语教材',91 ,'textbook');
INSERT INTO books VALUES('036','新概念英语2',44.90 ,'外语教学与研究出版社','亚历山大','152',NULL,'新概念英语教材',49 ,'textbook');
INSERT INTO books VALUES('037','新概念英语3',39.40 ,'外语教学与研究出版社','亚历山大','153',NULL,'新概念英语教材',80 ,'textbook');
INSERT INTO books VALUES('038','新概念英语4',21.80 ,'外语教学与研究出版社','亚历山大','154',NULL,'新概念英语教材',11 ,'textbook');
INSERT INTO books VALUES('039','普通心理学',43.60 ,'北京师范大学出版社','彭聃龄','155',NULL,'心理学教材',20 ,'textbook');
INSERT INTO books VALUES('040','内科学',71.30 ,'人民卫生出版社','葛均波、 徐永健','156',NULL,'内科学教材',0 ,'textbook');
INSERT INTO books VALUES('041','概率论与数理统计',32.10 ,'高等教育出版社','盛骤','157',NULL,'概率论与数理统计教材',98 ,'textbook');
INSERT INTO books VALUES('042','高等数学',29.90 ,'高等教育出版社','同济大学数学系','158',NULL,'高等数学教材',40 ,'textbook');
INSERT INTO books VALUES('043','一本书读懂财报',25.50 ,'浙江大学出版社','肖星','159',NULL,'《一本书读懂财报》专门为零基础的初学者写作，它将帮助初学者循序渐进、轻松自如地掌握财务报表的相关知识，快速入门。',53 ,'ttcj');
INSERT INTO books VALUES('044','1984',28.10 ,'吉林出版集团有限公司','乔治•奥威尔','160',NULL,'《1984》是一部政治寓言小说。在书中作者为我们展现了他惊人的想象力、伟大的创造力、深邃的洞察力，用他独有的风格为我们描绘了一个恐怖世界。',56 ,'ttcj');
INSERT INTO books VALUES('045','现代汉语词典（第7版）',87.20 ,'商务印书馆','--','161',NULL,'词典',46 ,'ttcj');
INSERT INTO books VALUES('046','牛津高阶英汉双解词典（第8版）',110.40 ,'商务印书馆','--','162',NULL,'词典',26 ,'ttcj');
INSERT INTO books VALUES('047','DK儿童太空百科全书',76.10 ,'中国大百科全书出版社','美国DK公司','163',NULL,'《DK儿童太空百科全书》是一本综合性的有关空间探索的百科全书。其内容几乎涵盖了所有普通读者感兴趣的和想要了解的太空知识。',82 ,'ttcj');
INSERT INTO books VALUES('048','新世纪汉英大词典（第二版）',96.80 ,'外语教学与研究出版社','惠宇','164',NULL,'词典',66 ,'ttcj');
INSERT INTO books VALUES('049','中国文化的深层结构',46.80 ,'中信出版集团股份有限公司','孙隆基','165',NULL,'本书中中国文化以十分负面的形象出现，中国文化的“文法”规则能否在新的世局里创造出簇新的佳词妙句，我们将拭目以待。',30 ,'ttcj');
INSERT INTO books VALUES('050','唐诗鉴赏辞典（新一版）',61.80 ,'上海辞书出版社','俞平伯','166',NULL,'辞典',25 ,'ttcj');
INSERT INTO books VALUES('051','麦克米伦高阶英汉双解词典',82.20 ,'外语教学与研究出版社','--','167',NULL,'词典',42 ,'ttcj');
INSERT INTO books VALUES('052','新华字典(第11版)(双色本)',19.90 ,'商务印书馆','--','168',NULL,'词典',90 ,'ttcj');
INSERT INTO books VALUES('053','成语大词典(彩色本)(最新修订版)',64.80 ,'商务印书馆','--','169',NULL,'词典',21 ,'ttcj');
INSERT INTO books VALUES('054','金文字彙/仰韶书屋',660.00 ,'天津古籍出版社','天津古籍出版社','170',NULL,'书法字典工具书',37 ,'ttcj');
INSERT INTO books VALUES('055','巨人的陨落',84.30 ,'江苏凤凰文艺出版社','肯 福莱特','171',NULL,'世界是属于勇敢者的，所以世界是属于我的。宏大的背景、结构和故事巧妙交织，构成了一部扣人心弦的史诗。',82 ,'Novel');
INSERT INTO books VALUES('056','永恒的边缘',106.90 ,'江苏凤凰文艺出版社','肯 福莱特','172',NULL,'世纪三部曲《巨人的陨落》大结局',40 ,'Novel');
INSERT INTO books VALUES('057','解忧杂货店',27.30 ,'南海出版公司','东野圭吾','173',NULL,'日本著名作家东野圭吾的《解忧杂货店》，出版当年即获中央公论文艺奖。作品超越推理小说的范围，却比推理小说更加扣人心弦。',67 ,'Novel');
INSERT INTO books VALUES('058','三体',62.30 ,'重庆出版社','刘慈欣','174',NULL,'这个这么叼你不可能不知道的吧',93 ,'Novel');
INSERT INTO books VALUES('059','世界的凛冬',78.10 ,'江苏文艺出版社','肯 福莱特','175',NULL,'《巨人的陨落》续篇',74 ,'Novel');
INSERT INTO books VALUES('060','美国众神',51.00 ,'北京联合出版公司','尼尔 盖曼','176',NULL,'《纽约时报》畅销榜冠军作品，全球发行近200个版本，粉丝遍布全世界',5 ,'Novel');
INSERT INTO books VALUES('061','恋情的终结',38.80 ,'江苏凤凰文艺出版社','格雷厄姆 格林','177',NULL,'这本书里有狂热的爱、狂热的恨、狂热的猜疑、狂热的嫉妒、狂热的信仰，有爱情中所有狂热的情感。',97 ,'Novel');
INSERT INTO books VALUES('062','月亮和六便士',28.10 ,'上海译文出版社','威廉 毛姆','178',NULL,'《月亮和六便士》是英国著名作家、“故事圣手”毛姆最重要的长篇小说代表作之一。',22 ,'Novel');
INSERT INTO books VALUES('063','白夜行',27.00 ,'南海出版公司','东野圭吾','179',NULL,'《白夜行》讲述了多年以前，大阪的一栋废弃建筑中发现一名遭利器刺死男子的故事。',62 ,'Novel');
INSERT INTO books VALUES('064','嫌疑人X的献身',24.20 ,'南海出版公司','东野圭吾','180',NULL,'《嫌疑人X的献身》创造了日本推理小说的奇迹，将第134届直木奖、第6届本格推理小说大奖及日本3大推理小说排行榜年度总冠军一并收入囊中。',99 ,'Novel');
INSERT INTO books VALUES('065','梦幻花',24.40 ,'作家出版社','东野圭吾','181',NULL,'《梦幻花》突破了东野圭吾之前的写作手法，是作者费思量的迷人之作。',67 ,'Novel');
INSERT INTO books VALUES('066','沙丘',45.10 ,'江苏文艺出版社','弗兰克 赫伯特','182',NULL,'《沙丘》是伟大的科幻作家弗兰克·赫伯特的传奇代表作。',100 ,'Novel');
INSERT INTO books VALUES('067','逆向管理：先行动后思考',32.70 ,'北京联合出版公司','埃米尼亚·伊贝拉','183',NULL,'《福布斯》年度领导力好书&《金融时报》畅销书！为什么你浪费了很多时间，却做不出有效的决策？',31 ,'Economy management');
INSERT INTO books VALUES('068','精进',25.90 ,'江苏凤凰文艺出版社','采铜','184',NULL,'在《精进：如何成为一个很厉害的人》中，作者提出了一种更有效的提升自我的方法：用持续精确的努力，撬动更大的可能，这便是精进。',72 ,'Economy management');
INSERT INTO books VALUES('069','理性乐观派:一部人类经济进步史(珍藏版)',51.00 ,'机械工业出版社','马特·里德利','185',NULL,'本书向我们阐述了情况怎样越变越好，并说明了原因。始于十多万年前的交换和专业分工习惯，创造出了以加速趋势改善人类生活水平的集体大脑。',49 ,'Economy management');
INSERT INTO books VALUES('070','时间管理',15.40 ,'上海交通大学出版社','吉姆 兰德尔','186',NULL,'《时间管理:如何充分利用你的24小时》作者从大量关于时间管理的书籍和文章中归纳出约50条原则.并在书中一一展示。',27 ,'Economy management');
INSERT INTO books VALUES('071','生而贫穷',62.40 ,'中国发展出版社','赵皓阳','187',NULL,'本书上篇主要阐述世界观，下篇讲的是方法论。',64 ,'Economy management');
INSERT INTO books VALUES('072','故事思维',29.20 ,'江西人民出版社','安妮特 西蒙斯','188',NULL,'《故事思维》是将故事思维应用于商界的**人 ——安妮特 •西蒙斯的奠基之作，畅销全球十余年。',62 ,'Economy management');
INSERT INTO books VALUES('073','富爸爸穷爸爸',15.40 ,'四川文艺出版社','罗伯特 清崎','189',NULL,'清崎以亲身经历的财富故事展示了“穷爸爸”和“富爸爸”截然不同的金钱观和财富观：穷人为钱工作，富人让钱为自己工作！',4 ,'Economy management');
INSERT INTO books VALUES('074','你的团队需要一个会讲故事的人',24.00 ,'江苏凤凰文艺出版社','安妮特 西蒙斯','190',NULL,'《你的团队需要一个会讲故事的人》不仅说明了如何学习和增强这项能力的方法，还将故事作为一种思维方式启迪大家来解决问题。',91 ,'Economy management');
INSERT INTO books VALUES('075','穿越历史聊经济',31.50 ,'北京大学出版社','汪通 汪凌燕','191',NULL,'通天人之际，达古今之变。一部二十四史，帝王将相读出来的，往往是尔虞我诈和经略权变，而在经济学家的眼中，却是很多当代经济理论的预演。',41 ,'Economy management');
INSERT INTO books VALUES('076','销售就是要玩转情商',22.80 ,'北京天雪文化有限公司','科林 斯坦利','192',NULL,'本书从情商出发，将销售行业中常见的销售渠道、客户心理、客户维护、谈判技巧、团队管理等问题都做了详尽的阐述，并给出了行之有效的指导方法。',97 ,'Economy management');
INSERT INTO books VALUES('077','大国大城',30.70 ,'世纪文景','陆铭','193',NULL,'经济学家陆铭教授的《大国大城》关注的是中国当前城乡经济发展中切实存在的现实问题。',3 ,'Economy management');
INSERT INTO books VALUES('078','影响力（经典版）',38.40 ,'北京联合出版公司','罗伯特 B','194',NULL,'无论你是普通人还是为某一产品或事业观点游说的人，这都是一本最基本的书，是你理解人们心理的基石。',16 ,'Economy management');
INSERT INTO books VALUES('079','智能时代:大数据与智能革命重新定义未来',48.40 ,'--','吴军','195',NULL,'大数据和人工智能迅猛发展，对社会和商业的影响日益深刻，从学术界到企业界，智能化浪潮的来临，已经成为共识。',70 ,'Technology');
INSERT INTO books VALUES('080','手机摄影从入门到精通',26.60 ,'化学工业出版社','雷波','196',NULL,'本书专门针对使用手机摄影应该掌握的各种操作方法、摄影理论、后期处理APP进行了深入讲解。',92 ,'Technology');
INSERT INTO books VALUES('081','上瘾：让用户养成使用习惯的四大产品逻辑',36.70 ,'中信出版社','尼尔 埃亚尔','197',NULL,'《上瘾》揭示了很多让用户上瘾、形成使用习惯的互联网产品和服务背后的基本设计原理;告诉你怎样打造让人们欲罢不能的产品。',11 ,'Technology');
INSERT INTO books VALUES('082','中产阶级如何保护自己的财富',33.10 ,'中国友谊出版公司','yevon_ou','198',NULL,'本书能更好地帮助人们理解财富、创造财富，给读者分享大量实践和研究中产生的经验与思想成果，为读者排忧解难，答疑解惑。',26 ,'Technology');
INSERT INTO books VALUES('083','设计中的设计',31.50 ,'山东人民出版社','原研哉','199',NULL,'当你们因为读完这本观念设计书而感到越来越不懂没计时，这并不意味着你对于设计的认识倒退了，而是证明你在设计的世界里又更往深处迈进了一步。',58 ,'Technology');
INSERT INTO books VALUES('084','造房子',50.70 ,'湖南美术出版社','王澍','200',NULL,'本书是世界建筑最高奖普利兹克奖得主、著名建筑大师王澍的建筑文化随笔集',48 ,'Technology');
INSERT INTO books VALUES('085','设计几何学:关于比例与构成的研究',32.50 ,'知识产权出版社','金伯利 伊拉姆','201',NULL,'本书带我们进入了神奇的几何领域——黄金分割、完美的比例和斐波纳契数列，用平实的语言表达晦涩难懂的数学。',6 ,'Technology');
INSERT INTO books VALUES('086','用设计解决问题',32.70 ,'时代出版传媒股份有限公司','佐藤大','202',NULL,'本书通过nendo工作室创始人佐藤大亲身体验的事例，介绍设计与创造的本质。',89 ,'Technology');
INSERT INTO books VALUES('087','数码单反摄影从入门到精通',29.90 ,'机械工业出版社','骆军','203',NULL,'本书语言简洁流畅，适合摄影新手阅读，资深摄影师也可以将此书作为进一步研究摄影技术与实拍的工具书。',25 ,'Technology');
INSERT INTO books VALUES('088','数据科学与大数据分析',54.50 ,'人民邮电出版社','EMC','204',NULL,'数据科学与大数据分析在当前是炙手可热的概念，关注的是如何通过分析海量数据来洞悉隐藏于数据背后的见解。',12 ,'Technology');
INSERT INTO books VALUES('089','DK木工全书',64.20 ,'北京科学技术出版社','英国DK出版社','205',NULL,'作为英国持续排名榜首的木工经典全书，本书介绍了木工学习所需要的全部基础知识和技巧',6 ,'Technology');
INSERT INTO books VALUES('090','数据挖掘导论',49.60 ,'人民邮电出版社','陈封能','206',NULL,'《数据挖掘导论(完整版)》全面介绍了数据挖掘的理论和方法，旨在为读者提供将数据挖掘应用于实际问题所必需的知识。',32 ,'Technology');
INSERT INTO books VALUES('091','第一行代码：Android（第2版）',59.00 ,'人民邮电出版社','郭霖','207',NULL,'本书被Android开发者誉为Android学习经典。全书系统全面、循序渐进地介绍了Android软件开发的知识、经验和技巧。',80 ,'Computer Science');
INSERT INTO books VALUES('092','Python编程 从入门到实践',64.50 ,'人民邮电出版社','埃里克 马瑟斯','208',NULL,'本书是一本针对所有层次的Python读者而作的Python入门书。',41 ,'Computer Science');
INSERT INTO books VALUES('093','Java编程思想(第4版)',86.40 ,'机械工业出版社','埃史尔','209',NULL,'《Java编程思想(第4版)》书共22章，包括操作符、控制执行流程、访问权限控制、复用类、并发以及图形化用户界面等内容。',8 ,'Computer Science');
INSERT INTO books VALUES('094','流畅的Python',101.50 ,'人民邮电出版社','Luciano Ramalho','210',NULL,'《流畅的Python》一书致力于帮助Python开发人员挖掘这门语言及相关程序库的优秀特性，避免重复劳动，同时写出地道Python风格的代码。',87 ,'Computer Science');
INSERT INTO books VALUES('095','JavaScript高级程序设计(第3版)',71.50 ,'人民邮电出版社','泽卡斯','211',NULL,'《JavaScript高级程序设计(第3版)》是JavaScript超级畅销书的最新版。',79 ,'Computer Science');
INSERT INTO books VALUES('096','图灵程序设计丛书:算法(第4版)',66.40 ,'人民邮电出版社','塞奇威克 、 韦恩','212',NULL,'本书是算法领域经典的参考书，涵盖所有程序员必须掌握的50种算法，全面介绍了关于算法和数据结构的必备知识',53 ,'Computer Science');
INSERT INTO books VALUES('097','C++ Primer(中文版)(第5版)',83.20 ,'电子工业出版社','斯坦利 李普曼、 约瑟·拉乔伊','213',NULL,'这本久负盛名的C++经典教程，时隔八年之久，终迎来的重大升级。畅销书重磅升级，全面采用最新 C++ 11标准。',45 ,'Computer Science');
INSERT INTO books VALUES('098','利用Python进行数据分析',63.10 ,'机械工业出版社','麦金尼','214',NULL,'学习NumPy（NumericalPython）的基础和高级知识；从pandas库的数据分析工具开始利用高性能工具对数据进行加载、清理、转换、合并以及重塑',79 ,'Computer Science');
INSERT INTO books VALUES('099','算法导论',104.80 ,'机械工业出版社','Thomas H.Cormen','215',NULL,'算法导论(原书第3版)将严谨性和全面性融为一体，深入讨论各类算法，并着力使这些算法的设计和分析能为各个层次的读者接受。',20 ,'Computer Science');
INSERT INTO books VALUES('100','R语言实战(第2版)',69.70 ,'人民邮电出版社','卡巴科弗','216',NULL,'本书注重实用性，是一本全面而细致的R指南，展示了使用的统计示例，且对于难以用传统方法处理的凌乱、不完整和非正态的数据给出了优雅的处理方法',86 ,'Computer Science');
INSERT INTO books VALUES('101','终极算法',53.50 ,'中信出版社','佩德罗 多明戈斯','217',NULL,' 机器学习五大学派，每个学派都有自己的主算法，能帮助人们解决特定的问题。而如果整合所有这些算法的优点，就有可能找到一种“终极算法”',42 ,'Computer Science');
INSERT INTO books VALUES('102','Python编程快速上手',53.20 ,'人民邮电出版社','斯维加特','218',NULL,'Python是一种解释型、面向对象、动态数据类型的高级程序设计语言。通过Python编程，我们能够解决现实生活中的很多任务。',17 ,'Computer Science');


select * from orders

select * from shopcart

select * from books

select * from scores

select * from users

select * from scores

select * from history

select * from recommend

select  books.book_id,book_name,book_price,book_press,writer,Options 
from books,recommend
where books.book_id = recommend.book_id
order by r_score ASC

select book_id AS ID,book_name AS Name,book_price AS Price,
book_press AS Press,writer AS Writer,Options from books,recommend 
where books.book_id = recommend.book_id order by r_score ASC

select book_id,SUM(number)
from orders
group by book_id
order by SUM(number) DESC

select HashBytes('MD5','stx15650')


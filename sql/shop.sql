-- auto-generated definition
CREATE TABLE admin
(
  id        INT AUTO_INCREMENT
    PRIMARY KEY,
  user_name VARCHAR(255) NULL,
  password  VARCHAR(255) NULL
)
  COMMENT '管理员表';

INSERT INTO zshop.admin (id, user_name, password) VALUES (1, 'seller', 'relles');
INSERT INTO zshop.admin (id, user_name, password) VALUES (2, 'dudu', 123123);
INSERT INTO zshop.admin (id, user_name, password) VALUES (3, 'asasd', 123123);
INSERT INTO zshop.admin (id, user_name, password) VALUES (4, '张航', 666666);
INSERT INTO zshop.admin (id, user_name, password) VALUES (5, 'coco', 123123);


-- auto-generated definition
CREATE TABLE category
(
  cid   INT AUTO_INCREMENT
    PRIMARY KEY,
  cname VARCHAR(255) NULL
)
  COMMENT '商品一级类目';

INSERT INTO zshop.category (cid, cname) VALUES (1, '电脑');
INSERT INTO zshop.category (cid, cname) VALUES (2, '图书');
INSERT INTO zshop.category (cid, cname) VALUES (3, '手机');
INSERT INTO zshop.category (cid, cname) VALUES (4, '家电');
INSERT INTO zshop.category (cid, cname) VALUES (5, '男装');
INSERT INTO zshop.category (cid, cname) VALUES (6, '女装');



-- auto-generated definition
CREATE TABLE categorysecond
(
  csid   INT AUTO_INCREMENT
    PRIMARY KEY,
  csname VARCHAR(255) NULL,
  cid    INT          NULL,
  CONSTRAINT categorysecond_category_cid_fk
  FOREIGN KEY (cid) REFERENCES category (cid)
)
  COMMENT '商品二级类目';
CREATE INDEX categorysecond_category_cid
  ON categorysecond (cid);


INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (1, '笔记本', 1);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (2, '游戏本', 1);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (3, '平板电脑', 1);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (4, '台式机', 1);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (5, 'Java', 2);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (6, 'C语言', 2);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (7, 'C++', 2);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (8, 'Python', 2);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (9, '数据挖掘', 2);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (10, '机器学习', 2);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (11, '华为', 3);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (12, '苹果', 3);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (13, '小米', 3);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (14, '电视', 4);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (15, '空调', 4);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (16, '洗衣机', 4);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (17, 'T恤', 5);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (18, '牛仔裤', 5);
INSERT INTO zshop.categorysecond (csid, csname, cid) VALUES (19, '连衣裙', 6);


-- auto-generated definition
CREATE TABLE orderitems
(
  itemid    INT AUTO_INCREMENT
    PRIMARY KEY,
  count     INT   NULL,
  sub_total FLOAT NULL,
  oid       INT   NULL,
  pid       INT   NULL,
  buy_price FLOAT NULL,
  CONSTRAINT orderitems_orders_oid_fk
  FOREIGN KEY (oid) REFERENCES orders (oid),
  CONSTRAINT orderitems_product_pid_fk
  FOREIGN KEY (pid) REFERENCES product (pid)
)
  COMMENT '订单详情';
CREATE INDEX orderitems_orders_oid
  ON orderitems (oid);
CREATE INDEX orderitems_product_pid
  ON orderitems (pid);

INSERT INTO zshop.orderitems (itemid, count, sub_total, oid, pid, buy_price) VALUES (1, 10, 500, 1, 1, 80);
INSERT INTO zshop.orderitems (itemid, count, sub_total, oid, pid, buy_price) VALUES (2, 10, 500, 1, 2, 40);
INSERT INTO zshop.orderitems (itemid, count, sub_total, oid, pid, buy_price) VALUES (7, 3, 266.1, 15, 1, 88.7);
INSERT INTO zshop.orderitems (itemid, count, sub_total, oid, pid, buy_price) VALUES (8, 3, 149.4, 15, 2, 49.8);
INSERT INTO zshop.orderitems (itemid, count, sub_total, oid, pid, buy_price) VALUES (9, 3, 230.7, 15, 5, 76.9);
INSERT INTO zshop.orderitems (itemid, count, sub_total, oid, pid, buy_price) VALUES (10, 3, 136.2, 15, 6, 45.4);
INSERT INTO zshop.orderitems (itemid, count, sub_total, oid, pid, buy_price) VALUES (11, 3, 230.4, 15, 11, 76.8);


-- auto-generated definition
CREATE TABLE orders
(
  oid          INT AUTO_INCREMENT
    PRIMARY KEY,
  create_time  DATETIME               NULL,
  name         VARCHAR(255)           NULL,
  phone        VARCHAR(255)           NULL,
  addr         VARCHAR(255)           NULL,
  state        TINYINT(1) DEFAULT '1' NULL,
  total        FLOAT                  NULL,
  uid          INT                    NULL,
  order_number VARCHAR(255)           NULL,
  zipcode      VARCHAR(255)           NULL,
  pay_time     DATETIME               NULL,
  ship_time    DATETIME               NULL,
  confirm_time DATETIME               NULL,
  CONSTRAINT orders_user_uid_fk
  FOREIGN KEY (uid) REFERENCES user (uid)
)
  COMMENT '订单表';
CREATE INDEX orders_user_uid
  ON orders (uid);


INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (1, '2018-02-21 20:10:22', '张航', 18251955137, '江苏省南京市', 4, 1000, 2, 4323423234, 210000, '2018-02-21 20:10:22', '2018-02-21 20:10:22', NULL);
INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (3, '2018-02-24 20:00:13', '酱油之星', 12312312312, '江苏省南京市玄武区', 2, 1200, 2, 3242342342, 210000, NULL, NULL, NULL);
INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (4, '2018-02-24 19:49:38', '酱油', 18260347122, '江苏省宿迁市宿城区香榭里明珠', 0, 1300, 2, 4571242381, 223800, NULL, NULL, NULL);
INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (5, '2018-02-26 14:43:46', '张航', NULL, NULL, 1, 100, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (6, '2018-02-26 14:44:21', '张航', NULL, NULL, 0, 100, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (7, '2018-02-26 14:44:44', '张航', NULL, NULL, 4, 100, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (8, '2018-02-26 14:45:02', '张航', NULL, NULL, 3, NULL, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (9, '2018-02-26 14:45:23', '张航', NULL, NULL, 2, 1, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (10, '2018-02-26 14:45:38', '张航', '', NULL, 3, 2, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (11, '2018-02-26 14:45:49', '张航', NULL, NULL, 0, 100, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (12, '2018-02-26 14:46:04', '张航', '', NULL, 4, 100, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (13, '2018-02-26 14:46:15', '张航', NULL, NULL, 2, 1000, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (14, '2018-03-03 17:05:57', '张航', 18251955137, '江苏省宿迁市宿城区香榭里明珠', 3, 521.6, 2, 20180303170557, 223800, NULL, NULL, NULL);
INSERT INTO zshop.orders (oid, create_time, name, phone, addr, state, total, uid, order_number, zipcode, pay_time, ship_time, confirm_time) VALUES (15, '2018-03-03 17:22:42', '张振学', 15150756598, '江苏省宿迁市宿城区香榭里明珠', 4, 1012.8, 2, 20180303172242, 223800, '2018-03-03 17:40:27', NULL, '2018-03-03 19:20:24');




-- auto-generated definition
CREATE TABLE product
(
  pid         INT AUTO_INCREMENT
    PRIMARY KEY,
  pname       VARCHAR(255)           NULL,
  price       FLOAT                  NULL,
  inventory   INT(5)                 NOT NULL,
  image       VARCHAR(255)           NULL,
  comment     VARCHAR(255)           NULL,
  create_time DATETIME               NULL,
  csid        INT                    NULL,
  state       TINYINT(1) DEFAULT '1' NULL
  COMMENT '商品状态：0下架1上架',
  buy_price   FLOAT                  NULL,
  code        VARCHAR(255)           NULL,
  CONSTRAINT product_categorysecond_csid_fk
  FOREIGN KEY (csid) REFERENCES categorysecond (csid)
)
  COMMENT '商品表';
CREATE INDEX product_categorysecond_csid
  ON product (csid);


INSERT INTO zshop.product (pid, pname, price, inventory, image, comment, create_time, csid, state, buy_price, code) VALUES (1, 'Java编程思想（第4版）', 88.7, 150, '/images/1519185447886.jpg', '《计算机科学丛书：Java编程思想（第4版）》赢得了全球程序员的广泛赞誉，即使是晦涩的概念，在BruceEckel的文字亲和力和小而直接的编程示例面前也会化解于无形。从Java的基础语法到高级特性（深入的面向对象概念、多线程、自动项目构建、单元测试和调试等），本书都能逐步指导你轻松掌握。', NULL, 6, 1, NULL, 36547915);
INSERT INTO zshop.product (pid, pname, price, inventory, image, comment, create_time, csid, state, buy_price, code) VALUES (2, 'JAVA从入门到精通', 49.8, 90, '/images/1519185550348.jpg', 'java入门经典书持续八年畅销累计63次重印 32小时视频 732个经典实例 369项面试真题 616项测试 30个模块及案例 PPT电子课件 入门 范例 项目实战全覆盖 随书附赠小白手册电子版。', NULL, 6, 1, NULL, 84714936);
INSERT INTO zshop.product (pid, pname, price, inventory, image, comment, create_time, csid, state, buy_price, code) VALUES (3, 'Java实战开发', 37.4, 50, '/images/1519185654567.jpg', '详细介绍了Java开发中的各项实例，适合有一定开发经验的同学学习。', '2018-02-18 16:09:13', 6, 0, NULL, 73651803);
INSERT INTO zshop.product (pid, pname, price, inventory, image, comment, create_time, csid, state, buy_price, code) VALUES (4, '深入理解Java虚拟机：JVM高级特性与最佳实践', 62.4, 150, '/images/1519184754188.jpg', '基于JDK1.7，围绕内存管理、执行子系统、程序编译与优化、高效并发等核心主题对JVM进行全面而深入的分析，深刻揭示JVM的工作原理。', '2018-02-20 13:50:37', 6, 0, NULL, 64543246);
INSERT INTO zshop.product (pid, pname, price, inventory, image, comment, create_time, csid, state, buy_price, code) VALUES (5, '疯狂JAVA讲义（第四版）', 76.9, 200, '/images/1519527539214.jpg', '十年原创经典，基于Java 9抢先升级面世，李刚作品成为海峡两岸50万读者之选，赠送包含1500分钟课程讲解的视频、源代码、电子书、课件、面试题，提供微信+QQ答疑群，配套学习交流网站。', '2018-02-21 12:03:27', 6, 1, NULL, 73591035);
INSERT INTO zshop.product (pid, pname, price, inventory, image, comment, create_time, csid, state, buy_price, code) VALUES (6, 'Java并发编程的艺术', 45.4, 200, '/images/1519185889456.jpg', '阿里巴巴技术专家/Java并发编程领域领军人物撰写，从JDK源码、JVM、CPU多角度剖析并发编程原理和核心技术。', '2018-02-21 12:04:49', 6, 1, NULL, 73492570);
INSERT INTO zshop.product (pid, pname, price, inventory, image, comment, create_time, csid, state, buy_price, code) VALUES (7, '第一行代码 Java 视频讲解版', 70.2, 100, '/images/1519185968347.jpg', 'Java从入门到精通书籍 国内原创经典Java入门书 Java教学名师视频教学 程序员笔试面试宝典 超过60小时教学视频 600多个实例 200余道常见面试题 400多个提示', '2018-02-21 12:06:08', 6, 0, NULL, 76459337);
INSERT INTO zshop.product (pid, pname, price, inventory, image, comment, create_time, csid, state, buy_price, code) VALUES (8, 'Java程序员面试笔试宝典', 38.1, 150, '/images/1519186026327.jpg', '程序员求职面试笔试必备图书', '2018-02-21 12:07:06', 6, 1, NULL, 834671);
INSERT INTO zshop.product (pid, pname, price, inventory, image, comment, create_time, csid, state, buy_price, code) VALUES (9, 'Java微服务实战', 54.2, 50, '/images/1519186120457.jpg', 'Java微服务实战', '2018-02-21 12:08:40', 6, 0, NULL, 64269026);
INSERT INTO zshop.product (pid, pname, price, inventory, image, comment, create_time, csid, state, buy_price, code) VALUES (10, 'Head First设计模式（中文版）', 67.6, 50, '/images/1519186565215.jpg', '畅销十年，累计印刷30余次，荣获2005年第十五届Jolt通用类图书震撼大奖', '2018-02-21 12:16:05', 6, 1, NULL, 64179024);
INSERT INTO zshop.product (pid, pname, price, inventory, image, comment, create_time, csid, state, buy_price, code) VALUES (11, 'Java开发实战1200例（第1卷）', 76.8, 100, '/images/1519186666495.jpg', '“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手', '2018-02-21 12:17:46', 6, 1, NULL, 56921560);
INSERT INTO zshop.product (pid, pname, price, inventory, image, comment, create_time, csid, state, buy_price, code) VALUES (12, '利用Python进行数据分析 [Python for Data Analysis]', 58.7, 100, '/images/1519524462988.jpg', '', '2018-02-25 10:07:43', 9, 1, NULL, 87431083);


-- auto-generated definition
CREATE TABLE user
(
  uid       INT AUTO_INCREMENT
    PRIMARY KEY,
  nick_name VARCHAR(255) NULL,
  password  VARCHAR(255) NULL,
  real_name VARCHAR(255) NULL,
  email     VARCHAR(255) NULL,
  phone     VARCHAR(255) NULL,
  age       INT(5)       NULL,
  addr      VARCHAR(255) NULL,
  zip_code  VARCHAR(6)   NULL
)
  COMMENT '用户表';

INSERT INTO zshop.user (uid, nick_name, password, real_name, email, phone, age, addr, zip_code) VALUES (1, 'buyer', 'reyub', 'buyer', '1033831484@qq.com', 18251955137, 25, '江苏省南京市玄武区', 210000);
INSERT INTO zshop.user (uid, nick_name, password, real_name, email, phone, age, addr, zip_code) VALUES (2, 'coco', 'coco', '逆非', '1033831484@qq.com', 18251955137, 25, '江苏省南京市玄武区', 210000);
INSERT INTO zshop.user (uid, nick_name, password, real_name, email, phone, age, addr, zip_code) VALUES (3, '张航', 666666, '张航', '1033831484@qq.com', 18251955137, 25, '江苏省宿迁市宿城区', 223800);
INSERT INTO zshop.user (uid, nick_name, password, real_name, email, phone, age, addr, zip_code) VALUES (4, 'ddd', 'ddd', NULL, NULL, NULL, NULL, NULL, NULL);


-- auto-generated definition
CREATE TABLE useraddress
(
  id      INT AUTO_INCREMENT
    PRIMARY KEY,
  address VARCHAR(255) NULL,
  name    VARCHAR(255) NULL,
  phone   VARCHAR(255) NULL,
  zipcode VARCHAR(255) NULL,
  user_id INT          NULL,
  CONSTRAINT useraddress_user_uid_fk
  FOREIGN KEY (user_id) REFERENCES user (uid)
);
CREATE INDEX useraddress_user_uid_fk
  ON useraddress (user_id);


INSERT INTO zshop.useraddress (id, address, name, phone, zipcode, user_id) VALUES (1, '江苏省宿迁市宿城区香榭里明珠', '曹苏梅', 18260347122, 223800, 2);
INSERT INTO zshop.useraddress (id, address, name, phone, zipcode, user_id) VALUES (2, '江苏省宿迁市宿城区香榭里明珠', '张航', 18251955137, 223800, 2);
INSERT INTO zshop.useraddress (id, address, name, phone, zipcode, user_id) VALUES (3, '江苏省宿迁市宿城区香榭里明珠', '张振学', 15150756598, 223800, 2);



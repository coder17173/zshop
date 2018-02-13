SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- auto-generated definition
CREATE TABLE admin
(
  id        INT AUTO_INCREMENT
    PRIMARY KEY,
  user_name VARCHAR(255) NULL,
  password  VARCHAR(255) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '管理员表';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户表';



-- auto-generated definition
CREATE TABLE category
(
  cid   INT AUTO_INCREMENT
    PRIMARY KEY,
  cname VARCHAR(255) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '商品一级类目';


-- auto-generated definition
CREATE TABLE categorysecond
(
  csid   INT AUTO_INCREMENT
    PRIMARY KEY,
  csname VARCHAR(255) NULL,
  cid    INT          NULL,
  CONSTRAINT categorysecond_category_cid_fk
  FOREIGN KEY (cid) REFERENCES category (cid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '商品二级类目';

CREATE INDEX categorysecond_category_cid ON categorysecond (cid);



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
  CONSTRAINT product_categorysecond_csid_fk
  FOREIGN KEY (csid) REFERENCES categorysecond (csid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '商品表';

CREATE INDEX product_categorysecond_csid ON product (csid);


 -- auto-generated definition
CREATE TABLE orders
(
  oid         INT AUTO_INCREMENT
    PRIMARY KEY,
  create_time DATETIME               NULL,
  name        VARCHAR(255)           NULL,
  phone       VARCHAR(255)           NULL,
  addr        VARCHAR(255)           NULL,
  state       TINYINT(1) DEFAULT '1' NULL,
  total       FLOAT                  NULL,
  uid         INT                    NULL,
  CONSTRAINT orders_user_uid_fk
  FOREIGN KEY (uid) REFERENCES user (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '订单表';

CREATE INDEX orders_user_uid ON orders (uid);




-- auto-generated definition
CREATE TABLE orderitems
(
  itemid    INT AUTO_INCREMENT
    PRIMARY KEY,
  count     INT   NULL,
  sub_total FLOAT NULL,
  oid       INT   NULL,
  pid       INT   NULL,
  CONSTRAINT orderitems_orders_oid_fk
  FOREIGN KEY (oid) REFERENCES orders (oid),
  CONSTRAINT orderitems_product_pid_fk
  FOREIGN KEY (pid) REFERENCES product (pid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '订单详情';
CREATE INDEX orderitems_orders_oid ON orderitems (oid);
CREATE INDEX orderitems_product_pid ON orderitems (pid);
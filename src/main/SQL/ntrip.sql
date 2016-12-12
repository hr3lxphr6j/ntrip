# 创建数据库
CREATE DATABASE ntrip;

# 使用数据库
USE ntrip;

# 创建用户表
CREATE TABLE ntrip.user (
  user_id       BIGINT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY
  COMMENT '用户ID',
  name          VARCHAR(100)    NOT NULL UNIQUE
  COMMENT '用户名',
  password      VARCHAR(32)     NOT NULL
  COMMENT '密码',
  phone_number  VARCHAR(100)                    DEFAULT ''
  COMMENT '电话号码',
  email         VARCHAR(100)                    DEFAULT ''
  COMMENT '电子邮件地址',
  birthday      DATE
  COMMENT '出生日期',
  register_time TIMESTAMP       NOT NULL        DEFAULT current_timestamp
  COMMENT '注册时间',
  KEY idx_name(name)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8
  COMMENT = '用户表';

# 插入用户数据
INSERT INTO
  ntrip.user (name, password)
VALUES
  ('hr3lxphr6j', MD5('8681700')),
  ('chigusa', MD5('hr3lxphr6j')),
  ('ZhangSan', MD5('123456')),
  ('Lisi', MD5('456789')),
  ('WangWu', MD5('741852')),
  ('ZhaoSi', MD5('745896')),
  ('LiuNeng', MD5('7412588')),
  ('ErGou', MD5('1245236')),
  ('ZhangZhe', MD5('JiaYiMiao')),
  ('admin', MD5('admin'));

# 创建城市表
CREATE TABLE ntrip.city (
  city_id BIGINT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY
  COMMENT '城市ID',
  name    VARCHAR(100) UNIQUE    NOT NULL
  COMMENT '城市名字'
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8
  COMMENT = '城市表';

# 插入城市数据
INSERT INTO
  ntrip.city (name)
VALUES
  ('北京市'), ('上海'), ('广州'), ('深圳'), ('成都'),
  ('重庆'), ('杭州'), ('南京'), ('沈阳'), ('苏州'),
  ('天津'), ('武汉'), ('西安'), ('长沙'), ('大连'),
  ('济南'), ('宁波'), ('青岛'), ('无锡'), ('厦门'),
  ('郑州'), ('长春'), ('常州'), ('哈尔滨'), ('福州'),
  ('昆明'), ('合肥'), ('东莞'), ('石家庄'), ('呼和浩特'),
  ('南昌'), ('温州'), ('佛山'), ('贵阳'), ('南宁');

# 建立线路表
CREATE TABLE ntrip.route (
  route_id      BIGINT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY
  COMMENT '线路ID',
  name          VARCHAR(100)           NOT NULL UNIQUE
  COMMENT '线路名字',
  start_city_id BIGINT UNSIGNED        NOT NULL
  COMMENT '始发城市ID',
  end_city_id   BIGINT UNSIGNED        NOT NULL
  COMMENT '终点城市ID',
  start_time    TIME                   NOT NULL
  COMMENT '出发时间',
  end_time      TIME                   NOT NULL
  COMMENT '到站时间',
  status        INT                    NOT NULL DEFAULT 0,
  KEY idx_route_name(name),
  CONSTRAINT FOREIGN KEY (start_city_id) REFERENCES city (city_id),
  CONSTRAINT FOREIGN KEY (end_city_id) REFERENCES city (city_id)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8
  COMMENT = '线路表';

# 插入线路信息
INSERT INTO
  ntrip.route (name, start_city_id, end_city_id, start_time, end_time)
VALUES
  ('东方航空MU3613', 1023, 1000, '08:00', '10:00'),
  ('南方航空CZ6201', 1023, 1000, '08:00', '10:00'),
  ('中国国航CA1640', 1023, 1000, '08:30', '10:35'),
  ('东方航空MU3924', 1001, 1000, '06:35', '08:50'),
  ('吉祥航空HO1252', 1001, 1000, '06:35', '08:50');

# 建立票表
CREATE TABLE ntrip.ticket (
  ticket_id BIGINT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY
  COMMENT '票ID',
  route_id  BIGINT UNSIGNED        NOT NULL
  COMMENT '所属线路ID',
  price     FLOAT(10, 2)           NOT NULL DEFAULT 0.00
  COMMENT '价格',
  seat      INT                    NOT NULL
  COMMENT '座位号',
  status    TINYINT                NOT NULL DEFAULT 0
  COMMENT '状态号',
  CONSTRAINT FOREIGN KEY (route_id) REFERENCES route (route_id)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8
  COMMENT = '票表';

# 插入票数据
INSERT INTO
  ntrip.ticket (route_id, price, seat, status)
VALUES
  (1002, 550, 1, 0),
  (1002, 550, 2, 0),
  (1002, 550, 3, 0),
  (1002, 550, 4, 0),
  (1002, 550, 5, 0),
  (1002, 550, 6, 0),
  (1002, 550, 7, 0),
  (1002, 550, 8, 0),
  (1002, 550, 9, 0),
  (1002, 550, 10, 0);

# 建立订单表

CREATE TABLE ntrip.order (
  order_id  BIGINT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY
  COMMENT '订单ID',
  ticket_id BIGINT UNSIGNED        NOT NULL
  COMMENT '所定票ID',
  user_id   BIGINT UNSIGNED        NOT NULL
  COMMENT '预定用户ID',
  time      TIMESTAMP              NOT NULL DEFAULT current_timestamp
  COMMENT '订单时间',
  CONSTRAINT FOREIGN KEY (ticket_id) REFERENCES ticket (ticket_id),
  CONSTRAINT FOREIGN KEY (user_id) REFERENCES user (user_id)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8
  COMMENT = '订单表';

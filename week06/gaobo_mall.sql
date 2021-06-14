-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` varchar(50) COMMENT '订单id',
  `total_num` int(11)  COMMENT '数量合计',
  `total_money` int(11)  COMMENT '金额合计',
  `pre_money` int(11)  COMMENT '优惠金额',
  `post_fee` int(11)  COMMENT '邮费',
  `pay_money` int(11)  COMMENT '实付金额',
  `pay_type` varchar(1) COMMENT '支付类型，1、在线支付、0 货到付款',
  `create_time` datetime COMMENT '订单创建时间',
  `update_time` datetime COMMENT '订单更新时间',
  `pay_time` datetime  COMMENT '付款时间',
  `consign_time` datetime  COMMENT '发货时间',
  `end_time` datetime  COMMENT '交易完成时间',
  `close_time` datetime  COMMENT '交易关闭时间',
  `shipping_name` varchar(20) COMMENT '物流名称',
  `shipping_code` varchar(20) COMMENT '物流单号',
  `username` varchar(50) COMMENT '用户名称',
  `buyer_message` varchar(1000) COMMENT '买家留言',
  `buyer_rate` char(1) COMMENT '是否评价',
  `receiver_contact` varchar(50) COMMENT '收货人',
  `receiver_mobile` varchar(12) COMMENT '收货人手机',
  `receiver_address` varchar(200) COMMENT '收货人地址',
  `transaction_id` varchar(30) COMMENT '交易流水号',
  `order_status` char(1) COMMENT '订单状态,0:未完成,1:已完成，2：已退货',
  `pay_status` char(1) COMMENT '支付状态,0:未支付，1：已支付，2：支付失败',
  `consign_status` char(1) COMMENT '发货状态,0:未发货，1：已发货，2：已收货',
  `is_delete` char(1) COMMENT '是否删除',
  PRIMARY KEY (`id`)
);

-- ----------------------------
-- Table structure for tb_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item`;
CREATE TABLE `tb_order_item`  (
  `id` varchar(50) COMMENT 'ID',
  `spu_id` bigint(20) COMMENT 'SPU_ID',
  `sku_id` bigint(20) COMMENT 'SKU_ID',
  `order_id` varchar(50)  NOT NULL COMMENT '订单ID',
  `name` varchar(200) COMMENT '商品名称',
  `price` int(20)  COMMENT '单价',
  `num` int(10)  COMMENT '数量',
  `money` int(20)  COMMENT '总金额',
  `pay_money` int(11)  COMMENT '实付金额',
  `weight` int(11)  COMMENT '重量',
  `post_fee` int(11)  COMMENT '运费',
  `is_return` char(1)   COMMENT '是否退货,0:未退货，1：已退货',
  PRIMARY KEY (`id`)
);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `username` varchar(50)  NOT NULL COMMENT '用户名',
  `password` varchar(100)  NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20)   COMMENT '注册手机号',
  `email` varchar(50)   COMMENT '注册邮箱',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '修改时间',
  `nick_name` varchar(50)   COMMENT '昵称',
  `name` varchar(50)   COMMENT '真实姓名',
  `status` varchar(1)   COMMENT '使用状态（1正常 0非正常）',
  `head_pic` varchar(150)   COMMENT '头像地址',
  `birthday` datetime  COMMENT '出生年月日',
  PRIMARY KEY (`username`)
);

-- ----------------------------
-- Table structure for tb_sku
-- ----------------------------
DROP TABLE IF EXISTS `tb_sku`;
CREATE TABLE `tb_sku`  (
  `id` bigint(20) NOT NULL COMMENT '商品id',
  `sn` varchar(100)  NOT NULL COMMENT '商品条码',
  `name` varchar(200)  NOT NULL COMMENT 'SKU名称',
  `price` int(20) NOT NULL COMMENT '价格（分）',
  `num` int(10) NOT NULL COMMENT '库存数量',
  `alert_num` int(11) COMMENT '库存预警数量',
  `image` varchar(200) COMMENT '商品图片',
  `images` varchar(2000) COMMENT '商品图片列表',
  `weight` int(11) COMMENT '重量（克）',
  `create_time` datetime COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `spu_id` bigint(20) COMMENT 'SPUID',
  `brand_name` varchar(100) COMMENT '品牌名称',
  `spec` varchar(200) COMMENT '规格',
  `sale_num` int(11) COMMENT '销量',
  `comment_num` int(11) COMMENT '评论数',
  `status` char(1) COMMENT '商品状态 1-正常，2-下架，3-删除',
  PRIMARY KEY (`id`)
);

-- ----------------------------
-- Table structure for tb_spu
-- ----------------------------
DROP TABLE IF EXISTS `tb_spu`;
CREATE TABLE `tb_spu`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `sn` varchar(60)   COMMENT '货号',
  `name` varchar(100)   COMMENT 'SPU名',
  `caption` varchar(100)   COMMENT '副标题',
  `image` varchar(100)   COMMENT '图片',
  `images` varchar(1000)   COMMENT '图片列表',
  `introduction` text  NULL COMMENT '介绍',
  `spec_items` varchar(3000)   COMMENT '规格列表',
  `para_items` varchar(3000)   COMMENT '参数列表',
  `sale_num` int(11) COMMENT '销量',
  `comment_num` int(11) COMMENT '评论数',
  `is_marketable` char(1) COMMENT '是否上架,0已下架，1已上架',
  `is_delete` char(1) COMMENT '是否删除,0:未删除，1：已删除',
  `status` char(1) COMMENT '审核状态，0：未审核，1：已审核，2：审核不通过',
  PRIMARY KEY (`id`)
);
package top.woohoo.mall.service.impl;

import com.alipay.api.AlipayResponse;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.alipay.demo.trade.config.Configs;
import com.alipay.demo.trade.model.ExtendParams;
import com.alipay.demo.trade.model.GoodsDetail;
import com.alipay.demo.trade.model.builder.AlipayTradePrecreateRequestBuilder;
import com.alipay.demo.trade.model.result.AlipayF2FPrecreateResult;
import com.alipay.demo.trade.service.AlipayTradeService;
import com.alipay.demo.trade.service.impl.AlipayTradeServiceImpl;
import com.alipay.demo.trade.utils.ZxingUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.mapper.*;
import top.woohoo.mall.model.pojo.*;
import top.woohoo.mall.service.OrderService;
import top.woohoo.mall.util.BigDecimalUtil;
import top.woohoo.mall.util.DateTimeUtil;
import top.woohoo.mall.util.FTPUtil;
import top.woohoo.mall.util.PropertiesUtil;
import top.woohoo.mall.model.vo.OrderItem.OrderItemVO;
import top.woohoo.mall.model.vo.Order.OrderProductVO;
import top.woohoo.mall.model.vo.Order.OrderVO;
import top.woohoo.mall.model.vo.Shipping.ShippingVO;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

@Service
@Slf4j
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private ShippingMapper shippingMapper;
    @Autowired
    private PayInfoMapper payInfoMapper;

    @Override
    public ServerResponse<OrderProductVO> cart(Integer userId) {
        OrderProductVO orderProductVO = new OrderProductVO();
        List<Cart> cartList = cartMapper.selectCheckedCartByUserId(userId);
        ServerResponse<List<OrderItem>> getCartOrderItemResponse = this.getCartOrderItem(userId, cartList);
        if (!getCartOrderItemResponse.isSuccess()) {
            return ServerResponse.createByErrorMessage(getCartOrderItemResponse.getMsg());
        }
        List<OrderItem> orderItemList = getCartOrderItemResponse.getData();
        orderProductVO.setOrderItemVOList(this.assembleOrderItemVOList(orderItemList));
        orderProductVO.setProductTotalPrice(this.getOrderTotalPrice(orderItemList));
        orderProductVO.setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix"));

        return ServerResponse.createBySuccess(orderProductVO);
    }

    @Override
    public ServerResponse<OrderVO> create(Integer userId, Integer shippingId) {
        // 从购物车中获取要购买的商品
        List<Cart> cartList = cartMapper.selectCheckedCartByUserId(userId);

        ServerResponse<List<OrderItem>> getCartOrderItemResponse = this.getCartOrderItem(userId, cartList);
        if (!getCartOrderItemResponse.isSuccess()) {
            return ServerResponse.createByErrorMessage(getCartOrderItemResponse.getMsg());
        }

        List<OrderItem> orderItemList = getCartOrderItemResponse.getData();
        if (CollectionUtils.isEmpty(orderItemList)) {
            return ServerResponse.createByErrorMessage("购物车未选中商品");
        }

        // 生成订单，写入数据库，删除购物车数据
        Order order = this.assembleOrder(userId, shippingId, this.getOrderTotalPrice(orderItemList));
        if (order == null) {
            return ServerResponse.createByErrorMessage("生成订单错误");
        }
        for (OrderItem orderItem : orderItemList) {
            orderItem.setOrderNo(order.getOrderNo());
        }
        orderItemMapper.batchInsert(orderItemList);
        this.reduceProductsStock(orderItemList);
        this.deleteCarts(cartList);

        return ServerResponse.createBySuccess(this.assembleOrderVO(order, orderItemList));
    }

    @Override
    public ServerResponse cancel(Integer userId, Long orderNo) {
        Order order = userId != null ?
                orderMapper.selectByUserIdAndOrderNo(userId, orderNo) :
                orderMapper.selectByOrderNo(orderNo);

        if (order == null) {
            return ServerResponse.createByErrorMessage("订单不存在或无权操作");
        }
        if (order.getStatus() != Const.OrderStatusEnum.NO_PAY.getCode()) {
            return ServerResponse.createByErrorMessage("非未付款状态，无法取消订单");
        }

        Order newOrder = new Order();
        newOrder.setId(order.getId());
        newOrder.setStatus(Const.OrderStatusEnum.CANCELED.getCode());
        newOrder.setCloseTime(new Date());
        if (orderMapper.updateByPrimaryKeySelective(newOrder) > 0) {
            this.resumeProductStock(orderNo);
            return ServerResponse.createBySuccessMessage("订单取消成功");
        }
        return ServerResponse.createByErrorMessage("订单取消失败");
    }

    @Override
    public ServerResponse<OrderVO> detail(Integer userId, Long orderNo) {
        if (userId == null) {
            Order order = orderMapper.selectByOrderNo(orderNo);
            if (order == null) {
                return ServerResponse.createByErrorMessage("未找到该目标订单");
            }
            return ServerResponse.createBySuccess(
                    this.assembleOrderVO(order, orderItemMapper.selectByOrderNo(orderNo)));
        } else {
            Order order = orderMapper.selectByUserIdAndOrderNo(userId, orderNo);
            if (order == null) {
                return ServerResponse.createByErrorMessage("未找到该用户的目标订单");
            }
            return ServerResponse.createBySuccess(
                    this.assembleOrderVO(order, orderItemMapper.selectByUserIdAndOrderNo(userId, orderNo)));
        }
    }

    @Override
    public ServerResponse<PageInfo<OrderVO>> list(Integer userId, Long orderNo, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);

        List<Order> orderList;
        if (userId == null && orderNo == null) {
            orderList = orderMapper.selectAll(null);
        } else if (userId == null) {
            orderList = orderMapper.selectAll(orderNo);
        } else {
            orderList = orderMapper.selectByUserId(userId);
        }
        List<OrderVO> orderVOList = this.assembleOrderVOList(orderList);

        PageInfo pageInfo = new PageInfo<>(orderList);
        pageInfo.setList(orderVOList);
        return ServerResponse.createBySuccess((PageInfo<OrderVO>) pageInfo);
    }

    @Override
    public ServerResponse delivery(Long orderNo) {
        Order order = orderMapper.selectByOrderNo(orderNo);
        if (order == null) {
            return ServerResponse.createByErrorMessage("未找到符合条件的订单");
        }
        if (order.getStatus() == Const.OrderStatusEnum.PAID.getCode()) {
            order.setStatus(Const.OrderStatusEnum.SHIPPED.getCode());
            order.setSendTime(new Date());
            orderMapper.updateByPrimaryKeySelective(order);
            return ServerResponse.createBySuccessMessage("订单发货成功");
        } else {
            return ServerResponse.createByErrorMessage("订单非已付款状态，无法发货");
        }
    }

    @Override
    public ServerResponse ended(Integer userId, Long orderNo) {
        Order order;
        if (userId == null) {
            order = orderMapper.selectByOrderNo(orderNo);
        } else {
            order = orderMapper.selectByUserIdAndOrderNo(userId, orderNo);
        }
        if (order == null) {
            return ServerResponse.createByErrorMessage("未找到符合条件的订单");
        }
        if (order.getStatus() == Const.OrderStatusEnum.SHIPPED.getCode()) {
            order.setStatus(Const.OrderStatusEnum.ORDER_SUCCESS.getCode());
            order.setEndTime(new Date());
            orderMapper.updateByPrimaryKeySelective(order);
            return ServerResponse.createBySuccessMessage("订单已确认完成");
        } else {
            return ServerResponse.createByErrorMessage("订单非已发货状态，无法完成");
        }
    }

    @Override
    public ServerResponse close(Long orderNo) {
        Order order = orderMapper.selectByOrderNo(orderNo);
        if (order == null) {
            return ServerResponse.createByErrorMessage("未找到符合条件的订单");
        }
        if (order.getStatus() == Const.OrderStatusEnum.CANCELED.getCode()) {
            return ServerResponse.createByErrorMessage("订单已被取消，无需执行关闭");
        } else if (order.getStatus() >= Const.OrderStatusEnum.ORDER_CLOSE.getCode()) {
            return ServerResponse.createByErrorMessage("订单已被关闭，请勿重复操作");
        } else {
            // 如果关闭的订单还未发货，回滚库存。
            if (order.getStatus() < Const.OrderStatusEnum.SHIPPED.getCode()) {
                this.resumeProductStock(orderNo);
            }

            order.setStatus(Const.OrderStatusEnum.ORDER_CLOSE.getCode());
            order.setCloseTime(new Date());
            orderMapper.updateByPrimaryKeySelective(order);

            return ServerResponse.createBySuccessMessage("订单已成功关闭");
        }
    }


    private ServerResponse<List<OrderItem>> getCartOrderItem(Integer userId, List<Cart> cartList) {
        List<OrderItem> orderItemList = Lists.newArrayList();
        if (CollectionUtils.isEmpty(cartList)) {
            return ServerResponse.createByErrorMessage("购物车未选中商品");
        }

        for (Cart cart : cartList) {
            OrderItem orderItem = new OrderItem();
            Product product = productMapper.selectByPrimaryKey(cart.getProductId());
            if (product.getStatus() != Const.ProductStatusEnum.ON_SALE.getCode()) {
                return ServerResponse.createByErrorMessage(product.getName() + ": 非在售商品");
            }
            if (product.getStock() < cart.getQuantity()) {
                return ServerResponse.createByErrorMessage(product.getName() + ": 商品库存不足");
            }

            // orderNo 在生成 Order 之后组装
            orderItem.setUserId(userId);
            orderItem.setProductId(product.getId());
            orderItem.setProductName(product.getName());
            orderItem.setProductImage(product.getMainImage());
            orderItem.setCurrentUnitPrice(product.getPrice());
            orderItem.setQuantity(cart.getQuantity());
            orderItem.setTotalPrice(BigDecimalUtil.multiply(product.getPrice().doubleValue(), cart.getQuantity()));

            orderItemList.add(orderItem);
        }
        return ServerResponse.createBySuccess(orderItemList);
    }

    private BigDecimal getOrderTotalPrice(List<OrderItem> orderItemList) {
        BigDecimal totalPrice = new BigDecimal("0");
        for (OrderItem orderItem : orderItemList) {
            totalPrice = BigDecimalUtil.add(totalPrice.doubleValue(), orderItem.getTotalPrice().doubleValue());
        }
        return totalPrice;
    }

    private Long generateOrderNo() {
        return System.currentTimeMillis() + new Random().nextInt(100);
    }

    private void reduceProductsStock(List<OrderItem> orderItemList) {
        for (OrderItem orderItem : orderItemList) {
            Product product = productMapper.selectByPrimaryKey(orderItem.getProductId());
            product.setStock(product.getStock() - orderItem.getQuantity());
            productMapper.updateByPrimaryKeySelective(product);
        }
    }

    private void deleteCarts(List<Cart> cartList) {
        for (Cart cart : cartList) {
            cartMapper.deleteByPrimaryKey(cart.getId());
        }
    }

    private Order assembleOrder(Integer userId, Integer shippingId, BigDecimal totalPrice) {
        Order order = new Order();
        order.setOrderNo(this.generateOrderNo());
        order.setUserId(userId);
        order.setShippingId(shippingId);
        order.setPayment(totalPrice);
        order.setPaymentType(Const.PaymentTypeEnum.ONLINE_PAY.getCode());
        order.setPostage(0);
        order.setStatus(Const.OrderStatusEnum.NO_PAY.getCode());

        if (orderMapper.insert(order) > 0) {
            return order;
        }
        return null;
    }

    private OrderVO assembleOrderVO(Order order, List<OrderItem> orderItemList) {
        OrderVO orderVO = new OrderVO();
        orderVO.setOrderNo(order.getOrderNo());
        orderVO.setUserId(order.getUserId());
        orderVO.setShippingId(order.getShippingId());
        orderVO.setPayment(order.getPayment());
        orderVO.setPaymentType(order.getPaymentType());
        orderVO.setPaymentTypeDesc(Const.PaymentTypeEnum.codeOf(order.getPaymentType()).getValue());
        orderVO.setPostage(order.getPostage());
        orderVO.setStatus(order.getStatus());
        orderVO.setStatusDesc(Const.OrderStatusEnum.codeOf(order.getStatus()).getValue());
        orderVO.setPaymentTime(DateTimeUtil.timestamp2FormatTime(order.getPaymentTime()));
        orderVO.setSendTime(DateTimeUtil.timestamp2FormatTime(order.getSendTime()));
        orderVO.setEndTime(DateTimeUtil.timestamp2FormatTime(order.getEndTime()));
        orderVO.setCloseTime(DateTimeUtil.timestamp2FormatTime(order.getCloseTime()));
        orderVO.setCreateTime(DateTimeUtil.timestamp2FormatTime(order.getCreateTime()));

        orderVO.setOrderItemVOList(this.assembleOrderItemVOList(orderItemList));

        Shipping shipping = shippingMapper.selectByPrimaryKey(order.getShippingId());
        if (shipping != null) {
            orderVO.setReceiverName(shipping.getReceiverName());
            orderVO.setShippingVO(this.assembleShippingVO(shipping));
        }

        orderVO.setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix"));

        return orderVO;
    }

    private List<OrderVO> assembleOrderVOList(List<Order> orderList) {
        List<OrderVO> orderVOList = Lists.newArrayList();
        for (Order order : orderList) {
            orderVOList.add(this.assembleOrderVO(order, orderItemMapper.selectByOrderNo(order.getOrderNo())));
        }
        return orderVOList;
    }

    private List<OrderItemVO> assembleOrderItemVOList(List<OrderItem> orderItemList) {
        List<OrderItemVO> orderItemVOList = Lists.newArrayList();
        for (OrderItem orderItem : orderItemList) {
            OrderItemVO orderItemVO = new OrderItemVO();
            orderItemVO.setOrderNo(orderItem.getOrderNo());
            orderItemVO.setProductId(orderItem.getProductId());
            orderItemVO.setProductName(orderItem.getProductName());
            orderItemVO.setProductImage(orderItem.getProductImage());
            orderItemVO.setCurrentUnitPrice(orderItem.getCurrentUnitPrice());
            orderItemVO.setQuantity(orderItem.getQuantity());
            orderItemVO.setTotalPrice(orderItem.getTotalPrice());
            orderItemVO.setCreateTime(DateTimeUtil.timestamp2FormatTime(orderItem.getCreateTime()));
            orderItemVOList.add(orderItemVO);
        }
        return orderItemVOList;
    }

    private ShippingVO assembleShippingVO(Shipping shipping) {
        ShippingVO shippingVO = new ShippingVO();
        shippingVO.setReceiverName(shipping.getReceiverName());
        shippingVO.setReceiverPhone(shipping.getReceiverPhone());
        shippingVO.setReceiverProvince(shipping.getReceiverProvince());
        shippingVO.setReceiverCity(shipping.getReceiverCity());
        shippingVO.setReceiverDistrict(shipping.getReceiverDistrict());
        shippingVO.setReceiverAddress(shipping.getReceiverAddress());
        shippingVO.setReceiverZip(shipping.getReceiverZip());
        return shippingVO;
    }

    private void resumeProductStock(Long orderNo) {
        List<OrderItem> orderItemList = orderItemMapper.selectByOrderNo(orderNo);
        for (OrderItem orderItem : orderItemList) {
            Product product = productMapper.selectByPrimaryKey(orderItem.getProductId());
            if (product != null) {
                product.setStock(product.getStock() + orderItem.getQuantity());
            }
            productMapper.updateByPrimaryKeySelective(product);
        }
    }


    // 以下为订单模块的付款部分（暂时只对接了支付宝）
    @Override
    public ServerResponse<Map<String, String>> pay(Integer userId, Long orderNo, String path) {

        Map<String, String> resultMap = Maps.newHashMap();
        Order order = orderMapper.selectByUserIdAndOrderNo(userId, orderNo);
        if (order == null) {
            return ServerResponse.createByErrorMessage("用户订单不存在");
        }
        resultMap.put("orderNo", String.valueOf(orderNo));


        // (必填) 商户网站订单系统中唯一订单号，64个字符以内，只能包含字母、数字、下划线，
        // 需保证商户系统端不能重复，建议通过数据库sequence生成，
        String outTradeNo = order.getOrderNo().toString();

        // (必填) 订单标题，粗略描述用户的支付目的。如“xxx品牌xxx门店当面付扫码消费”
        String subject = "EMM-Mall支付宝当面付订单号: " + outTradeNo;

        // (必填) 订单总金额，单位为元，不能超过1亿元
        // 如果同时传入了【打折金额】,【不可打折金额】,【订单总金额】三者,则必须满足如下条件:【订单总金额】=【打折金额】+【不可打折金额】
        String totalAmount = order.getPayment().toString();
        ;

        // (可选) 订单不可打折金额，可以配合商家平台配置折扣活动，如果酒水不参与打折，则将对应金额填写至此字段
        // 如果该值未传入,但传入了【订单总金额】,【打折金额】,则该值默认为【订单总金额】-【打折金额】
        String undiscountableAmount = "0";

        // 卖家支付宝账号ID，用于支持一个签约账号下支持打款到不同的收款账号，(打款到sellerId对应的支付宝账号)
        // 如果该字段为空，则默认为与支付宝签约的商户的PID，也就是appid对应的PID
        String sellerId = "";

        // 订单描述，可以对交易或商品进行一个详细地描述，比如填写"购买商品2件共15.00元"
        String body = "EMM-Mall订单: " + outTradeNo + "，购买商品共" + totalAmount + "元";

        // 商户操作员编号，添加此参数可以为商户操作员做销售统计
        String operatorId = "test_operator_id";

        // (必填) 商户门店编号，通过门店号和商家后台可以配置精准到门店的折扣信息，详询支付宝技术支持
        String storeId = "test_store_id";

        // 业务扩展参数，目前可添加由支付宝分配的系统商编号(通过setSysServiceProviderId方法)，详情请咨询支付宝技术支持
        ExtendParams extendParams = new ExtendParams();
        extendParams.setSysServiceProviderId("2088100200300400500");

        // 支付超时，定义为120分钟
        String timeoutExpress = "120m";

        // 商品明细列表，需填写购买商品详细信息，
        List<GoodsDetail> goodsDetailList = new ArrayList<GoodsDetail>();
        // 创建一个商品信息，参数含义分别为商品id（使用国标）、名称、单价（单位为分）、数量，如果需要添加商品类别，详见GoodsDetail
        // 创建好一个商品后添加至商品明细列表
        List<OrderItem> orderItemList = orderItemMapper.selectByUserIdAndOrderNo(userId, orderNo);
        for (OrderItem orderItem : orderItemList) {
            GoodsDetail goods = GoodsDetail.newInstance(orderItem.getProductId().toString(), orderItem.getProductName(),
                    BigDecimalUtil.multiply(orderItem.getCurrentUnitPrice().doubleValue(), 100).longValue(), orderItem.getQuantity());
            goodsDetailList.add(goods);
        }

        // 创建扫码支付请求builder，设置请求参数
        AlipayTradePrecreateRequestBuilder builder = new AlipayTradePrecreateRequestBuilder()
                .setSubject(subject).setTotalAmount(totalAmount).setOutTradeNo(outTradeNo)
                .setUndiscountableAmount(undiscountableAmount).setSellerId(sellerId).setBody(body)
                .setOperatorId(operatorId).setStoreId(storeId).setExtendParams(extendParams)
                .setTimeoutExpress(timeoutExpress)
                .setNotifyUrl(PropertiesUtil.getProperty("alipay.callback.url",
                        "http://mall.woohoo.top/order/alipay_callback.do"))
                .setGoodsDetailList(goodsDetailList);

        /* 一定要在创建AlipayTradeService之前调用Configs.init()设置默认参数
         *  Configs会读取classpath下的zfbinfo.properties文件配置信息，如果找不到该文件则确认该文件是否在classpath目录
         */
        Configs.init("zfbinfo.properties");

        /* 使用Configs提供的默认参数
         *  AlipayTradeService可以使用单例或者为静态成员对象，不需要反复new
         */
        AlipayTradeService tradeService = new AlipayTradeServiceImpl.ClientBuilder().build();
        AlipayF2FPrecreateResult result = tradeService.tradePrecreate(builder);
        switch (result.getTradeStatus()) {
            case SUCCESS:
                log.info("支付宝预下单成功: )");

                AlipayTradePrecreateResponse response = result.getResponse();
                dumpResponse(response);

                // 生成二维码文件
                File folder = new File(path);
                if (!folder.exists()) {
                    folder.setWritable(true);
                    folder.mkdirs();
                }

                String qrPath = String.format(path + "/qr-%s.png", response.getOutTradeNo());
                String qrFileName = String.format("qr-%s.png", response.getOutTradeNo());
                String qrFileFolder = PropertiesUtil.getProperty("ftp.server.alipay.path", "alipay_qr_code");
                ZxingUtils.getQRCodeImge(response.getQrCode(), 256, qrPath);

                File targetFile = new File(path, qrFileName);
                try {
                    FTPUtil.uploadFile(qrFileFolder, Lists.newArrayList(targetFile));
                } catch (IOException e) {
                    log.error("上传二维码异常: " + e);
                }
                log.info("qrPath: " + qrPath);

                String qrUrl = PropertiesUtil.getProperty("ftp.server.http.prefix") + qrFileFolder + "/" + targetFile.getName();
                resultMap.put("qrUrl", qrUrl);
                return ServerResponse.createBySuccess(resultMap);

            case FAILED:
                log.error("支付宝预下单失败!!!");
                return ServerResponse.createByErrorMessage("支付宝预下单失败!!!");

            case UNKNOWN:
                log.error("系统异常，预下单状态未知!!!");
                return ServerResponse.createByErrorMessage("系统异常，预下单状态未知!!!");

            default:
                log.error("不支持的交易状态，交易返回异常!!!");
                return ServerResponse.createByErrorMessage("不支持的交易状态，交易返回异常!!!");
        }
    }

    @Override
    public ServerResponse<Boolean> getPayStatus(Integer userId, Long orderNo) {
        Order order = orderMapper.selectByUserIdAndOrderNo(userId, orderNo);
        if (order == null) {
            return ServerResponse.createByErrorMessage("用户没有该订单");
        }
        if (order.getStatus() >= Const.OrderStatusEnum.PAID.getCode()) {
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }

    @Override
    public ServerResponse alipayCallback(Map<String, String> params) {
        // 参数参考: https://opendocs.alipay.com/open/00f7nu

        Long orderNo = Long.parseLong(params.get("out_trade_no"));
        String tradeNo = params.get("trade_no");
        String tradeStatus = params.get("trade_status");

        Order order = orderMapper.selectByOrderNo(orderNo);
        if (order == null) {
            return ServerResponse.createByErrorMessage("查询不到订单详情");
        }
        if (order.getStatus() >= Const.OrderStatusEnum.PAID.getCode()) {
            return ServerResponse.createByErrorMessage("忽略重复回调");
        }

        // 一切正常，更新Order状态为PAID
        if (Const.AlipayCallback.TRADE_STATUS_TRADE_SUCCESS.equals(tradeStatus)) {
            order.setPaymentTime(DateTimeUtil.formatTime2Timestamp(params.get("gmt_payment")));
            order.setStatus(Const.OrderStatusEnum.PAID.getCode());
            orderMapper.updateByPrimaryKeySelective(order);
        }

        // 新增PayInfo项记录支付详情
        PayInfo payInfo = new PayInfo();
        payInfo.setUserId(order.getUserId());
        payInfo.setOrderNo(order.getOrderNo());
        payInfo.setPayPlatform(Const.PayPlatformEnum.ALIPAY.getCode());
        payInfo.setPlatformNumber(tradeNo);
        payInfo.setPlatformStatus(tradeStatus);

        payInfoMapper.insert(payInfo);
        return ServerResponse.createBySuccess();
    }

    private void dumpResponse(AlipayResponse response) {
        if (response != null) {
            log.info(String.format("code:%s, msg:%s", response.getCode(), response.getMsg()));
            if (StringUtils.isNotEmpty(response.getSubCode())) {
                log.info(String.format("subCode:%s, subMsg:%s", response.getSubCode(),
                        response.getSubMsg()));
            }
            log.info("body:" + response.getBody());
        }
    }
}

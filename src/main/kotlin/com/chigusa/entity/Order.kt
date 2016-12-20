package com.chigusa.entity

import java.sql.Time

/**
 * 订单实体类
 * Created by chigusa on 16-12-11.
 */
data class Order(
        var orderId: Long = -1,
        var ticketId: Long = -1,
        var userId: Long = -1,
        var time: Time? = null
) {
}
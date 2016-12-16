package com.chigusa.dto

import java.sql.Time

/**
 * 订单业务层实体
 * Created by chigusa on 16-12-14.
 */
data class NOrder(
        var orderId: Long = -1,
        var ticket: NTicket? = null,
        var user: NUser? = null,
        var time: Time? = null
)
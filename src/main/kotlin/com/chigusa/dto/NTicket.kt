package com.chigusa.dto

/**
 * Ticket业务层实体
 * Created by chigusa on 16-12-14.
 */
data class NTicket(
        var ticketId: Long = -1, //票ID
        var route: NRoute? = null, //线路
        var price: Double = 0.0, //价格
        var seat: Int = 0, //座位号
        var status: Int = 0 //购买状态
)
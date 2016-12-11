package com.chigusa.entity

import com.google.gson.Gson
import java.sql.Time

/**
 * 订单实体类
 * Created by chigusa on 16-12-11.
 */
data class Order(
        var orderId: Long = -1,
        var ticket: Ticket? = null,
        var user: User? = null,
        var time: Time? = null
) {
    override fun toString(): String {
        return Gson().toJson(this)
    }
}
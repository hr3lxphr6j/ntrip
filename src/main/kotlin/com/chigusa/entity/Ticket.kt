package com.chigusa.entity

import com.google.gson.Gson

/**
 * 票实体类
 * Created by chigusa on 16-12-11.
 */
data class Ticket(
        var ticketId: Long = -1,
        var route: Route? = null,
        var price: Double = 0.0,
        var seat: Int = 0,
        var status: Int = 0
) {
    override fun toString(): String {
        return Gson().toJson(this)
    }
}
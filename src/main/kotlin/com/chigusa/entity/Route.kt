package com.chigusa.entity

import com.google.gson.Gson
import java.sql.Time

/**
 * 线路实体类
 * Created by chigusa on 16-12-11.
 */
data class Route(
        var routeId: Long = -1,
        var name: String = "",
        var startCity: City? = null,
        var endCity: City? = null,
        var startTime: Time? = null,
        var endTime: Time? = null
) {
    override fun toString(): String {
        return Gson().toJson(this)
    }
}
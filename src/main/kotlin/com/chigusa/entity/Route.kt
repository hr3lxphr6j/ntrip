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
        var startCityId: Long = -1,
        var endCityId: Long = -1,
        var startTime: Time? = null,
        var endTime: Time? = null,
        var status: Int = 0
) {
    override fun toString(): String {
        return Gson().toJson(this)
    }
}
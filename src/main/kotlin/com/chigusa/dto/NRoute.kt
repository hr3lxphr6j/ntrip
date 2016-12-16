package com.chigusa.dto

import java.sql.Time

/**
 * Route业务层实体
 * Created by chigusa on 16-12-14.
 */
data class NRoute(
        var routeId: Long = -1, //线路ID
        var name: String = "", //线路名字
        var startCity: NCity? = null, //始发城市
        var endCity: NCity? = null, //终点城市
        var startTime: Time? = null, //出发时间
        var endTime: Time? = null, //到站时间
        var status: Int = 0 //状态
)
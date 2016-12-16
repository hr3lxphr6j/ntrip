package com.chigusa.service

import com.chigusa.dto.NCity
import com.chigusa.dto.NRoute

/**
 * 线路业务层接口
 * Created by chigusa on 16-12-14.
 */
interface RouteService {
    /**
     * 按城市名字查询线路信息
     */
    fun queryRoutes(startCity: NCity, endCity: NCity): List<NRoute>

    /**
     * 根据线路名字查询信息
     */
    fun queryRoutes(routeName: String): List<NRoute>

    /**
     * 根据ID查询线路信息
     */
    fun queryRoute(routeId:Long):NRoute
}
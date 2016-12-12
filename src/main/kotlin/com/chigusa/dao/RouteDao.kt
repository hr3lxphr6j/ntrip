package com.chigusa.dao

import com.chigusa.entity.City
import com.chigusa.entity.Route
import org.apache.ibatis.annotations.Param

/**
 * 线路Dao
 * Created by chigusa on 16-12-12.
 */
interface RouteDao {
    /**
     * 增加线路
     */
    fun addRoute(route: Route): Int

    /**
     * 根据ID查询线路
     */
    fun queryById(routeId: Long): Route

    /**
     * 根据名字查询线路信息集合，支持模糊查询
     */
    fun queryByName(name: String): List<Route>

    /**
     * 根据始发城市和终点城市查询线路信息集合
     */
    fun queryByCity(@Param("startCity") startCity: City, @Param("endCity") endCity: City): List<Route>

    /**
     * 更新线路信息
     */
    fun updateRoute(route: Route): Int

}
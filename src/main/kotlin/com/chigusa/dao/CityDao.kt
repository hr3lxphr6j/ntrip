package com.chigusa.dao

import com.chigusa.entity.City

/**
 * 城市Dao
 * Created by chigusa on 16-12-11.
 */
interface CityDao {
    /**
     * 增加城市
     */
    fun addCity(city: City):Int

    /**
     * 根据ID查询城市
     */
    fun queryById(cityId: Long):City

    /**
     * 根据名字查询城市集合
     */
    fun queryByName(name: String):List<City>

    /**
     * 更新城市信息
     */
    fun updateCity(city: City):Int
}
package com.chigusa.dao

import com.chigusa.entity.City

/**
 * 城市Dao接口
 * Created by chigusa on 16-12-11.
 */
interface CityDao {
    /**
     * 增加城市
     */
    fun addCity(city: City):Int

    /**
     * 通过ID查询城市
     */
    fun queryById(cityId: Long):City

    /**
     * 通过名字查询城市集合
     */
    fun queryByName(name: String):List<City>
}
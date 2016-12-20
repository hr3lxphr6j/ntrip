package com.chigusa.service

import com.chigusa.dto.NCity

/**
 * 城市服务接口
 * Created by chigusa on 16-12-14.
 */
interface CityService {
    /**
     * 根据城市名字查询结果集
     */
    fun queryCities(cityName:String):List<NCity>

    /**
     * 根据ID查询城市信息
     */
    fun queryCity(cityId:Long): NCity
}
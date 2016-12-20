package com.chigusa.service.impl

import com.chigusa.dao.CityDao
import com.chigusa.dto.NCity
import com.chigusa.service.CityService
import com.chigusa.service.Entity2Dto
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class CityServiceImpl : CityService {
    @Autowired
    val cityDao: CityDao? = null
    @Autowired
    val entity2Dto: Entity2Dto? = null

    override fun queryCities(cityName: String): List<NCity> {
        return cityDao?.queryByName(cityName)!!.map { entity2Dto!!.City2NCity(it) }
    }

    override fun queryCity(cityId: Long): NCity {
        return entity2Dto!!.City2NCity(cityDao!!.queryById(cityId))
    }
}
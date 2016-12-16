package com.chigusa.service.impl

import com.chigusa.dao.RouteDao
import com.chigusa.dto.NCity
import com.chigusa.dto.NRoute
import com.chigusa.entity.Route
import com.chigusa.service.Dto2Entity
import com.chigusa.service.Entity2Dto
import com.chigusa.service.RouteService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class RouteServiceImpl : RouteService {
    @Autowired
    val routeDao: RouteDao? = null
    @Autowired
    val entity2Dto: Entity2Dto? = null
    @Autowired
    val dto2Entity: Dto2Entity? = null

    override fun queryRoutes(startCity: NCity, endCity: NCity): List<NRoute> {
        return routeDao!!.queryByCity(
                dto2Entity!!.NCity2City(startCity),
                dto2Entity.NCity2City(endCity)).map { entity2Dto!!.Route2NRoute(it) }
    }


    override fun queryRoutes(routeName: String): List<NRoute> {
        return routeDao!!.queryByName(routeName).map { entity2Dto!!.Route2NRoute(it) }
    }

    override fun queryRoute(routeId: Long): NRoute {
        return entity2Dto!!.Route2NRoute(routeDao!!.queryById(routeId))
    }
}
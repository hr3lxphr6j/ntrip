package com.chigusa.dao

import com.chigusa.entity.Route
import org.junit.Test
import org.junit.runner.RunWith
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.context.ContextConfiguration
import org.springframework.test.context.junit4.SpringRunner
import java.sql.Time
import java.text.SimpleDateFormat

/**
 * RouteDao单元测试
 */
@RunWith(SpringRunner::class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
@SpringBootTest

class RouteDaoTest {
    @Autowired
    val routeDao: RouteDao? = null
    @Autowired
    val cityDao: CityDao? = null

    @Test
    fun addRouteTest() {
        val route = Route()
        route.name = "东方航空MU5613"
        route.startCityId = 1023
        route.endCityId = 1036
        route.startTime = Time(SimpleDateFormat("hh:mm:ss").parse("12:35:00").time)
        route.endTime = Time(SimpleDateFormat("hh:mm:ss").parse("13:50:00").time)
        println("插入结果" + routeDao?.addRoute(route))
    }

    @Test
    fun queryByIdTest() {
        println(routeDao?.queryById(1000))
    }

    @Test
    fun queryByNameTest(){
        val routes = routeDao?.queryByName("")
        for (route in routes!!){
            println(route)
        }
    }

    @Test
    fun queryByCityTest(){
        val routes = routeDao?.queryByCity(cityDao!!.queryById(1023),cityDao.queryById(1000))
        for (route in routes!!){
            println(route)
        }
    }

    @Test
    fun updateRouteTest(){
        val route = routeDao?.queryById(1000)
        println(route)
        route?.status=1
        println("更新情况"+routeDao?.updateRoute(route!!))
    }
}
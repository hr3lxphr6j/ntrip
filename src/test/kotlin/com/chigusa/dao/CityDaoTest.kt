package com.chigusa.dao

import com.chigusa.entity.City
import org.junit.Test
import org.junit.runner.RunWith
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.context.ContextConfiguration
import org.springframework.test.context.junit4.SpringRunner

/**
 * CityDao单元测试
 * Created by chigusa on 16-12-12.
 */
@RunWith(SpringRunner::class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
@SpringBootTest

class CityDaoTest {
    @Autowired
    private val cityDao: CityDao? = null

    @Test
    fun addCityTest() {
        println("插入结果"+cityDao?.addCity(City(name = "河南")))
        println("插入结果"+cityDao?.addCity(City(name = "河北")))
    }

    @Test
    fun queryByIdTest() {
        println(cityDao?.queryById(1023))
    }

    @Test
    fun queryByNameTest() {
        val cites = cityDao?.queryByName("河")
        for (city in cites!!){
            println(city)
        }
    }
    @Test
    fun updateCityTest(){
        val city = cityDao?.queryById(1023)
        city!!.name = "哈尔滨"
        println("更新情况"+cityDao!!.updateCity(city))
    }
}
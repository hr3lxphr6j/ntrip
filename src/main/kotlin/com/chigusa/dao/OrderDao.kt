package com.chigusa.dao

import com.chigusa.entity.Order
import com.chigusa.entity.User

/**
 * 订单Dao
 * Created by chigusa on 16-12-12.
 */
interface OrderDao {
    /**
     * 增加订单
     */
    fun addOrder(order: Order):Int

    /**
     * 通过ID查询订单信息
     */
    fun queryById(orderId: Long):Order

    /**
     * 查询用户所有订单
     */
    fun queryByUser(user: User):List<Order>

    /**
     * 删除订单信息
     */
    fun delOrder(order: Order):Int
}
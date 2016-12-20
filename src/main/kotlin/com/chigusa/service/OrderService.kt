package com.chigusa.service

import com.chigusa.dto.NOrder
import com.chigusa.dto.NUser

/**
 * 订单业务接口
 * Created by chigusa on 16-12-20.
 */
interface OrderService{
    fun queryOrders(nUser: NUser):List<NOrder>
}
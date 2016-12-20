package com.chigusa.web

import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping

/**
 * 主页
 */
@Controller
class MainController {
    @RequestMapping(value = "/")
    fun mainPage():String{
        return "index"
    }
}
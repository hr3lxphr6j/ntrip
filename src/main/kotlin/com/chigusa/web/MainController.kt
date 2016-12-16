package com.chigusa.web

import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping

/**
 * Created by chigusa on 16-12-16.
 */
@Controller
class MainController {
    @RequestMapping(value = "/")
    fun mainPage(m:Model):String{
        return "index"
    }
}
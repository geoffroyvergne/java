package com.base.datajpakotlin.facade

import com.base.datajpakotlin.repository.EmployeeRepository
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/index")
class IndexController() {
    @GetMapping("/test")
    fun test(): ResponseEntity<HashMap<Int, String>> {
        val result:HashMap<Int,String> = HashMap()
        result[0] = "index"
        return ResponseEntity(result, HttpStatus.OK);
    }
}
package com.base.datajpakotlin.facade

import com.base.datajpakotlin.model.Employee
import com.base.datajpakotlin.repository.EmployeeRepository
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/employee")
class EmployeeController(private val repository: EmployeeRepository) {
    @GetMapping("/list")
    fun test(): ResponseEntity<List<Employee>> = ResponseEntity(repository.findAll(), HttpStatus.OK)
}
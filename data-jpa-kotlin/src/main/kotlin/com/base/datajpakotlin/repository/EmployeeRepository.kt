package com.base.datajpakotlin.repository

import com.base.datajpakotlin.model.Employee
import org.springframework.data.repository.CrudRepository

/*
public interface EmployeeRepository extends CrudRepository<Employee, Long> {
    List<Employee> findAll();
    Employee findByName(String name);
}
*/

interface EmployeeRepository : CrudRepository<Employee, Long> {
    override fun findAll(): List<Employee>
    fun findByName(name: String): Employee?
}

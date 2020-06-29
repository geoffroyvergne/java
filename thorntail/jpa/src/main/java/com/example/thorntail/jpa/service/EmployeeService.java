package com.example.thorntail.jpa.service;

import com.example.thorntail.jpa.model.Employee;

import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@ApplicationScoped
public class EmployeeService {

    @PersistenceContext(unitName = "PgPU")
    private EntityManager em;

    public List<Employee> getAll() {
        return em.createNamedQuery("Employee.findAll", Employee.class).getResultList();
    }

    public Employee getEmployeeById(int id) { return em.find(Employee.class, id); }

    public void persist(Employee employee) { em.persist(employee); }

    public void remove(Employee employee) { em.remove(employee);}
}

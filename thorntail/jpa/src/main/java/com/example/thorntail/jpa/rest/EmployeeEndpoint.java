package com.example.thorntail.jpa.rest;

import com.example.thorntail.jpa.model.Employee;
import com.example.thorntail.jpa.service.EmployeeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;
import java.util.logging.Logger;

@RequestScoped
@Transactional
@Path("/employee")
@Api(value = "/employee", tags = "employee")
public class EmployeeEndpoint {

    @Inject
    private EmployeeService employeeService;

    private static final Logger LOG = Logger.getLogger(EmployeeEndpoint.class.getName());

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @ApiOperation(value = "employee list",
            notes = "Returns the employee result",
            response = List.class
    )
    public Response list() {

        List<Employee> employees = employeeService.getAll();

        LOG.info("employee list : " + employees.toString());

        return Response.ok(employees).build();
    }

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @ApiOperation(value = "employee by id",
            notes = "Returns employee by id",
            response = List.class
    )
    public Response get(@PathParam("id") int id) {

        Employee employee = employeeService.getEmployeeById(id);
        LOG.info("employee get : " + employee.toString());

        return Response.ok(employee).build();
    }

    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response post(Employee employee) {
        employeeService.persist(employee);

        LOG.info("employee post : " + employee.toString());

        return Response
                .status(Response.Status.CREATED)
                .entity(employee)
                .build();
    }

    @DELETE
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response delete(Employee employee) {

        Employee employeeToDelete = employeeService.getEmployeeById(employee.getId());

        if(employeeToDelete == null) {
            return Response
                    .status(Response.Status.NOT_FOUND)
                    .entity(employee)
                    .build();
        }

        employeeService.remove(employeeToDelete);

        LOG.info("employee post : " + employee.toString());

        return Response
                .status(Response.Status.CREATED)
                .entity(employee)
                .build();
    }
}

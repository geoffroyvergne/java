package com.example.thorntail.jpa.rest;

import com.example.thorntail.base.model.Status;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.logging.Logger;

@Path("/index")
@Api(value = "/index", tags = "index")
public class IndexEndpoint {

    private static final Logger LOG = Logger.getLogger(IndexEndpoint.class.getName());

    @GET
    @Path("/index")
    @Produces(MediaType.APPLICATION_JSON)
    @ApiOperation(value = "index",
            notes = "Returns the index result",
            response = Status.class
    )
    public Response doGet() {

        LOG.info("index/index");

        return Response.ok(new Status("index", 200)).build();
    }
}

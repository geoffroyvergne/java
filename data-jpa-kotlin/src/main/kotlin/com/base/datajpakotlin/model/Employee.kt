package com.base.datajpakotlin.model

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@Entity
class Employee(
        @Id @GeneratedValue var id: Long? = null,
        var name: String
)

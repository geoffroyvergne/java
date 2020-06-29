package com.base.datajpakotlin

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class DataJpaKotlinApplication

fun main(args: Array<String>) {
	runApplication<DataJpaKotlinApplication>(*args)
}

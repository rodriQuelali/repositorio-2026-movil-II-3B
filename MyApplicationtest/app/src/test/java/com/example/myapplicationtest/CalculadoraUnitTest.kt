package com.example.myapplicationtest

import com.example.myapplicationtest.data.Calculadora
import org.junit.Assert.*
import org.junit.Before
import org.junit.BeforeClass
import org.junit.Test

class CalculadoraUnitTest {

    /** Realizar la prueba unitaria de la resta con los
      * siguientes puntos:
     * crea una clase Caculadora, crea un metodo resta
     * las variables que pasen por el contructor y
     * realize la operacion de restar.
      * - 2 - 2 = 0
     *
     * crea otra funcion de resta con pase los dos valores,
     * y opere con ello suguientes valores:
     * - 2.2 - 2.1 = 0.1
     *
     * otro
      * - "2" - "2" = "Introdusca numeros" o 4
      */

    /*
    * setup - se ejecuta por funciones de test.
    * setupClass -- se ejecuta solo una unica vez.
    * */

    companion object{
        @JvmStatic
        @BeforeClass
        fun setupClass(){
            println("---------------setupClasss..")
        }
    }

    @Before
    fun setup(){
        println("-------------------setup")
    }

    @Test
    fun test_resta(){
        val calculadora = Calculadora(2,2)
        val res = calculadora.restas(2.2, 2.1)
        println(".......... ${res}")
        assertEquals(0.10000000000000009, res, 0.0)
    }

    @Test
    fun test_suma(){
        val calculadora = Calculadora(2,2)
        val res = calculadora.suma()
        println(".......... ${res}")
        assertEquals(4, res)
    }

}
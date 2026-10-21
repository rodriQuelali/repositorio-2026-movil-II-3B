package com.example.myapplicationtest

import com.example.myapplicationtest.data.Estudiante
import com.example.myapplicationtest.data.Nota

import org.junit.Before
import org.junit.Test
import org.junit.Assert.*

class NotaUnitTest {

    lateinit var nota: Nota
    //setup
    @Before
    fun setup(){
        println("-------setup")
        nota = Nota()
    }

    /**
     * Input: nota -> estudiantes
     * Estudiante: Nombre y nota
     * output: Calcule si aprobo(true) o reprobo(false).
     * test: aprobado*/

    @Test
    fun test_aprobados(){

        val res= nota.validarNota(Estudiante("alan brito", 85))
        // false o true
        assertTrue(res)
    }

    //realizar para reprobados.
    //utilizar assertFalse

    //sello de 4
    @Test
    fun test_reprobados(){

        val res= nota.validarNota(Estudiante("alan brito", 50))
        // false o true
        assertFalse(res)
    }

    //prueba  de la nota si es igula a 61
    //
    @Test
    fun test_igual(){

        val res= nota.validarNota(Estudiante("alan brito", 61))
        // false o true
        assertTrue(res)
    }

    //realizar un test de validacion de datos
    //input: Estudnate, -25
    //oututput: "Nota no valida"
    

}
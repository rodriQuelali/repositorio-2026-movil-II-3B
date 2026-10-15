package com.example.myapplicationtest.data

class Calculadora(
    val numero1: Int,
    val numero2:Int,
) {

    fun resta():Int{
        return this.numero1 - this.numero2
    }

    fun restas(a: Double, b: Double): Double = a - b

    fun suma(): Int = this.numero1 + this.numero2

}
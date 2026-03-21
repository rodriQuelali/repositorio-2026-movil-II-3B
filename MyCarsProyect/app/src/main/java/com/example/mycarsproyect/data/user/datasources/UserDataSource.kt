package com.example.mycarsproyect.data.user.datasources

import android.content.Context
import com.example.mycarsproyect.data.remote.ApiClient
import com.example.mycarsproyect.data.user.model.User
import com.example.mycarsproyect.data.user.model.UserResponse
import com.example.mycarsproyect.data.login.model.Result
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.IOException

class UserDataSource(private val context: Context) {

    suspend fun registerUser(user: User): Result<UserResponse> {
        return withContext(Dispatchers.IO) {
            try {
                println("Enviando registro para: ${user.email}")

                // Llamada al API
                val response = ApiClient.create(context).getRegisterUser(user)

                // Validación del Status 201 (Created)
                if (response.isSuccessful && response.code() == 201) {
                    val body = response.body()
                    if (body != null) {
                        Result.Success(body)
                    } else {
                        Result.Error(IOException("Error: Cuerpo de respuesta vacío"))
                    }
                } else {
                    // Manejo de errores de servidor (400, 409, 500, etc.)
                    println("Error en servidor: Código ${response.code()}")
                    Result.Error(IOException("Error ${response.code()}"))
                }
            } catch (e: Exception) {
                // Captura errores de red, timeout o falta de conexión
                println("Error de red: ${e.message}")
                Result.Error(IOException("Error en la conexión", e))
            }
        }
    }
}
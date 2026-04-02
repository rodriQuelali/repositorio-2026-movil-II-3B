package com.example.mycarsproyect.data.login.datasources

import android.content.Context
import com.example.mycarsproyect.data.login.model.Result
import com.example.mycarsproyect.data.login.model.LoggedInUser
import com.example.mycarsproyect.data.login.model.LoginRequest
import com.example.mycarsproyect.data.remote.ApiClient
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.IOException

import java.util.UUID

/**
 * Class that handles authentication w/ login credentials and retrieves user information.
 */
class LoginDataSource (private val context: Context){

    suspend fun login(username: String, password: String): Result<LoggedInUser> {
        return try {
            val loginRequest = LoginRequest(email = username, password = password)
            println("Enviando solicitud con: $loginRequest")

            // Ejecutar la llamada de red en una coroutine
            val loginResponse = withContext(Dispatchers.IO) {
                ApiClient.create(context).getLogin(loginRequest)
            }

            println("Respuesta exitosa: $loginResponse")

            // Guardar el token si la autenticación es exitosa
            saveAccessToken(loginResponse.access)

            val fakeUser = LoggedInUser(java.util.UUID.randomUUID().toString(), "Alna Brito")
            Result.Success(fakeUser)
        } catch (e: Exception) {
            println("Error en la autenticación: ${e.message}")
            Result.Error(IOException("Error en la conexión", e))
        }
    }

    fun logout() {
        // TODO: revoke authentication
    }

    // Función para guardar el token en SharedPreferences
    private fun saveAccessToken(token: String) {
        val sharedPreferences = context.getSharedPreferences("AppPreferences", Context.MODE_PRIVATE)
        with(sharedPreferences.edit()) {
            putString("ACCESS_TOKEN", token)
            apply()
        }
    }

    // Función para borrar el token al cerrar sesión
    private fun clearAccessToken() {
        val sharedPreferences = context.getSharedPreferences("AppPreferences", Context.MODE_PRIVATE)
        with(sharedPreferences.edit()) {
            remove("ACCESS_TOKEN")
            apply()
        }
    }
}
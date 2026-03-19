package com.example.mycarsproyect.data.user.repository

import com.example.mycarsproyect.data.user.datasources.UserDataSource
import com.example.mycarsproyect.data.user.model.User
import com.example.mycarsproyect.data.user.model.UserResponse
import com.example.mycarsproyect.data.login.model.Result
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class UserRepository (private val dataSource: UserDataSource) {

    // Cache opcional del último usuario registrado (siguiendo tu lógica de Login)
    var registeredUser: UserResponse? = null
        private set

    /**
     * Registra un nuevo usuario delegando al DataSource.
     */
    suspend fun register(user: User): Result<UserResponse> {
        return withContext(Dispatchers.IO) {
            val result = dataSource.registerUser(user)

            if (result is Result.Success) {
                // Si el registro fue exitoso, guardamos en caché local (opcional)
                setRegisteredUser(result.data)
            }

            result
        }
    }

    private fun setRegisteredUser(user: UserResponse) {
        this.registeredUser = user
    }
}